--顾客的执行操作

--查看全部店家信息
exec check_server

--查看菜品
exec search_allfood

--查看店家的菜品
exec check_snack '老东北'
exec check_snack '张亮麻辣烫'

--购买菜品

exec buy_food '大盘鸡',1
exec buy_food '铁锅炖',3

--自动生成订单相关操作
--查看当前全部订单
exec check_order

--购买菜品后自动生成新订单
exec check_order

--店家的执行操作

--查询店家信息
exec check_server

--查看菜品
exec search_allfood

--已添加的菜品
exec insert_food 2,'酸辣土豆丝',15,20
exec insert_food 2,'铁锅炖',45,20
exec insert_food 2,'大盘鸡',40,20
exec insert_food 3,'番茄麻辣烫',20,20
exec insert_food 3,'蔬菜菌菇烫',25,20
exec insert_food 3,'麻辣小锅',23,20

--未添加的菜品
exec insert_food 2,'东北大乱炖',55,20

--删除菜品
exec delete_food '酸辣土豆丝'

--更新菜品
exec update_food '大盘鸡',40,25

--查看自己家的菜品
exec check_snack '老东北'

--骑手操作

--查看未被接单的订单
exec check_no

--接单
exec accept_order 5,5

--查看自己的订单
exec check_self_order '张三'