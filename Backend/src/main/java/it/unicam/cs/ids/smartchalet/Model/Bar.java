package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Bar {

    private Map<ItemBar, Integer> disponibility;

    public Bar() {
        this.disponibility = new HashMap<>();
    }

}
