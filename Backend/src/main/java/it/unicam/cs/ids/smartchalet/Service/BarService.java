package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.Bar;
import it.unicam.cs.ids.smartchalet.Model.BarItem;
import it.unicam.cs.ids.smartchalet.Model.BarOrder;
import it.unicam.cs.ids.smartchalet.Repository.BarItemRepository;
import it.unicam.cs.ids.smartchalet.Repository.BarRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class BarService {

    @Autowired
    private BarRepository repository;

    @Autowired
    private BarItemRepository itemRepository;

    private Bar getBar(int id){
        if(repository.findById(id).isEmpty()) repository.insert(Bar.singletonBar());
        return repository.findById(id).get();
    }

    public ArrayList<BarItem> getAvailableItems(int id){
        ArrayList<BarItem> items = getBar(id)
                .getItems()
                .stream()
                .filter(BarItem -> BarItem.getDisponibility()>0)
                .collect(Collectors.toCollection(ArrayList::new));
        checkSize(items.size());
        return items;
    }

    public BarItem getItem(String name, int barId){
        ArrayList<BarItem> items = getAvailableItems(barId)
                .stream()
                .filter(BarItem -> BarItem.getName().toUpperCase().equals(name.toUpperCase()))
                .collect(Collectors.toCollection(ArrayList::new));
        checkSize(items.size());
        return items.get(0);
    }

    private void checkSize(int size){
        if (size == 0) throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No item found");
    }

    public ArrayList<BarItem> getAllItems(){
        return getBar(1).getItems();
    }

    public BarItem addItem(@NonNull BarItem toAdd){
        if(exist(toAdd)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "The item is already present");
        } else {
            Bar.singletonBar().getItems().add(toAdd);
            itemRepository.insert(toAdd);
        }
        repository.save(Bar.singletonBar());
        return toAdd;
    }

    public BarItem removeItem(@NonNull BarItem toRemove){
        if(!exist(toRemove)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "The item is not present");
        } else {
            Bar.singletonBar().getItems().remove(toRemove);
            itemRepository.delete(toRemove);
        }
        repository.save(Bar.singletonBar());
        return toRemove;
    }

    public BarItem updateItem(BarItem newItem){
        if(itemRepository.findById(newItem.getId()).isPresent()){
            return itemRepository.save(newItem);
        } else throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Item not found, try to add");
    }

    //TODO usare quando un utente fa l'ordine in Bar Order
    public boolean checkDisponibility(@NonNull BarOrder order){
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
        }
        return toReturn.toString();
    }

    private boolean exist(BarItem toAdd) {
        return itemRepository.existsById(toAdd.getId());
    }
}
