# Analysis of Station Footfall Trends Across the TFL Train Network (2019–2024)
## Introduction 
This project analyzes daily footfall data from TFL train stations across London between 2019 and 2024. Using metrics such as average daily usage, seasonality dependency, and footfall volatility, stations have been segmented into functional groups—including Low Footfall Stops, Residential Connectors, and Busy Interchanges. The core focus is on understanding patterns of station usage and building a data-driven framework for station classification based on zone and usage behavior.

## Dataset Overview
1. TFL Station Footfall Data (2019–2024)
Daily footfall data was sourced from the official [Transport for London website](https://crowding.data.tfl.gov.uk/), where each year’s data is published as a separate file. The dataset includes key columns such as date, station name, entry tap count, and exit tap count. This rich time series data provides valuable insights into how station usage fluctuates over time across the TFL network.

2. TFL Station Metadata
Complementary metadata about each station was collected from a [Kaggle dataset](https://www.kaggle.com/datasets/olisao/transport-for-london-tfl-entry-and-exit-dataset/data), which includes details like the station’s zone, lines served, network classification, and geographical coordinates (latitude and longitude). This data enabled spatial segmentation and contextual understanding of station behavior within the broader network.

## Tools & Concepts
#### Tools Used:
- Microsoft Excel – Used for initial data preparation, including combining yearly footfall files into a single consolidated dataset.
- Power BI – Used to develop interactive dashboards and implement a scoring system using advanced DAX queries.

#### Key Concepts Applied:
- Comparative Analysis – Benchmarking stations across usage metrics to identify relative performance.
- Z-Score Calculation – Standardizing metrics to support meaningful comparison and segmentation.
- Time Series Trend Analysis – Examining seasonal patterns and long-term usage shifts across years.
- Footfall Volatility & Seasonality Metrics – Measuring variability and dependency on seasonal factors to classify station behavior.

## Methodology
1. **Data Cleaning & Transformation**
Once the Excel CSV files were consolidated, the dataset was loaded into Power BI. Using the Power Query Editor, data types were validated, and missing values, duplicates, and inconsistencies were addressed. This step ensured the data was clean and ready for analysis, laying the foundation for accurate insights.

2. **Station Usage Overview**
The first step in analysis was to visualize station usage patterns through a set of interactive dashboards in Power BI. Key metrics such as average daily footfall, monthly usage breakdowns, year-over-year (YoY) calculations, and identification of the busiest stations and peak days/months were included. This provided a comprehensive understanding of how footfall varied over time and highlighted seasonal trends within the data.
![Alt text](img/yoy.png)

4. **Station Segmentation**
To categorize stations, a scoring system was carefully designed, supported by analytical concepts. Five main metrics were considered:
- Average daily footfall
- Average YoY growth
- Day dependency index
- Month dependency index
- Footfall volatility

Each of these metrics was calculated for every station. To ensure consistency and comparability across stations, Z-score normalization was implemented. This method was chosen because Z-scores standardize each metric, removing the influence of scale differences and making it easier to compare stations with varying footfall levels. Based on the individual Z-scores, a composite Z-score was computed for each station. Stations were then assigned labels according to the range in which their composite Z-scores fell, classifying them into distinct groups.
![Alt text](img/Z_AvgDailyFootfall.png)


4. **Station Dashboard**
To facilitate deeper analysis, a Station Stats Dashboard was created. This interactive dashboard allows users to select any station and view its individual metrics, historical footfall patterns, and classification details.
![Alt text](img/StationStatsDashboard.png)


## Findings 
1.	**Dramatic COVID-19 Impact and Recovery Pattern** - The network experienced a severe 62% drop in footfall during 2020, falling from 3.17 billion to 1.21 billion passengers. Recovery has been steady but incomplete, with 2024 figures (2.72 billion) still 14% below pre-pandemic levels. 
2.	**Zone Distribution Reveals Central London Dominance** - Nearly half (45.52%) of all network usage occurs in Zone 1, with Zone 2 accounting for an additional 27.73%. This concentrated usage pattern underscores the continued importance of central London 
3.	**Elizabeth Line Integration Transforming Key Stations** - Stations connected to the Elizabeth Line show exceptional growth, with Tottenham Court Road (169% YoY growth in 2022) and Farringdon (156% YoY growth in 2022) experiencing dramatic increases in footfall.
4.	**Changing Weekly Usage Patterns** - Thursday has emerged as the busiest day (16.88K average footfall), while Monday shows relatively lower usage (13.52K), suggesting a mid-week concentration of office attendance. This indicates a lasting change in work patterns post-pandemic. 
5.	**Stratford as a Zone 2 Outlier** - Despite being outside Zone 1, Stratford ranks as the 5th busiest station with 131,097 daily passengers, outperforming many central London hubs. With a strong Z-score of 0.62, it demonstrates the growing importance of strategic outer hubs and the successful development of East London as a major transport and commercial centre.
