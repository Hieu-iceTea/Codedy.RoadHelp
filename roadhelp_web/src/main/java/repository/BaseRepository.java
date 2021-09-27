package repository;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BaseRepository<T, ID> extends CrudRepository<T, ID> {
    List<T> findAll();

    List<T> findAllByOrderByIdDesc();
}
