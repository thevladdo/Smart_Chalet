package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Bar implements Serializable {

    @Id
    private int id;
    private static Bar singleBar;
    private ArrayList<BarItem> items;

    private Bar() {
        this.id = 1;
        this.items = new ArrayList<>();
    }

    public static Bar singletonBar(){
        if (singleBar == null) singleBar = new Bar();
        return singleBar;
    }
}