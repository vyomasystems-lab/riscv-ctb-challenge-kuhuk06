# CHALLENGE2_EXCEPTIONS

In this challenge, we have to upadate the .yaml file so that it generates a test with 10 illegal exceptions and it runs fine on Spike simulation.

AAPG allows the user to control the number of exceptions to be added to the program in the exception-generation section of the configuration file. In the exception-generation section, we have to provide weightage to "ecauseXX" to decide which exceptions are to be added in the test. It basically decides the probablity distribution of exceptions. 

The following changes are made in the rv32i.yaml file :-

<img width="441" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/6f843a42-909b-4a85-8009-de0464f92c78">

This rv32i.yaml file created the test.S after multiple runs, which generated the following exceptions :-

<img width="580" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/9ca47344-55fb-495a-a8e9-b5b7fdf05519">

Please refer the rv32i.yaml and test.S file present in this directory.
