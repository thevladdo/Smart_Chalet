package it.unicam.cs.ids.smartchalet.Model.Users;

import it.unicam.cs.ids.smartchalet.Model.BeachUmbrella;
import it.unicam.cs.ids.smartchalet.Model.ItemBar;
import it.unicam.cs.ids.smartchalet.Model.Users.AuthenticatedUser;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.GregorianCalendar;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class BarStaff implements AuthenticatedUser {

    private String username;
    private String name;
    private String surname;
    private String email;

    public BarStaff(String username, String name, String surname, String email) {
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
    public void setBeachPreference(GregorianCalendar date, BeachUmbrella umbrella, int qntLounger, int qntBeachChairs) {

    }

    @Override
    public Set<ItemBar> getBarView() {
        return null;
    }

    @Override
    public String getDetailsBarItem(ItemBar itemBar) {
        return null;
    }

    @Override
    public void login(String u, String p) {

    }
}
