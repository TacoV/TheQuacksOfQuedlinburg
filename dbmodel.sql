
-- ------
-- BGA framework: © Gregory Isabelli <gisabelli@boardgamearena.com> & Emmanuel Colin <ecolin@boardgamearena.com>
-- TheQuacksOfQuedlinburg implementation : © <Your name here> <Your email address here>
-- 
-- This code has been produced on the BGA studio platform for use on http://boardgamearena.com.
-- See http://en.boardgamearena.com/#!doc/Studio for more information.
-- -----

-- dbmodel.sql

-- This is the file where you are describing the database schema of your game
-- Basically, you just have to export from PhpMyAdmin your table structure and copy/paste
-- this export here.
-- Note that the database itself and the standard tables ("global", "stats", "gamelog" and "player") are
-- already created and must not be created here

-- Note: The database schema is created from this file when the game starts. If you modify this file,
--       you have to restart a game to see your changes in database.

-- Example 1: create a standard "card" table to be used with the "Deck" tools (see example game "hearts"):

-- CREATE TABLE IF NOT EXISTS `card` (
--   `card_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `card_type` varchar(16) NOT NULL,
--   `card_type_arg` int(11) NOT NULL,
--   `card_location` varchar(16) NOT NULL,
--   `card_location_arg` int(11) NOT NULL,
--   PRIMARY KEY (`card_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- Example 2: add a custom field to the standard "player" table
-- ALTER TABLE `player` ADD `player_my_custom_field` INT UNSIGNED NOT NULL DEFAULT '0';

alter table player
	add flask_active smallint not null default 1,
	add kettle_exploded smallint not null default 0,
	add points int not null default 0,
	add droplet_pos int not null default 0,
	add rubies int not null default 0
	;

create table if not exists fortuneteller_card (
	card_id int unsigned not null auto_increment,	-- primary key
	card_name varchar(50) not null,					-- The name of the card, we'll build our logic around this
	card_type_arg int(11) not null,					-- Always 0
	card_location varchar(50) not null,				-- Either deck, table or discard
	card_location_arg int(11) not null,				-- Always 0
	primary key (card_id)
);

create table if not exists chip (
	chip_id int unsigned not null auto_increment,
	chip_color varchar(20) not null,
	chip_value smallint not null,
	chip_location varchar(20) not null,
	chip_location_arg int(11) not null,
	primary key (chip_id)
);