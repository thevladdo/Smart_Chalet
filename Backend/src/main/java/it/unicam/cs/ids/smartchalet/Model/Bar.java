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
    private static Bar singleBar;

    private Bar() {
        this.disponibility = new HashMap<>();
    }

    public static Bar singletonBar(){
        if (singleBar == null) {
            singleBar = new Bar();
        }
        return singleBar;
    }

}
