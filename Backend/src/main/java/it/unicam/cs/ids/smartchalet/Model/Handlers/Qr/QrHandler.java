package it.unicam.cs.ids.smartchalet.Model.Handlers.Qr;

import com.google.zxing.WriterException;
import it.unicam.cs.ids.smartchalet.Model.BeachUmbrella;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class QrHandler {

    private Map<Integer, BeachUmbrella> listOfQrCode;
    private static QrHandler qrHandler;

    private QrHandler() {
        this.listOfQrCode = new HashMap<>();
    }

    public static QrHandler singletonQrHandler() {
        if (qrHandler == null) {
            qrHandler = new QrHandler();
        }
        return qrHandler;
    }

    public void addQrUmbrella(BeachUmbrella umbrella){
        try {
            Qr.generateQRCodeImage(umbrella.getId());
            File file = new File ("src/main/java/it/unicam/cs/ids/smartchalet/Model/Handlers/Qr/QrImages/"
                    +String.valueOf(umbrella.getId())+".png");
            Integer qr = Qr.decodeQRCode(file);
            this.listOfQrCode.put(qr, umbrella);
        } catch (WriterException | IOException e) {
            e.printStackTrace();
        }
    }

}
