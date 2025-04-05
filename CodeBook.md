# CodeBook

This codebook describes the variables, transformations, and outputs used in the Exploratory Data Analysis Course Project 1.

## Source Data

**Dataset**: Individual household electric power consumption  
**Source**: UCI Machine Learning Repository  
**File**: `household_power_consumption.txt`  
**Format**: Semicolon-separated values (`;`), missing values denoted by `?`  

## Variables in the Original Dataset

| Variable              | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| Date                  | Date in format `dd/mm/yyyy`                                                 |
| Time                  | Time in format `hh:mm:ss`                                                   |
| Global_active_power   | Minute-averaged active power (kilowatts)                                    |
| Global_reactive_power | Minute-averaged reactive power (kilowatts)                                  |
| Voltage               | Minute-averaged voltage (volts)                                             |
| Global_intensity      | Minute-averaged current intensity (amperes)                                 |
| Sub_metering_1        | Energy for kitchen appliances (watt-hour)                                   |
| Sub_metering_2        | Energy for laundry appliances (watt-hour)                                   |
| Sub_metering_3        | Energy for electric water heater and air-conditioner (watt-hour)            |

## Data Processing Steps

1. **Data Loading**:
   - Read the file using `read.table` with `na.strings = "?"` and `sep = ";"`.

2. **Date and Time Conversion**:
   - The `Date` column is converted to `Date` class.
   - A new `datetime` column is created by merging `Date` and `Time` using `as.POSIXct`.

3. **Filtering**:
   - Data is filtered to include only two dates:
     - `2007-02-01`
     - `2007-02-02`

4. **Type Conversion**:
   - Power and sub metering columns are explicitly converted to `numeric` to avoid plot errors.

## Outputs

### plot1.png
- **Plot Type**: Histogram
- **Variable**: `Global_active_power`
- **Title**: "Global Active Power"
- **X-axis**: Global Active Power (kilowatts)

### plot2.png
- **Plot Type**: Time series (line plot)
- **Variable**: `Global_active_power` over time
- **Y-axis**: Global Active Power (kilowatts)

### plot3.png
- **Plot Type**: Multi-line time series
- **Variables**: `Sub_metering_1`, `Sub_metering_2`, `Sub_metering_3`
- **Legend**: Top right

### plot4.png
- **Plot Layout**: 2x2 grid
  1. `Global_active_power` vs time
  2. `Voltage` vs time
  3. `Sub_metering_1/2/3` vs time with legend
  4. `Global_reactive_power` vs time

## Notes

- Missing values were removed automatically when reading the data with `na.strings = "?"`.
- All time-series plots use the `datetime` column on the X-axis.
- PNG outputs are 480x480 pixels.

## Units

- Power: kilowatts
- Voltage: volts
- Current: amperes
- Sub metering: watt-hours

