# foodora-test

## 1 - Scenario

Imagine that you work in a delivering food company. When a restaurant is added to your backend system, one of the input informations you need to set is the regular opening hours for this restaurant in a week. For example, restaurant FooBar is opened from 19:00 to 22:00 from Tuesday to Friday, from 11:00 to 14:00 and 19:00 to 23:59:59 on Saturday and 24-hours opened on sundays. On Monday it is closed.

Also, imagine that a new feature was launched and this feature is called SpecialDays. This feature allows the restaurants to be opened or closed in special days such as Christmas. If a special day is created, the regular day has no effect for that day.

So imagine that the Restaurant FooBar has to be closed on Dec 24th, Dec 25th and opened from from 19:00 to 22:00 on Dec 26th and Dec 27th of 2015 and you are a week from those dates right now.

### - Database model

![alt tag](https://www.dropbox.com/s/c8r0e41zjxwtnnu/db.png?raw=1)

Below a snapshot of the restaurant FooBar rows.

INSERT  INTO `vendor`(`id`,`name`) VALUES (1,'FooBar');

INSERT  INTO `vendor_schedule` VALUES (1,1,2,0,'19:00:00','22:00:00');

INSERT  INTO `vendor_schedule` VALUES (2,1,3,0,'19:00:00','22:00:00');

INSERT  INTO `vendor_schedule` VALUES (3,1,4,0,'19:00:00','22:00:00');

INSERT  INTO `vendor_schedule` VALUES (4,1,5,0,'19:00:00','22:00:00');

INSERT  INTO `vendor_schedule` VALUES (5,1,6,0,'11:00:00','14:00:00');

INSERT  INTO `vendor_schedule` VALUES (6,1,6,0,'19:00:00','23:59:59');

INSERT  INTO `vendor_schedule` VALUES (7,1,7,1,NULL,NULL);

INSERT  INTO `vendor_special_day` VALUES (1,1,'2015-12-24','closed',1,NULL,NULL);

INSERT  INTO `vendor_special_day` VALUES (2,1,'2015-12-25','closed',1,NULL,NULL);

INSERT  INTO `vendor_special_day` VALUES (3,1,'2015-12-26','opened',0,'19:00:00','22:00:00');

INSERT  INTO `vendor_special_day` VALUES (4,1,'2015-12-27','opened',0,'19:00:00','22:00:00');

## Problem description

Imagine that a bug was reported to the team on Dec 17th and you have 5678 restaurants in the database and all of them added special days for the week from Dec 21th, 2015 to Dec 27th, 2015.

So your boss ordered to you to run a script on Dec 20th at 23:00 to fix the problem (update all regular days with special days) and another one Dec 28th 01:00 to restore everything again to the normal state.

## Some considerations

- This is a PHP command line test with a OOP design solution behind. 
- Weekday: 1-Monday, 2-Tuesday, ..., 7-Sunday.
- The team did a rollback in the software. So the current version doesn't know anything about the SpecialDays feature.
- The solution in this case is to use temporarily the regular days (vendor_schedule) as the SpecialDays in this week (Dec 21-27) and after that restore the database and feature.
- Assume that the team is fixing the feature during this week and on Monday 28th everything will be normal.
- Nobody will create/update special dates and schedules from Dec 21st and Dec 27th.
- Please, create a repository with your github account named 'foodora-test' and send it for us when you finish your solution.
- Please, use a OOP design/approach as best as you can to implement both scripts. Remember to be simple and have a S.O.L.I.D approach.
- We will evaluate 4 things. If your solution is right, your OOP design approach for the solution, your code standards (PSR standards) and the documentation (we will run your solution).
- Do not use any framework. Pure PHP/OOP please.
- Pay attention to the scenario. Make sure you understand all database fields. Think about all possible possibilities. Your solution must cover all of them.
- You can find a dump of the database [here](https://gist.github.com/leandrolages/e0423a2c56ab32c4e691#file-foodora-test-dump-sql).

## Fixing implementation

- This application run on both CLI [PHP command line] and from web URL too. Made with clean OOPS concept and SOLID.
- It process too fast. PSR compatible code. [ I will optimize this code later again when get little time :) ]
- Install process: keep this application main folder foodora-test into your document root or where you want to run.
- Run the db sql script in above section.
- go to database.php and fill your DB connection related information.
- Give permission on folder and user of DB which use to run this application.
- CLI: [from the application directory]  php index.php for20dec [ For fix which need to run at 20th Dec 23:00 ].
- CLI: [from the application directory]  php index.php for28dec [ For fix which need to run at 28th Dec 01:00 ].
- Web URL [from the application directory] index.php?fix=for20dec [ For fix which need to run at 20th Dec 23:00 ].
- Web URL [from the application directory] index.php?fix=for28dec [ For fix which need to run at 28th Dec 01:00 ].
- you will get small display messages. Also you should check your database tables to see the affects.

