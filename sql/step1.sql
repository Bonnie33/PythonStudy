-- 建一个新的schema`university`
CREATE SCHEMA `university` DEFAULT CHARACTER SET utf8 ;

-- 建一个新的表`department`
CREATE TABLE `university`.`department` (
  `dept_name` VARCHAR(45) NOT NULL,
  `building` VARCHAR(45) NULL,
  `budget` VARCHAR(45) NULL,
  PRIMARY KEY (`dept_name`));

-- 建一个新的表`student`
CREATE TABLE `university`.`student` (
  `ID` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL,
  `sex` CHAR NULL,
  `age` INT UNSIGNED NULL,
  `emotion_state` VARCHAR(45) NULL,
  `dept_name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));

-- 建一个新的表`exam`
  CREATE TABLE `university`.`exam` (
  `student_ID` INT UNSIGNED NOT NULL,
  `exam_name` VARCHAR(45) NOT NULL,
  `grade` VARCHAR(45) NULL,
  PRIMARY KEY (`student_ID`, `exam_name`));

-- 让student关联department，设置dept_name为外键  
ALTER TABLE `university`.`student` 
ADD INDEX `dept_name_idx` (`dept_name` ASC);
ALTER TABLE `university`.`student` 
ADD CONSTRAINT `dept_name`
  FOREIGN KEY (`dept_name`)
  REFERENCES `university`.`department` (`dept_name`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;
  
-- 让exam关联student，设置student_ID为外键
ALTER TABLE `university`.`exam` 
ADD CONSTRAINT `student_ID`
  FOREIGN KEY (`student_ID`)
  REFERENCES `university`.`student` (`ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

  
