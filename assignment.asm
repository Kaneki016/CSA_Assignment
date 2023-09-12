.model small
.stack 100
.data
    ;main file
    total_attempt_main db 0

    ;variable for calculatePromotion, Discounted, Tax, PriceAfterTax
    whole_number dw ?
    decimal_number db ?
    payment_price dw ?
    num_12_whole db ?
    num_34_whole dw ?
    result_12 dw ?
    result_34 dw ?
    result_extra db ?
    result_quotient_34 db ?
    result_remainder_34 db ?
    result_remainder_34_extra db ?
    result_quotient_12 db ?
    result_remainder_12 db ?
    result_quotient_num1 db ?
    result_quotient_num2 db ?
    result_remainder_num1 db ?
    result_remainder_num2 db ?

    ;variable for receipt
    receipt_title_receipt db "                       Receipt","$"
    cashier_receipt db "Cashier: ","$"
    category_receipt db " Qty  Item                        Price       Total","$"
    subtotal_title_receipt db " Subtotal        : RM ","$"
    discount_title_receipt db " Discount (5%)   : RM ","$"
    discounted_title_receipt db " Discounted Price: RM ","$"
    total_price_receipt db " Total           : RM ","$"
    tax_title_receipt db " Tax (6%)        : RM ","$"
    thank_you_receipt db "Thank you for your purchase!","$"

    ;variable for report
    single_line db "-----------------------------------------------------","$"
    summary_title_report db "            LGY POS System Summary Report","$"
    total_sales_report db " Total sales               : RM ","$"
    total_discount_report db " Total discount            : RM ","$"
    items_sales_report db " Product Sales:","$"
    product1_report db " TechNova X10              : RM ","$"
    product2_report db " SonicWave HD800           : RM ","$"
    product3_report db " TabGenius 12 Pro          : RM ","$"
    product4_report db " TimeSync Elite            : RM ","$"
    product5_report db " XPlay Prism Gaming Console: RM ","$"
    total_attempt_report db " Number of attempt: ","$"

    ;variable for ending message
    thank_you_end db "       Thank you for using our LGY POS System!","$"

    ;variable for menu
    menu_title db "                       MENU $"
	str1 db "================================================ $"
 	product1 db "1.Xiaomi Redmi Airdots			RM65 $"
	product2 db "2.Anker PowerCore 10,000mAh		RM99 $"
	product3 db "3.Mi Band 4		                RM85 $"
	product4 db "4.Spigen Liquid Air Armor Phone Case    RM39 $"
	product5 db "5.Google Chromecast                     RM149 $"
	str2 db "Sales Order No : $"
	varSales db ?
	str3 db "Quantity : $"
	varQty db ?
	str4 db "Press any key to continue adding order. (N=No) : $"
	varAdd db ?
	newline db 0dh,0ah,"$"
	errorMsg db "Invalid input. Please try again !$"
	price1  	dw 6500
	price2  	dw 9900
	price3  	dw 8500
	price4  	dw 3900
	price5  	dw 14900
	subtotal	dw 0h

.code

main proc

	mov ax,@data
	mov ds,ax

login:



main_menu:
    call menu

Sales:
    call calculatePromotion
    ;call calculateDiscountedPrice

    ;call n_line

sales_receipt:
    ;call receipt

summary_report:
    xor ax,ax
    xor dx,dx
    ;call report
    ;call calculateTax
    ;call calculatePriceAfterTax

ending_message:
    ;print thank you message
    ;print line
    ;call line
    ;call n_line

    ;print message
    ;mov ah,09h
    ;lea dx,end_thank_you
    ;int 21h
    ;call n_line

    ;print line
    ;call line

endProgram:
	;interrupt to exit
	mov ah,4ch
	int 21h

main endp

menu proc

    jmp show_menu

input_loop:
	mov ah,09h
	lea dx,str2
	int 21h
    ;input
    xor ax,ax
    xor dx,dx
	mov ah,01h
	int 21h
	mov bl,al

    ;Check user's input
    	cmp bl, '1'
	jne compare2

	;product1
	mov ah, 09h
    	lea dx, newline
    	int 21h
    	lea dx, str3
    	int 21h

    	; Input for quantity
    	mov ah, 01h
    	int 21h

    	sub al, 30h
    	mov bl, al  ; Store the numeric quantity in BL

    	; Move the price1 to AX
    	mov ax, price1

    	; Multiply AX by BL (quantity)
        xor dx,dx
    	mul bx

    	; Add the result to sum
    	add subtotal, ax

    	; Ask if the user wants to continue
    	jmp ask_to_continue

compare2:
    	cmp bl, '2'
	jne compare3

	;product2
	mov ah, 09h
    	lea dx, newline
    	int 21h
    	lea dx, str3
    	int 21h

    	; Input for quantity
    	mov ah, 01h
    	int 21h

    	sub al, 30h
    	mov bl, al  ; Store the numeric quantity in BL

    	; Move the price2 to AX
    	mov ax, price2

    	; Multiply AX by BL (quantity)
    	mul bx

    	; Add the result to sum
    	add subtotal, ax

    	; Ask if the user wants to continue
    	jmp ask_to_continue

compare3:
	cmp bl, '3'
	jne compare4

	;product3
	mov ah,09h
	lea dx,newline
	int 21h
	lea dx,str3
	int 21h

	;input
	mov ah,01h
	int 21h

	sub al, 30h
    	mov bl, al  ; Store the numeric quantity in BL

    	; Move the price3 to AX
    	mov ax, price3

    	; Multiply AX by BL (quantity)
    	mul bx

    	; Add the result to sum
    	add subtotal, ax

    	;Ask if the user wants to continue
    	jmp ask_to_continue

compare4:
    	cmp bl, '4'
	jne compare5
	
	;product4
	mov ah,09h
	lea dx,newline
	int 21h
	lea dx,str3
	int 21h

	;input
	mov ah,01h
	int 21h

	sub al, 30h
    	mov bl, al  ; Store the numeric quantity in BL

    	; Move the price4 to AX
    	mov ax, price4

    	; Multiply AX by BL (quantity)
    	mul bx

    	; Add the result to sum
    	add subtotal, ax

    	;Ask if the user wants to continue
    	jmp ask_to_continue

compare5:
	cmp bl, '5'
 	jne invalidInput

	;product5
	mov ah,09h
	lea dx,newline
	int 21h
	lea dx,str3
	int 21h

	;input
	mov ah,01h
	int 21h

	sub al, 30h
    	mov bl, al  ; Store the numeric quantity in BL

    	; Move the price5 to AX
    	mov ax, price5

    	; Multiply AX by BL (quantity)
    	mul bx

    	; Add the result to sum
    	add subtotal, ax

    	;Ask if the user wants to continue
    	jmp ask_to_continue


invalidInput:
    ;Invalid input, inform the user and ask again
    	mov ah, 09h
    	lea dx, newline
    	int 21h
    	lea dx, errorMsg
    	int 21h
	    lea dx,newline
	    int 21h
    	jmp input_loop

ask_to_continue:
    mov ah, 09h
	lea dx,newline
	int 21h
   	lea dx, str4
   	int 21h

    ;Input
    	mov ah, 01h
    	int 21h

    ;Check user's input
    	cmp al, 'N'
    	je end_program
    	cmp al, 'n'
    	je end_program

    ;If 'Y' or 'y' or invalid input, show the menu again
        mov ah, 09h
        lea dx,newline
        int 21h
    	jmp show_menu

show_menu:
	mov ah,09h
	lea dx,newline
	int 21h
	lea dx,menu_title
	int 21h
	lea dx,newline
	int 21h
	lea dx,str1
	int 21h
	lea dx,newline
	int 21h
	lea dx,product1
	int 21h
	lea dx,newline
	int 21h
	lea dx,product2
	int 21h
	lea dx,newline
	int 21h
	lea dx,product3
	int 21h
	lea dx,newline
	int 21h
	lea dx,product4
	int 21h
	lea dx,newline
	int 21h
	lea dx,product5
	int 21h
	lea dx,newline
	int 21h
	
	mov ah,09h
	lea dx,newline
	int 21h
	jmp input_loop

end_program:
	ret

menu endp

calculatePromotion proc

    ;clear dx
    xor dx,dx

    ;separate decimal
    mov ax,subtotal
    mov bx,100
    div bx

    ;store whole and decimal
    mov whole_number,ax
    mov decimal_number,dl

    ;whole number
	;mov data to registers
    xor dx,dx
    xor ax,ax
	mov ax,whole_number

    ;compare subtotal
    cmp ax,300
    jl continue_endPromotion

    ;div 100 to separate ax,dx
    mov bx,100
    div bx

    ;store ax,dx into variable
    mov num_12_whole,dl
    mov num_34_whole,ax
    
    ;check dx
    cmp [num_12_whole],0
    jg calc_12_whole_promotion
    jmp calc_34_whole_promotion

calc_12_whole_promotion:
    ;calc 5% discount for 1,2 digits
    xor dx,dx
    mov al,num_12_whole
    mov bl,5
    mul bl
    mov bx,100
    div bx
    mov result_12,dx
    mov result_extra,al

    ;multiply result_12 with 100
    xor ax,ax
    mov ax,result_12
    mov bx,100
    mul bx
    mov result_12,ax

calc_34_whole_promotion:
    ;calc 5% discount for 3,4 digits
    xor dx,dx
    mov ax,num_34_whole
    mov bx,5
    mul bx
    add al,result_extra
    mov result_34,ax

calc_12_decimal_promotion:
    ;calc 5% discount for decimal
    xor ax,ax
    xor dx,dx
    mov al,decimal_number
    mov bl,5
    mul bl
    add ax,result_12
    mov result_12,ax
    jmp promotion_price

continue_endPromotion:
    jmp endPromotion

promotion_price:

    ;print total discount
    ;separate result_34
    xor ax,ax
    mov ax,result_34
    mov bx,10
    div bx
    mov result_remainder_34,dl
    
    ;check if al more than 9
    cmp al,10
    jge thou_place
    mov result_remainder_34_extra,10
    mov result_quotient_34,al
    jmp continue_print_34

thou_place:
    xor dx,dx
    div bx
    mov result_remainder_34_extra,dl
    mov result_quotient_34,al

continue_print_34:

    ;check if result_quotient_34 is 0
    cmp result_quotient_34,0
    je end_continue_print_34

    ;print first number
    xor ax,ax
    xor dx,dx
    mov dl,result_quotient_34
    add dl,30h
    mov ah,02h
    int 21h

end_continue_print_34:
    ;check value of result_remainder_34_extra
    cmp result_remainder_34_extra,10
    jl print_result_remainder_34_extra
    jmp print_result_remainder_34

print_result_remainder_34_extra:
    mov dl,result_remainder_34_extra
    add dl,30h
    mov ah,02h
    int 21h

print_result_remainder_34:
    mov dl,result_remainder_34
    add dl,30h
    mov ah,02h
    int 21h

    ;print '.'
    xor ax,ax
    mov dl,'.'
    mov ah,02h
    int 21h

    ;separate deci_result
    xor dx,dx
    xor ax,ax
    mov ax,result_12
    mov bx,100
    div bx
    mov result_quotient_12,al
    mov result_remainder_12,dl

    ;separate result_quotient
    xor dx,dx
    xor ax,ax
    mov al,result_quotient_12
    mov bl,10
    div bl

    ;store
    mov result_quotient_num1,al
    mov result_quotient_num2,ah

    ;print first number
    xor ax,ax
    mov dl,result_quotient_num1
    add dl,30h
    mov ah,02h
    int 21h

    ;print second number
    xor ax,ax
    mov dl,result_quotient_num2
    add dl,30h
    mov ah,02h
    int 21h

    ;separate result_remainder
    xor dx,dx
    xor ax,ax
    mov al,result_remainder_12
    mov bl,10
    div bl
    mov result_remainder_num1,al
    mov result_remainder_num2,ah

    ;print third number
    xor ax,ax
    mov dl,result_remainder_num1
    add dl,30h
    mov ah,02h
    int 21h

    ;print forth number
    xor ax,ax
    mov dl,result_remainder_num2
    add dl,30h
    mov ah,02h
    int 21h

    ;print n_line
    call n_line

endPromotion:
    ret

calculatePromotion endp

calculateDiscountedPrice proc

    ;clear dx
    xor dx,dx

    ;separate decimal
    mov ax,subtotal
    mov bx,100
    div bx

    ;store whole and decimal
    mov whole_number,ax
    mov decimal_number,dl

    ;whole number
	;mov data to registers
    xor dx,dx
    xor ax,ax
	mov ax,whole_number

    ;compare subtotal
    cmp ax,300
    jl continue_endDiscounted

    ;div 100 to separate ax,dx
    mov bx,100
    div bx

    ;store ax,dx into variable
    mov num_12_whole,dl
    mov num_34_whole,ax
    
    ;check dx
    cmp [num_12_whole],0
    jg calc_12_whole_discounted
    jmp calc_34_whole_discounted

calc_12_whole_discounted:
    ;calc 95% for 1,2 digits
    xor dx,dx
    mov al,num_12_whole
    mov bl,95
    mul bl
    mov bx,100
    div bx
    mov result_12,dx
    mov result_extra,al

    ;multiply result_12 with 100
    xor ax,ax
    mov ax,result_12
    mov bx,100
    mul bx
    mov result_12,ax

calc_34_whole_discounted:
    ;calc 95% discount for 3,4 digits
    xor dx,dx
    mov ax,num_34_whole
    mov bx,95
    mul bx
    add al,result_extra
    mov result_34,ax

calc_12_decimal_discounted:
    ;calc 95% discount for decimal
    xor ax,ax
    xor dx,dx
    mov al,decimal_number
    mov bl,95
    mul bl
    add ax,result_12
    mov result_12,ax
    jmp discounted_price

continue_endDiscounted:
    jmp endDiscounted

discounted_price:

    ;print discounted price
    ;separate result_34
    xor ax,ax
    mov ax,result_34
    mov bx,10
    div bx
    mov result_remainder_34,dl

    xor dx,dx
    div bx
    mov result_remainder_34_extra,dl
    mov result_quotient_34,al

    ;print first number
    xor ax,ax
    xor dx,dx
    mov dl,result_quotient_34
    add dl,30h
    mov ah,02h
    int 21h

    ;print second number
    mov dl,result_remainder_34_extra
    add dl,30h
    mov ah,02h
    int 21h

    ;print thrid
    mov dl,result_remainder_34
    add dl,30h
    mov ah,02h
    int 21h

    ;print '.'
    xor ax,ax
    mov dl,'.'
    mov ah,02h
    int 21h

    ;separate deci_result
    xor dx,dx
    xor ax,ax
    mov ax,result_12
    mov bx,100
    div bx
    mov result_quotient_12,al
    mov result_remainder_12,dl

    ;separate result_quotient
    xor dx,dx
    xor ax,ax
    mov al,result_quotient_12
    mov bl,10
    div bl

    ;store
    mov result_quotient_num1,al
    mov result_quotient_num2,ah

    ;print first number
    xor ax,ax
    mov dl,result_quotient_num1
    add dl,30h
    mov ah,02h
    int 21h

    ;print second number
    xor ax,ax
    mov dl,result_quotient_num2
    add dl,30h
    mov ah,02h
    int 21h

    ;separate result_remainder
    xor dx,dx
    xor ax,ax
    mov al,result_remainder_12
    mov bl,10
    div bl
    mov result_remainder_num1,al
    mov result_remainder_num2,ah

    ;print third number
    xor ax,ax
    mov dl,result_remainder_num1
    add dl,30h
    mov ah,02h
    int 21h

    ;print forth number
    xor ax,ax
    mov dl,result_remainder_num2
    add dl,30h
    mov ah,02h
    int 21h

    ;print n_line
    call n_line

endDiscounted:
    ret

calculateDiscountedPrice endp

calculateTax proc

    ;clear dx
    xor dx,dx

    ;separate decimal
    mov ax,payment_price
    mov bx,100
    div bx

    ;store whole and decimal
    mov whole_number,ax
    mov decimal_number,dl

    ;whole number
	;mov data to registers
    xor dx,dx
    xor ax,ax
	mov ax,whole_number

    ;div 100 to separate ax,dx
    mov bx,100
    div bx

    ;store ax,dx into variable
    mov num_12_whole,dl
    mov num_34_whole,ax
    
    ;check dx
    cmp [num_12_whole],0
    jg calc_12_whole_tax
    jmp calc_34_whole_tax

calc_12_whole_tax:
    ;calc 6% for 1,2 digits
    xor dx,dx
    mov al,num_12_whole
    mov bl,6
    mul bl
    mov bx,100
    div bx
    mov result_12,dx
    mov result_extra,al

    ;multiply result_12 with 100
    xor ax,ax
    mov ax,result_12
    mov bx,100
    mul bx
    mov result_12,ax

calc_34_whole_tax:
    ;calc 6% discount for 3,4 digits
    xor dx,dx
    mov ax,num_34_whole
    mov bx,6
    mul bx
    add al,result_extra
    mov result_34,ax

calc_12_decimal_tax:
    ;calc 6% discount for decimal
    xor ax,ax
    xor dx,dx
    mov al,decimal_number
    mov bl,6
    mul bl
    add ax,result_12
    mov result_12,ax
    jmp promotion_price

tax_price:

    ;print total tax
    ;separate result_34
    xor ax,ax
    mov ax,result_34
    mov bx,10
    div bx
    mov result_remainder_34,dl
    
    ;check if al more than 9
    cmp al,10
    jge thou_place_tax
    mov result_remainder_34_extra,10
    mov result_quotient_34,al
    jmp continue_print_34

thou_place_tax:
    xor dx,dx
    div bx
    mov result_remainder_34_extra,dl
    mov result_quotient_34,al

continue_print_34_tax:

    ;check if result_quotient_34 is 0
    cmp result_quotient_34,0
    je end_continue_print_34_tax

    ;print first number
    xor ax,ax
    xor dx,dx
    mov dl,result_quotient_34
    add dl,30h
    mov ah,02h
    int 21h

end_continue_print_34_tax:
    ;check value of result_remainder_34_extra
    cmp result_remainder_34_extra,10
    jl print_result_remainder_34_extra_tax
    jmp print_result_remainder_34_tax

print_result_remainder_34_extra_tax:
    mov dl,result_remainder_34_extra
    add dl,30h
    mov ah,02h
    int 21h

print_result_remainder_34_tax:
    mov dl,result_remainder_34
    add dl,30h
    mov ah,02h
    int 21h

    ;print '.'
    xor ax,ax
    mov dl,'.'
    mov ah,02h
    int 21h

    ;separate deci_result
    xor dx,dx
    xor ax,ax
    mov ax,result_12
    mov bx,100
    div bx
    mov result_quotient_12,al
    mov result_remainder_12,dl

    ;separate result_quotient
    xor dx,dx
    xor ax,ax
    mov al,result_quotient_12
    mov bl,10
    div bl

    ;store
    mov result_quotient_num1,al
    mov result_quotient_num2,ah

    ;print first number
    xor ax,ax
    mov dl,result_quotient_num1
    add dl,30h
    mov ah,02h
    int 21h

    ;print second number
    xor ax,ax
    mov dl,result_quotient_num2
    add dl,30h
    mov ah,02h
    int 21h

    ;separate result_remainder
    xor dx,dx
    xor ax,ax
    mov al,result_remainder_12
    mov bl,10
    div bl
    mov result_remainder_num1,al
    mov result_remainder_num2,ah

    ;print third number
    xor ax,ax
    mov dl,result_remainder_num1
    add dl,30h
    mov ah,02h
    int 21h

    ;print forth number
    xor ax,ax
    mov dl,result_remainder_num2
    add dl,30h
    mov ah,02h
    int 21h

    ;print n_line
    call n_line

    ret

calculateTax endp

calculatePriceAfterTax proc

    ;clear dx
    xor dx,dx

    ;separate decimal
    mov ax,payment_price
    mov bx,100
    div bx

    ;store whole and decimal
    mov whole_number,ax
    mov decimal_number,dl

    ;whole number
	;mov data to registers
    xor dx,dx
    xor ax,ax
	mov ax,whole_number

    ;div 100 to separate ax,dx
    mov bx,100
    div bx

    ;store ax,dx into variable
    mov num_12_whole,dl
    mov num_34_whole,ax
    
    ;check dx
    cmp [num_12_whole],0
    jg calc_12_whole_payment
    jmp calc_34_whole_payment

calc_12_whole_payment:
    ;calc 94% for 1,2 digits
    xor dx,dx
    mov al,num_12_whole
    mov bl,94
    mul bl
    mov bx,100
    div bx
    mov result_12,dx
    mov result_extra,al

    ;multiply result_12 with 100
    xor ax,ax
    mov ax,result_12
    mov bx,100
    mul bx
    mov result_12,ax

calc_34_whole_payment:
    ;calc 94% discount for 3,4 digits
    xor dx,dx
    mov ax,num_34_whole
    mov bx,94
    mul bx
    add al,result_extra
    mov result_34,ax

calc_12_decimal_payment:
    ;calc 94% discount for decimal
    xor ax,ax
    xor dx,dx
    mov al,decimal_number
    mov bl,94
    mul bl
    add ax,result_12
    mov result_12,ax

    ;print discounted price
    ;separate result_34
    xor ax,ax
    mov ax,result_34
    mov bx,10
    div bx
    mov result_remainder_34,dl

    xor dx,dx
    div bx
    mov result_remainder_34_extra,dl
    mov result_quotient_34,al

    ;print first number
    xor ax,ax
    xor dx,dx
    mov dl,result_quotient_34
    add dl,30h
    mov ah,02h
    int 21h

    ;print second number
    mov dl,result_remainder_34_extra
    add dl,30h
    mov ah,02h
    int 21h

    ;print thrid
    mov dl,result_remainder_34
    add dl,30h
    mov ah,02h
    int 21h

    ;print '.'
    xor ax,ax
    mov dl,'.'
    mov ah,02h
    int 21h

    ;separate deci_result
    xor dx,dx
    xor ax,ax
    mov ax,result_12
    mov bx,100
    div bx
    mov result_quotient_12,al
    mov result_remainder_12,dl

    ;separate result_quotient
    xor dx,dx
    xor ax,ax
    mov al,result_quotient_12
    mov bl,10
    div bl

    ;store
    mov result_quotient_num1,al
    mov result_quotient_num2,ah

    ;print first number
    xor ax,ax
    mov dl,result_quotient_num1
    add dl,30h
    mov ah,02h
    int 21h

    ;print second number
    xor ax,ax
    mov dl,result_quotient_num2
    add dl,30h
    mov ah,02h
    int 21h

    ;separate result_remainder
    xor dx,dx
    xor ax,ax
    mov al,result_remainder_12
    mov bl,10
    div bl
    mov result_remainder_num1,al
    mov result_remainder_num2,ah

    ;print third number
    xor ax,ax
    mov dl,result_remainder_num1
    add dl,30h
    mov ah,02h
    int 21h

    ;print forth number
    xor ax,ax
    mov dl,result_remainder_num2
    add dl,30h
    mov ah,02h
    int 21h

    ;print n_line
    call n_line

    ret

calculatePriceAfterTax endp

report proc

    ;print line
    call line
    call n_line

    ;print title
    mov ah,09h
    lea dx,summary_title_report
    int 21h
    call n_line

    ;print line
    call line
    call n_line

    ;print n_line
    call n_line

    ;print total sales
    mov ah,09h
    lea dx,total_sales_report
    int 21h
    call n_line

    ;print total discount
    mov ah,09h
    lea dx,total_discount_report
    int 21h
    call n_line

    ;print n_line
    call n_line

    ;print product sale
    mov ah,09h
    lea dx,items_sales_report
    int 21h
    call n_line

    ;print product 1
    mov ah,09h
    lea dx,product1_report
    int 21h
    call n_line

    ;print product 2
    mov ah,09h
    lea dx,product2_report
    int 21h
    call n_line

    ;print product 3
    mov ah,09h
    lea dx,product3_report
    int 21h
    call n_line

    ;print product 4
    mov ah,09h
    lea dx,product4_report
    int 21h
    call n_line

    ;print product 5
    mov ah,09h
    lea dx,product5_report
    int 21h
    call n_line

    ;print n_line
    call n_line

    ;print number of attempt
    mov ah,09h
    lea dx,total_attempt_report
    int 21h
    call n_line

    ;print n_line
    call n_line

    ret

report endp

line proc

    mov ah,09h
    lea dx,single_line
    int 21h
    ret

line endp

n_line proc

    mov ah,02h
    mov dl,10
    int 21h
    ret

n_line endp

receipt proc

    ;print line
    call line
    call n_line

    ;print receipt title
    mov ah,09h
    lea dx,receipt_title_receipt
    int 21h
    call n_line

    ;print line 
    call line
    call n_line

    ;print cashier
    mov ah,09h
    lea dx,cashier_receipt
    int 21h
    call n_line

    ;print line
    call line
    call n_line

    ;print category
    mov ah,09h
    lea dx,category_receipt
    int 21h
    call n_line

    ;print line 
    call line
    call n_line

    ;print item1
    mov ah,09h
    lea dx,product1_report
    int 21h
    call n_line

    ;print item2
    mov ah,09h
    lea dx,product2_report
    int 21h
    call n_line

    ;print item3
    mov ah,09h
    lea dx,product3_report
    int 21h
    call n_line

    ;print item4
    mov ah,09h
    lea dx,product4_report
    int 21h
    call n_line

    ;print item5
    mov ah,09h
    lea dx,product5_report
    int 21h
    call n_line

    ;print n_line
    call n_line

    ;print subtotal
    mov ah,09h
    lea dx,subtotal_title_receipt
    int 21h
    call n_line

    ;print discount
    mov ah,09h
    lea dx,discount_title_receipt
    int 21h
    call calculatePromotion
    call n_line

    ;print line
    call line
    call n_line

    ;print discounted price
    mov ah,09h
    lea dx,discounted_title_receipt
    int 21h
    call calculateDiscountedPrice
    call n_line

    ;print tax
    mov ah,09h
    lea dx,tax_title_receipt
    int 21h
    call calculateTax
    call n_line

    ;print final price
    mov ah,09h
    lea dx,total_price_receipt
    int 21h
    call calculateDiscountedPrice
    call n_line

    ;print line
    call line
    call n_line

    ;print thank you message
    mov ah,09h
    lea dx,thank_you_receipt
    int 21h
    call n_line

    ;print line
    call line
    call n_line

    ret

receipt endp



end main