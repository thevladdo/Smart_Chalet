package it.unicam.cs.ids.smartchalet.Model;

import lombok.*;
import org.springframework.data.annotation.Id;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Qr {

    @Id
    private int umbrellaId;
    private Umbrella umbrella;
}
