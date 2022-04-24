package it.unicam.cs.ids.smartchalet.Model;

import lombok.*;
import org.springframework.data.annotation.Id;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Umbrella {

    @EqualsAndHashCode.Include
    @Id
    private UUID id;
    private int y;
    private int x;
    private int qtyLounger;
    private Boolean disponibility;
}
