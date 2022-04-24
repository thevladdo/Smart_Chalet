package it.unicam.cs.ids.smartchalet.Model;

import lombok.*;
import org.springframework.data.annotation.Id;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class BarItem {

    @Id
    private UUID id;
    private int integerPrice;
    private int decimalPrice;
    private int disponibility;
    private String name;

}
