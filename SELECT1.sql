SELECT genre.name, COUNT(music_group.name) FROM music_group
JOIN genre_group ON music_group.id = genre_group.group_id
JOIN genre ON genre_group.genre_id = genre.id
GROUP BY genre.name;

SELECT date, COUNT(track.name) FROM track
JOIN album ON track.albom_id = album.id
WHERE date between '2019-01-01' and '2020-12-31'
GROUP BY date;

SELECT album.name, round(AVG(duration),2) FROM track
JOIN album ON track.albom_id = album.id
GROUP BY album.name;

SELECT music_group.name, album.date FROM music_group
JOIN group_album ON music_group.id = group_album.group_id
JOIN album ON group_album.album_id = album.id
WHERE album.date not between '2020-01-01' and '2020-12-31';

SELECT c.name FROM collection c
JOIN collection_track ct ON c.id = ct.collection_id
JOIN track ON ct.track_id = track.id
JOIN album ON track.albom_id = album.id
JOIN group_album ON album.id = group_album.album_id
JOIN music_group ON group_album.group_id = music_group.id
WHERE music_group.name = 'rammstein';

SELECT album.name FROM album
JOIN group_album ON album.id = group_album.album_id
JOIN music_group ON group_album.group_id = music_group.id
JOIN genre_group ON music_group.id = genre_group.group_id
WHERE genre_group.genre_id IN (SELECT COUNT(genre_group.genre_id) FROM genre_group
GROUP BY group_id HAVING COUNT(genre_group.genre_id) >= 2);

SELECT track.name FROM track
WHERE track.id NOT IN (SELECT track_id FROM collection_track)

SELECT music_group.name FROM music_group
JOIN group_album ON music_group.id = group_album.group_id
JOIN album ON group_album.album_id = album.id
JOIN track ON album.id = track.albom_id
WHERE track.duration in (SELECT MIN(track.duration) FROM track)