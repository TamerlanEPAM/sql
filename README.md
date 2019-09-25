# Task

Construct ER diagram and database for National Hockey League (NHL). 
Key entities:
- Team: name, city, coach, captain, players;
- Player: name, position (e.g.: goalie, forwards), skill level, injury records;
- Injury records: description;
- Game:  date, score, refer to host_team and guest_team;



#SQL Task
1. Develop a query to calculate the number of games, played by each player, the number of won games by this payer, number of games ended as a tie, the average number of injures per game for this player. All these information must be output in one single result set. Based on these query create a custom db view.
2. Create custom db function that will return the list of players with specific position. Function must accept position and separator character as input parameters and return a single string as a result.
3. Create custom LOGGING db table. The following corresponding columns must be
created:
a. Record insert date;
b. Referenced Table Name - Table Name where new record was inserted;
c. Description - The list of key-value pairs, separated by semicolon. Note: empty
values and their column names must be omitted.
Add required changes to your DB Schema to populate current table columns each
time when new record was inserted to any db table (in a scope of your schema).
4. Prepare a SQL statement to output total/available space within each tablespace.
5. Calculate “Used %” column value.
Prepare a SQL Statement to calculate each table size in your schema.
