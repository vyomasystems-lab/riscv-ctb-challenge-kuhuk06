# CHALLENGE2_LOOP

In this challenge, we had to find bugs in test.S, which implements a loop and fix them so that it runs fine on Spike simulation.

Following are the bugs found in test.S :-
1) The offset used with t0 register in the two "lw" load instruction for t2 and t3 registers is incorrect. Thus replaced it with 8 instead of 4 in first instruction and 16 instead of 8 in the second instruction as it needs to jump 8 locations to reach the next word.
 
   <img width="234" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/2b63cbc0-229c-4bc5-8c4f-2468909cf86c">

2) The offset used in addi instruction to increment the value of t0 register should be 24 instead of 16, as offset value "16" will point to third word instead of fourth word.
 
   <img width="210" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/2eabac51-2b70-4831-b62a-7fb90459f416">

3) The immediate value "fail" used in jump instruction "j" is not declared any where in the test. Thus replaced it with "test_end".
   <img width="221" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/9fa54a51-96e7-44a4-a850-22c3ccd10e8b">
