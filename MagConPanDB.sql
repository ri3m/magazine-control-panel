create table Users(username nvarchar(50) NOT NULL PRIMARY KEY,password nvarchar(50) NOT NULL)
create table Issues(Issue_ID int IDENTITY(1,1) not null PRIMARY KEY, Issue nvarchar(50) not null UNIQUE, IssueNo int not null, IssueDate NVARCHAR(10) not null, Status nvarchar(50) not null)


create table Sections(Section_ID int IDENTITY(1,1) not null PRIMARY KEY,SectionName nvarchar(50) not null unique)

create table Pages( Page_ID int identity(1,1)PRIMARY KEY, PageTitle nvarchar(50) not null , PageContent ntext not null, PageNo int  not null)



create table Association( Association_ID int IDENTITY(1,1) not null PRIMARY KEY, Issue nvarchar(50) not null, SectionName nvarchar(50) not null, FPageNumNSec int not null, SectionNo int not null)

alter table Association add constraint FK_Association_Issuse foreign key (Issue) references Issues(Issue) ON DELETE CASCADE ON UPDATE CASCADE;

alter table Association add constraint FK_Association_Sections foreign key (SectionName) references Sections(SectionName) ON DELETE CASCADE ON UPDATE CASCADE;
insert into Users values ("admin", "123");

