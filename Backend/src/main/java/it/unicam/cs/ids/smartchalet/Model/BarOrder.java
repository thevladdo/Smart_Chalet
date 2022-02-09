package it.unicam.cs.ids.smartchalet.Model;

import lombok.*;
import org.springframework.data.annotation.Id;
import java.util.Date;
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
    private UUID umbrellaId;
    private Date date;
    private Map<UUID,Integer> orderDetails;
}
