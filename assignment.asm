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
    product1_report db " 1.Xiaomi Redmi Airdots			         RM $","$"
    product2_report db " 2.Anker PowerCore 10,000mAh		     RM ","$"
    product3_report db " 3.Mi Band 4		                     RM ","$"
    product4_report db " 4.Spigen Liquid Air Armor Phone Case    RM ","$"
    product5_report db " 5.Google Chromecast                     RM ","$"
    total_attempt_report db " Number of attempt: ","$"

    ;variable for ending message
    thank_you_end db "       Thank you for using our LGY POS System!","$"

    ;variable for menu
    menu_title db "                       MENU $"
	str1 db "================================================ $"
 	product1 db "1.Xiaomi Redmi Airdots			RM 65 $"
	product2 db "2.Anker PowerCore 10,000mAh		RM 99 $"
	product3 db "3.Mi Band 4		                RM 85 $"
	product4 db "4.Spigen Liquid Air Armor Phone Case    RM 39 $"
	product5 db "5.Google Chromecast                     RM149 $"
	str2 db "Sales Order No : $"
	varSales db ?
	str3 db "Quantity : $"
	varQty db ?
	str4 db "Press any key to continue adding order. (N=No) : $"
	varAdd db ?
	errorMsg db "Invalid input. Please try again !$"
	price1  	dw 6500
	price2  	dw 9900
	price3  	dw 8500
	price4  	dw 3900
	price5  	dw 14900

    ;variable for calculateBalance
    cash dw ?
	subtotal dw ?
	balance dw ?
	message db "Your balance is: RM ", "$" 
	message2 db "Your remaining amount is:RM ","$"
	message3 db "Payment successfully ! ", "$"

    ;variable for register and login
    fileHandler dw ?
	File 			db "text.txt",0
	buffer 			db 100 dup (?)
	openErrorMsg 		db "Error occured when opening file$"
	readErrorMsg 		db "Error occured when reading file$"
	writeErrorMsg		db "Error occured when writing file$"
	inputUser 		db 50 dup(?)
	newline 		db 0dh,0ah,"$"
	usrnamePrompt 		db 0dh,0ah,20h,01h,20h,"Enter username -> $"
	newNamePrompt 		db 0dh,0ah,20h,01h,20h,"Enter New User Name -> $"
	usrErrorMsg     	db 0dh,0ah,"Incorrect username. Please try again. :)",'$'
	pwdErrorMsg     	db 0dh,0ah,"Incorrect password. Please try again. :)",'$'
	successMsg      	db 0dh,0ah,"You have logged in successfully.",'$'
	exitMsg         	db 0dh,0ah,"Exiting the program... Hope to see you again!!",'$'
	pwdPrompt       	db 0dh,0ah,20h,01h,20h,"Enter password -> $"
	newPwdPrompt    	db 0dh,0ah,20h,01h,20h,"Enter New User Password (12 alphanumeric)-> $"
	inputPass     		db 12 dup(?)
	Ast     		db "*"
	greet			db "Hello $"
	accessUser		db "manager$"
	noAccessMsg		db 0dh,0ah,20h,01h,20h,"You have no permission to access registration. $"
	registerUser		db 50 dup(?)
	registerPass		db 12 dup(?)
	correctRegister		db 0h
	registerSuccessMsg	db 0dh,0ah,"You have registered new user successfully.",'$'
	registerData		db 30 dup (?)
	welcomeLogo		db "*     *     *  ******   *       ******  *******    *       *   ****** ",0dh,0ah
				db " *   * *   *   *        *       *       *     *    **     **   *",0dh,0ah
				db " * *   *  *    ******   *       *       *     *    * *   * *   ******",0dh,0ah
				db "  **    * *    *        *       *       *     *    *  * *  *   *",0dh,0ah
				db "  *      *     ******   ******  ******  *******   *    *    *  ******",0dh,0ah,"$"
	logo			db "  .----------------.   .----------------.   .----------------.",0dh,0ah
				db " | .--------------. | | .--------------. | | .--------------. |",0dh,0ah
				db " | |   _____      | | | |    ______    | | | |  ____  ____  | |",0dh,0ah
				db " | |  |_   _|     | | | |  .' ___  |   | | | | |_  _||_  _| | |",0dh,0ah
				db " | |    | |       | | | | / .'   \_|   | | | |   \ \  / /   | |",0dh,0ah
				db " | |    | |   _   | | | | | |    ____  | | | |    \ \/ /    | |",0dh,0ah
				db " | |   _| |__/ |  | | | | \ `.___]  _| | | | |    _|  |_    | |",0dh,0ah
				db " | |  |________|  | | | |  `._____.'   | | | |   |______|   | |",0dh,0ah
				db " | |              | | | |              | | | |              | |",0dh,0ah
				db " | '--------------' | | '--------------' | | '--------------' |",0dh,0ah
				db "  '----------------'   '----------------'   '----------------' ",0dh,0ah,0dh,0ah
				db " **************************************************************",0dh,0ah,"$"


.code

main proc

	mov ax,@data
	mov ds,ax

    jmp skipcode
login_proc:

    mov ah,09h
	lea dx,newline
	int 21h
	lea dx,welcomeLogo
	int 21h

    openFile:
	mov ah,3dh		;function 3dh - open file
	mov al,2	;010b	;access mode - read/write
	lea dx,File		;address of filename
	int 21h

	mov fileHandler,ax	;save handler
	jc openError		;when error, cf=1

	;read file
	mov ah,3fh		;function 3fh - read file
	mov bx,fileHandler	;ready handler
	mov cx,100		;read 100 bytes in file
	lea dx,buffer		;ready buffer
	int 21h
	jmp inpUsername

	jc readError		;when error, cf=1

    closeFile:
	;close file
	mov bx,fileHandler	;ready handler
	mov ah,3eh		;function 3eh - close file
	int 21h
	mov ah,4ch
	int 21h

    openError:
	mov ah,09h
	lea dx,openErrorMsg
	int 21h
	mov ah,4ch		;terminate
	mov al,01h		;error level=1
	int 21h

    readError:
	mov ah,09h
	lea dx,readErrorMsg
	int 21h
	mov ah,4ch		;terminate
	mov al,02h		;error level=2
	int 21h

    inpUsername:
	mov al,correctRegister
	cmp al,1
	je newUser
	;print prompt
	mov ah, 09h
	lea dx, usrnamePrompt
	int 21h
	lea si,inputUser
	mov di,si
	jmp inputLoop

    newUser:
	mov ah,09h
	lea dx,newNamePrompt
	int 21h
	lea si,registerUser
	mov di,si
	jmp inputLoop

    inputLoop:
	;input
	mov ah, 01h
	int 21h
	cmp al,13
	je inputDone
	cmp al,8
	je handleUsrBackspace
	jne saveInput

    saveInput:
	mov [si],al
	inc si
	jmp inputLoop

    handleUsrBackspace:
	mov ah,02h
	mov dl,' '
	int 21h
	cmp si,di
	je inputLoop
	mov dl,8
	int 21h

	dec si
	inc cx
	jmp inputLoop	

    inputDone:
	mov al,'*'
	mov [si],al
	mov al,correctRegister
	cmp al,1
	je newPassword
	mov al,'$'
	mov [si],al
	
	;setup
	lea si, inputUser
	lea di, buffer
	jmp checkCharacter

    newPassword:
	mov ah,09h
	lea dx,newPwdPrompt
	int 21h
	mov cx,12
	lea si,registerPass
	mov di,si
	jmp newPass
	
    newPass:
	cmp cx,0
	je endPass
	mov ah, 01h
    	int 21h
	cmp al,8	
	je handleNewBackspace
	mov [si], al
    	inc si
        dec cx
	jmp newPass

    endPass:
	mov al,'#'
	mov [si],al
	lea si,registerUser
	lea di,registerData

	jmp registerProcess

    handleNewBackspace:
	mov ah,02h
	mov dl,' '
	int 21h
	cmp si,di
	je newPass
	mov dl,8
	int 21h

	dec si
	dec di
	inc cx
	jmp newPass

    registerProcess:
	mov al,[si]
	mov [di],al
	cmp al,'*'
	je setUpRegister
	inc si
	inc di
	jmp registerProcess

    setUpRegister:
	lea si,registerPass
	inc di
	jmp savePass

    savePass:
	mov al,[si]
	mov [di],al
	cmp al,'#'
	je eliminateNull
	inc si
	inc di
	jmp savePass

    eliminateNull:
	inc di
	mov al,'$'
	mov [di],al
	mov cx,0
	lea si,registerData
	jmp countStringLength
	
    countStringLength:
	mov al,[si]
	cmp al,'$'
	je registerSuccess
	inc cx
	inc si
	jmp countStringLength

    registerSuccess:
	lea dx,registerData
	mov bx,fileHandler
	mov ah,40h
	int 21h
	jc WriteError 		; jump if there is an error
	cmp ax,cx 		; was all the data written?
	jne WriteError 		; no it wasn't - error!

	mov ah,09h
	lea dx,registerSuccessMsg
	int 21h
	jmp closeFile

    WriteError:
	mov ah,09h
	lea dx,writeErrorMsg
	int 21h
	jmp exitProgram

    checkCharacter:
	mov al,[di]
	cmp al,' '	
	je incorrectUser
	mov al,[si]
	cmp al,[di]
	je nextChar
	mov cx,100
	jne nextID

    nextID:
	mov al,[di]
	cmp al,'#'
	je skipSymbol
	inc di
	loop nextID

    skipSymbol:
	inc di
	jmp checkCharacter

    incorrectUser:
	mov ah, 09h
	lea dx, usrErrorMsg
	int 21h
	jmp inpUsername

    nextChar:
	inc si
	inc di
	mov al,[di]
	cmp al,'*'
	je restoreDI
	jmp checkCharacter

    restoreDI:
	inc di	;skip symbol
	mov bx,di
	
	jmp inpPassword

    inpPassword:
	mov ah, 09h
	lea dx, pwdPrompt
	int 21h
	mov cx, 12   ; get 12 chars
    lea si, inputPass ; buffer to hold password
	jmp encryption

    encryption:
    ; get char typed
    mov ah, 07h
    int 21h
	cmp al,13
	je endString
	cmp al,8	;backspace key
	je handleBackspace
	jne saveString

    saveString:
	; save in buffer
    mov [si], al

    ; Display Asterick
    mov ah, 02h
	mov dl,'*'
    int 21h

	; increase our buffer pointer
    inc si
    dec cx
    jnz encryption ;continue until met 0

	mov ah, 09h
    lea dx,newline
    int 21h

    endString:
	mov al,'$'
	mov [si],al
		
	;set up
    lea si,inputPass
	lea di,buffer
	mov di,bx
    jmp checkPassword

    handleBackspace:
	cmp si,offset inputPass
	je encryption

	mov ah,02h
	mov dl,8
	int 21h
	mov dl,' '
	int 21h
	mov dl,8
	int 21h

	dec si
	dec di
	inc cx

	jmp encryption

    checkPassword:
	mov al, [di]
	cmp al,'#'	
	je incorrectPass
	mov al, [si]
	cmp al, [di]
	je nextPass
	jne incorrectPass

    successLogin:
	call clearScreen
	mov ah,09h
	lea dx,greet
	int 21h
	lea dx,inputUser
	int 21h
	lea dx,successMsg
	int 21h
	lea dx,newline
	int 21h
	lea dx,logo
	int 21h

	;change here to login menu,please include the registration in the menu
	call registration	
	jmp exitProgram

    nextPass:
	inc si
	inc di
	mov al,[di]
	cmp al,'#'
	je successLogin
	jmp checkPassword

    incorrectPass:
	mov ah,09h
	lea dx,pwdErrorMsg
	int 21h
	jmp inpPassword

skipcode:

menu_proc:

    call menu
    call calculatePriceAfterTax
    call printOutput

exitProgram:
	mov ah,09h
	lea dx,exitMsg
	int 21h
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
    jl endPromotion

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

endPromotion:
    ret

calculatePromotion endp

printOutput proc

    ;print price
    ;separate result_34
    xor dx,dx
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

    ret

printOutput endp

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
    jl endDiscounted

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

    ;check result_12 value
    cmp [result_12],10000
    jge extra_calc_decimal_discounted
    jmp endDiscounted

extra_calc_decimal_discounted:
    xor ax,ax
    xor dx,dx
    mov ax,result_12
    mov bx,10000
    div bx
    add ax,result_34
    mov result_12,dx
    mov result_34,ax

endDiscounted:
    ret

calculateDiscountedPrice endp

calculateTax proc

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

    ret

calculateTax endp

calculatePriceAfterTax proc

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

    ;check result_12 value
    cmp [result_12],10000
    jge extra_calc_decimal_tax
    jmp endTax

extra_calc_decimal_tax:
    xor ax,ax
    xor dx,dx
    mov ax,result_12
    mov bx,10000
    div bx
    add ax,result_34
    mov result_12,dx
    mov result_34,ax

endTax:
    ret

calculatePriceAfterTax endp

balanceProc proc

    mov ax,cash
	mov bx,subtotal

	cmp ax,bx
	jg calculate_balance
	jl calculate_remaining
	je continue_display_message

calculate_balance:
    sub ax,bx   ; Calculate balance (cashReceive - subtotal)
    mov balance,ax

    ;clear dx
    xor dx,dx

    ;mov balance to register
    mov ax,balance

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
    jg calc_12_whole_balance
    jmp calc_34_whole_balance

calc_12_whole_balance:
    xor dx,dx
    mov al,num_12_whole
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

calc_34_whole_balance:
    xor dx,dx
    mov ax,num_34_whole
    add al,result_extra
    mov result_34,ax

calc_12_decimal_balance:
    xor ax,ax
    xor dx,dx
    mov al,decimal_number
    add ax,result_12
    mov result_12,ax
    jmp display_balance

continue_display_message:
    jmp display_message

display_balance:

    ;print balance message
    mov ah,09h
    lea dx,message
    int 21h
    xor ax,ax
    xor dx,dx
    call printOutput
	jmp end_program

calculate_remaining:
	SUB bx,ax		; Calculate remaining (subtotal - cashReceive)		
	mov balance,bx

    ;clear dx
    xor dx,dx

    ;separate decimal
    mov ax,balance

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
    jg calc_12_whole_remainding
    jmp calc_34_whole_remainding

calc_12_whole_remainding:
    xor dx,dx
    mov al,num_12_whole
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

calc_34_whole_remainding:
    xor dx,dx
    mov ax,num_34_whole
    add al,result_extra
    mov result_34,ax

calc_12_decimal_remainding:
    xor ax,ax
    xor dx,dx
    mov al,decimal_number
    add ax,result_12
    mov result_12,ax

display_remaining:
    mov ah,09h
    lea dx,message2
    int 21h
    xor ax,ax
    xor dx,dx
    call printOutput
	jmp end_program

display_message:
	MOV AH, 09h
	lea dx, newline     	; DOS function to print a string
	lea dx, message3  	; Load the message 
	INT 21h 		; Call DOS to print the message

endBalance:
    ret

balanceProc endp

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

registration proc
	lea si,inputUser
	lea di,accessUser

checkManager:
	mov al,[di]
	cmp al,"$"
	je register
	mov al,[si]
	cmp al,[di]
	je checkNext
	jne cannotAccess

checkNext:
	inc si
	inc di
	jmp checkManager

cannotAccess:
	mov ah,09h
	lea dx,noAccessMsg
	int 21h
	ret

register:
	mov correctRegister,1
	jmp openFile

registration endp

clearScreen proc
	mov ah,06h
	mov al,0
	mov bh,07h
	mov cx,0
	mov dx,184Fh
	int 10h
	mov ah,02h
	mov bh,0
	mov dh,0
	mov dl,0
	int 10h
	ret
clearScreen endp

end main