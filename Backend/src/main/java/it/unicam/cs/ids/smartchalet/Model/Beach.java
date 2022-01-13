package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import java.util.ArrayList;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Beach {

    private ArrayList<ArrayList<BeachUmbrella>> beach;
    private int qntLounger;
    private int qntBeachChairs;
    private static Beach singleBeach;

    private Beach(){
        this(0,0);
    }

    private Beach(int qntLounger, int qntBeachChairs) {
        this.beach = new ArrayList<>();
        this.qntLounger = qntLounger;
        this.qntBeachChairs = qntBeachChairs;
    }

    public static Beach singletonBeach(int qntLounger, int qntBeachChairs){
        if (singleBeach == null) {
            singleBeach = new Beach(qntLounger,qntBeachChairs);
        }
        return singleBeach;
    }

    public void add(BeachUmbrella umbrella, int xPosition, int yPosition) {
        this.beach.get(xPosition).add(yPosition, umbrella);
    }
}
