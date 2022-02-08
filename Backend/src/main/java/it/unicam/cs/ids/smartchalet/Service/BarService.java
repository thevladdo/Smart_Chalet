package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.Bar;
import it.unicam.cs.ids.smartchalet.Model.BarItem;
import it.unicam.cs.ids.smartchalet.Repository.BarItemRepository;
import it.unicam.cs.ids.smartchalet.Repository.BarRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.ArrayList;
import java.util.UUID;
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

    public ArrayList<BarItem> getAvailableItems(int barId){
        ArrayList<BarItem> items = getBar(barId)
                .getItems()
                .stream()
                .filter(BarItem -> BarItem.getDisponibility()>0)
                .collect(Collectors.toCollection(ArrayList::new));
        checkSize(items.size());
        return items;
    }

    public BarItem getItem(@NonNull String name, int barId){
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
        if(toAdd.getId() == null) toAdd.setId(UUID.randomUUID());
        if(exist(toAdd)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "The item is already present");
        } else {
            Bar.singletonBar().getItems().add(toAdd);
            itemRepository.insert(toAdd);
        }
        repository.save(Bar.singletonBar());
        return toAdd;
    }

    public BarItem removeItem(@NonNull BarItem item) {
        if(exist(item)){
            itemRepository.delete(item);
            if (!getBar(1).getItems().removeIf(BarItem -> BarItem.getId().equals(item.getId()))){
                throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Item not present in bar collection");
            } else repository.save(Bar.singletonBar());
        } else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Item not present");
        return item;
    }

    public BarItem updateItem(@NonNull BarItem newItem){
        if(itemRepository.findById(newItem.getId()).isPresent()){
            Bar.singletonBar().getItems().set(repository.findById(1).get().getItems().indexOf(newItem),newItem);
            repository.save(Bar.singletonBar());
            return itemRepository.save(newItem);
        } else throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Item not found, try to add");
    }

    private boolean exist(BarItem toAdd) {
        return itemRepository.existsById(toAdd.getId());
    }
}
