CREATE TABLE FIFA.dbo.league ( 
	league_id            int    IDENTITY  NOT NULL,
	league_name          varchar(100)      NULL,
	league_level         int      NULL,
	CONSTRAINT pk_league PRIMARY KEY  ( league_id ) ,
	CONSTRAINT unq_league UNIQUE ( league_name ) 
 );
GO

CREATE TABLE FIFA.dbo.nationality ( 
	nationality_id       int      NOT NULL,
	nationality_name     varchar(50)      NULL,
	CONSTRAINT pk_nationality PRIMARY KEY  ( nationality_id ) 
 );
GO

CREATE TABLE FIFA.dbo.player ( 
	sofifa_id            int      NOT NULL,
	player_url           varchar(150)      NULL,
	short_name           varchar(100)      NULL,
	long_name            varchar(100)      NULL,
	date_of_birth        date      NULL,
	nationality_id       int      NULL,
	CONSTRAINT pk_player_0 PRIMARY KEY  ( sofifa_id ) 
 );
GO

CREATE TABLE FIFA.dbo.club ( 
	club_team_id         int      NOT NULL,
	club_name            varchar(100)      NULL,
	league_id            int      NULL,
	CONSTRAINT pk_club PRIMARY KEY  ( club_team_id ) 
 );
GO

CREATE TABLE FIFA.dbo.player_info_stats ( 
	id                   int    IDENTITY  NOT NULL,
	year                 int      NULL,
	sofifa_id            int      NOT NULL,
	player_positions     varchar(30)      NULL,
	overall              int      NULL,
	potential            int      NULL,
	value_eur            money      NULL,
	wage_eur             money      NULL,
	age                  int      NULL,
	height_cm            int      NULL,
	weight_kg            int      NULL,
	club_team_id         int      NULL,
	club_position        char(4)      NULL,
	club_jersey_number   int      NULL,
	club_id_loaned_from  int      NULL,
	club_joined          date      NULL,
	club_contract_valid_until int      NULL,
	nation_position      char(4)      NULL,
	nation_jersey_number int      NULL,
	prefered_foot        varchar(20)      NULL,
	weak_foot            int      NULL,
	skill_moves          int      NULL,
	international_reputation int      NULL,
	work_rate            varchar(50)      NULL,
	body_type            varchar(30)      NULL,
	real_face            bit      NULL,
	release_clause_eur   money      NULL,
	player_tags          varchar(120)      NULL,
	player_traits        varchar(150)      NULL,
	pace                 int      NULL,
	shooting             int      NULL,
	passing              int      NULL,
	dribbling            int      NULL,
	defending            int      NULL,
	physic               int      NULL,
	attacking_crossing   int      NULL,
	attacking_finishing  int      NULL,
	attacking_heading_accuracy int      NULL,
	attacking_short_passing int      NULL,
	attacking_volleys    int      NULL,
	skill_dribbling      int      NULL,
	skill_curve          int      NULL,
	skill_fk_accuracy    int      NULL,
	skill_long_passing   int      NULL,
	skill_ball_control   int      NULL,
	movement_acceleration int      NULL,
	movement_sprint_speed int      NULL,
	movement_agility     int      NULL,
	movement_reactions   int      NULL,
	movement_balance     int      NULL,
	power_shot_power     int      NULL,
	power_jumping        int      NULL,
	power_stamina        int      NULL,
	power_strength       int      NULL,
	power_long_shots     int      NULL,
	mentality_aggression int      NULL,
	mentality_interceptions int      NULL,
	mentality_positioning int      NULL,
	mentality_vision     int      NULL,
	mentality_penalties  int      NULL,
	mentality_composure  int      NULL,
	defending_marking_awareness int      NULL,
	defending_standing_tackle int      NULL,
	defending_sliding_tackle int      NULL,
	goalkeeping_diving   int      NULL,
	goalkeeping_handling int      NULL,
	goalkeeping_kicking  int      NULL,
	goalkeeping_positioning int      NULL,
	goalkeeping_reflexes int      NULL,
	goalkeeping_speed    int      NULL,
	ls                   varchar(10)      NULL,
	st                   varchar(10)      NULL,
	rs                   varchar(10)      NULL,
	lw                   varchar(10)      NULL,
	lf                   varchar(10)      NULL,
	cf                   varchar(10)      NULL,
	rf                   varchar(10)      NULL,
	rw                   varchar(10)      NULL,
	lam                  varchar(10)      NULL,
	cam                  varchar(10)      NULL,
	ram                  varchar(10)      NULL,
	lm                   varchar(10)      NULL,
	lcm                  varchar(10)      NULL,
	cm                   varchar(10)      NULL,
	rcm                  varchar(10)      NULL,
	rm                   varchar(10)      NULL,
	lwb                  varchar(10)      NULL,
	ldm                  varchar(10)      NULL,
	cdm                  varchar(10)      NULL,
	rdm                  varchar(10)      NULL,
	rwb                  varchar(10)      NULL,
	lb                   varchar(10)      NULL,
	lcb                  varchar(10)      NULL,
	cb                   varchar(10)      NULL,
	rcb                  varchar(10)      NULL,
	rb                   varchar(10)      NULL,
	gk                   varchar(10)      NULL,
	CONSTRAINT pk_player_info_stats PRIMARY KEY  ( id ) 
 );
GO

ALTER TABLE FIFA.dbo.club ADD CONSTRAINT fk_club_league FOREIGN KEY ( league_id ) REFERENCES FIFA.dbo.league( league_id );
GO

ALTER TABLE FIFA.dbo.player ADD CONSTRAINT fk_player_nationality FOREIGN KEY ( nationality_id ) REFERENCES FIFA.dbo.nationality( nationality_id );
GO

ALTER TABLE FIFA.dbo.player_info_stats ADD CONSTRAINT fk_player_info_stats_club FOREIGN KEY ( club_team_id ) REFERENCES FIFA.dbo.club( club_team_id );
GO

ALTER TABLE FIFA.dbo.player_info_stats ADD CONSTRAINT fk_player_info_stats_club_loan FOREIGN KEY ( club_id_loaned_from ) REFERENCES FIFA.dbo.club( club_team_id );
GO

ALTER TABLE FIFA.dbo.player_info_stats ADD CONSTRAINT fk_player_info_stats_player FOREIGN KEY ( sofifa_id ) REFERENCES FIFA.dbo.player( sofifa_id );
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'league name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'league', @level2type=N'COLUMN',@level2name=N'league_name';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'league rank of the club (e.g. English Premier League is 1, English League Championship is 2, etc.)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'league', @level2type=N'COLUMN',@level2name=N'league_level';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player nationality' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'nationality', @level2type=N'COLUMN',@level2name=N'nationality_name';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'club name id where the player plays' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'club', @level2type=N'COLUMN',@level2name=N'club_team_id';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'league name of the club' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'club', @level2type=N'COLUMN',@level2name=N'club_name';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'unique player ID on sofifa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'sofifa_id';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player preferred positions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'player_positions';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player current overall attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'overall';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player potential overall attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'potential';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player value (in EUR)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'value_eur';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player weekly wage (in EUR)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'wage_eur';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player weight (in kg)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'weight_kg';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player position in the club (e.g. SUB means substitute, RES means reserve)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'club_position';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player jersey number in the club' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'club_jersey_number';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'club loaning out the player - if applicable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'club_id_loaned_from';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'date when the player joined his current club' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'club_joined';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player position in the national team' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'nation_position';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player jersey number in the national team' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'nation_jersey_number';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player preferred foot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'prefered_foot';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player weak foot attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'weak_foot';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player international reputation attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'international_reputation';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player work rate attributes (attacking / defensive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'work_rate';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player body type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'body_type';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player real face' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'real_face';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player release clause (in EUR) - if applicable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'release_clause_eur';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player pace attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'pace';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player shooting attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'shooting';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player passing attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'passing';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player dribbling attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'dribbling';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player defending attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'defending';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player crossing attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'attacking_crossing';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player finishing attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'attacking_finishing';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player heading accuracy attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'attacking_heading_accuracy';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player short passing attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'attacking_short_passing';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player volleys attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'attacking_volleys';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player dribbling attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'skill_dribbling';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player curve attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'skill_curve';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player free-kick accuracy attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'skill_fk_accuracy';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player long passing attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'skill_long_passing';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player ball control attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'skill_ball_control';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player acceleration attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'movement_acceleration';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player agility attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'movement_sprint_speed';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player agility attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'movement_agility';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player reactions attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'movement_reactions';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player balance attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'movement_balance';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player shot power attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'power_shot_power';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player jumbing attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'power_jumping';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player stamina attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'power_stamina';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player strength attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'power_strength';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player long shots attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'power_long_shots';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player aggression attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'mentality_aggression';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player interceptions attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'mentality_interceptions';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player positioning attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'mentality_positioning';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player vision attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'mentality_vision';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player penalties attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'mentality_penalties';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player composure attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'mentality_composure';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player marking awareness attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'defending_marking_awareness';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player standing tackle attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'defending_standing_tackle';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player sliding tackle attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'defending_sliding_tackle';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player GK diving attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'goalkeeping_diving';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player GK handling attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'goalkeeping_handling';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player GK kicking attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'goalkeeping_kicking';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player GK positioning attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'goalkeeping_positioning';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player GK reflexes attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'goalkeeping_reflexes';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player GK speed attribute' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'goalkeeping_speed';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as LS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'ls';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as ST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'st';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as RS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'rs';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as LW' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'lw';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as LF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'lf';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as CF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'cf';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as RF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'rf';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as RW' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'rw';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as LAM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'lam';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as CAM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'cam';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as ram' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'ram';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as LM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'lm';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as LCM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'lcm';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as CM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'cm';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as RCM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'rcm';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as RM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'rm';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as LWB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'lwb';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as LDM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'ldm';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as CDM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'cdm';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as RDM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'rdm';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as RWB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'rwb';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as LB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'lb';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as LCB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'lcb';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as CB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'cb';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as RCB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'rcb';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as RB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'rb';
GO

exec [FIFA].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'player attribute playing as GK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'player_info_stats', @level2type=N'COLUMN',@level2name=N'gk';
GO

