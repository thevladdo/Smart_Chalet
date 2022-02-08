package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import org.springframework.data.annotation.Id;
import java.util.ArrayList;


@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Beach {

    @Id
    private int id;
    private static Beach singleBeach;
    private final ArrayList<Umbrella> beach;
    private int qtyLounger;

    private Beach() {
        this.id = 1;
        this.beach = new ArrayList<>();
        this.qtyLounger = 0;
    }

    public static Beach singletonBeach() {
        if (singleBeach == null) singleBeach = new Beach();
        singleBeach.setQtyLounger();
        return singleBeach;
    }

    public void setQtyLounger(){
        int loungers = 0;
        for (Umbrella u : Beach.singletonBeach().beach) {
            loungers = (loungers + u.getQtyLounger());
        } this.qtyLounger = loungers;
    }

    public int getQtyLounger(){
        setQtyLounger();
        return this.qtyLounger;
    }

    public ArrayList<Umbrella> getBeach(){
        return this.beach;
    }
}