package com.app.jewellery.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.jewellery.entities.CategoryEntity
;

@Repository

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
}
