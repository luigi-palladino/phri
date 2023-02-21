# phri

Project for Physical Human Robot Interaction course A.Y. 2022-2023.

Università degli Studi di Verona

Author:
Luigi Palladino - luigi.palladino@studenti.univr.it

The scope of the project is to reproduce the 4-CH teleopration architecture proposed in D. Sun, F. Naghdy and H. Du, "Wave-Variable-Based Passivity Control of Four-Channel Nonlinear Bilateral Teleoperation System Under Time Delays," in IEEE/ASME Transactions on Mechatronics, vol. 21, no. 1, pp. 238-253, Feb. 2016, doi: 10.1109/TMECH.2015.2442586.

Major contributions of this paper:
  1. Introduction of a new wave transformation that can be applied to a 4-CH architecture to achieve high transparency and channel passivity, even in the presence of constant time delays.

  2. Development of a wave-based TDPA (Time-Delayed Passivity Approach) that guarantees system passivity even in the presence of time-varying delays.

  3. Demonstration that the proposed system can achieve higher transparency compared to passivity-based systems from previous work while maintaining stability under random time delays.

  4. Proof of the system stability in different environments.

  5. Validation of the proposed algorithm's performance using the 3-DOF teleoperation system.

Contributions from 1 to 3 are reproduced in this project in a simplified scenario.

The "robot" implemented in this simulation is a very simple 1 DOF bar actuated by an electrical motor.

The implementation is made entirely in Matlab Simulink and use Level2 S-functions to create the passivity observer/controller described in the paper.

Results in constant and variable delay listed below.

An ablation test has also been performed to verify the impact of each feature in the architecture.

- Variable-time-delay:

![Variable-time-delay](/images/variable_full.png "Variable-time-delay")

- Constant-time-delay:

![Constant-time-delay](/images/constant_full.png "Constant-time-delay")


