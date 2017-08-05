-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- create database:
CREATE DATABASE tournament;

-- connect with it..
\c tournament

-- create table for players:
CREATE TABLE players (
    player_id SERIAL primary key,
    player_name TEXT
);

-- create table for matches:
CREATE TABLE matches (
    match_serial SERIAL primary key,
    winner INTEGER REFERENCES players(player_id) ON DELETE CASCADE,
    loser INTEGER REFERENCES players(player_id) ON DELETE CASCADE
);


-- create view to count winners
CREATE VIEW winners_count AS
SELECT players.player_id As player, players.player_name, COUNT(matches.winner) AS total_wins
FROM players LEFT JOIN matches
ON players.player_id = matches.winner
GROUP BY players.player_id;

-- create view to count matches
CREATE VIEW matches_count AS
SELECT players.player_id AS player, players.player_name, COUNT(matches) AS total_matches
FROM players LEFT JOIN matches
ON players.player_id = matches.winner
OR players.player_id = matches.loser
GROUP BY players.player_id;

-- create view for standings
CREATE VIEW standings AS
SELECT players.player_id, players.player_name, winners_count.total_wins, matches_count.total_matches
FROM players LEFT JOIN winners_count 
ON players.player_id = ( winners_count.player
LEFT JOIN matches_count ON players.player_id = matches_count.player )
GROUP BY players.player_id;
