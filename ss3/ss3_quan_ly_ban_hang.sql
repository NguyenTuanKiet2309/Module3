create
database ss2_quan_ly_ban_hang;
use
ss2_quan_ly_ban_hang;

create table customer
(
    c_id   int primary key auto_increment,
    c_name varchar(50),
    c_age  varchar(10)
);

create table `order`
(
    o_id          int primary key auto_increment,
    c_id          int,
    foreign key (c_id) references customer (c_id),
    o_date        date,
    o_total_price int
);

create table product
(
    p_id    int primary key,
    p_name  varchar(50),
    p_price int
);

create table order_detail
(
    o_id   int,
    p_id   int,
    primary key (o_id, p_id),
    foreign key (o_id) references `order` (o_id),
    foreign key (p_id) references product (p_id),
    od_qty int
);

insert into customer(c_id, c_name, c_age)
values (1, "Minh Quân", 10),
       (2, "Ngọc Oanh", 20),
       (3, "Hông Hà", 50);

insert into `order`(o_id, c_id, o_date, o_total_price)
values (1, 1, 20060321, null),
       (2, 2, 20060323, null),
       (3, 1, 20060316, null);

insert into product(p_id, p_name, p_price)
values (1, "Máy Giặt", 3),
       (2, "Tủ Lạnh", 5),
       (3, "Điều Hoà", 7),
       (4, "Quạt", 1),
       (5, "Bếp Điện", 2);

insert into order_detail(o_id, p_id, od_qty)
values (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id, o_date, o_total_price
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.c_name, p.p_name
from customer c
         join `order` o
              on c.c_id = o.c_id
         join order_detail od
              on od.o_id = o.o_id
         join product p
              on p.p_id = od.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.c_name
from customer c
         left join `order` o
                   on c.c_id = o.c_id
where o.c_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại
--  mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.o_id, o.o_date, sum(od.od_qty * p.p_price) as "gia tien"
from `order` o
         join order_detail od
              on o.o_id = od.o_id
         join product p
              on p.p_id = od.o_id
group by o.o_id;

