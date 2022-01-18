package it.unicam.cs.ids.smartchalet.Model.Users;

import it.unicam.cs.ids.smartchalet.Model.BeachUmbrella;
import it.unicam.cs.ids.smartchalet.Model.ItemBar;
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
public class ReceptionStaff implements AuthenticatedUser {

    private String username;
    private String name;
    private String surname;
    private String email;

    public ReceptionStaff(String username, String name, String surname, String email) {
        this.username = username;
        this.name = name;
        this.surname = surname;
        this.email = email;
    }

    public String getReservation(GregorianCalendar date, int idReservation) {
        return null;
    }

    public Boolean reserve(GregorianCalendar date, int qntLounger, int qntBeachChairs) {
        return true;
    }

    public Boolean confirmReservation(int idReservation){
        return true;
    }

    public Boolean deleteReservation(int idReservation){
        return true;
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
