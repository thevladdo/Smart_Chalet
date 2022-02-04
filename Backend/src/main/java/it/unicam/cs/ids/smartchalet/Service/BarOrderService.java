package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.BarItem;
import it.unicam.cs.ids.smartchalet.Model.BarOrder;
import it.unicam.cs.ids.smartchalet.Repository.BarItemRepository;
import it.unicam.cs.ids.smartchalet.Repository.BarOrderRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Service
public class BarOrderService {

    @Autowired
    private BarOrderRepository repository;

    @Autowired
    private BarItemRepository itemRepository;

    public BarOrder createOrder(@NonNull BarOrder order){
        if(!repository.existsById(order.getOrderId())){
            return repository.insert(order);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Order ID already exist");
    }

    public BarOrder updateOrder(@NonNull BarOrder order, Date date){
        if (order.getOrderMoment().before(date)){
            if(repository.existsById(order.getOrderId())){
                return repository.save(order);
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Order don't exist. Try to create new one");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Can't modify this order. Time limit reached");
    }

    public boolean removeOrder(@NonNull BarOrder order){
         if (repository.existsById(order.getOrderId())){
             repository.deleteById(order.getOrderId());
             return true;
         } else return false;
    }

    public BarOrder makeOrder(@NonNull BarOrder order){
        if (checkDisponibility(order)) {
            for (BarItem item : order.getOrderDetails().keySet()){
                item.setDisponibility(item.getDisponibility() - order.getOrderDetails().get(item));
            }
            return createOrder(order);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "No disponibility. Check order details");
    }

    private boolean checkDisponibility(@NonNull BarOrder order){
        ArrayList<BarItem> notDisponibility = new ArrayList<>();
        for (BarItem item : order.getOrderDetails().keySet()) {
            if(!exist(item)) throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                    item.getName().toUpperCase()+" don't exist");
            if(item.getDisponibility() < order.getOrderDetails().get(item)) notDisponibility.add(item);
        }
        if (notDisponibility.isEmpty()) return true;
        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, printItemList(notDisponibility));
    }

    private String printItemList(List<BarItem> items){
        StringBuilder toReturn = new StringBuilder();
        for (BarItem item : items) {
            toReturn.append(item.getName());
            toReturn.append(" Disponibility: ");
            toReturn.append(item.getDisponibility());
            toReturn.append("\n");
        } return toReturn.toString();
    }

    private boolean exist(BarItem toAdd) {
        return itemRepository.existsById(toAdd.getId());
    }

}
