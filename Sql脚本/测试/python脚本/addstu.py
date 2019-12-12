import random


def 学生产生器():
    年级学号 = ['2016','2017','2018','2019']
    年级 = [4,3,2,1]
    院系 = ['计算机学院','数学学院','地科学院','马克思学院','外国语学院']
    院系人数 = {'计算机学院':0,'数学学院':0,'地科学院':0,'马克思学院':0,'外国语学院':0}
    院系学号字段 = {'计算机学院':'010','数学学院':'020','地科学院':'030','马克思学院':'040','外国语学院':'050'}
    年龄 = [19,20,21,22]
    性别 = ['男','女']
    总人数 = 1000
    with open('names.txt','r') as names:
        name = 'init'
        while 总人数 > 0:
            name = names.readline().split('\n')[0]
            if name == '':
                continue
            总人数 -= 1
            年级序号 = random.randint(0,3)
            院系序号 = random.randint(0,4)
            该系学号 = str(院系人数[院系[院系序号]]+1).zfill(3)
            院系人数[院系[院系序号]] += 1
            学号 = 年级学号[年级序号]+ 院系学号字段[院系[院系序号]]+该系学号
            age = 年龄[random.randint(0,3)]
            sex = 性别[random.randint(0,1)]
            # 学号= 年级学号[年级序号]+院系学号字段[院系序号]+该系学号
            学生元组 = (学号,name,age,sex,院系[院系序号],年级[年级序号],学号)
            yield 学生元组



if __name__ == '__main__':
    gen = 学生产生器()
    while True:
        try:
            学生元组 = next(gen)
            print('insert into 学生 values'+str(学生元组))
        except StopIteration:
            print('finish')
            break
