package it.unicam.cs.ids.smartchalet.Controller;

import it.unicam.cs.ids.smartchalet.Model.BarOrder;
import it.unicam.cs.ids.smartchalet.Service.BarOrderService;
import it.unicam.cs.ids.smartchalet.security.AccessCheckerComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "smartchalet/barOrder")
public class BarOrderController {

    @Autowired
    private BarOrderService orderService;

    @Autowired
    private AccessCheckerComponent accessCheckerComponent;

    @PostMapping("/make/new")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('BAR_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #order.getUserMail())")
    public BarOrder makeOrder(@RequestBody BarOrder order){
        return orderService.makeOrder(order);
    }

    @GetMapping("/getNewOrders")
    @PreAuthorize("(hasAuthority('BAR_STAFF'))")
    public List<BarOrder> getNewOrders(){
        return orderService.getNewOrders();
    }

    @PutMapping("/update")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('BAR_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #order.getUserMail())")
    public BarOrder updateOrder(@RequestBody @Param("order") BarOrder order){
        return orderService.updateOrder(order);
    }

    @DeleteMapping("/delete")
    @PreAuthorize("(hasAuthority('CLIENT') or hasAuthority('MANAGER') or hasAuthority('BAR_STAFF')) " +
            "and @accessCheckerComponent.sameUser(principal, #order.getUserMail())")
    public BarOrder removeOrder(@RequestBody @Param("order") BarOrder order){
        return orderService.removeOrder(order);
    }
}
