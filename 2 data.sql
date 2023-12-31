use ScenicHotelDB 
go 
delete guest 
go 
insert guest (FirstName, LastName, AmountOfPeople, DateOfBirth, CreditCardNumber, ExpirationDate, RoomType, RoomNumber, DateCheckedIn, DateCheckedOut)
select 'Jimmy', 'Jane', 6, '1999-12-20', '0999 8976 6543 2357', '08/28', 'Connecting Room', '306', '2020-11-23', '2020-11-25'
union select 'Moshe', 'Fried', 2, '2000-09-17', '8099 6754 3425 0988', '09/29', 'Standard Room', '202', '2021-07-09', '2021-07-13'
union select 'Nikki', 'Clark', 1, '1940-09-09', '7878 5656 3456 2123', '09/24', 'Senior Room', '109', '2021-12-05', '2021-12-13'
union select 'Freddy', 'Shane', 2, '1987-08-13', '1112 3334 5432 6765', '07/27', 'Standard Room', '234', '2022-11-08', '2022-11-08'
union select 'Kalman', 'Marko', 5, '1952-05-09', '0987 6754 6867 8888', '11/26', 'Connecting Room', '120', '2023-05-13', '2023-05-20'
union select 'James', 'Haley', 3, '1975-09-18', '8976 6755 4532 0876', '12/28', 'Suite', '217', '2023-12-17', null
union select 'Danny', 'Samuel', 1, '1999-05-16', '9876 0098 3456 2222', '02/27', 'Suite', '209', '2021-06-13', '2021-06-16'
union select 'Nikki', 'Clark', 2, '1940-09-09', '7878 5656 3456 2123', '09/24', 'Senior Room', '112', '2023-12-08', '2023-12-11'
union select 'Zang', 'Wei', 4, '1987-08-15', '0978 9865 4542 9877', '08/22', 'Suite', '208', '2022-11-15', '2022-11-26'
union select 'Zeidy', 'Shtark', 2, '1949-07-24', '0975 4643 3156 9087', '09/21', 'Senior Room', '135', '2023-08-27', '2023-09-06'
union select 'Zeidy', 'Shtark', 7, '1949-07-24', '0975 4643 3156 9087', '09/21', 'Connecting Room', '312', '2023-08-27', '2023-09-06'

select * from guest