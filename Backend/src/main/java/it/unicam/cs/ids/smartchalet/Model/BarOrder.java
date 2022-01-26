package it.unicam.cs.ids.smartchalet.Model;

import it.unicam.cs.ids.smartchalet.OldModel.REFACTORED.ItemBar;
import lombok.*;
import org.springframework.data.annotation.Id;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class BarOrder {

    @Id
    private UUID orderId;
    private Map<Integer, ArrayList<ItemBar>> order;

}
