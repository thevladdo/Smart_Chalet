package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import java.util.ArrayList;

/**
 * This class represent a beach object.
 * Is needed to set the quantity of Loungers and Chairs.
 */
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Beach {

    private ArrayList<ArrayList<BeachUmbrella>> beach;
    private int qtaLounger;
    private int qtaBeachChairs;
    private static Beach singleBeach;

    private Beach() {
        this.beach = new ArrayList<>();
        this.qtaLounger = 0;
        this.qtaBeachChairs = 0;
    }

    public static Beach singletonBeach(){
        if (singleBeach == null) {
            singleBeach = new Beach();
        }
        return singleBeach;
    }

    public void add(BeachUmbrella umbrella, int xPosition, int yPosition) {
        this.beach.get(xPosition).add(yPosition, umbrella);
    }
}
