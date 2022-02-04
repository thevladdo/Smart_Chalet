package it.unicam.cs.ids.smartchalet.Service;

import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeWriter;
import it.unicam.cs.ids.smartchalet.Model.Beach;
import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Repository.QrRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

@Service
public class QrService {

    @Autowired
    private QrRepository repository;

    public File generateQRCodeImage(@NonNull Beach beach, @NonNull Umbrella umbrella, @NonNull File savedQr) throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        int x = -1,y = -1;
        for (ArrayList<Umbrella> list: beach.getBeach()){
            if (list.contains(umbrella)){
                y = beach.getBeach().indexOf(list);
                x = beach.getBeach().get(y).indexOf(umbrella);
            }
        }
        String text = String.valueOf(y+x);
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, 1000, 1000);
        MatrixToImageWriter.writeToPath(bitMatrix,"PNG",savedQr.toPath());
        return repository.insert(savedQr);
    }

    public Integer decodeQRCode(@NonNull File qrCodeimage) throws IOException {
        if (!repository.existsByFile(qrCodeimage)) throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "No file saved.");
        BufferedImage bufferedImage = ImageIO.read(qrCodeimage);
        LuminanceSource source = new BufferedImageLuminanceSource(bufferedImage);
        BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
        try {
            Result result = new MultiFormatReader().decode(bitmap);
            return Integer.parseInt(result.getText());
        } catch (NotFoundException e) {
            System.out.println("There is no QR code in the image");
            return null;
        }
    }
}
