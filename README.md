# Exploratory Data Analysis - Course Project 1

This project is part of the Exploratory Data Analysis course, and it uses data from the **UC Irvine Machine Learning Repository**.

## Dataset

**Individual household electric power consumption**  
- One-minute sampling rate  
- Almost 4 years of data  
- [Source Dataset](https://archive.ics.uci.edu/ml/datasets/individual+household+electric+power+consumption)

## Files Included

- `plot1.R`: Script to create a histogram of Global Active Power.
- `plot2.R`: Script to create a line graph of Global Active Power over time.
- `plot3.R`: Script to create a line graph showing three energy sub metering values over time.
- `plot4.R`: Script to create a 2x2 panel with plots of:
  - Global Active Power
  - Voltage
  - Sub metering
  - Global Reactive Power
- `plot1.png`, `plot2.png`, `plot3.png`, `plot4.png`: Output plots.
- `CodeBook.md`: Describes the variables and transformations used in this analysis.

## Data Usage

This analysis uses a subset of the data for the dates:
- **2007-02-01**
- **2007-02-02**

The dataset is filtered accordingly before generating the plots.

## How to Run

1. Make sure the dataset file `household_power_consumption.txt` is in your working directory.
2. Run any of the `plotX.R` files using:

```r
source("plot1.R")
