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

    private GregorianCalendar date;
    private BeachUmbrella beachUmbrella;
    private static int id = 0;
    private Boolean checkReview;

    public Reservation(GregorianCalendar date, BeachUmbrella beachUmbrella) {
        this.date = date;
        this.beachUmbrella = beachUmbrella;
        this.id++;
        this.checkReview = true;
    }
}
