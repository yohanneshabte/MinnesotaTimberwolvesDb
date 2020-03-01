-- Drop All tables first

DROP TABLE IF EXISTS [Game Attendance],[Ticket],[Order], [Game Results], [Game], [Stadium Seats],
                     [Stadium Zones], [Stadium], [Dependent],
                     [Payment Info], [Address], [Member], [Employee],
                     [Team Owner], [Owner], [Team];

GO

                                    -- **** Group 1

-- Team

CREATE TABLE [Team]
(
 [team-ID]   int NOT NULL ,
 [team-abbr] varchar(50) NOT NULL ,
 [team-name] varchar(50) NOT NULL ,


 CONSTRAINT [PK_Team] PRIMARY KEY  ([team-ID] ASC)
);
GO
-- Owner

CREATE TABLE [Owner]
(
 [owner-ID]   int NOT NULL ,
 [first-name] varchar(50) NOT NULL ,
 [last-name]  varchar(50) NOT NULL ,


 CONSTRAINT [PK_Owner] PRIMARY KEY  ([owner-ID] ASC)
);
GO
-- [Team Owner]

CREATE TABLE [Team Owner]
(
 [team-ID]  int NOT NULL ,
 [owner-ID] int NOT NULL ,


 CONSTRAINT [PK_Team Owner] PRIMARY KEY  ([team-ID] ASC, [owner-ID] ASC),
 CONSTRAINT [FK_Owner] FOREIGN KEY ([owner-ID])  REFERENCES [Owner]([owner-ID]),
 CONSTRAINT [FK_Team] FOREIGN KEY ([team-ID])  REFERENCES [Team]([team-ID])
);
GO


                                        -- **** Group 5


-- Employee

CREATE TABLE [Employee]
(
 [employee-ID]     int NOT NULL ,
 [first-name]    varchar(50) NOT NULL ,
 [last-name]     varchar(50) NOT NULL ,
 [job-desc]   varchar(50) NOT NULL ,


 CONSTRAINT [PK_Employ] PRIMARY KEY  ([employee-ID] ASC)
);
GO




                                        -- **** Group 2 

-- Member

CREATE TABLE [Member]
(
 [member-ID]     int NOT NULL ,
 [first-name]    varchar(50) NOT NULL ,
 [last-name]     varchar(50) NOT NULL ,
 [member-type]   varchar(50) NOT NULL ,
 [email-address] varchar(50) NOT NULL ,
 [phone-number]  varchar(50) NOT NULL ,


 CONSTRAINT [PK_Member] PRIMARY KEY  ([member-ID] ASC)
);
GO
-- Address

CREATE TABLE [Address]
(
 [address-ID]     int NOT NULL ,
 [street-address] varchar(50) NOT NULL ,
 [zip-code]       int NOT NULL ,
 [city]           varchar(50) NOT NULL ,
 [state]          varchar(50) NOT NULL ,
 [country]        varchar(50) NOT NULL ,
 [ID]             int NOT NULL ,


 CONSTRAINT [PK_Address] PRIMARY KEY  ([address-ID] ASC),
 CONSTRAINT [FK_Member_1] FOREIGN KEY ([ID])  REFERENCES [Member]([member-ID]),
 CONSTRAINT [FK_Member_2] FOREIGN KEY ([ID])  REFERENCES [Employee]([employee-ID])
);
GO
-- Payment Info

CREATE TABLE [Payment Info]
(
 [payment-ID]    int NOT NULL ,
 [member-ID]     int NOT NULL ,
 [cc-number]     varchar(50) NOT NULL ,
 [expiry-date]   varchar(50) NOT NULL ,
 [ccv-number]    int NOT NULL ,


 CONSTRAINT [PK_Payment_Info] PRIMARY KEY  ([payment-ID] ASC),
 CONSTRAINT [FK_Member_2] FOREIGN KEY ([member-ID])  REFERENCES [Member]([member-ID])
);
GO
-- Dependent

CREATE TABLE [Dependent]
(
 [dependent-ID] int NOT NULL ,
 [member-ID]    int NOT NULL ,
 [first-name]   varchar(50) NOT NULL ,
 [relationship] varchar(50) NOT NULL ,
 [gender]       varchar(50) NOT NULL ,


 CONSTRAINT [PK_Dependent] PRIMARY KEY  ([dependent-ID] ASC),
 CONSTRAINT [FK_Member] FOREIGN KEY ([member-ID])  REFERENCES [Member]([member-ID])
);
GO








                                        -- **** Group 3 


-- Stadium

CREATE TABLE [Stadium]
(
 [stadium-ID]   int NOT NULL ,
 [stadium-name] varchar(50) NOT NULL ,
 [capacity]     int NULL ,
 [team-ID]      int NOT NULL ,        


 CONSTRAINT [PK_Stadium] PRIMARY KEY  ([stadium-ID] ASC),
 CONSTRAINT [FK_teamstadium] FOREIGN KEY ([team-ID])  REFERENCES [Team]([team-ID])
);
GO
-- Stadium Zones

CREATE TABLE [Stadium Zones]
(
 [zone-ID]    int NOT NULL ,
 [zone-desc]  varchar(50) NOT NULL ,
 [price]      decimal(8,2) NOT NULL ,


 CONSTRAINT [PK_Stadium_Zones] PRIMARY KEY  ([zone-ID] ASC)
);
GO
-- Stadium Seats

CREATE TABLE [Stadium Seats]
(
 [seat-ID]      int NOT NULL ,
 [stadium-ID]   int NOT NULL ,
 [zone-ID]      int NOT NULL ,


 CONSTRAINT [PK_Stadium_Seats] PRIMARY KEY  ([seat-ID] ASC),
 CONSTRAINT [FK_Stadium_3] FOREIGN KEY ([stadium-ID])  REFERENCES [Stadium]([stadium-ID]),
 CONSTRAINT [FK_Zone] FOREIGN KEY ([zone-ID])  REFERENCES [Stadium Zones]([zone-ID])
);
GO






                                        -- **** Group 4 

-- Game

CREATE TABLE [Game]
(
 [game-ID]     int NOT NULL ,
 [opponent-ID] int NOT NULL ,
 [game-date]   datetime NOT NULL ,
 [home-game]   bit NOT NULL ,
 [stadium-ID]  int NOT NULL ,


 CONSTRAINT [PK_Game_1] PRIMARY KEY  ([game-ID] ASC),
 CONSTRAINT [FK_Stadium_2] FOREIGN KEY ([stadium-ID])  REFERENCES [Stadium]([stadium-ID]),
 CONSTRAINT [FK_Opp] FOREIGN KEY ([opponent-ID])  REFERENCES [Team]([team-ID])
);
GO
-- Game Results

CREATE TABLE [Game Results]
(
 [game-ID]                   int NOT NULL ,
 [is-won]                    bit NOT NULL ,
 [team-pts]                  int NOT NULL ,
 [away-pts]                  int NOT NULL ,
 [field-goals]               int NOT NULL ,
 [field-goals-attempted]     int NOT NULL ,
 [3pt-shots]                 int NOT NULL ,
 [3pt-shots-attempted]       int NOT NULL ,
 [free-throws]               int NOT NULL ,
 [free-throws-attempted]     int NOT NULL ,
 [off-rebounds]              int NOT NULL ,
 [total-rebounds]            int NOT NULL ,
 [assists]                   int NOT NULL ,
 [steals]                    int NOT NULL ,
 [blocks]                    int NOT NULL ,
 [turnovers]                 int NOT NULL ,
 [fouls]                     int NOT NULL ,
 [opp-field-goals]           int NOT NULL ,
 [opp-field-goals-attempted] int NOT NULL ,
 [opp-3pt-shots]             int NOT NULL ,
 [opp-3pt-shots-attempted]   int NOT NULL ,
 [opp-free-throws]           int NOT NULL ,
 [opp-free-throws-attempted] int NOT NULL ,
 [opp-off-rebounds]          int NOT NULL ,
 [opp-total-rebounds]        int NOT NULL ,
 [opp-assists]               int NOT NULL ,
 [opp-steals]                int NOT NULL ,
 [opp-blocks]                int NOT NULL ,
 [opp-turnovers]             int NOT NULL ,
 [opp-fouls]                 int NOT NULL ,


 CONSTRAINT [PK_Game_2] PRIMARY KEY  ([game-ID] ASC),
 CONSTRAINT [FK_Game] FOREIGN KEY ([game-ID])  REFERENCES [Game]([game-ID])
);
GO



                                        -- **** Group 6


-- Orders

CREATE TABLE [Order]
(
 [order-ID]     int NOT NULL ,
 [member-ID]    int NOT NULL ,
 [order-time]   datetime NOT NULL ,
 [employee-ID]   int NOT NULL ,


 CONSTRAINT [PK_Order] PRIMARY KEY  ([order-ID] ASC),
 CONSTRAINT [FK_Member_3] FOREIGN KEY ([member-ID])  REFERENCES [Member]([member-ID]),
 CONSTRAINT [FK_Employee] FOREIGN KEY ([employee-ID])  REFERENCES [Employee]([employee-ID])
);
GO
-- Ticket

CREATE TABLE [Ticket]
(
 [ticket-ID]    int NOT NULL ,
 [order-ID]     int NOT NULL ,
 [seat-ID]      int NOT NULL ,
 [game-ID]      int NOT NULL ,
 [price]        decimal(10,2) NOT NULL ,

 CONSTRAINT [PK_ticket] PRIMARY KEY  ([ticket-ID] ASC),
 CONSTRAINT [FK_Order] FOREIGN KEY ([order-ID])  REFERENCES [Order]([order-ID]),
CONSTRAINT [FK_Game_3] FOREIGN KEY ([game-ID])  REFERENCES [Game]([game-ID]),
 CONSTRAINT [FK_Seat] FOREIGN KEY ([seat-ID])  REFERENCES [Stadium Seats]([seat-ID])
);
GO
-- Game Attendance

CREATE TABLE [Game Attendance]
(
 [attendance-ID]     int NOT NULL ,
 [ticket-ID]         int NOT NULL ,
 [employee-ID]        int NOT NULL ,


 CONSTRAINT [PK_Attendance] PRIMARY KEY  ([attendance-ID] ASC),
 CONSTRAINT [FK_Ticket] FOREIGN KEY ([ticket-ID])  REFERENCES [Ticket]([ticket-ID]),
 CONSTRAINT [FK_Employee2] FOREIGN KEY ([employee-ID])  REFERENCES [Employee]([employee-ID])
);
GO








