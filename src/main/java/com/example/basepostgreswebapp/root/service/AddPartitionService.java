package com.example.basepostgreswebapp.root.service;

import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
@RequiredArgsConstructor
public class AddPartitionService {
    private final JdbcTemplate jdbcTemplate;

    @Scheduled(fixedRate = 10000)
    public void createPartition(){
        String sql = "CREATE TABLE strange_data_old" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy_MM_dd_HH_MM_SS")) + " PARTITION OF strange_data FOR VALUES FROM (current_timestamp + INTERVAL '1 month') to (current_timestamp + INTERVAL '2 month')";
        jdbcTemplate.execute(sql);
    }
}
