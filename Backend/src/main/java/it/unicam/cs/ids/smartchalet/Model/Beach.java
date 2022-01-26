package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import java.util.ArrayList;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Beach {

    @Id
    private static Beach singleBeach;
    private ArrayList<ArrayList<Umbrella>> beach;
    private int qtaLounger;
    private int qtaBeachChairs;

    private Beach() {
        this.beach = new ArrayList<>();
        this.qtaLounger = 0;
        this.qtaBeachChairs = 0;
    }

    public static Beach singletonBeach() {
        if (singleBeach == null) {
            singleBeach = new Beach();
        }
        return singleBeach;
    }

}