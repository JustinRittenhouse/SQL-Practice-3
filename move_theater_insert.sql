insert into "movie"("title")
values
('The Adventures of Derek Hawkins'),
('Lucas Lang Goes to White Castle');

insert into "concessions"("name", "size", "amount")
values
('popcorn', 'small', 8.00),
('popcorn', 'medium', 8.01),
('popcorn', 'large', 8.02),
('beer', 'small', 6.50),
('beer', 'medium', 6.51),
('beer', 'large', 6.52);

insert into "staff"("first_name", "last_name", "email", "phone_number")
values 
('Derek', 'Hawkins', 'iluvcoding@hotmail.com', '4815162342'),
('Lucas', 'Lang', 'canyoushareyourscreen@hotmail.com', '2460124601');

insert into "customer"("first_name", "last_name", "birthday", "email", "phone_number")
values 
('Albert', 'Alcatraz', '1900-01-01', 'somehowstillliving@hotmail.com', '1234567890'),
('Beatrice', 'Bartholemew', '1990-05-14', 'thisisanalias@hotmail.com', '9876543210'),
('Clyde', 'Cash', '2000-02-10', 'whatageami@hotmail.com', '5408675309');

insert into "customer"("first_name", "birthday", "email")
values 
('Doug', '1978-02-11', 'idonttrustthegovmentwithmyinformation@hotmail.com')

--insert into "customer"("age")
--values 
--(datediff(year(customer.birthday),getdate())

-- After consulting Lucas, he explained how it was better to just create the age when needed.
alter table "customer"
drop column "age";

insert into "ticket" ("movie_id", "start_time", "customer_id")
values 
(1, '6:30', 4),
(1, '8:00', 4),
(1, '9:30', 4),
(2, '20:00', 2),
(2, '20:00', 3);

-- It would be nice to see when each purchase was made, too.
alter table "payment"
add "time" time;

insert into "payment" ("customer_id", "staff_id", "ticket_id", "amount", "time")
values 
(5, 1, 11, 13.00, current_timestamp),
(5, 1, 12, 13.00, current_timestamp),
(5, 1, 13, 13.00, current_timestamp),
(2, 1, 14, 13.00, current_timestamp),
(3, 1, 15, 13.00, current_timestamp);

-- Whoops. Want consistent names. Didn't catch this until now.
alter table "payment" rename column "concessions_id" to "concession_id";

insert into "payment" ("customer_id", "staff_id", "concession_id", "amount", "time")
values 
(1, 2, 6, 0, current_timestamp),
(1, 2, 6, 0, current_timestamp),
(1, 2, 6, 0, current_timestamp),
(1, 2, 6, 0, current_timestamp),
(1, 2, 6, 0, current_timestamp),
(1, 2, 6, 0, current_timestamp),
(1, 2, 6, 0, current_timestamp),
(1, 2, 6, 0, current_timestamp),
(1, 2, 6, 0, current_timestamp),
(1, 2, 6, 0, current_timestamp),
(3, 2, 1, 8.00, current_timestamp),
(2, 2, 6, 6.52, current_timestamp);