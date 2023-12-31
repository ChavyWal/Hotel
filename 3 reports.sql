use ScenicHotelDB 
go 

/*
1) Show me a list of all the sceniors in the scenior section in this format: 
Firstname lastname, age, season(Summer is from May to October, The rest is winter), and  amount of days spent in the hotel. (ex:Jimmy Smith, 76, winter, 5).
*/

select SeniorInfo = concat(g.FirstName, ' ', g.LastName, ', ', datediff(year, DateOfBirth, DateCheckedIn), ', ', g.Season, ', ', g.AmountOfDaysSpentInHotel ) 
from guest g
where g.RoomType = 'Senior Room'

--2) Show me The average days that people stay in the hotel.

select AvgDaysSpentInHotel = avg(AmountOfDaysSpentInHotel) 
from guest g

--3) I would like to have a list of those who visited in the summer, stayed for over seven days and were 2 or more people.

select * 
from guest g 
where g.Season = 'Summer'
and AmountOfDaysSpentInHotel > 7 
and AmountOfPeople > 2

--4) Show me a list of those Guest who came back more than once.

select g.FirstName, g.LastName, AmountOfTimesVisited = count(*) 
from guest g 
group by g.FirstName, g.LastName
having count(*) > 1