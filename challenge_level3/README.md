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
   
   BUG2 ---> ori instruction performs xori operation

   Please refer files in directory random_tests/BUG_OR_ORI
   
3) Coverage
   
   


   
