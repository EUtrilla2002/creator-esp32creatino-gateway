####################################################
# CREATINO EXAMPLE: Hello world                    #
#               BY ELISA UTRILLA                   #
####################################################      

#ARDUINO
.data
    msg: .string "Hola %s\n"
    arg: .string "Mundo"


.text
setup:
    li a0,115200 
    addi sp, sp, -4      
    sw ra, 0(sp)     # Guardar el valor de ra (return address)
    jal ra,cr_serial_begin
    lw ra, 0(sp)     # Recupera el valor de ra
    addi sp, sp,4 

    la a0, msg
    la a1, arg
    addi sp, sp, -16       # Reservar espacio en el stack
    sw ra, 12(sp)          # Guardar el registro RA en el stack
    jal ra,cr_serial_printf
    lw ra, 12(sp)          # Restaurar el registro RA desde el stack
    addi sp, sp, 16       # Liberar el espacio del stack
    jr ra
loop:
    nop
main:

  li  t3,  1
  li  t4,  4
  la  t5,  w3
  li  t0,  0

  # loop initialization
  li  t1,  0
  li  t2,  5

  # loop header
loop1: beq t1, t2, end1      # if(t1 == t2) --> jump to fin1

  # loop body
  mul t6, t1, t4             # t1 * t4 -> t6
  lw  t6, 0(t5)              # Memory[t5] -> t6
  add t0, t0, t6             # t6 + t0 -> t0

  # loop next...
  add  t1, t1, t3            # t1 + t3 -> t1
  addi t5, t5, 4
  beq  x0, x0, loop1

  # loop end
end1: 
  #return
  jr ra


