package it.unicam.cs.ids.smartchalet.Model.Users;

import it.unicam.cs.ids.smartchalet.Model.*;
import it.unicam.cs.ids.smartchalet.Model.Handlers.ReservationHandler;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Client implements AuthenticatedUser {

    private String username;
    private String name;
    private String surname;
    private String email;
    private Reservation reservation;
    private ArrayList<ItemBar> barOrder;


    public Client(String username, String name, String surname, String email) {
        this.username = username;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.reservation = null;
        this.barOrder = new ArrayList<>();
    }

    public boolean reserve() {
        if(checkPresence()){
            ReservationHandler.sigletonReservationHandler().getHandler().put(this, this.reservation);
            return true;
        } else return false;
    }

    @Override
    public void setBeachPreference(GregorianCalendar date, BeachUmbrella umbrella, int qtaLounger, int qtaBeachChairs) {
        this.reservation = new Reservation(date, umbrella, qtaLounger, qtaBeachChairs);
    }

    public Reservation getReservation() {
        return ReservationHandler.sigletonReservationHandler().getHandler().get(this);
    }

    public void modifyReservation(BeachUmbrella umbrella, GregorianCalendar date, int qntLounger, int qntBeachChairs) {
        this.setBeachPreference(date, umbrella, qntLounger, qntBeachChairs);
    }

    @Override
    public void login(String u, String p) {
        //TODO da fare
    }

    public boolean pay() {
        //TODO da fare
        return false;
    }

    public void addToCart(ItemBar itemBar) {
        this.barOrder.add(itemBar);
    }

    public ArrayList<ItemBar> getCart() {
        return this.barOrder;
    }

    public boolean setDiscount(String code) {
        //TODO da fare
        return true;
    }

    public boolean confirmOrder() {
        if(checkPresence()){
            BarOrder newOrder = new BarOrder(this.reservation.getUmbrella().getId(), this.barOrder);
            return true;
        } else return false;
    }

    @Override
    public ArrayList<ArrayList<BeachUmbrella>> getBeachView() {
        return Beach.singletonBeach().getBeach();
    }

    @Override
    public Set<ItemBar> getBarView() {
        return Bar.singletonBar().getDisponibility().keySet();
    }

    @Override
    public String getDetailsBarItem(ItemBar itemBar) {
        return itemBar.getDetails();
    }

    private boolean checkPresence(){
        if (!ReservationHandler.sigletonReservationHandler().getHandler().containsValue(this)) {
            return pay();
        } return false;
    }
}
