package it.unicam.cs.ids.smartchalet.Model;

import it.unicam.cs.ids.smartchalet.OldModel.REFACTORED.BeachUmbrella;
import lombok.*;
import org.springframework.data.annotation.Id;
import java.util.Date;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Reservation {

    @Id
    private static UUID id;
    private Date date;
    private BeachUmbrella umbrella;

}