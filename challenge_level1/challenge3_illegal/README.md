# CHALLENGE3_ILLEGAL

In this challenge, we had to modify test.S, so that it runs fine on Spike simulation.

After the exception causing instruction is executed, it's address is stored into "mepc" register, as "mepc" register stores the virtual address of the instruction that was interrupted or that encountered the exception. The test reads the value of "mepc" register into t0 register. "addi" instruction is used to increment the t0 register with the address of the next instruction and its value is written back to mepc register. mret instruction is used to return from the traps.

<img width="206" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/77cdd5fc-8eb0-4ae9-87d5-11267d794303">
