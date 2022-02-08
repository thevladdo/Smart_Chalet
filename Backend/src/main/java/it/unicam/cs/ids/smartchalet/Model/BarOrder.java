package it.unicam.cs.ids.smartchalet.Model;

import lombok.*;
import org.springframework.data.annotation.Id;
import java.sql.Time;
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
    private String userMail;
    private int umbrellaId;
    private Map<BarItem,Integer> orderDetails;
    private Time orderMoment;
}
