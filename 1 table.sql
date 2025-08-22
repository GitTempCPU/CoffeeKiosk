/*
PurchaseID primary key int not null unique 
PurchaseTime datetime not before today not null not blank 
PurchaseItem varchar(30) not null not blank 
PriceEach decimal(5,2) not null not negative
Quantity int not null
TotalPrice decimal(5,2) not null
PaymentMethod varchar(5) must be either cash or card not null not blank
*/

drop table if exists CoffeeKiosk
go 
create table dbo.CoffeeKiosk(
    PurchaseId int not null identity primary key,
    PurchaseDate date not null constraint CofeeKiosk_Purchase_time_cannot_be_blank check(PurchaseDate <> ''),
        constraint CoffeeKiosk_Purchase_time_cannot_be_after_current_date check(PurchaseDate <= getdate()),
    PurchaseItem varchar(30) not null constraint CoffeeKiosk_Purchase_item_cannot_be_blank check(PurchaseItem <> ''),
    PriceEach decimal(5,2) not null constraint CoffeeKiosk_price_each_cannot_be_a_negative_number check(PriceEach >= 0),
    Quantity int not null,
    TotalPrice as PriceEach * Quantity persisted, 
    PaymentMethod varchar(5) not null constraint CoffeKiosk_Payment_method_must_be_either_cash_or_card check(PaymentMethod in('cash', 'card'))
)