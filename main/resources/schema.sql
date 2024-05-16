create table if not exists Ingredient (
    id varchar(4) primary key not null,
    name varchar(25) not null,
    type varchar(10) not null
);

create table if not exists Taco (
    id bigint auto_increment primary key,
    name varchar(50) not null,
    createdAt timestamp not null
);

create table if not exists Taco_Ingredients (
    taco bigint not null,
    ingredient_id varchar(4) not null,
    foreign key (taco) references Taco(id),
    foreign key (ingredient_id) references Ingredient(id),
    primary key (taco, ingredient_id)
);

create table if not exists Taco_Order (
    id bigint auto_increment primary key,
    deliveryName varchar(50) not null,
    deliveryStreet varchar(50) not null,
    deliveryCity varchar(50) not null,
    deliveryState varchar(2) not null,
    deliveryZip varchar(10) not null,
    ccNumber varchar(16) not null,
    ccExpiration varchar(5) not null,
    ccCVV varchar(3) not null,
    placedAt timestamp not null
);

create table if not exists Taco_Order_Tacos (
    tacoOrder bigint not null,
    taco bigint not null,
    foreign key (tacoOrder) references Taco_Order(id),
    foreign key (taco) references Taco(id),
    primary key (tacoOrder, taco)
);
