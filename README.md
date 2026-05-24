# Smart-Solar-Tracking-System

A Smart Solar Tracking System developed using Arduino UNO, LDR sensors, servo motor control, and MATLAB-based PID feedback control to improve solar energy harvesting efficiency.

## Overview

Traditional fixed solar panels remain stationary and cannot continuously follow the movement of the sun throughout the day. This reduces the overall energy generated, especially during morning and evening hours.

This project presents an automated solar tracking mechanism that continuously aligns the solar panel toward maximum sunlight intensity using sensor feedback and servo motor control.

The system integrates embedded systems, control logic, automation, and renewable energy concepts into a practical working prototype.

---

## Features

* Automatic sunlight tracking
* Arduino-based embedded control
* MATLAB PID-based monitoring and control
* Real-time sensor data visualization
* Servo motor based panel alignment
* Stable tracking using filtering and threshold control
* Low-cost and practical implementation

---

## Components Used

* Arduino UNO
* LDR Sensors
* SG90 Servo Motor
* Solar Panel
* Breadboard and Jumper Wires
* MATLAB

---

## Working Principle

1. LDR sensors detect sunlight intensity from different directions.
2. Arduino reads the sensor values.
3. MATLAB PID control logic calculates alignment error.
4. Control signals are sent to the servo motor.
5. The solar panel rotates toward maximum sunlight intensity.
6. Continuous feedback maintains proper alignment.

---

## PID Control and Stability

The system incorporates PID-inspired feedback concepts to improve tracking accuracy and stability.

### PID Functions

* Proportional Control (P) – Corrects immediate alignment error
* Integral Control (I) – Reduces steady-state error
* Derivative Control (D) – Improves stability and reduces overshoot

### Stability Enhancements

* Low-pass filtering
* Threshold-based control
* Servo movement limiting
* Noise reduction techniques

These improvements help reduce sensor noise, servo jitter, and unnecessary panel movements.

---

## Testing and Validation

The project was tested under multiple operating conditions to evaluate:

* Sensor response accuracy
* Servo motor performance
* Automatic tracking operation
* Stability during continuous operation
* Tracking efficiency compared to fixed solar panels

The system demonstrated stable operation, smooth panel movement, and improved sunlight alignment.

---

## Results

The tracking solar panel generated better voltage output compared to a fixed solar panel, particularly during morning and evening hours.

| Time     | Fixed Panel Voltage | Tracking Panel Voltage |
| -------- | ------------------- | ---------------------- |
| 9:00 AM  | 4.2 V               | 5.7 V                  |
| 10:00 AM | 5.1 V               | 6.1 V                  |
| 12:00 PM | 6.1 V               | 6.4 V                  |
| 2:00 PM  | 5.3 V               | 6.0 V                  |
| 4:00 PM  | 3.8 V               | 5.1 V                  |

---

## Project Structure

```bash
Smart-Solar-Tracking-System/
│
├── codes/
│   ├── solar_tracker.ino - Arduino source code
│   └── solar_tracker_pid.m - MATLAB PID controller
│
├── images/
│   ├── solar_tracker_schematic.png - Circuit diagram
│   └── Solar_Tracker_setup.png - Prototype setup image
│
├── presentation/
│   ├── SunTracking_SolarSystem_PPT.pdf - Project presentation
│   └── SunTracking_SolarSystem_PPT.pptx - Editable presentation
│
├── report/
│   └── SunTracking_SolarSystem_Report.pdf - Project report
│
└── README.md
```

---

## Applications

* Solar power systems
* Renewable energy projects
* Educational embedded system projects
* Smart automation systems
* Rural energy solutions

---

## Future Scope

* Dual-axis solar tracking
* IoT-based monitoring
* Cloud data logging
* AI-assisted optimization
* Smart energy management systems

---

## Team Members

* Mani Sharan Raj Mengani
* Rishitha Vallika Pulaparthi
* Larshitha Borra

---

## Conclusion

The Smart Solar Tracking System successfully demonstrates automatic sunlight tracking using embedded systems, servo motor control, and PID-based feedback mechanisms.

The project provides a low-cost and practical solution for improving solar energy utilization while also serving as an educational platform for automation, renewable energy, and control system concepts.
