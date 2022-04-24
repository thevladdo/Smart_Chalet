package it.unicam.cs.ids.smartchalet.Security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
public class AccessCheckerComponent {

    public boolean sameUser(UserDetails principal, String mail){
        return principal.getUsername().equals(mail);
    }
}
