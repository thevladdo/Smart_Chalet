package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Client implements AuthenticatedUser {

    private String username;
    private String name;
    private String surname;
    private String email;


    public Client(String username, String name, String surname, String email) {
        this.username = username;
        this.name = name;
        this.surname = surname;
        this.email = email;
    }

    public Boolean reserve(){
        return true;
    }

    public Reservation getReservation() {
        return null;
    }

    public Boolean modificationReservation(Reservation reservation, GregorianCalendar date, int qntLounger, int qntBeachChairs) {
        return true;
    }

    public void pay() {

    }

    public Boolean addToCart(ItemBar itemBar) {
        return true;
    }

    public ArrayList<ItemBar> getCart() {
        return null;
    }

    public Boolean setDiscount(String code) {
        return true;
    }

    public Boolean confirmOrder() {
        return true;
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
