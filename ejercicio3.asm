.data
inputMsg: .asciiz "Ingrese el número de términos para la serie de Fibonacci: "
fibSeriesMsg: .asciiz "Serie de Fibonacci: "
space: .asciiz " "

.text
.globl main

main:
    # Solicita al usuario el número de términos
    li $v0, 4
    la $a0, inputMsg
    syscall
    
    # Lee el número de términos
    li $v0, 5
    syscall
    move $t1, $v0 # Guarda el número de términos en $t1
    
    # Imprime el mensaje inicial de la serie
    li $v0, 4
    la $a0, fibSeriesMsg
    syscall
    
    # Verifica si el número de términos es válido
    blez $t1, end # Si es 0 o negativo, termina el programa
    
    # Inicializa los primeros dos términos
    li $t2, 0 # Primer término, fib(0)
    li $t3, 1 # Segundo término, fib(1)
    
    # Imprime el primer término (0)
    li $v0, 1
    move $a0, $t2
    syscall
    # Imprime un espacio
    li $v0, 4
    la $a0, space
    syscall
    
    # Verifica si solo necesitamos imprimir el primer término
    li $t0, 1
    beq $t1, $t0, end
    
    # Imprime el segundo término si es necesario
    li $v0, 1
    move $a0, $t3
    syscall
    li $v0, 4
    la $a0, space
    syscall
    
    addi $t0, $t0, 1 # Incrementa el contador de términos impresos
    
loop:
    # Verifica si ya imprimimos todos los términos necesarios
    beq $t0, $t1, end
    
    # Calcula el nuevo término
    add $t4, $t2, $t3
    move $t2, $t3
    move $t3, $t4
    
    # Imprime el nuevo término
    li $v0, 1
    move $a0, $t4
    syscall
    li $v0, 4
    la $a0, space
    syscall
    
    addi $t0, $t0, 1
    j loop

end:
    # Salida del programa
    li $v0, 10
    syscall
