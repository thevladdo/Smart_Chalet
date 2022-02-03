package it.unicam.cs.ids.smartchalet.Model;

import lombok.*;
import org.springframework.data.annotation.Id;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class AuthCredential  {

    @EqualsAndHashCode.Include
    @Id
    private String mail;
    private String password;
    private List<Role> roles;

    public enum Role {
        CLIENT, BAR_STAFF, ENTERTAINER, NOT_COMPLETED, MANAGER, RECEPTION_STAFF
    }

    //@Override
    //public Collection<? extends GrantedAuthority> getAuthorities() {
        //List<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        //for (Role role : roles)
       //     auth.add(new SimpleGrantedAuthority(role.name()));
     //   return auth;
   // }


    public String getPassword() {
        return password;
    }


    public String getUsername() {
        return mail;
    }


    public boolean isAccountNonExpired() {
        return true;
    }


    public boolean isAccountNonLocked() {
        return true;
    }


    public boolean isCredentialsNonExpired() {
        return true;
    }


    public boolean isEnabled()  {
        return true;
    }
}