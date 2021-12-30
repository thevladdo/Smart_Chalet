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
public class ActivityReserve {

    GregorianCalendar date;
    Activity activity;
    int people;


    public ActivityReserve(GregorianCalendar date, Activity activity, int people) {
        this.date = date;
        this.activity = activity;
        this.people = people;
    }

}
