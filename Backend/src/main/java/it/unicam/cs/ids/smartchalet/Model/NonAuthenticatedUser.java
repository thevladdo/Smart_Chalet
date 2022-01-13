package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.util.GregorianCalendar;
import java.util.List;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class NonAuthenticatedUser implements GenericUser {

    private String username;
    private String name;
    private String surname;
    private String email;

    public NonAuthenticatedUser(){
        this(null,null,null,null);
    }

    public NonAuthenticatedUser(String username, String name, String surname, String email) {
        this.username = null;
        this.name = null;
        this.surname = null;
        this.email = null;
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
