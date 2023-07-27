#define PRV_S 1
#define PRV_U 0
#define MSTATUS_MPP 0x00001800
#if __riscv_xlen == 64
  #define LREG ld
  #define SREG sd
  #define LREGU lwu
  #define REGBYTES 8
  #define FMV fmv.d.x
#else
  #define LREG lw
  #define LREGU lw
  #define SREG sw
  #define REGBYTES 4
  #define FMV fmv.w.x
#endif


# From here 
.align 2
.globl custom_trap_handler_s
custom_trap_handler_s:
  addi sp, sp, -40*REGBYTES

  SREG x1, 1*REGBYTES(sp)
  SREG x3, 3*REGBYTES(sp)
  SREG x4, 4*REGBYTES(sp)
  SREG x5, 5*REGBYTES(sp)
  SREG x6, 6*REGBYTES(sp)
  SREG x7, 7*REGBYTES(sp)
  SREG x8, 8*REGBYTES(sp)
  SREG x9, 9*REGBYTES(sp)
  SREG x10, 10*REGBYTES(sp)
  SREG x11, 11*REGBYTES(sp)
  SREG x12, 12*REGBYTES(sp)
  SREG x13, 13*REGBYTES(sp)
  SREG x14, 14*REGBYTES(sp)
  SREG x15, 15*REGBYTES(sp)
  SREG x16, 16*REGBYTES(sp)
  SREG x17, 17*REGBYTES(sp)
  SREG x18, 18*REGBYTES(sp)
  SREG x19, 19*REGBYTES(sp)
  SREG x20, 20*REGBYTES(sp)
  SREG x21, 21*REGBYTES(sp)
  SREG x22, 22*REGBYTES(sp)
  SREG x23, 23*REGBYTES(sp)
  SREG x24, 24*REGBYTES(sp)
  SREG x25, 25*REGBYTES(sp)
  SREG x26, 26*REGBYTES(sp)
  SREG x27, 27*REGBYTES(sp)
  SREG x28, 28*REGBYTES(sp)
  SREG x29, 29*REGBYTES(sp)
  SREG x30, 30*REGBYTES(sp)
  SREG x31, 31*REGBYTES(sp)
  csrr a0, sstatus
  csrr a0, sepc
  csrr a0, stvec
  csrr a0, scause 
  li a2, 0
  beq a0, a2, 1f
  li a2, 1
  beq a0, a2, 1f
  csrr a1, sepc   
  # li a2, 2
  # beq a0, a2, inst32_s
1:
  lh a2, (a1)
  # check the lower 2 bits to see if the instruction is 32-bit or 16-bit.
  andi a2, a2, 0x3;
  li t0, 0x3
  bne a2,t0,inst16_s
inst32_s:                           # is 32-bit instruction then increment by 4
  addi a1,a1,0x4
  beqz x0,1f
inst16_s:
  addi a1,a1,0x2                  # is 16-bit instruction then increment by 2
1: 
  csrw sepc, a1                   # point mepc to the next instruction.


  LREG x1, 1*REGBYTES(sp)
  LREG x3, 3*REGBYTES(sp)
  LREG x4, 4*REGBYTES(sp)
  LREG x5, 5*REGBYTES(sp)
  LREG x6, 6*REGBYTES(sp)
  LREG x7, 7*REGBYTES(sp)
  LREG x8, 8*REGBYTES(sp)
  LREG x9, 9*REGBYTES(sp)
  LREG x10, 10*REGBYTES(sp)
  LREG x11, 11*REGBYTES(sp)
  LREG x12, 12*REGBYTES(sp)
  LREG x13, 13*REGBYTES(sp)
  LREG x14, 14*REGBYTES(sp)
  LREG x15, 15*REGBYTES(sp)
  LREG x16, 16*REGBYTES(sp)
  LREG x17, 17*REGBYTES(sp)
  LREG x18, 18*REGBYTES(sp)
  LREG x19, 19*REGBYTES(sp)
  LREG x20, 20*REGBYTES(sp)
  LREG x21, 21*REGBYTES(sp)
  LREG x22, 22*REGBYTES(sp)
  LREG x23, 23*REGBYTES(sp)
  LREG x24, 24*REGBYTES(sp)
  LREG x25, 25*REGBYTES(sp)
  LREG x26, 26*REGBYTES(sp)
  LREG x27, 27*REGBYTES(sp)
  LREG x28, 28*REGBYTES(sp)
  LREG x29, 29*REGBYTES(sp)
  LREG x30, 30*REGBYTES(sp)
  LREG x31, 31*REGBYTES(sp)
  addi sp, sp, 40*REGBYTES
  sret

.align 2
.globl custom_trap_handler
custom_trap_handler:
  addi sp, sp, -40*REGBYTES

  SREG x1, 1*REGBYTES(sp)
  SREG x3, 3*REGBYTES(sp)
  SREG x4, 4*REGBYTES(sp)
  SREG x5, 5*REGBYTES(sp)
  SREG x6, 6*REGBYTES(sp)
  SREG x7, 7*REGBYTES(sp)
  SREG x8, 8*REGBYTES(sp)
  SREG x9, 9*REGBYTES(sp)
  SREG x10, 10*REGBYTES(sp)
  SREG x11, 11*REGBYTES(sp)
  SREG x12, 12*REGBYTES(sp)
  SREG x13, 13*REGBYTES(sp)
  SREG x14, 14*REGBYTES(sp)
  SREG x15, 15*REGBYTES(sp)
  SREG x16, 16*REGBYTES(sp)
  SREG x17, 17*REGBYTES(sp)
  SREG x18, 18*REGBYTES(sp)
  SREG x19, 19*REGBYTES(sp)
  SREG x20, 20*REGBYTES(sp)
  SREG x21, 21*REGBYTES(sp)
  SREG x22, 22*REGBYTES(sp)
  SREG x23, 23*REGBYTES(sp)
  SREG x24, 24*REGBYTES(sp)
  SREG x25, 25*REGBYTES(sp)
  SREG x26, 26*REGBYTES(sp)
  SREG x27, 27*REGBYTES(sp)
  SREG x28, 28*REGBYTES(sp)
  SREG x29, 29*REGBYTES(sp)
  SREG x30, 30*REGBYTES(sp)
  SREG x31, 31*REGBYTES(sp)
  csrr a0, mstatus
  csrr a0, mepc
  csrr a0, mtvec
  csrr a0, mcause 
  li a2, 0
  beq a0, a2, 1f
  li a2, 1
  beq a0, a2, 1f
  csrr a1, mepc   
  # li a2, 2
  # beq a0, a2, inst32
1:
  lh a2, (a1)
  # check the lower 2 bits to see if the instruction is 32-bit or 16-bit.
  andi a2, a2, 0x3;
  li t0, 0x3
  bne a2,t0,inst16
inst32:                           # is 32-bit instruction then increment by 4
  addi a1,a1,0x4
  beqz x0,1f
inst16:
  addi a1,a1,0x2                  # is 16-bit instruction then increment by 2
1: 
  csrw mepc, a1                   # point mepc to the next instruction.


  LREG x1, 1*REGBYTES(sp)
  LREG x3, 3*REGBYTES(sp)
  LREG x4, 4*REGBYTES(sp)
  LREG x5, 5*REGBYTES(sp)
  LREG x6, 6*REGBYTES(sp)
  LREG x7, 7*REGBYTES(sp)
  LREG x8, 8*REGBYTES(sp)
  LREG x9, 9*REGBYTES(sp)
  LREG x10, 10*REGBYTES(sp)
  LREG x11, 11*REGBYTES(sp)
  LREG x12, 12*REGBYTES(sp)
  LREG x13, 13*REGBYTES(sp)
  LREG x14, 14*REGBYTES(sp)
  LREG x15, 15*REGBYTES(sp)
  LREG x16, 16*REGBYTES(sp)
  LREG x17, 17*REGBYTES(sp)
  LREG x18, 18*REGBYTES(sp)
  LREG x19, 19*REGBYTES(sp)
  LREG x20, 20*REGBYTES(sp)
  LREG x21, 21*REGBYTES(sp)
  LREG x22, 22*REGBYTES(sp)
  LREG x23, 23*REGBYTES(sp)
  LREG x24, 24*REGBYTES(sp)
  LREG x25, 25*REGBYTES(sp)
  LREG x26, 26*REGBYTES(sp)
  LREG x27, 27*REGBYTES(sp)
  LREG x28, 28*REGBYTES(sp)
  LREG x29, 29*REGBYTES(sp)
  LREG x30, 30*REGBYTES(sp)
  LREG x31, 31*REGBYTES(sp)
  addi sp, sp, 40*REGBYTES
  mret


# To here
# Instructions to be inserted before and after the program
# Possible setups inside this macro can be
#   1. Privilege mode change
#   2. PMP Configuration - csrw pmpcfg0 xxx, csrw pmpcfg1 xxx

############################
### Exception generation ###
############################

# Instruction address misaligned
.macro ecause00
.endm

# Instruction access fault
.macro ecause01
li x15, -10
jr x15
.endm

# Illegal Instruction
.macro ecause02
.word 0x01239239812981
.endm

# Breakpoint
.macro ecause03
ebreak
.endm

# Load address misaligned
.macro ecause04
LREG x0, (REGBYTES-2)(sp)
.endm

# Load access fault
.macro ecause05
.endm

# Store/AMO address misaligned
.macro ecause06
SREG x0, (REGBYTES-2)(sp)
.endm

# Store/AMO access fault
.macro ecause07
.endm

# Env call from U-mode
.macro ecause08
.endm

# Env call from S-mode
.macro ecause09
.endm

# Reserved
.macro ecause10
.endm

# Env call from M-mode
.macro ecause11
ecall
.endm

# Instruction page fault
.macro ecause12
.endm

# Load page fault
.macro ecause13
.endm

# Reserved
.macro ecause14
.endm

# Store/AMO page fault
.macro ecause15
.endm

# Env call 
.macro switchmodes
ecall
.endm

.macro test_entry_macro
.endm
.macro pre_program_macro
add x0,x0,x0
 .endm
.macro post_program_macro
add x0,x0,x0
 .endm
.macro pre_branch_macro
add x0,x0,x0
 .endm
.macro post_branch_macro
add x0,x0,x0
 .endm
.macro test_pass_macro
la      sp, begin_signature; addi    sp, sp, 2*REGBYTES; li      t1, 0xfffff; SREG    t1, 0*REGBYTES(sp)
 .endm
.macro test_fail_macro
add x0,x0,x0
 .endm

# User defined functions to be called
    
.globl func1        
func1:
add x0,x0,x0
  ret

  .macro ecause00_00000
  # stack push
  addi sp, sp, -2*REGBYTES
  SREG a1,  1*REGBYTES(sp)
  SREG x10,  2*REGBYTES(sp)
    
  # exception
  la x10, 2f
  la a1, 1f
    1:
  jr 2(x10)
    2: 
  nop
  nop
  # stack pop
  LREG a1, 1*REGBYTES(sp)
  LREG x10, 2*REGBYTES(sp)
  addi sp, sp, 1*REGBYTES
  .endm
  
  .macro ecause00_00001
  # stack push
  addi sp, sp, -2*REGBYTES
  SREG a1,  1*REGBYTES(sp)
  SREG x10,  2*REGBYTES(sp)
    
  # exception
  la x10, 2f
  la a1, 1f
    1:
  jr 2(x10)
    2: 
  nop
  nop
  # stack pop
  LREG a1, 1*REGBYTES(sp)
  LREG x10, 2*REGBYTES(sp)
  addi sp, sp, 1*REGBYTES
  .endm
    
  .macro ecause00_00002
  # stack push
  addi sp, sp, -3*REGBYTES
  SREG a1, 1*REGBYTES(sp)
  SREG x10, 2*REGBYTES(sp)
  SREG x0, 3*REGBYTES(sp)
    
  # exception
  la x10, 2f
  la a1, 1f
  1:
  jalr x0, 2(x10)
  2:
  nop
  nop
  # stack pop
  LREG a1, 1*REGBYTES(sp)
  LREG x10, 2*REGBYTES(sp)
  LREG x0, 3*REGBYTES(sp)
  addi sp, sp, 3*REGBYTES

  .endm
  
.macro ecause02_00000
.word 0xFB08172F
.endm
      
.macro ecause02_00001
.word 0x2282489F
.endm
      
.macro ecause02_00002
.word 0xD1D576DB
.endm
      
  .macro ecause03_00000
  ebreak
  .endm
  
  .macro ecause03_00001
  ebreak
  .endm
  
  .macro ecause03_00002
  ebreak
  .endm
  
  .macro ecause04_00000
  # stack push
  addi sp, sp, -2*REGBYTES
  SREG x1,  1*REGBYTES(sp)
  SREG x3,  2*REGBYTES(sp)
    
  #exception
  mv x1, sp
  li x3, 1
  mul x1, x1, x3
  lh x3, 3(x1)
  mul x1, x1, x3

  # stack pop
  LREG x1,  1*REGBYTES(sp)
  LREG x3,  2*REGBYTES(sp)
  addi sp, sp, 2*REGBYTES
  .endm
  
  .macro ecause04_00001
  # stack push
  addi sp, sp, -1*REGBYTES
  SREG x3,  1*REGBYTES(sp)
    
  #exception
  LREG x3, 3(sp)

  # stack pop
  LREG x3, 1*REGBYTES(sp)
  addi sp, sp, 1*REGBYTES
  .endm
  
  .macro ecause04_00002
  # stack push
  addi sp, sp, -2*REGBYTES
  SREG x1,  1*REGBYTES(sp)
  SREG x3,  2*REGBYTES(sp)
    
  #exception
  mv x1, sp
  li x3, 1
  mul x1, x1, x3
  LREGU x3, 1(x1)
  mul x1, x1, x3

  # stack pop
  LREG x1,  1*REGBYTES(sp)
  LREG x3,  2*REGBYTES(sp)
  addi sp, sp, 2*REGBYTES
  .endm
  
  .macro ecause05_00000
  # stack push
  addi sp, sp, -1*REGBYTES
  SREG x1,  1*REGBYTES(sp)
    
  # exception 
  li x1, 0
  lw x1, (x1)
    
  # stack pop
  LREG x1,  1*REGBYTES(sp)
  addi sp, sp,  1*REGBYTES
  .endm
  
  .macro ecause05_00001
  # stack push
  addi sp, sp, -1*REGBYTES
  SREG x1,  1*REGBYTES(sp)
    
  # exception 
  li x1, 0
  lw x1, (x1)
    
  # stack pop
  LREG x1,  1*REGBYTES(sp)
  addi sp, sp,  1*REGBYTES
  .endm
  
  .macro ecause05_00002
  # stack push
  addi sp, sp, -1*REGBYTES
  SREG x1,  1*REGBYTES(sp)
    
  # exception 
  li x1, 0
  lbu x1, (x1)
    
  # stack pop
  LREG x1,  1*REGBYTES(sp)
  addi sp, sp,  1*REGBYTES
  .endm
  
  .macro ecause06_00000
  # stack push
  addi sp, sp, -1*REGBYTES
  SREG x10,  1*REGBYTES(sp)
    
  #exception
  SREG x10, 3(sp)

  # stack pop
  LREG x10, 1*REGBYTES(sp)
  addi sp, sp, 1*REGBYTES
  .endm
  
  .macro ecause06_00001
  # stack push
  addi sp, sp, -2*REGBYTES
  SREG x8,  1*REGBYTES(sp)
  SREG x10,  2*REGBYTES(sp)
    
  #exception
  mv x8, sp
  SREG x10, 2(x8)

  # stack pop
  LREG x8,  1*REGBYTES(sp)
  LREG x10,  2*REGBYTES(sp)
  addi sp, sp, 2*REGBYTES
  .endm
  
  .macro ecause06_00002
  # stack push
  addi sp, sp, -2*REGBYTES
  SREG x8,  1*REGBYTES(sp)
  SREG x10,  2*REGBYTES(sp)
    
  #exception
  mv x8, sp
  li x10, 1
  mul x8, x8, x10
  sw x10, 1(x8)
  mul x8, x8, x10

  # stack pop
  LREG x8,  1*REGBYTES(sp)
  LREG x10,  2*REGBYTES(sp)
  addi sp, sp, 2*REGBYTES
  .endm
  