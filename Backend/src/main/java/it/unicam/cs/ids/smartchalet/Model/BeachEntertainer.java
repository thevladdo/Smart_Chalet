package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.GregorianCalendar;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class BeachEntertainer implements AuthenticatedUser {

    private String username;
    private String name;
    private String surname;
    private String email;

    public BeachEntertainer(String username, String name, String surname, String email) {
        this.username = username;
        this.name = name;
        this.surname = surname;
        this.email = email;
    }

    @Override
    public List getBeachView() {
        return null;
    }

    @Override
    public void setBeachPreferences(GregorianCalendar date, int qntLounger, int qntBeachChairs) {

    }

    @Override
    public List getBarView() {
        return null;
    }

    @Override
    public String getDetailsBarItems() {
        return null;
    }
}
