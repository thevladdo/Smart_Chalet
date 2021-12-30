package it.unicam.cs.ids.smartchalet.Model;

import java.util.GregorianCalendar;
import java.util.List;

public interface GenericUser {

    public List getBeachView();

    public void setBeachPreferences(GregorianCalendar date, int qntLounger, int qntBeachChairs);

    public List getBarView();

    public String getDetailsBarItems();

}
