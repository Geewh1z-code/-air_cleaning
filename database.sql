-- Создаем базу данных
CREATE DATABASE IF NOT EXISTS air_quality_monitoring;
USE air_quality_monitoring;

-- Таблица users (пользователи)
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Таблица locations (локации)
CREATE TABLE IF NOT EXISTS locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Таблица devices (устройства)
CREATE TABLE IF NOT EXISTS devices (
    device_id INT AUTO_INCREMENT PRIMARY KEY,
    device_type VARCHAR(50) NOT NULL,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE SET NULL
);

-- Таблица air_quality_data (данные о качестве воздуха)
CREATE TABLE IF NOT EXISTS air_quality_data (
    data_id INT AUTO_INCREMENT PRIMARY KEY,
    device_id INT NOT NULL,
    location_id INT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    temperature FLOAT,
    humidity FLOAT,
    PM2_5 FLOAT,
    PM10 FLOAT,
    NO2 FLOAT,
    SO2 FLOAT,
    CO FLOAT,
    AQI FLOAT,
    air_quality FLOAT,
    FOREIGN KEY (device_id) REFERENCES devices(device_id) ON DELETE CASCADE,
    FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE CASCADE
);

-- Таблица reports (отчеты)
CREATE TABLE IF NOT EXISTS reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    report_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Таблица alerts (оповещения)
CREATE TABLE IF NOT EXISTS alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    device_id INT NOT NULL,
    parameter ENUM('temperature', 'humidity', 'PM2_5', 'PM10', 'NO2', 'SO2', 'CO', 'AQI'),
    value FLOAT NOT NULL,
    alert_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (device_id) REFERENCES devices(device_id) ON DELETE CASCADE
);

-- Таблица logs (логи действий)
CREATE TABLE IF NOT EXISTS logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    action ENUM('login', 'logout', 'report_generated', 'alert_triggered'),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);


-- Заполняем таблицу locations (3 цеха)
INSERT INTO locations (name) VALUES
('Цех 1'),
('Цех 2'),
('Цех 3');

-- Заполняем таблицу devices (по 3 устройства в каждом цеху)
-- Цех 1 (location_id = 1)
INSERT INTO devices (device_type, location_id) VALUES
('MQ-135', 1),
('SDS011', 1),
('DHT22', 1);

-- Цех 2 (location_id = 2)
INSERT INTO devices (device_type, location_id) VALUES
('MQ-135', 2),
('SDS011', 2),
('DHT22', 2);

-- Цех 3 (location_id = 3)
INSERT INTO devices (device_type, location_id) VALUES
('MQ-135', 3),
('SDS011', 3),
('DHT22', 3);

-- Добавляем пользователей в таблицу users
INSERT INTO users (username, password_hash, email) VALUES
('admin', 'admin123', 'admin@yandex.ru'),
('user1', 'password1', 'user1@yandex.ru'),
('user2', 'password2', 'user2@yandex.ru');


