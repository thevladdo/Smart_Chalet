package it.unicam.cs.ids.smartchalet.Model;

import it.unicam.cs.ids.smartchalet.OldModel.REFACTORED.ItemBar;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Bar {

    @Id
    private static Bar singleBar;
    private Map<ItemBar, Integer> disponibility;

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