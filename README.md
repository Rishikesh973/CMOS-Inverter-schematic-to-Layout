# CMOS_Inverter:schematic-to-Layout
CMOS_Inverter using sky130nm Technology 

Design of cmos inverter schematic & analyzing its Noise Margin, Power and Delay
---
The task is to analyse the DC character of the nmos and pmos and is IV response initially, Then to construct a schematic for Inverter and analyse its Noise Margin, Delay & Power consuption finally we gonna draw Layout for the inverter we constucted and compare the Voltage Transfer Characters 

---
## Contents
- 1.Softwares Used
-  2.DC sweep analysis of NMOS & PMOS
- 3.Schamtic of CMOS Inverter
-   4.Noise Margin Analysis
- 5.Delay Analysis
- 6.Power Analysis
- 7.Layout


---

### 1. Softwares Used

- 1.Xschem(For Constructing Schematics for Inverter)
- 2.Open PDK( open Source Process Design Kit by Skywater of 130nm Technology)
- 3.Magic(For Drawing Layout)
- 4.Netgen(LVS tool)
- Install these through (https://xschem.sourceforge.io/stefan/xschem_man/tutorial_xschem_sky130.html)

  ---
 ## 2. DC Trancfer Chararacteristics
  ---
### 2.1 DC Sweep of NMOS


NMOS (N-type Metal-Oxide-Semiconductor) transistors are fundamental semiconductor devices commonly used in Pulldown network. These transistors operate in enhancement mode, meaning they require a positive voltage at the gate terminal to enable current flow between the drain and source terminals. NMOS devices typically have a positive threshold voltage, around 0.7-1.0 volts(the transistor that we using in this project designed by SKy130 has a Vth of 0.8v), making them suitable for efficient digital logic design. They act as voltage-controlled switches, with low ON-resistance when turned on. NMOS transistors are integral components in modern electronics, enabling the creation of logic gates and digital circuits essential for computing and signal processing. The nmos can only dischare the capacitor to GROUND it can charge only up to Vdd-Vth thats why the nmos is used in pulldown network.


![nmos_circuit](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/3c169d29-c2a1-44af-92c1-c6e45e81a593)
- Here we gonna give Vgs of 0 to 1.8volts and Vds of 0 to 2volts for simulation
  
  
![nmos_Id](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/c22bcdb1-e86e-408f-96ba-b36f01e4997a)
- Since the Threshold voltage of the nmos is 0.8v the Drain Current start to increase when the Vgs crosses the Vth. Multiple Currents are shown in the image which is simulated for different Vds


![nmos_Idsweep](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/7bebb0e0-57a0-44e6-b787-f8d79ff3ee7e)
- Then the IV plot for the NMOS is simulated by varying the Vgs without changing of Vds

  ---
  ### 2.2 DC Sweep for PMOS
  
  PMOS (P-type Metal-Oxide-Semiconductor) transistors are essential semiconductor devices commonly used in Pullup network. PMOS devices also operate in enhancement mode, requiring a negative voltage at the gate terminal to enable current flow between the drain and source terminals. They typically have a negative threshold voltage, usually around -0.7 to -1.0 volts(the transistor that we using in this project designed by SKY130 has a Vth of -0.8v). PMOS transistors function as voltage-controlled switches, with higher ON-resistance when turned on compared to NMOS transistors. These devices are crucial for complementing NMOS transistors in CMOS (Complementary Metal-Oxide-Semiconductor) technology, allowing the efficient design of digital logic circuits with both logic states (high and low) , The pmos can only used for charging the capacitor till Vdd and it can discharge only up to Vdd+Vth(Vth is -ve) thats why pmos is used in pullup network
  
![pmos_circuit](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/aeea1085-90ee-4c2a-923f-85b0df21072e)
  - Circuit for PMOS Transistor

![pmos vcc](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/f8cde815-3c9f-4f08-b9b4-ac5843a861a8)
 - Input for pmos in source terminal from 0 to -2v
   
![pmos_gate_vol](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/a6ee4e4c-4b0b-483f-b61e-9180e3119002)
- Input in gate terminal from 0 to -2 v

  ![Pmos_Id](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/b07829dc-6e15-4860-a504-3a4591478c06)
  - The Drain current of the pmos transistor is simulated for various Vgd and Vdd. The source Current start to Increase when we cross -0.8v ,since the Treshold voltage of the pmos in -0.8v. Different current curves are shown for various source voltages
 
    ![pmoc_Id_sweep](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/f465b3b1-af5b-40db-98bf-351377c54bd3)
  - Drain current for the various gate voltage with constant source voltage
Successfully we have completed DC anlysis for MOS transistors, In the next section lets do the schematic for the inverter

---
## 3.Schematic of Inverter in xschem

A schematic diagram of a CMOS (Complementary Metal-Oxide-Semiconductor) inverter typically consists of two transistors, one NMOS (N-type Metal-Oxide-Semiconductor) and one PMOS (P-type Metal-Oxide-Semiconductor), interconnected to create an efficient digital logic gate.

The NMOS transistor has its source terminal connected to the ground (0V) and its drain terminal connected to the output node. Its gate terminal is the input to the inverter. Conversely, the PMOS transistor has its source terminal connected to the power supply voltage (Vdd) and its drain terminal also connected to the output node. The gate terminal of the PMOS transistor is connected to the same input signal but inverted.

When the input signal is low (0V), the NMOS transistor is off, while the PMOS transistor is on, allowing the output node to be at a logic high level (Vdd). Conversely, when the input signal is high (Vdd), the NMOS transistor is on, and the PMOS transistor is off, resulting in the output node being at a logic low level (0V). This behavior makes the CMOS inverter an essential component in digital circuits for logic signal inversion and signal amplification while consuming minimal power when idle, owing to its use of complementary transistors.

 ![Inv_schematic](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/a511c81a-62f2-4beb-b6c5-9ad04a79c725)

 - After creating a schematic for inverter create a testbench symbol for the schematic which is in .sym format to do various analysis

     ![inv_sym](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/a2b365ad-029b-4236-a89e-ab2426ab7cd3)


   - Set the vin as 0 so that we can use the code box in xschem to sweep the vin from 0 to vdd. The width of the NMOS and PMOS is 1 initially so that we can't
     get the desired trip piont Vm, ideally the Vm will be (Vdd/2) in practical cases it will not (vdd/2) but. When the size of both transistor are 1 the
     Vm comes around 0.83, to increase the trip point of to bring it closer to 0.9 we should double the size of the pmos now the width of nmos is 1 and pmos is 2 (note: Length should be Unchanged)
     - The Reason to increase the width of the pmos is to increase the conductivity since Width is inversly proportional to resistance

       ![inv_vtc](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/adeebf14-f81b-4115-9452-02474cf974f6)

- Here's the Vtc curve of the inverter we constructed

- Schematic of standard CMOS inverter(1x) is Successfully constructed, In the next section we anlysis the noise margin of the inverter

---
## 4. Noise Margin Analysis

 The noise margin of a CMOS inverter is a measure of its ability to tolerate small variations in input voltage levels without causing erroneous or unpredictable logic state changes at the output. There are two noise margins associated with a CMOS inverter: the high-level noise margin (Vil) and the low-level noise margin (Vih).

 ### High Level Noise margin(Vil & Voh)
   It is the maximum allowable noise (voltage fluctuation or deviation from ideal logic levels) at the input of a CMOS inverter while still ensuring that the output remains in the high logic state (logical 1). It quantifies the noise immunity for a high logic level. A larger NMH indicates better noise tolerance for logic high.

### Low Level Noise Margin(Vih &Vol)
  It is the maximum allowable noise at the input of a CMOS inverter while maintaining the output in the low logic state (logical 0). It measures the noise immunity for a low logic level. A larger NML signifies better noise tolerance for logic low.

  - Noise margins are crucial for reliable digital circuit operation, as they provide a safety margin against noise, process variations, and other transient effects that can occur in real-world applications. In CMOS technology, where transistors switch between high and low states efficiently, having substantial NMH and NML ensures robust and noise-resistant logic gates and circuits. These margins are influenced by various factors, including the threshold voltage of transistors and the supply voltage. We can optimize these parameters to achieve desired noise margins for  specific applications.

### Calculation of Noise Margin
 - To find the minimum and maximum error voltage we have to find the gain of the inverter for that we can use the command "deriv(vout)" in the ngspice
   command window, the gain of the inverter comes around -12v when vin comes closer to 1 and then decreases -ve sign is not significant for us so
   by using the command "gain=abs(deriv(vout))" get the positive gain value and the multiply by 1.8 and divide by 12 for normalizing for our usecase.
   
![nma_range](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/b534f171-40af-4360-8d77-07930e3f88a4)

- now to find Vil and Vilh plot the gain curve in Vtc curve

![nma crossover](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/0f1d2f2d-f7e8-405e-a048-2bd8e9b29092)

- To find Vil use command "meas vil dc find vin when gain=1 cross=1" the command refers to 'measure the vil(variable) in DC simulation and find when vin crosses the gain curve for the first time'
-    Vil=8.1e-01
-    similarly using "meas vih dc find vin when gain=1 cross=last" here we measuring the value when the vin crosses the gain curve for the last time
-    Vih=1.8 - 9.8e-01 =0.82
-    In ideal transistor Vil and Vih will be equal
-    Now we clearly understand that upto 0.81v the circuit is tolerable to maintain the HIGH state and 0.82v on the downside it  maintain in the LOW state
  Noise Margin Analysis is completed, in the next section we going to analye the Delay
---
## 5. Delay Analysis
 ### 5.1. Propagation Delay
 
- The propagation delay of a CMOS inverter is a critical parameter that measures the time it takes for the output of the inverter to change in response to a change in its input. There are two components to the propagation delay: the delay when transitioning from a low input to a high output (tPLH) and the delay when transitioning from a high input to a low output (tPHL), we usually calculte by 50% of input to 50% of output.

- tPLH (Propagation Delay High to Low): This is the time it takes for the output of the CMOS inverter to transition from a logic high (1) to a logic low (0) in response to a change in the input from logic low to logic high. It is the time required for the NMOS transistor to turn on and pull the output to logic low while the PMOS transistor turns off.

- tPHL (Propagation Delay Low to High): This is the time it takes for the output of the CMOS inverter to transition from a logic low (0) to a logic high (1) in response to a change in the input from logic high to logic low. It is the time required for the PMOS transistor to turn on and pull the output to logic high while the NMOS transistor turns off.

![with_1pf](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/19b0bc70-5276-4db4-967f-20606cfc8d7b)
- To perform delay analysis we are not going to do DC analysis instead we going to do transient analysis, To do that and ".tran 0.2n 10n" in the code box of inverter symbol after netlisting use commant "setplot tran1" to enter into transient analysis or remove the line "dc 0.2 1.8" you will automaticall goes into transient
- In Vin use the command "PULSE(0 1.8 0 0.3n 0.3n 3n 6.6n 5)" in vlaue place then the Vin change to pulse mode for the ginven spec
- Syntax: PULSE( V1 V2 Td Tr Tf PW Period)

  ![vin_pulse](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/32979a0c-c6df-4205-90a6-4a13feac584e)
  

![vtc_pulse](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/0ad89eb9-40e2-4dd7-852c-6e07539fcb97)

 -Vtc for pulse input

 ### 5.2 VpHL & VpLH
  - Measure the VpHL as per the Image
  - To find VpLH just change the command FALL=2 while finding vin50 and RISE=2 while finding vout50
  - VpHL=7.04e-12s
  - VpLH=6.9e-12s
    
![low_tpHL](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/374952bb-7039-498f-afa4-0d8fa74c486d)

### 5.3 Rise and Fall Time
  The rise time (tR) and fall time (tF) of a CMOS inverter are key parameters that characterize how quickly the output voltage transitions from one logic state to another in response to a change in the input, usually it is calculated by taking different of time taken to reach 90% of value and 10% of the value . These times are defined as follows:

Rise Time (tR): The rise time is the time it takes for the output voltage to transition from a logic low (0) to a logic high (1) when the input changes from a low to a high level. In other words, it measures how quickly the output rises when the input changes from 0 to 1.
   tR=tR90 - tR10

Fall Time (tF): The fall time is the time it takes for the output voltage to transition from a logic high (1) to a logic low (0) when the input changes from a high to a low level. It measures how quickly the output falls when the input changes from 1 to 0.
   tF=tF10 - tR90

These parameters are influenced by various factors, including the characteristics of the transistors used in the CMOS inverter, the load capacitance at the output, and the driving capabilities of the inverter. Generally, designers strive to minimize rise and fall times to ensure that digital signals switch quickly and accurately, especially in high-speed applications. Reducing these times can improve the overall speed and performance of digital circuits while also reducing the potential for signal integrity issues such as signal distortion and noise.

- Rise and Fall time can be calculated in transient analysis using the commands in the following images
  
![Rise_time](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/9f97472a-68dd-4920-9cfa-4e2fb3511bfb) 
![Fall_time](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/ef0414a8-4996-49df-86dc-0a39214cf896)

### 5.4 Loaded Delay Analysis
- In digital circuits inverter may used in places where it has to drive the next cell in the circuit, so to analyse the loaded scenario, a 1pf capacitace is connected as load in output terminal
- After adding Capacitor the standard inverter takes more time to rise and fall and its propagation delay is increased 
![1xinv_with-c](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/7b824979-51cd-4b5e-a305-e64ed809a9cb)

- To overcome this issue we can increase the width of the transistor but the rule that width(pmos)=2*width(nmos) should hold always
- Now we going to try out various sizes of inverter and see its Vtc & how size affact the propagation delay

![2x_inv](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/abab8d5f-73aa-4341-b56c-ae67bbcb094b)
Schematic of 2x inverter (nmos w=2 , pmos w=4)
  
  ![2xinv_with-c](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/d021618e-ad71-42d6-a836-80a195b30ff2)

- see how the timing parameter has changed by increasing the width

   
![8xinv_with-c](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/a5009f77-638f-405c-829b-46ec971e29c9)
- Vtc of 8x inverter, this inverter will have high drive strength, low propagation Delay ,low rise and fall time as it alligning with ideal inverter & also remember that when we increase the width the area and power consuption  will increase, we'll see the power analysis of inverter in next section

---
## 6. Power Analysis
The power consumed by a CMOS (Complementary Metal-Oxide-Semiconductor) inverter depends on several factors, including the supply voltage (Vdd), the switching activity, and the parasitic capacitance at the output. The power consumed can be categorized into static power and dynamic power.

Static Power (P_static): This is the power consumed by the CMOS inverter when it is not switching and is in a static state. It primarily depends on the leakage current through the transistors and is typically very low in CMOS technology, especially when the transistors are in the OFF state. Static power consumption increases with higher supply voltage and process technology.

Dynamic Power (P_dynamic): Dynamic power is the power consumed when the CMOS inverter is actively switching its output in response to changes in the input signal. It depends on the following factors:

Switching Frequency (f): How often the CMOS inverter switches its output.
Load Capacitance (C_load): The capacitance at the output node, including the capacitance of any connected wires or gates.
Supply Voltage (Vdd): The voltage level at which the inverter operates.
Activity Factor (α): The proportion of time the signal spends in each logic state (0 or 1). For a simple inverter, α is typically 0.5 (equal time in each state).
- We doing this power analysis in DC simulation of a standard inverter with the load capacitance of 0.2pf
Total Power= (integral(p(t)) from 0 to T)/T
 - To find the power we can use the command "meas dc curr_inte integ -vdd#branch from=20e-09 to=40e-09 " it will give a value of -7.29e-13
   since the voltage is conatant multiply it with 1.8
- Intermediate Power= -7.28e-12 * 1.8 = -1.31e-12
- Now divide the Intermediate power by 20ns to find Instantenous Power
- Inst_Power=(-1.31e-12/20e-12)= -6.559e-06 watts (-ve sign Indicates that the power is consumed)

  - TOTAL POWER= 65.5 micro watts
---
## 7 . Layout of CMOS inverter using Magic tool

The layout process of a CMOS  inverter involves physically designing the arrangement and connections of transistors and interconnects on a semiconductor substrate. This layout aims to create a functional CMOS inverter while optimizing for factors such as area, performance, and manufacturability. Here's a simplified overview of the layout process:

1. **Substrate:** Start with a semiconductor substrate, typically made of silicon. The choice of the substrate material is essential for the electrical characteristics of the CMOS inverter.

2. **Transistor Placement:** Place the NMOS (N-type Metal-Oxide-Semiconductor) and PMOS (P-type Metal-Oxide-Semiconductor) transistors in close proximity to each other. These transistors will form the core of the CMOS inverter.

3. **Gate Formation:** Create the gate terminals for both the NMOS and PMOS transistors by depositing and patterning a layer of gate material, such as polysilicon. The gate material acts as a control terminal for the transistors.

4. **Source and Drain Regions:** Define the source and drain regions of the transistors. This involves ion implantation or diffusion processes to create regions with the desired doping profiles.

5. **Interconnects:** Add interconnect layers made of materials like metal or metal silicides. These interconnects connect various parts of the inverter, including the transistor terminals, power supply lines, and input/output connections.

6. **Metal Layers:** Create metal layers to establish electrical connections between different parts of the CMOS inverter. These metal layers are used to route signals and power throughout the circuit.

7. **Well Taps:** Insert well taps to connect the substrate to the power supply rails, ensuring proper biasing and electrical isolation.

8. **Dummies and Spacer Cells:** In advanced semiconductor processes, dummy structures and spacer cells may be added to improve manufacturing yield and ensure uniformity across the chip.

9. **Design Rules and DRC:** Ensure that the layout adheres to the design rules specified for the particular semiconductor manufacturing process. Design Rule Checking (DRC) tools are used to verify compliance with these rules.

10. **Verification and Simulation:** After the layout is complete, perform simulations and verification to ensure that the CMOS inverter functions as intended and meets performance specifications.

![layout](https://github.com/Rishikesh973/CMOS-Inverter-schematic-to-Layout/assets/145873226/50d2bb03-6817-491a-aa78-d496a15a42a6)


---

**Successfully the project  "CMOS inverter schematic to Layout" is done**










