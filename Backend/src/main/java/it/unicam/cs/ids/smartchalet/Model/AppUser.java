package it.unicam.cs.ids.smartchalet.Model;

import lombok.*;
import org.springframework.data.annotation.Id;


@Getter
@Setter
@ToString
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class AppUser {

    @EqualsAndHashCode.Include
    @Id
    private String mail;
    private String username;
    private String name;
    private String surname;
    //private List<AuthCredential.Role> roles;
}