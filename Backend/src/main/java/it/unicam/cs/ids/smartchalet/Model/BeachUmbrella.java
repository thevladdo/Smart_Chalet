package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class BeachUmbrella {

    private int id;
    private int qntLounger;
    private int qntBeachChairs;
    private Boolean disponibility;

    public BeachUmbrella(int id, int qntLounger, int qntBeachChairs) {
        this.id = id;
        this.qntLounger = qntLounger;
        this.qntBeachChairs = qntBeachChairs;
        this.disponibility = false;
    }

}
