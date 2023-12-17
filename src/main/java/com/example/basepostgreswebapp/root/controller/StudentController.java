package com.example.basepostgreswebapp.root.controller;

import com.example.basepostgreswebapp.root.model.Faculty;
import com.example.basepostgreswebapp.root.model.Student;
import com.example.basepostgreswebapp.root.service.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
@RequiredArgsConstructor
public class StudentController {

    private final StudentService studentService;

    @GetMapping("/{id}")
    public ResponseEntity<Student> getStudentById (@PathVariable Long id) {
        return ResponseEntity.ok(studentService.findStudentById(id));

    }


    @PostMapping()
    public ResponseEntity<Student> getStudentById (@RequestParam String name, @RequestParam String familyName, @RequestParam Faculty faculty) {
        return ResponseEntity.ok(studentService.createStudent(name, familyName, faculty));

    }
}
