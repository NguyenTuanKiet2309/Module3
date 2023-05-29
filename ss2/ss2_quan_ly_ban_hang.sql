create
database ss2_bai_tap_2;
use
ss2_bai_tap_2;

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
    o_tolal_price int
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

