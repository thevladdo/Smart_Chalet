package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.GregorianCalendar;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Reservation {

    public static int idGenerator = 0;
    private GregorianCalendar date;
    private BeachUmbrella umbrella;
    private int id = 0;
    private Boolean checkReview;

    public Reservation(GregorianCalendar date, BeachUmbrella umbrella, int qtaLounger, int qtaBeachChairs) {
        this.date = date;
        this.umbrella = umbrella;
        idGenerator++;
        this.id = idGenerator;
        this.checkReview = true;
    }
}
