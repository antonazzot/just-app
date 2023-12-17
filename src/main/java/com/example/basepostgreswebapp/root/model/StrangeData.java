package com.example.basepostgreswebapp.root.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.ZonedDateTime;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class StrangeData {
    @Id
    private String id;
    private String strangeValue;
    private ZonedDateTime dataCreation;
}
