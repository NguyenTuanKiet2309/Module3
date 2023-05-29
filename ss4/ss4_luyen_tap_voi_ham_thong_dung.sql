CREATE
DATABASE ss4_luyen_tap_voi_ham_thong_dung;
USE
ss4_luyen_tap_voi_ham_thong_dung;

CREATE TABLE class
(
    classID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    className VARCHAR(60) NOT NULL,
    startDate DATETIME    NOT NULL,
    status    BIT
);

CREATE TABLE student
(
    studentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    studentName VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    status      BIT,
    classId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);

CREATE TABLE `subject`
(
    subId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subName VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
    status  BIT                  DEFAULT 1
);

CREATE TABLE mark
(
    markId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subId     INT NOT NULL,
    studentId INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    examTimes TINYINT DEFAULT 1,
    UNIQUE (subId, studentId),
    FOREIGN KEY (subId) REFERENCES subject (subId),
    FOREIGN KEY (studentId) REFERENCES student (studentId)
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (studentName, address, phone, status, classId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (studentName, address, status, classId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (studentName, address, phone, status, classId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO mark (subId, studentId, mark, examTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject
where credit = (
    select max(credit)
    from subject
);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select *
from subject
         join mark
              on mark.subId = subject.subId
where mark = (
    select max(mark)
    from mark
);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.*, avg(mark.mark)
from student
         join mark
              on mark.studentId = student.studentId
group by studentId
order by avg(mark.mark) desc;