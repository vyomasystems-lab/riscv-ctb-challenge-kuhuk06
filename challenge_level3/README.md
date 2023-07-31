# CHALLENGE_LEVEL3

In this challenge, we have to find bugs and coverage in the given design.

1) Bugs in the given design
   
   We have used random test generation through AAPG (Automatic Assembly Program Generator) method to find bugs in the given design.
   The following modifications are made in the rv32i.yaml to generate the test :-
   
   --> Incresed the number of instructions to 1000
   
   <img width="446" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/3fd87e0a-e073-4090-bde8-fd6489f164ed">

   --> Provided weightage to each type of rv32i instruction 

   <img width="256" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/3fcec62c-2499-45fd-960b-5b4cb3d75151">

   This rv32i.yaml file helped in generating tests which helped in uncovering bugs of the design. Upon executing the test, the diff between rtl.dump and spike.dump resulted in following bugs:-

   BUG1 ---> or instruction performs xor operation
   
   <img width="299" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/a356a22d-b2b1-481f-a7d5-fbd1397bea25">
   
   After decoding the instruction mentioned in diff logs, we found the following details ---

   opcode = 0110011

   rd = 00110 (x6)

   funct3 = 110 (OR)

   rs1 = 11110 (x30)

   rs2 = 11110 (x30)

   funct7 = 0000000

   Since the content of rs1 and rs2 is same, rd will be equal to 0, if xor is performed else if or is performed, it would be 0x00b34767.

   BUG2 ---> ori instruction performs xori operation
   
   <img width="299" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/d4923846-1968-4210-8e59-0be37f9e7992">
   
   After decoding the instruction mentioned in diff logs, we found the following details ---

   opcode = 0010011

   rd     = 11100 (x28)

   funct3 = 110 (OR)

   rs1    = 01110 (x14)

   imm    = 111101111100 (f7c)

   After grepping the value of rs1 register, we found that rs1 = 0x70000000.

   rd     = 0x70000000 OR 0xffffff7c (sign-extended imm. ) = 0xffffff7c

   if xor is carried out, rd would be

   rd     = 0x70000000 XOR 0xffffff7c = 0x8fffff7c

   Please refer files in directory random_test/BUG_OR_ORI
   
3) Coverage

   The following changes are made in testlist.yaml :-
   
   <img width="365" alt="image" src="https://github.com/vyomasystems-lab/riscv-ctb-challenge-kuhuk06/assets/22321279/af111613-5388-4142-a976-32822d5cf31d">

   ---> increased the instr_cnt to 500
   
   ---> removed lines to generate FENCE, JUMP, CSR instructions ==== +no_fence=1
    +no_data_page=1
    +no_branch_jump=1 +no_csr_instr=1

   ---> added the directed test to geneerate JUMP instructions ==== +directed_instr_1=riscv_jal_instr,4

   The following commands are executed :-
   
   ---> run --target rv32i --test riscv_arithmetic_basic_test --testlist testlist.yaml --simulator pyflow --iteration 10
   
   This run command iterates 10 times
   
   ---> cov --target rv32i --test riscv_arithmetic_basic_test --testlist testlist.yaml --simulator pyflow --dir out_2023-07-31/

   This cov command leads to error: unrecognized arguments: +disable_compressed_instr=1

   So ran the python3 /tools/riscv-dv/pygen/pygen_src/test/riscv_instr_cov_test.py command directly on the terminal after removing "+disable_compressed_instr=1" argument, which lead to the following coverage report generation, which can be found in directory - riscv_dv_coverage/cov_out_2023-07-31/CoverageReport.txt
   



   
