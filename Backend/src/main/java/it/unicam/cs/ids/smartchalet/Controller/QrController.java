package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.Umbrella;
import it.unicam.cs.ids.smartchalet.Service.QrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.awt.image.BufferedImage;
import java.io.IOException;

@RestController
@RequestMapping(path = "smartchalet/qr")
public class QrController {

    @Autowired
    private QrService service;

    @GetMapping(path = "/generate", produces = MediaType.IMAGE_PNG_VALUE)
    //TODO same as ActivityController
    @PreAuthorize("(hasAuthority('MANAGER'))")
    public BufferedImage createQr(Umbrella umbrella){
        return service.generateQRCodeImage(umbrella);
    }

    @GetMapping("/decode")
    @PreAuthorize("(hasAuthority('MANAGER') or hasAuthority('BAR_STAFF') or hasAuthority('CLIENT'))")
    public String decode(MultipartFile file, RedirectAttributes redirectAttributes){
        if(file.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Please choose file to upload.");
            return "redirect:/";
        }
        try {
            return service.decodeQR(file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }
}
