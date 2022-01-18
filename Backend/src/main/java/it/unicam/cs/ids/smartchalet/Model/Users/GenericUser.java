package it.unicam.cs.ids.smartchalet.Model.Users;

import it.unicam.cs.ids.smartchalet.Model.BeachUmbrella;
import it.unicam.cs.ids.smartchalet.Model.ItemBar;

import java.util.GregorianCalendar;
import java.util.List;
import java.util.Set;

/**
 * This class is the rapresentation of the basic options between
 */
public interface GenericUser {

    /**
     * This method return the actual state of the beach
     * @return a list
     */
    public List getBeachView();

    /**
     * This method allows the user to personalize the preferences for the research
     * @param date the date inserted by the user
     * @param umbrella beachUmbrella
     * @param qntLounger the quantity of loungers inserted by the user
     * @param qntBeachChairs the quantity of chairs inserted by the user
     */
    public void setBeachPreference(GregorianCalendar date, BeachUmbrella umbrella, int qntLounger, int qntBeachChairs);

    /**
     * This method return the actual bar details
     * @return a list
     */
    Set<ItemBar> getBarView();

    /**
     * This method return the actual bar items
     * @return a list
     */
    String getDetailsBarItem(ItemBar itemBar);

}
