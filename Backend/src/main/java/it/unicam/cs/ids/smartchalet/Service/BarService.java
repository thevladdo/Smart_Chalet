package it.unicam.cs.ids.smartchalet.Service;

import it.unicam.cs.ids.smartchalet.Model.BarItem;
import it.unicam.cs.ids.smartchalet.Repository.BarItemRepository;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class BarService {

    @Autowired
    private BarItemRepository itemRepository;

    public ArrayList<BarItem> getAvailableItems(int barId){
        ArrayList<BarItem> items = itemRepository.findAll()
                .stream()
                .filter(BarItem -> BarItem.getDisponibility()>0)
                .collect(Collectors.toCollection(ArrayList::new));
        checkSize(items.size());
        return items;
    }

    public BarItem getItem(@NonNull String name){
        List<BarItem> items = itemRepository.findByName(name);
        checkSize(items.size());
        return items.get(0);
    }

    private void checkSize(int size){
        if (size == 0) throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No item found");
    }

    public List<BarItem> getAllItems(){
        return itemRepository.findAll();
    }

    public BarItem addItem(@NonNull BarItem toAdd){
        if(toAdd.getId() == null) toAdd.setId(UUID.randomUUID());
        if(exist(toAdd)){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "The item is already present");
        } else itemRepository.insert(toAdd);
        return toAdd;
    }

    public BarItem removeItem(@NonNull BarItem item) {
        if(exist(item)){
            itemRepository.delete(item);
            return item;
        } else throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Item not present in bar collection");
    }

    public BarItem updateItem(@NonNull BarItem newItem){
        if(itemRepository.findById(newItem.getId()).isPresent()){
            return itemRepository.save(newItem);
        } else throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Item not found, try to add");
    }

    private boolean exist(BarItem toAdd) {
        return itemRepository.existsById(toAdd.getId());
    }
}
