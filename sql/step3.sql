-- 3-1.把peoples表中school不是GDUFS的人全部找出来？（包括school为NULL的人）
select * from peoples where school != 'GDUFS' and school is NULL;

-- 3-2.查找计算机系每次考试所有学生的平均成绩(最终显示学生姓名, 考试名称, 平均分)
select name,exam_name,avg(grade) from student,exam where student.ID = exam.ID and student.dept_name in ('computer');

-- 3-3.查找女学霸（考试平均分达到80分或80分以上的女生的姓名, 分数）
select name, grade from student where student.ID = exam.ID and exam.avg(grade) >= 80 and sex = 'f';

-- 3-4.找出人数最少的院系以及其年度预算
select department, budget from (select min(dept_number), min(budget) from department);

-- 3-5.计算机系改名了，改成计算机科学系（comp. sci.），写出mysql语句
update department set dept_name = 'comp. sci' where dept_name = 'computer';

-- 3-6.修改每个系的年度预算，给该系的每个学生发2000元奖金。（修改每个系的年度预算为 原预算+该系人数*2000）
update department set budget = budget + dept_number * 2;

-- 3-7.向department表中插入一条数据, dept_name属性的值为avg_budget, building为空, 年度预算为所有院系的年度预算平均值.
select avg(budget) from department;
insert into department(dept_name, building, budget) values('avg_budget', NULL, avg(budget));

-- 3-9.找出所有正在谈恋爱,但是学习成绩不佳(考试平均分低于75)的学生,强制将其情感状态改为单身
update student 
set emotion_state = 'single' 
    where ID = (
        select ID from student, exam 
            where student.ID = exam.ID 
            and student.emotion_state = 'loving' 
            and exam.grade < 75
		);
        
-- 3-10(选做). 对每个学生, 往exam表格中插入名为Avg_Exam的考试, 考试分数为之前学生参加过考试的平均分
alter table exam add column Avg_Exam int;
replace into exam (ID, Avg_Exam) values (1,avg(grade)),(2,,avg(grade)),...(x,avg(grade));
