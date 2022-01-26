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

    @Id
    private UUID id;
    private int qntLounger;
    private int qntBeachChairs;
    private Boolean disponibility;
}
