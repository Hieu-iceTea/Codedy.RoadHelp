package com.codedy.roadhelp.service.base;

import com.codedy.roadhelp.model.BaseModel;
import org.springframework.transaction.annotation.Transactional;
import com.codedy.roadhelp.repository.BaseRepository;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;


public class BaseServiceImplement<T extends BaseModel, ID extends Serializable> implements BaseService<T, ID> {

    private final BaseRepository<T, ID> repository;

    public BaseServiceImplement(BaseRepository<T, ID> repository) {
        this.repository = repository;
    }

    @Override
    @Transactional
    public List<T> findAll() {
        return repository.findAll();
    }

    @Override
    @Transactional
    public List<T> findAllByOrderByIdDesc() {
        return repository.findAllByOrderByIdDesc();
    }

    @Override
    @Transactional
    public T findById(ID id) {
        Optional<T> itemOptional = repository.findById(id);
        T item;

        if (itemOptional.isPresent()) {
            item = itemOptional.get();
        } else {
            throw new RuntimeException("Did not find item id - " + id);
        }

        return item;
    }

    @Override
    @Transactional
    public T save(T item) {
        return repository.save(item);
    }

    @Override
    @Transactional
    public List<T> saveAll(List<T> items) {
        return (List<T>) repository.saveAll(items);
    }

    @Override
    @Transactional
    public void deleteById(ID id) {
        repository.deleteById(id);
    }

    @Override
    @Transactional
    public boolean existsById(ID id) {
        return repository.existsById(id);
    }

}
