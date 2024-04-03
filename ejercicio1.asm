.data
msg1: .asciiz "Ingrese el primer número: "
msg2: .asciiz "Ingrese el segundo número: "
msg3: .asciiz "Ingrese el tercer número: "
msgResult: .asciiz "El número mayor es: "

.text
.globl main

main:
    # Solicita el primer número
    li $v0, 4
    la $a0, msg1
    syscall
    
    # Lee el primer número
    li $v0, 5
    syscall
    move $t0, $v0 # Guarda el primer número en $t0
    
    # Solicita el segundo número
    li $v0, 4
    la $a0, msg2
    syscall
    
    # Lee el segundo número
    li $v0, 5
    syscall
    move $t1, $v0 # Guarda el segundo número en $t1
    
    # Solicita el tercer número
    li $v0, 4
    la $a0, msg3
    syscall
    
    # Lee el tercer número
    li $v0, 5
    syscall
    move $t2, $v0 # Guarda el tercer número en $t2
    
    # Compara los números y encuentra el mayor
    # Compara el primero y el segundo número
    bgt $t0, $t1, compare_third
    move $t0, $t1
    
compare_third:
    # Compara el mayor de los dos anteriores con el tercer número
    bgt $t0, $t2, print_result
    move $t0, $t2
    
print_result:
    # Imprime el mensaje "El número mayor es: "
    li $v0, 4
    la $a0, msgResult
    syscall
    
    # Imprime el número mayor
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Fin del programa
    li $v0, 10
    syscall
