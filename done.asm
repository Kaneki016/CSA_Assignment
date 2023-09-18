.model small
.stack 100
.data
    ;main file
    total_attempt dw 0
    another_order db "Press Y to make another order. (N=No) : ",'$'

    ;variable for calculatePromotion, Discounted, Tax, PriceAfterTax
    whole_number dw ?
    decimal_number dw ?
    total_number dw ?
    subtotal dw ?
    result_whole_thou db ?
    result_whole_hund db ?
    result_whole_single db ?
    result_whole_tens db ?
    result_decimal_hund db ?
    result_decimal_remain dw ?
    result_decimal_single db ?
    result_decimal_tens db ?
    result_decimal_thou db ?
    result_whole_tenthou db ?
    whole_number_remainder dw ?
    payment_price_decimal dw ?
    payment_price_whole dw ?

    ;variable for receipt
    receipt_title_receipt db "                       Receipt",'$'
    cashier_receipt db "Cashier: ",'$'
    category_receipt db " Qty  Item                                    Total",'$'
    subtotal_title_receipt db " Subtotal        : RM ",'$'
    discount_title_receipt db " Discount (5%)   : RM ",'$'
    discounted_title_receipt db " Discounted Price: RM ",'$'
    total_price_receipt db " Total           : RM ",'$'
    tax_title_receipt db " Tax (6%)        : RM ",'$'
    thank_you_receipt db "Thank you for your purchase!",'$'
    receipt_content db ?

    ;variable for report
    single_line db "------------------------------------------------------",'$'
    summary_title_report db "            LGY POS System Summary Report",'$'
    total_sales_report db " Total sales               : RM ",'$'
    total_discount_report db " Total discount            : RM ",'$'
    items_sales_report db " Product Sales:",'$'
    product1_report db " Xiaomi Redmi Airdots                  RM ",'$'
    product2_report db " Anker PowerCore 10,000mAh             RM ",'$'
    product3_report db " Mi Band 4                             RM ",'$'
    product4_report db " Spigen Liquid Air Armor Phone Case    RM ",'$'
    product5_report db " Google Chromecast                     RM ",'$'
    space2 db "  ",'$'
    total_attempt_report db " Number of attempt: ",'$'
    qty1_report db ?
    qty2_report db ?
    qty3_report db ?
    qty4_report db ?
    qty5_report db ?
    total_item1_report dw ?
    total_item2_report dw ?
    total_item3_report dw ?
    total_item4_report dw ?
    total_item5_report dw ?
    subtotal_report dw ?
    total_promotion_whole dw ?
    total_promotion_decimal dw ?
    total_subtotal_decimal dw ?
    total_subtotal_whole dw ?

    ;variable for menu
    menu_title db "                                 MENU $"
	str1 db "      ============================================================= $"
 	product1 db "               1.Xiaomi Redmi Airdots			RM 65 $"
	product2 db "               2.Anker PowerCore 10,000mAh		RM 99 $"
	product3 db "               3.Mi Band 4		                RM 85 $"
	product4 db "               4.Spigen Liquid Air Armor Phone Case     RM 39 $"
	product5 db "               5.Google Chromecast                      RM149 $"
	str2 db "Sales Order No : $"
	str3 db "Quantity : $"
	qty1 db ?
    qty2 db ?
    qty3 db ?
    qty4 db ?
    qty5 db ?
    total_item1 dw ?
    total_item2 dw ?
    total_item3 dw ?
    total_item4 dw ?
    total_item5 dw ?
	str4 db "Press Y to continue adding item. (N=No) : $"
	errorMsg db "Invalid input. Please try again !$"
	price1  dw 6500
	price2  dw 9900
	price3  dw 8500
	price4	dw 3900
	price5	dw 14900

    ;variable for register and login
    fileHandler dw ?
	File 			db "text.txt",0
	buffer 			db 150 dup (?)
	openErrorMsg 		db "Error occured when opening file$"
	readErrorMsg 		db "Error occured when reading file$"
	writeErrorMsg		db "Error occured when writing file$"
	inputUser 		db 50 dup(?)
	newline 		db 0dh,0ah,"$"
	usrnamePrompt 		db 0dh,0ah,20h,01h,20h,"Enter username -> $"
	newNamePrompt 		db 0dh,0ah,20h,01h,20h,"Enter New User Name -> $"
	usrErrorMsg     	db 0dh,0ah,"Incorrect username. Please try again. :)",'$'
	pwdErrorMsg     	db 0dh,0ah,"Incorrect password. You can try ",'$'
	time			db " more time(s). ",0dh,0ah,"$"
	try			db 33h
	successMsg      	db 0dh,0ah,"You have logged in successfully.",'$'
	exitPrompt		db 0dh,0ah,"Do you want to exit the system ? (Press Y to exit,N=No) -> $"
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
	logoutPrompt		db 0dh,0ah,"Do you want to log out the system ? (Y=Yes,N=No) -> $"
	logoutMsg		db 0dh,0ah,"You have logged out successfully! $"
	error			db 0dh,0ah,"Invalid input.",0dh,0ah,"Please try again:)$"
	welcomeLogo		db "*     *     *  ******   *       ******  *******    *       *   ****** ",0dh,0ah
				db " *   * *   *   *        *       *       *     *    **     **   *",0dh,0ah
				db " * *   *  *    ******   *       *       *     *    * *   * *   ******",0dh,0ah
				db "  **    * *    *        *       *       *     *    *  * *  *   *",0dh,0ah
				db "  *      *     ******   ******  ******  *******   *    *    *  ******",0dh,0ah,"$"
	logo			db 0dh,0ah,"       .----------------.   .----------------.   .----------------.",0dh,0ah
				db         "      | .--------------. | | .--------------. | | .--------------. |",0dh,0ah
				db         "      | |   _____      | | | |    ______    | | | |  ____  ____  | |",0dh,0ah
				db         "      | |  |_   _|     | | | |  .' ___  |   | | | | |_  _||_  _| | |",0dh,0ah
				db         "      | |    | |       | | | | / .'   \_|   | | | |   \ \  / /   | |",0dh,0ah
				db         "      | |    | |   _   | | | | | |    ____  | | | |    \ \/ /    | |",0dh,0ah
				db         "      | |   _| |__/ |  | | | | \ `.___]  _| | | | |    _|  |_    | |",0dh,0ah
				db         "      | |  |________|  | | | |  `._____.'   | | | |   |______|   | |",0dh,0ah
				db         "      | |              | | | |              | | | |              | |",0dh,0ah
				db         "      | '--------------' | | '--------------' | | '--------------' |",0dh,0ah
				db         "       '----------------'   '----------------'   '----------------' ",0dh,0ah
				db         "      +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ",0dh,0ah,"$"
	mainMenuMsg		db         "       	       /\/\   __ _(_)_ __     /\/\   ___ _ __  _   _ 	   ",0dh,0ah
				db         "       	      /    \ / _` | | '_ \   /    \ / _ \ '_ \| | | |	   ",0dh,0ah
				db         "       	     / /\/\ \ (_| | | | | | / /\/\ \  __/ | | | |_| |	   ",0dh,0ah
				db         "             \/    \/\__,_|_|_| |_| \/    \/\___|_| |_|\__,_|	   ",0dh,0ah,0dh,0ah
				db         "      			Choice:					   ",0dh,0ah
				db         "      			1. Registration				   ",0dh,0ah
				db         "      			2. Sales				   ",0dh,0ah
				db         "      			3. Logout				   ",0dh,0ah
				db         "                     	(Press any key to exit)			  -> $"
    successLogout dw 0

.code

main proc

	mov ax,@data
	mov ds,ax

login_proc:

    call login
    mov ah,09h
	lea dx,logo
	int 21h

mainMenu_proc:

    mov successLogout,0
    call mainMenu
    cmp al,'1'
	je toRegistration
	cmp al,'2'
	je orderMenu_proc	;sales
	cmp al,'3'
	je toLogout
    jmp endProgram_main

    toRegistration:
    call registration
    jmp mainMenu_proc

    toLogout:
    call logout
    cmp [successLogout],0
    je mainMenu_proc
    jmp login_proc

orderMenu_proc:
    call order_menu
    call clearScreen
    call calculateTotalSubtotal

receipt_proc:
    call receipt
    call n_line
    inc [total_attempt]

    check_another_order:
    ;check for another order
    xor ax,ax
    mov ah,09h
    lea dx,another_order
    int 21h
    mov ah,01h
    int 21h
    mov bl,al
    cmp bl,'n'
    call clearScreen
    je mainMenu_proc
    cmp bl,'N'
    call clearScreen
    je mainMenu_proc
    cmp bl,'y'
    je orderMenu_proc
    cmp bl,'Y'
    je orderMenu_proc

    display_error_message:
    ;display error message
    xor ax,ax
    call n_line
    mov ah,09h
    lea dx,errorMsg
    int 21h
    call n_line
    jmp check_another_order

endProgram_main:
    call report
	mov ah,09h
	lea dx,exitMsg
	int 21h
	mov ah,4ch
	int 21h

main endp

order_menu proc

    call clearScreen
    mov ah,09h
	lea dx,logo
	int 21h
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

compare1:
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
    mov bl, al   ; Store the numeric quantity in BL
    add qty1,al
    add qty1_report,al ; Store qty product 1 in variable

    ; Move the price1 to AX
    mov ax, price1

    ; Multiply AX by BL (quantity)
    xor dx,dx
    mul bx

    ; Add the result to sum
    add total_item1, ax ; Store price for each item
    add total_item1_report,ax
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
    add qty2,al ; Store qty product 2 in variable
    add qty2_report,al

    ; Move the price2 to AX
    mov ax, price2

    ; Multiply AX by BL (quantity)
    mul bx

    ; Add the result to sum
    add subtotal, ax
    add total_item2, ax ; Store price for each item
    add total_item2_report,ax

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
    add qty3,al ; Store qty product 3 in variable
    add qty3_report,al

    ; Move the price3 to AX
    mov ax, price3

    ; Multiply AX by BL (quantity)
    mul bx

    ; Add the result to sum
    add subtotal, ax
    add total_item3, ax ; Store price for each item
    add total_item3_report,ax

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
    add qty4,al ; Store qty product 4 in variable
    add qty4_report,al

    ; Move the price4 to AX
    mov ax, price4

    ; Multiply AX by BL (quantity)
    mul bx

    ; Add the result to sum
    add subtotal, ax
    add total_item4, ax ; Store price for each item
    add total_item4_report,ax

    ;Ask if the user wants to continue
    jmp ask_to_continue

compare5:
	cmp bl, '5'
 	jne invalidInput_sales

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
    add qty5,al ; Store qty product 5 in variable
    add qty5_report,al

    ; Move the price5 to AX
    mov ax, price5

    ; Multiply AX by BL (quantity)
    mul bx

    ; Add the result to sum
    add subtotal, ax
    add total_item5, ax ; Store price for each item
    add total_item5_report,ax

    ;Ask if the user wants to continue
    jmp ask_to_continue

invalidInput_sales:
    ;Invalid input, inform the user and ask again
    mov ah, 09h
    lea dx, newline
    int 21h
    lea dx, errorMsg
    int 21h
	lea dx,newline
	int 21h
    jmp input_loop

invalidInput_confirm:
    mov ah,09h
    lea dx, newline
    int 21h
    lea dx, errorMsg
    int 21h
    lea dx,newline
	int 21h

ask_to_continue:
    mov ah,09h
    lea dx,newline
    int 21h
   	lea dx, str4
   	int 21h

    ;Input
    mov ah, 01h
    int 21h

    ;Check user's input
    cmp al, 'N'
    je continue_end_program
    cmp al, 'n'
    je continue_end_program

    ;If 'Y' or 'y', show the menu again
    cmp al, 'Y'
    je show_menu
    cmp al, 'y'
    je show_menu

    ;If invalid input, show invalid message and ask for input
    jmp invalidInput_confirm

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
    jmp continue_show_menu

continue_end_program:
    jmp end_program

continue_show_menu:
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

order_menu endp

calculatePromotion proc

    mov ax,subtotal

    ;compare subtotal
    cmp ax,30000
    jb endPromotion

    ;separate decimal
    mov bx,100
    div bx

    ;store whole and decimal
    mov whole_number,ax
    mov decimal_number,dx

    ;whole number
	;mov data to registers
    xor dx,dx
    xor ax,ax
	mov ax,whole_number

    ;calc 5% for whole number
    mov bx,5
    mul bx
    mov bx,100
    div bx
    mov whole_number,ax
    mov whole_number_remainder,dx

    ;multiply whole_number_remainder with 100
    xor ax,ax
    mov ax,whole_number_remainder
    mul bx
    mov whole_number_remainder,ax

    ;calc 5% discount for decimal
    xor ax,ax
    xor dx,dx
    mov ax,decimal_number
    mov bl,5
    mul bl
    add ax,whole_number_remainder
    mov decimal_number,ax

    ;check if decimal exceed 10000
    cmp [decimal_number],10000
    jge round_up_decimal_promotion
    jmp calculate_total_promotion

round_up_decimal_promotion:
    mov ax,decimal_number
    mov bx,10000
    div bx
    add whole_number,ax
    mov dx,decimal_number
    jmp endPromotion

calculate_total_promotion:
    xor dx,dx
    mov ax,whole_number
    add total_promotion_whole,ax
    mov ax,decimal_number
    add total_promotion_decimal,ax

    ;check if decimal exceed 10000
    cmp [total_promotion_decimal],10000
    jge round_up_decimal_promotion

endPromotion:
    xor ax,ax
    xor dx,dx
    ret

calculatePromotion endp

printOutput proc

    ;print price
    ;separate result_whole
    xor dx,dx
    xor ax,ax
    mov ax,whole_number
    mov bx,10
    div bx
    mov result_whole_single,dl
    
    ;check al condition
    cmp ax,1000
    jge tenthou_place
    cmp ax,100
    jge thou_place
    cmp ax,10
    jge hund_place
    cmp ax,0
    je print_whole_single
    mov result_whole_tens,al
    jmp print_whole_tens

tenthou_place:
    xor dx,dx
    div bx
    mov result_whole_tens,dl
    xor dx,dx
    div bx
    mov result_whole_hund,dl
    xor dx,dx
    div bx
    mov result_whole_thou,dl
    mov result_whole_tenthou,al
    jmp print_whole_thou

thou_place:
    xor dx,dx
    div bx
    mov result_whole_tens,dl
    xor dx,dx
    div bx
    mov result_whole_hund,dl
    mov result_whole_thou,al
    jmp print_whole_thou


hund_place:
    xor dx,dx
    div bx
    mov result_whole_tens,dl
    mov result_whole_hund,al
    jmp print_whole_hund

print_whole_thou:

    ;print thou number
    xor ax,ax
    xor dx,dx
    mov dl,result_whole_thou
    add dl,30h
    mov ah,02h
    int 21h

print_whole_hund:

    ;print hund number
    xor ax,ax
    xor dx,dx
    mov dl,result_whole_hund
    add dl,30h
    mov ah,02h
    int 21h

print_whole_tens:

    ;print tens number
    mov dl,result_whole_tens
    add dl,30h
    mov ah,02h
    int 21h

print_whole_single:

    ;print single number
    mov dl,result_whole_single
    add dl,30h
    mov ah,02h
    int 21h

    ;print '.'
    xor ax,ax
    mov dl,'.'
    mov ah,02h
    int 21h

    ;separate deci_result
    ;get decimal_single
    xor dx,dx
    xor ax,ax
    mov ax,decimal_number
    mov bl,10
    div bx
    mov result_decimal_single,dl
    mov result_decimal_remain,ax

    ;get decimal_tens
    xor dx,dx
    div bx
    mov result_decimal_tens,dl
    mov result_decimal_remain,ax

    ;get decimal_thou and hund
    xor dx,dx
    div bl
    mov result_decimal_hund,ah
    mov result_decimal_thou,al

    ;print first number
    xor ax,ax
    mov dl,result_decimal_thou
    add dl,30h
    mov ah,02h
    int 21h

    ;print second number
    xor ax,ax
    mov dl,result_decimal_hund
    add dl,30h
    mov ah,02h
    int 21h

    ;print third number
    xor ax,ax
    mov dl,result_decimal_tens
    add dl,30h
    mov ah,02h
    int 21h

    ;print forth number
    xor ax,ax
    mov dl,result_decimal_single
    add dl,30h
    mov ah,02h
    int 21h

    ;clear whole_number and decimal_number
    xor ax,ax
    mov whole_number,ax
    mov decimal_number,ax

    ret

printOutput endp

calculateDiscountedPrice proc

    mov ax,subtotal

    ;compare subtotal
    cmp ax,30000
    jb storePayment_withoutDiscount

    ;separate decimal
    mov bx,100
    div bx

    ;store whole and decimal
    mov whole_number,ax
    mov decimal_number,dx

    ;whole number
	;mov data to registers
    xor dx,dx
    xor ax,ax
	mov ax,whole_number

    ;calc 95% for whole number
    mov bx,95
    mul bx
    mov bx,100
    div bx
    mov whole_number,ax
    mov whole_number_remainder,dx

    ;multiply whole_number_remainder with 100
    xor ax,ax
    mov ax,whole_number_remainder
    mul bx
    mov whole_number_remainder,ax

    ;calc 95% discount for decimal
    xor ax,ax
    xor dx,dx
    mov ax,decimal_number
    mov bl,95
    mul bl
    add ax,whole_number_remainder
    mov decimal_number,ax

    ;check if decimal exceed 10000
    cmp [decimal_number],10000
    ja round_up_decimal_discounted
    jmp storePayment_withDiscount

round_up_decimal_discounted:
    mov ax,decimal_number
    mov bx,10000
    div bx
    add whole_number,ax
    mov decimal_number,dx
    jmp storePayment_withDiscount

storePayment_withDiscount:
    mov ax,whole_number
    mov payment_price_whole,ax
    mov ax,decimal_number
    mov payment_price_decimal,ax
    jmp endDiscounted

storePayment_withoutDiscount:
    xor dx,dx
    mov ax,subtotal
    mov bx,100
    div bx
    mov payment_price_whole,ax
    mov whole_number,ax
    mov ax,dx
    mul bx
    mov payment_price_decimal,ax
    mov decimal_number,ax
    jmp endDiscounted 

endDiscounted:

    xor ax,ax
    xor dx,dx
    ret

calculateDiscountedPrice endp

calculateTax proc

    ;whole number
	;mov data to registers
    xor dx,dx
    xor ax,ax
	mov ax,payment_price_whole

    ;calc 6% for whole number
    mov bx,6
    mul bx
    mov bx,100
    div bx
    mov whole_number,ax
    mov whole_number_remainder,dx

    ;multiply whole_number_remainder with 100
    xor ax,ax
    mov ax,whole_number_remainder
    mul bx
    mov whole_number_remainder,ax

    ;calc 6% discount for decimal
    xor ax,ax
    xor dx,dx
    mov ax,payment_price_decimal
    mov bx,6
    mul bx
    mov bx,100
    div bx
    add ax,whole_number_remainder
    mov decimal_number,ax

    ;check if decimal exceed 10000
    cmp [decimal_number],10000
    ja round_up_decimal_tax
    jmp endTax

round_up_decimal_tax:
    mov ax,decimal_number
    mov bx,10000
    div bx
    add whole_number,ax
    mov decimal_number,dx

endTax:
    xor ax,ax
    xor dx,dx

    ret

calculateTax endp

calculatePriceAfterTax proc

    ;whole number
	;mov data to registers
    xor dx,dx
    xor ax,ax
	mov ax,payment_price_whole

    ;calc 106% for whole number
    mov bx,106
    mul bx
    mov bx,100
    div bx
    mov whole_number,ax
    mov whole_number_remainder,dx

    ;multiply whole_number_remainder with 100
    xor ax,ax
    mov ax,whole_number_remainder
    mul bx
    mov whole_number_remainder,ax

    ;calc 106% discount for decimal
    xor ax,ax
    xor dx,dx
    mov ax,payment_price_decimal
    mov bx,106
    mul bx
    mov bx,100
    div bx
    add ax,whole_number_remainder
    mov decimal_number,ax

    ;check if decimal exceed 10000
    cmp [decimal_number],10000
    ja round_up_decimal_afterTax
    jmp endAfterTax

round_up_decimal_afterTax:
    mov ax,decimal_number
    mov bx,10000
    div bx
    add whole_number,ax
    mov decimal_number,dx

endAfterTax:
    xor ax,ax
    xor dx,dx
    ret

calculatePriceAfterTax endp

calculateTotalSubtotal proc

    xor dx,dx 
    xor ax,ax

    ;store total subtotal
    mov ax,subtotal
    mov bx,100

    ;separate decimal and whole
    div bx

    ;store whole and decimal
    add total_subtotal_whole,ax
    mov ax,dx
    mul bx
    add total_subtotal_decimal,ax

    ;check if decimal exceed 10000
    cmp [total_subtotal_decimal],10000
    ja round_up_decimal_total_subtotal
    jmp endTotalSubtotal

round_up_decimal_total_subtotal:
    mov ax,total_subtotal_decimal
    mov bx,10000
    div bx
    add total_subtotal_whole,ax
    mov total_subtotal_decimal,dx
    jmp endTotalSubtotal

endTotalSubtotal:
    xor ax,ax
    xor dx,dx
    ret

calculateTotalSubtotal endp

report proc

    ;print n_line
    call clearScreen

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
    xor dx,dx
total_subtotal_proc:
    ;mov total_whole to register
    mov ax,total_subtotal_whole

    ;store whole and decimal
    mov whole_number,ax

    ;store total_decimal to register
    mov ax,total_subtotal_decimal
    mov decimal_number,ax
    call printOutput
    call n_line

    ;print total discount
    mov ah,09h
    lea dx,total_discount_report
    int 21h
    xor dx,dx
total_discount_proc:
    ;mov total_whole to register
    mov ax,total_promotion_whole

    ;store whole and decimal
    mov whole_number,ax

    ;store total_decimal to register
    mov ax,total_promotion_decimal
    mov decimal_number,ax
    call printOutput
    call n_line

    ;print n_line
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

    ;print product 1
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,02h
    mov dl,qty1_report
    add dl,30h
    int 21h
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,09h
    lea dx,product1_report
    int 21h
    mov ax,total_item1_report
    xor dx,dx
    call printDecimalProc
    call printOutput
    call n_line

    ;print product 2
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,02h
    mov dl,qty2_report
    add dl,30h
    int 21h
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,09h
    lea dx,product2_report
    int 21h
    mov ax,total_item2_report
    xor dx,dx
    call printDecimalProc
    call printOutput
    call n_line

    ;print product 3
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,02h
    mov dl,qty3_report
    add dl,30h
    int 21h
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,09h
    lea dx,product3_report
    int 21h
    mov ax,total_item3_report
    xor dx,dx
    call printDecimalProc
    call printOutput
    call n_line

    ;print product 4
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,02h
    mov dl,qty4_report
    add dl,30h
    int 21h
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,09h
    lea dx,product4_report
    int 21h
    mov ax,total_item4_report
    xor dx,dx
    call printDecimalProc
    call printOutput
    call n_line

    ;print product 5
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,02h
    mov dl,qty5_report
    add dl,30h
    int 21h
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,09h
    lea dx,product5_report
    int 21h
    mov ax,total_item5_report
    xor dx,dx
    call printDecimalProc
    call printOutput
    call n_line

    ;print n_line
    call n_line

    ;print number of attempt
    mov ah,09h
    lea dx,total_attempt_report
    int 21h
    xor dx,dx
    mov ax,total_attempt
    ;store whole and decimal
    mov whole_number,ax

print_attempt:
    ;separate result_whole
    xor dx,dx
    xor ax,ax
    mov ax,whole_number
    mov bx,10
    div bx
    mov result_whole_single,dl
    
    ;check if al more than 9
    cmp al,10
    jge hund_place_attempt
    cmp al,0
    je print_whole_single_attempt
    mov result_whole_tens,al
    jmp print_whole_tens_attempt

hund_place_attempt:
    xor dx,dx
    div bx
    mov result_whole_tens,dl
    mov result_whole_hund,al

print_whole_attempt:

    ;print hund number
    xor ax,ax
    xor dx,dx
    mov dl,result_whole_hund
    add dl,30h
    mov ah,02h
    int 21h

print_whole_tens_attempt:

    ;print tens number
    mov dl,result_whole_tens
    add dl,30h
    mov ah,02h
    int 21h

print_whole_single_attempt:

    ;print single number
    mov dl,result_whole_single
    add dl,30h
    mov ah,02h
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

item1_receipt:
    ;check item existence
    cmp qty1,0
    je item2_receipt
    inc [receipt_content]

    ;print item1
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,02h
    mov dl,qty1
    add dl,30h
    int 21h
    mov ah,09h
    lea dx,space2
    int 21h
    lea dx,product1_report
    int 21h
    xor dx,dx
    mov ax,total_item1
    call printDecimalProc
    call printOutput
    call n_line

item2_receipt:
    ;check item existence
    cmp qty2,0
    je item3_receipt
    inc [receipt_content]

    ;print item2
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,02h
    mov dl,qty2
    add dl,30h
    int 21h
    mov ah,09h
    lea dx,space2
    int 21h
    lea dx,product2_report
    int 21h
    xor dx,dx
    mov ax,total_item2
    call printDecimalProc
    call printOutput
    call n_line

item3_receipt:
    ;check item existence
    cmp qty3,0
    je item4_receipt
    inc [receipt_content]

    ;print item3
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,02h
    mov dl,qty3
    add dl,30h
    int 21h
    mov ah,09h
    lea dx,space2
    int 21h
    lea dx,product3_report
    int 21h
    xor dx,dx
    mov ax,total_item3
    call printDecimalProc
    call printOutput
    call n_line

item4_receipt:
    ;check item existence
    cmp qty4,0
    je item5_receipt
    inc [receipt_content]

    ;print item4
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,02h
    mov dl,qty4
    add dl,30h
    int 21h
    mov ah,09h
    lea dx,space2
    int 21h
    lea dx,product4_report
    int 21h
    xor dx,dx
    mov ax,total_item4
    call printDecimalProc
    call printOutput
    call n_line

item5_receipt:
    ;check item existence
    cmp qty5,0
    je end_item5
    inc [receipt_content]

    ;print item5
    mov ah,09h
    lea dx,space2
    int 21h
    mov ah,02h
    mov dl,qty5
    add dl,30h
    int 21h
    mov ah,09h
    lea dx,space2
    int 21h
    lea dx,product5_report
    int 21h
    xor dx,dx
    mov ax,total_item5
    call printDecimalProc
    call printOutput
    call n_line

end_item5:
    ;check receipt product
    cmp receipt_content,0
    je continue_endReceipt_empty

    ;print n_line
    call n_line

    ;print subtotal
    mov ah,09h
    lea dx,subtotal_title_receipt
    int 21h
    xor dx,dx
    mov ax,subtotal
    call printDecimalProc
    call printOutput
    call n_line

    ;print discount
    mov ah,09h
    lea dx,discount_title_receipt
    int 21h
    xor dx,dx
    call calculatePromotion
    call printOutput
    call n_line

    ;print line
    call line
    call n_line

    ;print discounted price
    mov ah,09h
    lea dx,discounted_title_receipt
    int 21h
    xor dx,dx
    call calculateDiscountedPrice
    call printOutput
    call n_line
    jmp continue_tax

continue_endReceipt_empty:
    jmp endReceipt_empty

continue_tax:
    ;print tax
    mov ah,09h
    lea dx,tax_title_receipt
    int 21h
    xor dx,dx
    call calculateTax
    call printOutput
    call n_line

    ;print final price
    mov ah,09h
    lea dx,total_price_receipt
    int 21h
    xor dx,dx
    call calculatePriceAfterTax
    call printOutput
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
    jmp endReceipt_purchased

endReceipt_empty:
    call clearScreen

endReceipt_purchased:
    mov qty1,0
    mov qty2,0
    mov qty3,0
    mov qty4,0
    mov qty5,0
    mov total_item1,0
    mov total_item2,0
    mov total_item3,0
    mov total_item4,0
    mov total_item5,0
    mov subtotal,0
    ret

receipt endp

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

printDecimalProc proc

    ;separate whole and decimal
    mov bx,100
    div bx

    ;store whole and decimal
    mov whole_number,ax
    mov ax,dx
    xor dx,dx
    mul bx
    mov decimal_number,ax

    ret

printDecimalProc endp

login proc
    
    call clearScreen
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
	mov cx,150		;read 150 bytes in file
	lea dx,buffer		;ready buffer
	int 21h
	jmp inpUsername

	jc readError		;when error, cf=1

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

;input username, if correctRegister=1->input registerUsername
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

;prompt input new user
newUser:
	mov ah,09h
	lea dx,newNamePrompt
	int 21h
	lea si,registerUser
	mov di,si
	jmp inputLoop

;input string using char by char
inputLoop:
	;input
	mov ah, 01h
	int 21h
	cmp al,13
	je inputDone
	cmp al,8
	je handleUsrBackspace
	jne saveInput

;save input to username variable
saveInput:
	mov [si],al
	inc si
	jmp inputLoop

;check user entered backspace
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

;add symbol to variable,$ to end string
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

;prompt registerPassword
newPassword:
	mov ah,09h
	lea dx,newPwdPrompt
	int 21h
	mov cx,12	;password=12alphanumeric
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

;add symbol to end string
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
	inc cx
	jmp newPass

;save register data such as username and password
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

;eliminate null to store in textfile
eliminateNull:
	inc di
	mov al,'$'
	mov [di],al
	mov cx,0
	lea si,registerData
	jmp countStringLength
	
;count length of string to store in textfile
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
	call clearScreen
	mov ah,09h
	lea dx,registerSuccessMsg
	int 21h
    call n_line
	ret ;to main menu

WriteError:
	mov ah,09h
	lea dx,writeErrorMsg
	int 21h
	jmp exitProgram_login

checkCharacter:
	mov al,[di]
	cmp al,' '	
	je incorrectUser
	mov al,[si]
	cmp al,[di]
	je nextChar
	mov cx,150
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

	ret ;to login_proc

nextPass:
	inc si
	inc di
	mov al,[di]
	cmp al,'#'
	je successLogin
	jmp checkPassword

incorrectPass:
	mov al,try
	cmp al,30h
	je exitProgram_login
	mov ah,09h
	lea dx,pwdErrorMsg
	int 21h
	mov ah,02h
	mov dl,try
	int 21h
	mov ah,09h
	lea dx,time
	int 21h
	dec try
	jmp inpPassword

exitProgram_login:
	mov ah,09h
	lea dx,exitMsg
	int 21h
	mov ah,4ch
	int 21h

login endp

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
	call clearScreen
	mov ah,09h
	lea dx,noAccessMsg
	int 21h
    call n_line
	ret ;to mainMenu

register:
	mov correctRegister,1
	jmp openFile

registration endp

mainMenu proc

    mov ah,09h
	lea dx,mainMenuMsg
	int 21h
	mov ah,01h
	int 21h
	
    ret ; to mainMenu_proc

mainMenu endp

logout proc
logoutProccess:
	mov ah,09h
	lea dx,logoutPrompt
	int 21h
	mov ah,01h
	int 21h
	cmp al,'Y'
	je logoutSuccess
	cmp al,'y'
	je logoutSuccess	
	cmp al,'N'
    je return_logout
	cmp al,'n'
	je return_logout
	jmp invalidLoginInput

return_logout:
    call n_line
    ret ;to mainMenu_proc

logoutSuccess:
	mov ah,09h
	lea dx,logoutMsg
	int 21h
	jmp inputExit

invalidLoginInput:
	mov ah,09h
	lea dx,error
	int 21h
	jmp logoutProccess

invalidLogoutInput:
	mov ah,09h
	lea dx,error
	int 21h
	jmp inputExit

inputExit:
	mov ah,09h
	lea dx,exitPrompt
	int 21h
	mov ah,01h
	int 21h
	cmp al,'N'
	je closeFile
	cmp al,'n'
	je closeFile
	cmp al,'Y'
	je exitProgram_logout
	cmp al,'y'
    je exitProgram_logout
    jmp invalidLogoutInput

exitProgram_logout:
    call report
	mov ah,09h
	lea dx,exitMsg
	int 21h
	mov ah,4ch
	int 21h

closeFile:
	;close file
	mov bx,fileHandler	;ready handler
	mov ah,3eh		;function 3eh - close file
	int 21h
    mov ax,1
    mov successLogout,ax
	ret ;to mainMenu_proc

logout endp

end main