# coding: utf-8
import MySQLdb
import sys
reload(sys)
sys.setdefaultencoding("utf-8")

if __name__ == '__main__':

    # 连接数据库
    conn = MySQLdb.connect(
        host='127.0.0.1',
        port=3306,
        user='root',
        passwd='4955sslf',
        charset = "utf8",
        db='university'
    )

    #获取数据库执行游标
    cur = conn.cursor()

    #打开department文件并将其导入department表格
    dept = open('/home/zss/桌面/数挖培训/MySQL上课文件/作业/university/department.txt', 'r')
    for line in dept.readlines():
        line = line.strip('\n')
        line = line.split(' ')
        print line
        cur.execute("insert into department values('%s','%s','%s')" % (line[0], line[1], line[2]))
    dept.close()

    # 打开student文件并将其导入student表格
    student = open('/home/zss/桌面/数挖培训/MySQL上课文件/作业/university/student.txt', 'r')
    for line in student.readlines():
        line = line.strip('\n')
        line = line.split(' ')
        print line
        cur.execute("insert into student values('%s','%s','%s','%s','%s','%s')" %
                    (line[0], line[1], line[2],line[3], line[4], line[5]))
    student.close()

    # 打开exam文件并将其导入exam表格
    exam = open('/home/zss/桌面/数挖培训/MySQL上课文件/作业/university/student.txt', 'r')
    for line in exam.readlines():
        line = line.strip('\n')
        line = line.split(' ')
        print line
        cur.execute("insert into exam values('%s','%s','%s')" % (line[0], line[1], line[2]))
    exam.close()

    #提交修改
    conn.commit()

    #关闭数据库
    conn.close()
