# Soil Moisture Sensor Specifications

For more info, check: Hrisko (2020) *Capacitive Soil Moisture Sensor Theory, Calibration, and Testing*. DOI: [10.13140/RG.2.2.36214.83522](https://doi.org/10.13140/RG.2.2.36214.83522)

## A. Material Used:
1. **Probe #1**:  
   - Capacitive soil moisture sensor v2.0; HW-390  
   - Voltage: 3.3–5 V  
   - Dimensions: Length 10 cm; Width 2.2 cm  

2. **Arduino UNO Microcontroller**:  
   - Model: ATmega328 R3 Board CH340  
   - Board version: R3; USB-Chip: CH340  
   - Microcontroller: Atmel ATmega328-PU (SMD-Version)  
   - Features:  
     - 14 digital GPIOs (6 with PWM function)  
     - 6 analog inputs  
     - Output Voltage: 3.3V, 5V  
     - Recommended Input Voltage: 7–12V; Maximum Input Voltage: 6–20V  
     - Memory: 1KB EEPROM, 32KB Flash, 0.5KB Bootloader  

3. **Arduino-Compatible Micro SD Storage Board**:  
   - Voltage: 5V or 3.3V  
   - Power Supply: 4.5V ~ 5.5V (3.3V voltage regulator circuit board)  
   - Interface: SPI  
   - Pins: GND, VCC, MISO, MOSI, SCK, CS  

4. **Cables**

---

## B. Connections:

### Probe #1 to Control Board:
- Module GND → Arduino GND pin  
- Module VCC → Arduino VCC pin  
- Module AUOT → Arduino A0 pin  

### SD Card to Control Board:

---

## C. Calibrating and Testing:

### Calibration Readings:
- **Full dry conditions (air)**: 510 units  
- **Full dry conditions (dry soil)**:  
  - Humidity: 9% → 18.86  
  - Dryness: 482 (USED)  
- **Full wet conditions (glass of water)**: 192 units  
- **Full wet conditions (saturated soil)**:  
  - Humidity: 98% → 66.92  
  - Dryness: 196 (USED)  

---

## D. On-Site Procedure:
1. Record geolocation of the measurement point.  
2. Start soil moisture sensor in dry air for control.  
3. Remove topsoil layer with dense organic matter.  
4. Insert soil moisture sensor at 10 cm depth.  
5. Keep the sensor stable for at least 1 minute.  
6. Remove the sensor from the soil.  
7. Wait 30 seconds in dry air for control.  
8. Turn off the sensor.

The average of readings was calculated at each point after the sensor stabilized. Soil moisture (humidity) readings were converted to Plant Available Water (PAW).

### PAW Calculation:
\[ \text{PAW (%) = } 100 \times \frac{\text{SM – WP}}{\text{FC – WP}} \]

For loam soil:  
- Field Capacity (FC) = 33%  
- Wilting Point (WP) = 13%
