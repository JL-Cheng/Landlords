; #########################################################################

	;=================
	; include files
	;=================
	;�ڴ˴����������ļ�
	include player.inc
	include cards.inc

; #########################################################################

	;=============
    ; Local structures
    ;=============
	;�ڴ˴����ӽṹ��
	Game STRUCT;713BYTE
		status BYTE 0;��Ϸ����
		all_cards BYTE 54 DUP(0);������
		all_cards_remain BYTE 54;ʣ������
		landlord_cards BYTE 3 DUP(0);������
		all_players Player 3 DUP(<>);���������Ϣ
	Game ENDS

	;=================
    ; Local prototypes
    ;=================
	;�ڴ˴����Ӻ���
    GameStart PROTO,gamePtr:PTR Game;��Ϸ��ʼ��ʼ��
	SendCard PROTO,gamePtr:PTR Game;����
	SetLandlord PROTO,gamePtr:PTR Game;���õ���
	SendLandlordCard PROTO,gamePtr:PTR Game;��������
	GamePlaying PROTO,gamePtr:PTR Game;��Ϸ������
	GameOver PROTO,gamePtr:PTR Game;��Ϸ����

; #########################################################################

    .data
		;�ڴ˴����ӱ���

        ;��Ϸ״̬
		game_NoStart = 0;δ��ʼ
		game_GetLandlord= 1;�е����׶�
		game_SendLandlordCard = 2;�������ƽ׶�
		game_Discard = 3;���ƽ׶�
		game_GameOver = 4;��Ϸ����	

; #########################################################################