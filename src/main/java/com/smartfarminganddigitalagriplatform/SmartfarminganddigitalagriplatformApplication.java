package com.smartfarminganddigitalagriplatform;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import org.springframework.context.annotation.Bean;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
@EnableScheduling
public class SmartfarminganddigitalagriplatformApplication {

	public static void main(String[] args) {
		SpringApplication.run(SmartfarminganddigitalagriplatformApplication.class, args);
	}

	@Bean
	public CommandLineRunner migrateDatabase(JdbcTemplate jdbcTemplate) {
		return args -> {
			try {
				jdbcTemplate.execute("ALTER TABLE users MODIFY COLUMN role VARCHAR(50)");
				System.out.println(">>> DB MIGRATION: User role column expanded to VARCHAR(50)");
			} catch (Exception e) {
			}

			try {
				jdbcTemplate.execute("ALTER TABLE mentors ADD COLUMN is_approved BOOLEAN DEFAULT TRUE");
				System.out.println(">>> DB MIGRATION: Added is_approved column to mentors table");
			} catch (Exception e) {
			}
		};
	}

}
