
.data
    msg:    .string "Esperando datos...\n"
    
    .align 2             # Alinea la siguiente sección de datos a un múltiplo de 4 bytes
    sol:    .string "Result: %c\n"
    
    .align 2             # Alinea la siguiente sección de datos a un múltiplo de 4 bytes
    time:  .word 3000000

.text 
setup:
    li a0,115200 
    addi sp, sp, -4      
    sw ra, 0(sp)     # Guardar el valor de ra (return address)
    jal ra, serial_begin
    lw ra, 0(sp)     # Recupera el valor de ra
    addi sp, sp,4

    la a0, msg
    addi sp, sp, -4       # Reservar espacio en el stack
    sw ra, 0(sp)          # Guardar el registro RA en el stack
    jal ra, serial_printf
    lw ra, 0(sp)          # Restaurar el registro RA desde el stack
    addi sp, sp, 4       # Liberar el espacio del stack
    jr ra
    
loop:
    addi sp, sp, -4      
    sw ra, 0(sp)     
    jal ra, serial_available
    lw ra, 0(sp)     
    addi sp, sp,4 
    #mv t2,a0
    #bgez t2, loop_2
    jal ra, loop_2
    jr ra
    
loop_2:
    addi sp, sp, -4      
    sw ra, 0(sp)     
    jal ra, serial_read
    lw ra, 0(sp)    
    addi sp, sp,4 

    mv a1,a0
    la a0, sol
    addi sp, sp, -4      
    sw ra, 0(sp)
    jal ra,serial_printf        
    lw ra, 0(sp)          
    addi sp, sp, 4       
    j loop 


main:
    #Inicializar Arduino y configurar pines
    addi sp, sp, -4       
    sw ra, 0(sp)    
    jal ra,  initArduino
    lw ra, 0(sp)
    addi sp, sp, 4
    
    addi sp, sp, -4       
    sw ra, 0(sp)    
    jal ra,  setup
    lw ra, 0(sp)
    addi sp, sp, 4
    li  t0, 0
    beqz t0, loop
    jr ra 

