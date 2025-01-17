# Drought Heat Risk (DHR) Assessment
**This repository contains R and Arduino code used in the drought and heat risk assessment for urban green infrastructure and ecosystem services of Hammer Park, Plauen, Germany**. The code is highlighted in orange in the risk assessment's data flowchart (below).

Arduino version 2.3.2;
R-script version 4.4.1

1. **Arduino Soil Moisture Sensor** (Arduino_SM_Sensor):
The code calibrates and programs the Arduino UNO Microcontroller connected to the sensor to measure the plant's available water (PAW) based on the soil charge storing capacity.
Reference: [Zenodo DOI]

2. **Air Quality Correlation Code** (R_AirQ):
The code analyzes the (Spearman) correlation between the air quality (Particulate Matter < 10 microns [PM10]) and air temperature under a certain water availability.
Reference: [Zenodo DOI]

3. **Air Temperature Code** (R_AirT):
The code analyzes the historical air temperature to calculate the temperature value with a specific percentile (return period/frequency) of the heat hazard. The code also provides the option to identify days as heat waves.
Reference: [Zenodo DOI]

4. **TOPSIS Code** (R_TOPSIS):
The code normalizes and aggregates the different indicators based on specific weights into three indices. Technique for Order Preference by Similarity to Ideal Solution (TOPSIS) is a multi-criteria evaluation method.
Reference: [Zenodo DOI]

5. **Universal Thermal Climate Index Code** (R_UTCI):
The code uses input meteorological data to calculate the UTCI over a spatial area.
Reference: [Zenodo DOI]

6. **ENVI-met data validation Code** (R_Validation):
The code applies statistical methods of Mean Absolute Error and Root Mean Squared Error to validate the ENVI-met air temperature output at several spatial locations.
Reference: [Zenodo DOI]

Data flow description, abbreviations, and acronyms: [Zenodo DOI]

![DataFlowChart_HighlightCode](https://github.com/user-attachments/assets/36225ee1-f8f8-47a7-90ae-fce5ea2448a3)
