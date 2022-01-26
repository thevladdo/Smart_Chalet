package it.unicam.cs.ids.smartchalet.Service;

import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeWriter;
import it.unicam.cs.ids.smartchalet.OldModel.Handlers.Qr.Qr;
import it.unicam.cs.ids.smartchalet.OldModel.REFACTORED.BeachUmbrella;
import it.unicam.cs.ids.smartchalet.Repository.QrRepository;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

public class QrService {

    private QrRepository repository;

    //TODO DA METTERE IN DB NON CARTELLA
    public static void generateQRCodeImage(Integer id) throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        String text = String.valueOf(id);
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, 1000, 1000);
        Path path = FileSystems.getDefault().getPath(
                "src/main/java/it/unicam/cs/ids/smartchalet/Model/Handlers/Qr/QrImages/" +text+ ".png");
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
    }

    public static Integer decodeQRCode(File qrCodeimage) throws IOException {
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
