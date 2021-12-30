package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Activity {

    private int duration;
    private String name;
    private String description;
    private int placesAvailable;


    public Activity(int duration, String name, String description, int placesAvailable) {
        this.duration = duration;
        this.name = name;
        this.description = description;
        this.placesAvailable = placesAvailable;
    }

}
