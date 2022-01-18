package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ItemBar {

    private int id;
    private double price;
    private Boolean disponibility;
    private String details;


    public ItemBar(int id, double price, String details) {
        this.id = id;
        this.price = price;
        this.disponibility = true;
        this.details=details;
    }

}
