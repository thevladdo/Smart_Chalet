package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import org.springframework.data.annotation.Id;
import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Beach {

    @Id
    private int id;
    private int qtyLounger;

    public Beach(){
        this.id = 1;
        this.qtyLounger = 0;
    }

    public void updateQtyLounger(List<Umbrella> beach){
        int loungers = 0;
        for (Umbrella u : beach) {
            loungers = (loungers + u.getQtyLounger());
        } this.qtyLounger = loungers;
    }

    public int getQtyLounger(List<Umbrella> beach){
        updateQtyLounger(beach);
        return this.qtyLounger;
    }
}