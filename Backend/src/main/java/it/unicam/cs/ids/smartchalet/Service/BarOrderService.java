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
import java.util.UUID;
import java.util.stream.Collectors;


@Service
public class BarOrderService {

    @Autowired
    private BarOrderRepository repository;

    @Autowired
    private BarItemRepository itemRepository;

    public BarOrder updateOrder(@NonNull BarOrder order){
        if (order.getDate().before(new Date(System.currentTimeMillis()))){
            if(repository.existsById(order.getOrderId())){
                removeOrder(order);
                return makeOrder(order);
            } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Order don't exist. Try to create new one");
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Can't modify this order. Time limit reached");
    }

    public List<BarOrder> getNewOrders(){
        if (repository.findAll().size() != 0){
            return repository.findAll()
                    .parallelStream()
                    .filter(BarOrder -> BarOrder.getDate().after(new Date(System.currentTimeMillis())))
                    .collect(Collectors.toCollection(ArrayList::new));
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "No new orders");
    }

    public BarOrder removeOrder(@NonNull BarOrder order){
         if (repository.existsById(order.getOrderId())){
             if(new Date(System.currentTimeMillis()).before(order.getDate())){
                 for (UUID itemId : order.getOrderDetails().keySet()){
                     BarItem item = itemRepository.findById(itemId).get();
                     item.setDisponibility(item.getDisponibility() + order.getOrderDetails().get(item.getId()));
                     itemRepository.save(item);
                 }
             } repository.deleteById(order.getOrderId());
             return order;
         } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trying to remove a not existing order");
    }

    public BarOrder makeOrder(@NonNull BarOrder order){
        if (checkDisponibility(order)) {
            createOrder(order);
            for (UUID itemId : order.getOrderDetails().keySet()){
                BarItem item = itemRepository.findById(itemId).get();
                item.setDisponibility(item.getDisponibility() - order.getOrderDetails().get(item.getId()));
                itemRepository.save(item);
            } return order;
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "No disponibility. Check order details");
    }

    private void createOrder(@NonNull BarOrder order){
        if(order.getOrderId() == null) order.setOrderId(UUID.randomUUID());
        if(!repository.existsById(order.getOrderId())){
            repository.insert(order);
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Order ID already exist");
    }

    private boolean checkDisponibility(@NonNull BarOrder order){
        ArrayList<BarItem> notDisponibility = new ArrayList<>();
        for (UUID itemId : order.getOrderDetails().keySet()) {
            BarItem item = itemRepository.findById(itemId).get();
            if(!exist(item)) throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                    item.getName().toUpperCase()+" don't exist");
            if(item.getDisponibility() < order.getOrderDetails().get(item.getId())) notDisponibility.add(item);
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
