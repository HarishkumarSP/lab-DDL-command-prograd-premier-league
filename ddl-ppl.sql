-- PROGRESSION 1:

--1. Insert skill
create table SKILL(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100)NOT NULL
);

--2. Insert city

create table CITY(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100)NOT NULL
);
--3. Insert venue

create table VENUE(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100)NOT NULL,
city_id NUMBER(11)NOT NULL,
FOREIGN KEY(city_id)
REFERENCES city(id)
);
--4. Insert team

create table TEAM(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100) NOT NULL,
coach VARCHAR(100) NOT NULL,
home_city_id NUMBER(11),
FOREIGN KEY(home_city_id)
REFERENCES city(id)
);
--5. Insert player

--6. Insert outcome

create table OUTCOME(
id NUMBER(11)PRIMARY KEY,
status VARCHAR(100)NOT NULL,
winner_team_id NUMBER(11), 
FOREIGN KEY(winner_team_id)REFERENCES team(id),
wickets NUMBER(11),
runs NUMBER(11),
player_of_match NUMBER(11),
FOREIGN KEY(player_of_match)REFERENCES player(id)
);
--7. Insert innings

create table innings(
id NUMBER(11)PRIMARY KEY,
innings_number NUMBER(11)NOT NULL,
batting_team_id NUMBER(11),
FOREIGN KEY(batting_team_id)REFERENCES team(id)
);
--8. Insert game

create table game(
id NUMBER(11)PRIMARY KEY,
game_date DATE,
team_id_1 NUMBER(11),
FOREIGN KEY(team_id_1)REFERENCES team_1(id),
team_id_2 NUMBER(11),
FOREIGN KEY(team_id_2)REFERENCES team_2(id),
venue_id NUMBER(11),
FOREIGN KEY(venue_id)REFERENCES venue(id),
outcome_id NUMBER(11),
FOREIGN KEY(outcome_id)REFERENCES outcome(id),
first_innings_id NUMBER(11),
FOREIGN KEY(first_innings_id)REFERENCES first(id),
second_innings_id NUMBER(11),
FOREIGN KEY(second_innings_id)REFERENCES second(id)
);
--9. Insert umpire

create table umpire(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100)NOT NULL
);
--10. Insert umpire_type

create table umpire_type(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100)NOT NULL
);
--11. Insert game_umpire_type

create table game_umpire_type(
id NUMBER(11)PRIMARY KEY,
game_id NUMBER(11),
FOREIGN KEY(game_id)REFERENCES game(id),
umpire_id NUMBER(11),
FOREIGN KEY(umpire_id)REFERENCES umpire(id),
umpire_type_id NUMBER(11),
FOREIGN KEY(umpire_type_id)REFERENCES umpire_type(id)
);
--12. Insert wicket_type

create table wicket_type(
id NUMBER(11)PRIMARY KEY,
name VARCHAR(100)NOT NULL
);
--13. Insert delivery

--14. Insert wicket

create table delivery(
id NUMBER(11) PRIMARY KEY,
innings_id NUMBER(11) NOT NULL,
FOREIGN KEY(innings_id) REFERENCES innings(id),
over NUMBER(11) NOT NULL,
ball NUMBER(11) NOT NULL,
batsman_id NUMBER(11) NOT NULL,
FOREIGN KEY(batsman_id) REFERENCES player(id),
bowler_id NUMBER(11) NOT NULL,
FOREIGN KEY(bowler_id) REFERENCES player(id),
non_striker_id NUMBER(11) NOT NULL,
FOREIGN KEY(non_striker_id) REFERENCES player(id),
runs NUMBER(11) NOT NULL
);
--14. Insert wicket
create table wicket(
id NUMBER(11) primary key,
delivery_id NUMBER(11) NOT NULL,
CONSTRAINT FK_deliveryid1 foreign key(delivery_id) REFERENCES delivery(id),
wicket_type_id NUMBER(11) NOT NULL,
FOREIGN KEY(wicket_type_id) REFERENCES wicket_type(id),
player_id NUMBER(11) NOT NULL,
FOREIGN KEY(player_id) REFERENCES player(id),
fielder_id NUMBER(11),
FOREIGN KEY(fielder_id) REFERENCES player(id)
);
--15. Insert extratype

create table extratype(
id NUMBER(11) PRIMARY KEY,
name VARCHAR(100) NOT NULL
);


--16. Insert extradelivery

create table extradelivery(
id NUMBER(11)PRIMARY KEY,
delivery_id NUMBER(11) NOT NULL,
FOREIGN KEY(delivery_id) REFERENCES delivery(id),
extra_type_id NUMBER(11) NOT NULL,
FOREIGN KEY(extra_type_id) REFERENCES extratype(id),
runs NUMBER(11) NOT NULL
);
--17. Update venue

--18. Update team
--19. Update player
--20. Delete player
