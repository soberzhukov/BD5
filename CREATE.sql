create table if not exists music_group (
	id serial primary key,
	name varchar(50) not null
);

create table if not exists genre (
	id serial primary key,
	name varchar(40) not null unique
);

create table if not exists genre_group (
	genre_id integer not null references genre(id),
	group_id integer not null references music_group(id),
	constraint gg primary key (genre_id, group_id)
);

create table if not exists album (
	id serial primary key,
	name varchar(50) not null unique,
	date date null
);

create table if not exists group_album (
	group_id integer not null references music_group(id),
	album_id integer not null references album(id),
	constraint ga primary key (group_id, album_id)
);

create table if not exists track (
	id serial primary key,
	name varchar(40) not null,
	duration integer not null,
	albom_id integer references album(id)
);


create table if not exists collection (
	id serial primary key,
	name varchar(50) not null,
	date date null
);

create table if not exists collection_track (
	collection_id integer not null references collection(id),
	track_id integer not null references track(id),
	constraint ct primary key (collection_id, track_id)
);