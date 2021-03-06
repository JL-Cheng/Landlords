; #########################################################################
; 文件：
;	cards.asm
;
; 功能：
;	模拟一副扑克以及抽牌流程
;
; #########################################################################

TITLE Cards (cards.asm)


include irvine32.inc
includelib irvine32.lib

include cards.inc

.code

;-----------------------------------------------------
Cards PROC,
	my_cards:PTR BYTE,	;参数作用：牌组地址
	my_remain:PTR BYTE	;参数作用：剩余牌数量地址
; 函数功能:初始化牌组
; 返回值:无
;-----------------------------------------------------
	;函数实现
	pushad
	
	mov esi,my_cards
	mov al,0
	.while al<54
		mov [esi],al
		inc esi
		inc al
	.endw

	invoke RandCards,my_cards,my_remain

	popad
	ret
Cards ENDP

;-----------------------------------------------------
RandCards PROC,
	my_cards:PTR BYTE,	;参数作用：牌组地址
	my_remain:PTR BYTE	;参数作用：剩余牌数量地址
; 函数功能:随机洗牌
; 返回值:无
;-----------------------------------------------------
	;函数实现
	pushad
	
	mov esi,my_cards
	mov ebx,0
	call Randomize
	.while ebx<54
		mov edi,my_cards
		mov eax,54
		call RandomRange
		add edi,eax
		
		mov al,[edi]
		xchg al,[esi]
		mov [edi],al

		inc esi
		inc ebx
	.endw

	mov esi,my_remain
	mov al,54
	mov [esi],al

	popad
	ret
RandCards ENDP

;-----------------------------------------------------
GetCard PROC,
	result:PTR BYTE,	;参数作用：抽牌数字
	my_remain:PTR BYTE,	;参数作用：剩余牌数量地址
	my_cards:PTR BYTE	;参数作用：牌组地址
; 函数功能:发牌
; 返回值:无
;-----------------------------------------------------
	;函数实现
	pushad

	mov esi,result
	mov edi,my_remain
	mov bl,[edi]

	.if bl == 0
		ret
	.endif

	dec bl
	mov [edi],bl
	movzx eax,bl
	
	mov edi,my_cards
	add edi,eax
	mov al,[edi]
	mov [esi],al
	
	popad
	ret
GetCard ENDP

END