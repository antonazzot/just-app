package com.example.basepostgreswebapp.root.service;

import com.example.basepostgreswebapp.root.model.Faculty;
import com.example.basepostgreswebapp.root.model.Student;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.ZonedDateTime;

@Service
@RequiredArgsConstructor
public class StudentService {

    private final StudentRepository studentRepository;

    @Transactional
    public Student findStudentById(Long id) {
        return studentRepository.findById(id).orElseThrow(() -> new RuntimeException("student not found"));
    }

    @Transactional
    public Student createStudent(String name, String familyName, Faculty faculty) {
        return studentRepository.save(
                Student.builder()
                        .name(name)
                        .familyName(familyName)
                        .faculty(faculty)
                        .totalScore(0)
                        .startLearning(ZonedDateTime.now())
                        .build()
        );
    }
}
