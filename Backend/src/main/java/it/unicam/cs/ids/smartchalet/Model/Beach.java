package it.unicam.cs.ids.smartchalet.Model;

import lombok.EqualsAndHashCode;
import org.springframework.data.annotation.Id;
import java.util.ArrayList;


@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Beach {

    @Id
    private int id;
    private static Beach singleBeach;
    private ArrayList<ArrayList<Umbrella>> beach;
    private int qtaLounger;

    private Beach() {
        this.id = 1;
        this.beach = new ArrayList<>();
        this.qtaLounger = 0;
    }

    public static Beach singletonBeach() {
        if (singleBeach == null) {
            singleBeach = new Beach();
        }
        singleBeach.setQtaLounger();
        return singleBeach;
    }

    public void setQtaLounger(){
        int loungers = 0;
        for (ArrayList<Umbrella> a: Beach.singletonBeach().beach) {
            for (Umbrella u : a) {
                loungers++;
            }
        } this.qtaLounger = loungers;
    }

    public int getQtaLounger(){
        setQtaLounger();
        return this.qtaLounger;
    }

    public ArrayList<ArrayList<Umbrella>> getBeach(){
        return this.beach;
    }
}