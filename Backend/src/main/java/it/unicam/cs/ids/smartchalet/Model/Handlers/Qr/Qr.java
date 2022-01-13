package it.unicam.cs.ids.smartchalet.Model.Handlers.Qr;

import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeWriter;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;


@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public  class Qr {

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

    /*
   public static void main(String[] args) {
        try {
            generateQRCodeImage(11);
        } catch (WriterException e) {
            System.out.println("Could not generate QR Code, WriterException :: " + e.getMessage());
        } catch (IOException e) {
            System.out.println("Could not generate QR Code, IOException :: " + e.getMessage());
        }
    }
     */
/*
    public static void main(String[] args) {
        try {
            File file = new File("src/main/java/it/unicam/cs/ids/smartchalet/Model/Handlers/Qr/QrImages/11.png");
            String decodedText = String.valueOf(decodeQRCode(file));
            if(decodedText == null) {
                System.out.println("No QR Code found in the image");
            } else {
                System.out.println("Decoded text = " + decodedText);
            }
        } catch (IOException e) {
            System.out.println("Could not decode QR Code, IOException :: " + e.getMessage());
        }
    }*/
}

