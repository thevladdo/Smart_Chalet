package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.AuthCredential;
import it.unicam.cs.ids.smartchalet.Service.AuthCredentialService;
import it.unicam.cs.ids.smartchalet.Security.AccessCheckerComponent;
import it.unicam.cs.ids.smartchalet.Security.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.Set;

@RestController
@RequestMapping("smartchalet/auth")
public class AuthCredentialController {

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private AuthCredentialService authCredentialService;

    @Autowired
    private AccessCheckerComponent accessCheckerComponent;

    @PostMapping("/public/login")
    @PreAuthorize("permitAll")
    public String loginWithCredentials(@RequestBody @Param("credential") AuthCredential credentials) {
        if(authCredentialService.loginWithCredentials(credentials)){
            return jwtUtil.generateToken(authCredentialService.loadUserByUsername(credentials.getMail()));
        } else return null;
    }

    @PostMapping("/public/addCredential")
    @PreAuthorize("permitAll")
    public String addCredential(@RequestBody @Param("credential") AuthCredential credentials) {
        authCredentialService.addCredentials(credentials);
        return jwtUtil.generateToken(authCredentialService.loadUserByUsername(credentials.getMail()));
    }

    @PutMapping("/updateCredential")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, #authCredential.getMail()) or hasAuthority('MANAGER')")
    public boolean updateCredentials(@RequestBody @Param("authCredential") AuthCredential authCredential) {
        return authCredentialService.updateCredentials(authCredential);
    }

    @DeleteMapping("/deleteCredential")
    @PreAuthorize("@accessCheckerComponent.sameUser(principal, #authCredential.getUsername()) or hasAuthority('MANAGER')")
    public boolean removeCredentials(@RequestBody @Param("authCredential") AuthCredential authentication) {
        return authCredentialService.removeCredentials(authentication.getMail());
    }

    @PreAuthorize("hasAuthority('MANAGER')")
    @GetMapping("/getAuthCredential")
    public Set<AuthCredential> getAuthCredential() {
        return authCredentialService.getAuthCredentials();
    }

    @GetMapping("/public/existsById/{id}")
    @PreAuthorize("permitAll")
    public boolean existsByMail(@PathVariable("id") String id) {
        return authCredentialService.existsById(id);
    }
}
