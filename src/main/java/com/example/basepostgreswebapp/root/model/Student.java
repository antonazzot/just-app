package com.example.basepostgreswebapp.root.model;

import com.example.basepostgreswebapp.root.config.PostgreSQLEnumType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.ZonedDateTime;

@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TypeDef(name = "enum_type", typeClass = PostgreSQLEnumType.class)
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String familyName;
    private ZonedDateTime startLearning;
    @Enumerated(EnumType.STRING)
    @Type(type = "enum_type")
    private Faculty faculty;
    private Integer totalScore;
}
