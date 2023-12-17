package com.example.basepostgreswebapp.root.service;

import com.example.basepostgreswebapp.root.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, Long> {
}
