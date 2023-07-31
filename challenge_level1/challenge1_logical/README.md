# CHALLENGE1_LOGICAL
In this challenge, we had to find bugs in test.S and fix them so that it runs fine on Spike simulation.

Following are the two bugs found in test.S :-

1) The source register (rs2) "z4" mentioned in "and" instruction, which is an R-type instruction, is not declared anywhere in the test. Thus, replaced it with the register "t4" which is declared in the test.

   <img width="260" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/5887cc90-e1e4-469e-8ef6-e30deb6226c3">

3) "andi" is an I-type instruction and a source register is provided instead of immediate value. Thus, replaced the register "s0" with an immmediate value "0xff".

   <img width="254" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/a44f6d3d-27f1-4846-99b2-fff9dbee7a72">
