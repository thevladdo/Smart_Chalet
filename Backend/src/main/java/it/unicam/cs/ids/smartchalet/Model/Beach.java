package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Beach {

    private ArrayList<ArrayList<BeachUmbrella>> beach;
    private int qntLounger;
    private int qntBeachChairs;

    public Beach(int qntLounger, int qntBeachChairs) {
        this.beach = new ArrayList<>();
        this.qntLounger = qntLounger;
        this.qntBeachChairs = qntBeachChairs;
    }
}
