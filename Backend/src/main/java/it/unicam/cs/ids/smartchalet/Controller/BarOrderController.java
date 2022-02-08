package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.BarOrder;
import it.unicam.cs.ids.smartchalet.Service.BarOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.Date;

@RestController
@RequestMapping(path = "smartchalet/barOrder")
public class BarOrderController {

    @Autowired
    private BarOrderService orderService;

    @PostMapping("/create")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('BAR_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #order.getUserMail())")
    public BarOrder createOrder(BarOrder order){
        return orderService.createOrder(order);
    }

    @PutMapping("/update")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('BAR_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #order.getUserMail())")
    public BarOrder updateOrder(BarOrder order, Date date){
        return orderService.updateOrder(order, date);
    }

    @DeleteMapping("/delete")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('BAR_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #order.getUserMail())")
    public boolean removeOrder(BarOrder order){
        return orderService.removeOrder(order);
    }

    @PostMapping("/make/new")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('BAR_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #order.getUserMail())")
    public BarOrder makeOrder(BarOrder order){
        return orderService.makeOrder(order);
    }


}
