# Air Quality Monitoring System

A desktop application for real-time monitoring of air quality parameters across multiple factory workshops. The system simulates sensor data, visualizes environmental metrics, generates reports, and logs user actions, all integrated with a MySQL database.

## Features
- **User Authentication**: Secure login system with role-based access.
- **Real-Time Data Simulation**: Generates sensor data (Temperature, Humidity, PM2.5, PM10, NO2, SO2, CO, AQI) for three workshops with configurable spikes.
- **Data Visualization**: Displays real-time graphs of environmental parameters using Matplotlib, split across two panels for clarity.
- **Alerts System**: Logs alerts in the database when parameters exceed thresholds.
- **Reporting**: Creates detailed reports (average, max, min values) based on the last 100 records, exportable to Excel.
- **Action Logging**: Tracks user actions (login, logout, report generation, alerts) in the database.
- **Multi-Workshop Support**: Monitors and compares data across three distinct factory locations.

## Technologies
- **Python 3.8+**: Core programming language.
- **Tkinter**: GUI framework for the desktop interface.
- **Matplotlib**: Data visualization for real-time graphs.
- **MySQL Connector**: Database integration for storing and retrieving data.
- **Openpyxl**: Excel report generation.
- **Threading**: Background data processing to ensure smooth UI performance.

## Installation
1. **Clone the Repository**:
   ```bash
    https://github.com/Geewh1z-code/-air_cleaning.git cd -air_cleaning
   ```

2. **Install Dependencies**:
   Ensure Python 3.8+ is installed, then run:
   ```bash
   pip install -r requirements.txt
   ```
   Requirements file:
   ```
   mysql-connector-python==8.0.33
   matplotlib==3.7.1
   openpyxl==3.1.2
   ```

3. **Set Up MySQL Database**:
   - Install MySQL and create a database named `air_quality_monitoring`.
   - Run the SQL script (`database.sql`) to create tables and populate initial data:
     ```bash
     mysql -u root -p air_quality_monitoring < database.sql
     ```
   - Update the `db_config` in the Python script with your MySQL credentials:
     ```python
     db_config = {
         'host': '127.0.0.1',
         'user': 'your_username',
         'password': 'your_password',
         'database': 'air_quality_monitoring'
     }
     ```

4. **Run the Application**:
   ```bash
   python main.py
   ```

## Usage
1. **Login**: Use the default credentials (e.g., username: `admin`, password: `admin123`) or create new users in the `users` table.
2. **Select Workshop**: Choose a workshop (Цех 1, Цех 2, or Цех 3) to view real-time data.
3. **Monitor Data**: Observe graphs updating every 3 seconds with sensor readings and air quality percentage.
4. **Generate Reports**: Click "Создать отчет" to view statistics and export to Excel.
5. **View Reports**: Access previously generated reports under "Просмотреть отчеты".
6. **Alerts**: The system automatically logs alerts for parameter spikes in the database.

## Database Schema
The MySQL database includes:
- `users`: Stores user credentials.
- `locations`: Defines factory workshops (Цех 1–3).
- `devices`: Lists sensors (MQ-135, SDS011, DHT22).
- `air_quality_data`: Stores sensor readings and AQI.
- `reports`: Logs generated reports.
- `alerts`: Records parameter threshold violations.
- `logs`: Tracks user actions.

See `database.sql` for the full schema and initial data.
