use ScenicHotelDB
go
drop table if exists guest 
go 
create table dbo.guest(
    GuestId int not null identity primary key,
    FirstName varchar(25) not null 
        constraint ck_Guest_first_name_cannot_be_blank check(FirstName <> ''),
    LastName varchar(25) not null 
        constraint ck_Guest_last_name_cannot_be_blank check(LastName <> ''),
    AmountOfPeople int not null 
        constraint ck_Guest_amount_of_people_must_be_greater_than_zero check(AmountOfPeople > 0),
    DateOfBirth date not null,
    CreditCardNumber char(19) not null 
        constraint ck_Guest_credit_card_number_must_be_16_digits_separated_by_a_space_after_each_4_digits
            check(CreditCardNumber like '[0-9][0-9][0-9][0-9] [0-9][0-9][0-9][0-9] [0-9][0-9][0-9][0-9] [0-9][0-9][0-9][0-9]'),
    ExpirationDate char(5) not null 
        constraint ck_Guest_expiration_date_must_be_in_the_format_of_the_month_and_year_separated_by_slash check(ExpirationDate like '[0-1][0-9]/[0-9][0-9]'),
    RoomType varchar(15) not null 
        constraint ck_Guest_room_type_must_be_one_of_the_4_possible_options 
            check(RoomType in('Suite', 'Standard Room', 'Connecting Room', 'Senior Room')),
    RoomNumber int not null
        constraint ck_Guest_room_number_must_be_between_100_and_399 check(RoomNumber between 100 and 399),
    DateCheckedIn date not null
        constraint ck_Guest_date_checked_in_must_be_after_oppening_date_and_cannot_be_future check(DateCheckedIn between '1998-01-01' and getdate()),
    DateCheckedOut date null 
        constraint Guest_dates_cannot_be_future check(DateCheckedOut <= getdate()),
    Season as 
        case 
            when convert(varchar,DateCheckedIn) like '[0-9][0-9][0-9][0-9]-0[5-9]-[0-9][0-9]' then 'Summer'
            else 'Winter'
            end,
    AmountOfDaysSpentInHotel as isnull(datediff(day, DateCheckedIn, DateCheckedOut), datediff(day, DateCheckedIn, getdate())),
    TotalCost as 
        case RoomType 
            when 'Suite' then 250
            when 'Standard Room' then 170
            when 'Connecting Room' then 320
            when 'Senior Room' then 150
            end
            * 
        case datediff(day, DateCheckedIn, DateCheckedOut)
                when 0 then 1
                else datediff(day, DateCheckedIn, DateCheckedOut)
                end
        persisted,
            constraint ck_Guest_one_must_be_eighteen_or_older_to_make_reservations check(datediff(year, DateOfBirth, DateCheckedIn) >= 18),
            constraint ck_Guest_senior_date_checked_in_must_be_on_or_after_sept_19_2023_and_age_must_be_65_or_over_and_can_only_be_on_first_floor
                check((RoomType = 'Senior Room' and datediff(year, DateOfBirth, DateCheckedIn) >= 65 and DateCheckedIn >= '2020-09-19' and RoomNumber between 100 and 199) or (RoomType <> 'Senior Room')),
            constraint ck_guest_amount_of_people_must_be_in_accordance_to_room_type 
                check((RoomType = 'Suite' and AmountOfPeople <= 4) or ((RoomType = 'Standard Room'or RoomType = 'Senior Room') and AmountOfPeople <= 2) or (RoomType = 'Connecting Room' and AmountOfPeople <= 8)),
            constraint ck_Guest_date_checked_in_must_be_before_or_on_the_same_date_as_date_checked_out check(DateCheckedIn <= DateCheckedOut)         
)
go 