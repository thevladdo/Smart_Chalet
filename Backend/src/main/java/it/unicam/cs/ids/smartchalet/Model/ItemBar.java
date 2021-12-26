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


    public ItemBar(int id, double price) {
        this.id = id;
        this.price = price;
        this.disponibility = true;
    }

}
