package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class BarOrder {

    //TODO integer è l'i dell'ombrellone
    private Map<Integer, ArrayList<ItemBar>> orders;


    public BarOrder(int idBeachUmbrella, ArrayList<ItemBar> items) {
        this.orders = new HashMap<>();
    }
}
