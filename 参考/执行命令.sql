--�˿͵�ִ�в���

--�鿴ȫ�������Ϣ
exec check_server

--�鿴��Ʒ
exec search_allfood

--�鿴��ҵĲ�Ʒ
exec check_snack '�϶���'
exec check_snack '����������'

--�����Ʒ

exec buy_food '���̼�',1
exec buy_food '������',3

--�Զ����ɶ�����ز���
--�鿴��ǰȫ������
exec check_order

--�����Ʒ���Զ������¶���
exec check_order

--��ҵ�ִ�в���

--��ѯ�����Ϣ
exec check_server

--�鿴��Ʒ
exec search_allfood

--����ӵĲ�Ʒ
exec insert_food 2,'��������˿',15,20
exec insert_food 2,'������',45,20
exec insert_food 2,'���̼�',40,20
exec insert_food 3,'����������',20,20
exec insert_food 3,'�߲˾�����',25,20
exec insert_food 3,'����С��',23,20

--δ��ӵĲ�Ʒ
exec insert_food 2,'����������',55,20

--ɾ����Ʒ
exec delete_food '��������˿'

--���²�Ʒ
exec update_food '���̼�',40,25

--�鿴�Լ��ҵĲ�Ʒ
exec check_snack '�϶���'

--���ֲ���

--�鿴δ���ӵ��Ķ���
exec check_no

--�ӵ�
exec accept_order 5,5

--�鿴�Լ��Ķ���
exec check_self_order '����'