.model small
.stack 100
.data
    ;q2
    char db 'A'
    question db "Do you want to continue printing (y/n)?","$"
    input db ?
    errorMsg db "Please enter a valid input!","$"

    ;q3
    original db "In english : You like english and espresso, excellent !",'$'
    egg db "egg",'$'


.code

main proc

    mov ax,@data
	mov ds,ax

    ;call q2
    call q3

    mov ah,4ch
    mov al,0
    int 21h

main endp

q2 proc
    
continue:
    mov ah,02h
    mov dl,char
    int 21h

    inc char

ask_question:
    mov ah,02h ;n_line
    mov dl,10
    int 21h
    mov ah,02h
    mov dl,13
    int 21h

    mov ah,09h ;question
    lea dx,question
    int 21h

    mov ah,01h
    int 21h
    mov input,al
    
    mov ah,02h ;n_line
    mov dl,10
    int 21h

    cmp input,'y'
    je continue
    cmp input,'n'
    je endloop

    mov ah,09h
    lea dx,errorMsg
    int 21h
    jmp ask_question

endloop:
    ret

q2 endp

q3 PROC
    mov ah,09h
    lea dx,original
    int 21h

    mov ah,02h ;n_line
    mov dl,10
    int 21h
    mov ah,02h
    mov dl,13
    int 21h

    mov si,0
looping:
    cmp original[si],' '
    je compare_e

    mov ah,02h
    mov dl,original[si]
    int 21h
    inc si
    cmp original[si],'$'
    je end_Loop
    jmp looping

compare_e:
    cmp original[si+1],'e'
    je print_egg
    mov ah,02h
    mov dl,original[si]
    int 21h
    inc si
    cmp original[si],'$'
    je end_Loop
    jmp looping

print_egg:
    mov ah,02h
    mov dl,' '
    int 21h

    mov ah,09h
    lea dx,egg
    int 21h
    inc si
    cmp original[si],'$'
    je end_Loop
    inc si
    jmp looping

end_Loop:
    ret

q3 ENDP

end main

