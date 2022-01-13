package it.unicam.cs.ids.smartchalet.Model;

import it.unicam.cs.ids.smartchalet.Model.Handlers.Qr.QrHandler;
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
public class Manager implements AuthenticatedUser {

    private String username;
    private String name;
    private String surname;
    private String email;
    private Beach beach;

    public Manager(String username, String name, String surname, String email, Beach beach) {
        this.username = username;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.beach = beach;
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

    public void addBeachUmbrella(BeachUmbrella umbrella, int xPosition, int yPosition) {
        this.beach.add(umbrella, xPosition, yPosition);
        QrHandler qr = QrHandler.singletonQrHandler();
        QrHandler.singletonQrHandler().addQrUmbrella(umbrella);
    }
}
