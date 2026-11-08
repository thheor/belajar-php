-- ========================================================
-- MariaDB Music Database Dummy Data Script
-- ========================================================

DROP TABLE IF EXISTS playlist_songs;
DROP TABLE IF EXISTS playlists;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS users;

-- 1. Table: users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Table: artists
CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    bio TEXT,
    followers INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Table: albums
CREATE TABLE albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT NOT NULL,
    title VARCHAR(30) NOT NULL,
    release_date DATE NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Table: songs
CREATE TABLE songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    album_id INT NOT NULL,
    title VARCHAR(30) NOT NULL,
    duration TIME NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. Table: playlists
CREATE TABLE playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6. Table: playlist_songs
CREATE TABLE playlist_songs (
    playlist_song_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_id INT NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES songs(song_id) ON DELETE CASCADE,
    UNIQUE KEY uq_playlist_song (playlist_id, song_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ========================================================
-- INSERT DATA: users (20 users)
-- ========================================================
INSERT INTO users (user_id, username, email, password) VALUES
(1,  'Alfarian Fauzi',  'alfarianfauzi@email.com',  'Passw0rd!01'),
(2,  'Arya Pandu',      'aryapandu@email.com',      'Passw0rd!02'),
(3,  'Azhri Sae',       'azhrisae@email.com',       'Passw0rd!03'),
(4,  'Bella Khoirin',   'bellakhoirin@email.com',   'Passw0rd!04'),
(5,  'Billal Nafsy',    'billalnafsy@email.com',    'Passw0rd!05'),
(6,  'Damar Dwi',       'damardwi@email.com',       'Passw0rd!06'),
(7,  'Keisya Nisrina',  'keisyanisrina@email.com',  'Passw0rd!07'),
(8,  'Lidya Hardana',   'lidyahardana@email.com',   'Passw0rd!08'),
(9,  'Mario Andrew',    'marioandrew@email.com',    'Passw0rd!09'),
(10, 'Mudhofar Ali',    'mudhofarali@email.com',    'Passw0rd!10'),
(11, 'Muhammad Dzikri', 'mdzikri@email.com',        'Passw0rd!11'),
(12, 'Muhammad Haris',  'mharis@email.com',         'Passw0rd!12'),
(13, 'Muhammad Muflih', 'mmuflih@email.com',        'Passw0rd!13'),
(14, 'Nharyana Aufa',   'nharyanaaufa@email.com',   'Passw0rd!14'),
(15, 'Petra Antonio',   'petraantonio@email.com',   'Passw0rd!15'),
(16, 'Aditya Pratama',  'adityapratama@email.com',  'Passw0rd!16'),
(17, 'Citra Lestari',   'citralestari@email.com',   'Passw0rd!17'),
(18, 'Dimas Saputra',   'dimassaputra@email.com',   'Passw0rd!18'),
(19, 'Farhan Maulana',  'farhanmaulana@email.com',  'Passw0rd!19'),
(20, 'Gita Amalia',     'gitaamalia@email.com',     'Passw0rd!20');

-- ========================================================
-- INSERT DATA: artists (10 artists)
-- ========================================================
INSERT INTO artists (artist_id, name, bio, followers) VALUES
(1,  'Taylor Swift',    'American singer-songwriter across multiple genres.', 105400000),
(2,  'Kendrick Lamar',  'Pulitzer Prize-winning American rapper and songwriter.', 32100000),
(3,  'SZA',             'American R&B singer-songwriter known for soulful storytelling.', 22900000),
(4,  'Bruno Mars',      'Singer, songwriter, and multi-instrumentalist known for retro showmanship.', 56300000),
(5,  'Lorde',           'New Zealand singer-songwriter known for introspective alt-pop.', 11800000),
(6,  'The Weeknd',      'Canadian singer-songwriter shaping modern contemporary R&B and pop.', 89200000),
(7,  'Hindia',          'Indonesian singer-songwriter and vocalist of .Feast.', 4500000),
(8,  '.Feast',          'Indonesian indie rock band from Jakarta.', 2100000),
(9,  'Lomba Sihir',     'Indonesian alternative pop supergroup formed in Jakarta.', 1200000),
(10, 'ROSÉ',            'Korean-New Zealand singer and member of Blackpink.', 28700000);

-- ========================================================
-- INSERT DATA: albums (25 albums)
-- ========================================================
INSERT INTO albums (album_id, artist_id, title, release_date) VALUES
-- Taylor Swift (3)
(1,  1,  '1989',                          '2014-10-27'),
(2,  1,  'Folklore',                      '2020-07-24'),
(3,  1,  'Midnights',                     '2022-10-21'),
-- Kendrick Lamar (3)
(4,  2,  'good kid, m.A.A.d city',        '2012-10-22'),
(5,  2,  'To Pimp a Butterfly',           '2015-03-15'),
(6,  2,  'DAMN.',                         '2017-04-14'),
-- SZA (2)
(7,  3,  'Ctrl',                          '2017-06-09'),
(8,  3,  'SOS',                           '2022-12-09'),
-- Bruno Mars (3)
(9,  4,  'Doo-Wops & Hooligans',          '2010-10-04'),
(10, 4,  'Unorthodox Jukebox',            '2012-12-07'),
(11, 4,  '24K Magic',                     '2016-11-18'),
-- Lorde (3)
(12, 5,  'Pure Heroine',                  '2013-09-27'),
(13, 5,  'Melodrama',                     '2017-06-16'),
(14, 5,  'Solar Power',                   '2021-08-20'),
-- The Weeknd (3)
(15, 6,  'Beauty Behind the Madness',     '2015-08-28'),
(16, 6,  'Starboy',                       '2016-11-25'),
(17, 6,  'After Hours',                   '2020-03-20'),
-- Hindia (2)
(18, 7,  'Menari dengan Bayangan',        '2019-11-29'),
(19, 7,  'Lagipula Hidup Akan Berakhir',  '2023-07-07'),
-- .Feast (2)
(20, 8,  'Multiverses',                   '2017-09-19'),
(21, 8,  'Membangun & Menghancurkan',     '2024-08-30'),
-- Lomba Sihir (2)
(22, 9,  'Selamat Datang di Ujung Dunia', '2021-03-26'),
(23, 9,  'Obrolan Jam 3 Pagi',            '2024-11-15'),
-- ROSÉ (2)
(24, 10, '-R-',                           '2021-03-12'),
(25, 10, 'rosie',                         '2024-12-06');

-- ========================================================
-- INSERT DATA: songs (100 songs, 10 per artist)
-- ========================================================
INSERT INTO songs (song_id, album_id, title, duration) VALUES
-- Taylor Swift (1-10)
(1,   1,  'Blank Space',                 '00:03:51'),
(2,   1,  'Style',                       '00:03:51'),
(3,   1,  'Shake It Off',                '00:03:39'),
(4,   1,  'Bad Blood',                   '00:03:19'),
(5,   2,  'Cardigan',                    '00:03:59'),
(6,   2,  'Exile',                       '00:04:45'),
(7,   2,  'August',                      '00:04:21'),
(8,   3,  'Anti-Hero',                   '00:03:20'),
(9,   3,  'Lavender Haze',               '00:03:22'),
(10,  3,  'Karma',                       '00:03:24'),
-- Kendrick Lamar (11-20)
(11,  4,  'm.A.A.d city',                '00:05:50'),
(12,  4,  'Money Trees',                 '00:06:26'),
(13,  4,  'Swimming Pools (Drank)',      '00:05:13'),
(14,  4,  'Poetic Justice',              '00:05:00'),
(15,  5,  'King Kunta',                  '00:03:54'),
(16,  5,  'Alright',                     '00:03:39'),
(17,  5,  'The Blacker the Berry',       '00:05:28'),
(18,  6,  'DNA.',                        '00:03:05'),
(19,  6,  'HUMBLE.',                     '00:02:57'),
(20,  6,  'LOVE.',                       '00:03:33'),
-- SZA (21-30)
(21,  7,  'Supermodel',                  '00:03:01'),
(22,  7,  'Love Galore',                 '00:04:35'),
(23,  7,  'The Weekend',                 '00:04:32'),
(24,  7,  'Drew Barrymore',              '00:03:51'),
(25,  7,  'Broken Clocks',               '00:03:51'),
(26,  8,  'Kill Bill',                   '00:02:33'),
(27,  8,  'Seek & Destroy',              '00:03:23'),
(28,  8,  'Low',                         '00:03:01'),
(29,  8,  'Snooze',                      '00:03:21'),
(30,  8,  'Nobody Gets Me',              '00:03:00'),
-- Bruno Mars (31-40)
(31,  9,  'Grenade',                     '00:03:42'),
(32,  9,  'Just the Way You Are',        '00:03:40'),
(33,  9,  'The Lazy Song',               '00:03:15'),
(34,  9,  'Marry You',                   '00:03:50'),
(35,  10, 'Locked Out of Heaven',        '00:03:53'),
(36,  10, 'When I Was Your Man',         '00:03:33'),
(37,  10, 'Treasure',                    '00:02:58'),
(38,  11, '24K Magic',                   '00:03:46'),
(39,  11, 'That\'s What I Like',         '00:03:26'),
(40,  11, 'Versace on the Floor',        '00:04:21'),
-- Lorde (41-50)
(41,  12, 'Tennis Court',                '00:03:18'),
(42,  12, 'Royals',                      '00:03:10'),
(43,  12, 'Team',                        '00:03:13'),
(44,  12, 'Ribs',                        '00:04:18'),
(45,  13, 'Green Light',                 '00:03:54'),
(46,  13, 'Liability',                   '00:02:52'),
(47,  13, 'Supercut',                    '00:04:37'),
(48,  14, 'Solar Power',                 '00:03:12'),
(49,  14, 'Stoned at the Nail Salon',    '00:04:26'),
(50,  14, 'Mood Ring',                   '00:03:45'),
-- The Weeknd (51-60)
(51,  15, 'The Hills',                   '00:04:02'),
(52,  15, 'Can\'t Feel My Face',         '00:03:33'),
(53,  15, 'Earned It',                   '00:04:37'),
(54,  15, 'In the Night',                '00:03:55'),
(55,  16, 'Starboy',                     '00:03:50'),
(56,  16, 'Party Monster',               '00:04:09'),
(57,  16, 'I Feel It Coming',            '00:04:29'),
(58,  17, 'Blinding Lights',             '00:03:20'),
(59,  17, 'Save Your Tears',             '00:03:35'),
(60,  17, 'After Hours',                 '00:06:01'),
-- Hindia (61-70)
(61,  18, 'Evakuasi',                    '00:03:18'),
(62,  18, 'Secukupnya',                  '00:03:23'),
(63,  18, 'Jam Makan Siang',             '00:03:45'),
(64,  18, 'Dehidrasi',                   '00:03:40'),
(65,  18, 'Rumah Ke Rumah',              '00:04:22'),
(66,  19, 'Malaikat Berputar Di Atas',   '00:02:51'),
(67,  19, 'Janji Palsu',                 '00:03:48'),
(68,  19, 'Mata Air',                    '00:04:03'),
(69,  19, 'Perkara Tubuh',               '00:03:41'),
(70,  19, 'Cincin',                      '00:04:38'),
-- .Feast (71-80)
(71,  20, 'Sectumsempra',                '00:04:15'),
(72,  20, 'Fast Food Religion',          '00:03:44'),
(73,  20, 'Rima Ababil',                 '00:04:33'),
(74,  20, 'Wives of Gomorrah',           '00:04:47'),
(75,  20, 'Kelelawar',                   '00:03:58'),
(76,  21, 'Konsekuens',                  '00:03:22'),
(77,  21, 'Tarot',                       '00:03:46'),
(78,  21, 'Nina',                        '00:04:35'),
(79,  21, 'Politrik',                    '00:03:14'),
(80,  21, 'Arteri',                      '00:03:30'),
-- Lomba Sihir (81-90)
(81,  22, 'Hati dan Paru-Paru',          '00:04:05'),
(82,  22, 'Semua Orang Pernah Sakit',    '00:03:45'),
(83,  22, 'Apa Ada Asmara',              '00:03:35'),
(84,  22, 'Nirwana',                     '00:04:20'),
(85,  22, 'Serangga Pertapa',            '00:03:38'),
(86,  23, 'Menit Tambahan',              '00:03:55'),
(87,  23, 'Ribuan Memori',               '00:03:42'),
(88,  23, 'Pesona',                      '00:03:30'),
(89,  23, 'Selamanya Berdua',            '00:03:50'),
(90,  23, 'Tak Ada Waktu Santai',        '00:03:15'),
-- ROSÉ (91-100)
(91,  24, 'On The Ground',               '00:02:48'),
(92,  24, 'Gone',                        '00:03:27'),
(93,  24, 'Hard to Love',                '00:02:42'),
(94,  24, 'Eyes Closed',                 '00:03:12'),
(95,  24, 'Viva La Vida',                '00:03:10'),
(96,  25, 'APT.',                        '00:02:49'),
(97,  25, 'Number One Girl',             '00:03:35'),
(98,  25, 'Toxic Till the End',          '00:02:36'),
(99,  25, 'Drinks or Coffee',            '00:03:15'),
(100, 25, '3am',                         '00:02:40');

-- ========================================================
-- INSERT DATA: playlists (60 playlists, 1-5 per user)
-- ========================================================
INSERT INTO playlists (playlist_id, user_id, name, description) VALUES
-- User 1 (3)
(1,  1,  'Daily Focus',            'Tracks to help concentrate during study'),
(2,  1,  'Workout Hits',           'High energy pop and rock for exercise'),
(3,  1,  'Evening Chill',          'Calm acoustic and low-tempo tracks'),
-- User 2 (3)
(4,  2,  'Indie Vibes',            'Local indie gems and favorites'),
(5,  2,  'Road Trip',              'Sing-along anthems on the highway'),
(6,  2,  'Midnight Coding',        'Late night coding companion sounds'),
-- User 3 (4)
(7,  3,  'Morning Coffee',         'Gentle acoustic melodies to start the day'),
(8,  3,  'Gym Beast Mode',         'Heavy beats and rap motivation'),
(9,  3,  'Sunset Acoustics',       'Warm sunset chill acoustic playlist'),
(10, 3,  'R&B Soulful',            'Deep bass and emotional vocals'),
-- User 4 (2)
(11, 4,  'Pop Anthems',            'Chart-topping pop hits'),
(12, 4,  'Sentimental Nostalgia',  'Songs that bring back memories'),
-- User 5 (5)
(13, 5,  'Study Session',          'Quiet background music'),
(14, 5,  'Hip Hop Bangers',        'Top hip hop and rap tracks'),
(15, 5,  'Weekend Warmup',         'Getting hyped for the weekend'),
(16, 5,  'Rainy Day Melancholy',   'Moody indie songs for gray afternoons'),
(17, 5,  'Driving at 2 AM',        'Synthwave and midnight pop for empty streets'),
-- User 6 (1)
(18, 6,  'My All-Time Favs',       'Personal all-time top 100 tracks'),
-- User 7 (4)
(19, 7,  'Acoustic Mornings',      'Peaceful acoustic wake-up tunes'),
(20, 7,  'Indonesian Rock',        'Modern Indonesian indie and alt-rock'),
(21, 7,  'Deep Focus Flow',        'Instrumental and lo-fi vibes'),
(22, 7,  'Retro Revival',          '80s and 90s inspired sounds'),
-- User 8 (3)
(23, 8,  'Night Drives',           'Smooth synth beats for night drives'),
(24, 8,  'Party Starters',         'Upbeat dance and funk hits'),
(25, 8,  'Coffee Shop Ambient',    'Relaxed cafe atmosphere songs'),
-- User 9 (2)
(26, 9,  'Hype Tracks',            'Maximum energy tunes'),
(27, 9,  'Chillhop Sunday',        'Mellow beats for lazy Sundays'),
-- User 10 (4)
(28, 10, 'Lofi Beats',             'Soft beats to study and relax to'),
(29, 10, 'Indie Jakarta',          'Local Jakarta indie scene'),
(30, 10, 'Global Top Hits',        'Viral worldwide songs'),
(31, 10, 'Sleep Soundly',          'Soothing tunes for deep sleep'),
-- User 11 (3)
(32, 11, 'Rap Heavyweights',       'Masterclass lyricism and flows'),
(33, 11, 'Sunset Boulevard',       'Breezy evening pop'),
(34, 11, 'Cardio Run',             'High BPM tracks to keep pushing'),
-- User 12 (2)
(35, 12, 'Sunday Morning',         'Laid back acoustic vibes'),
(36, 12, 'Mood Booster',           'Instantly lifts your spirits'),
-- User 13 (5)
(37, 13, 'Overdrive Rock',         'Loud guitars and drum grooves'),
(38, 13, 'Alternative Wave',       'Indie alt-pop explorations'),
(39, 13, 'Electronic Energy',      'Pumping dance and electro'),
(40, 13, 'Deep Thoughts',          'Reflective lyrics and stories'),
(41, 13, 'Peaceful Evening',       'Wind down with mellow vocals'),
-- User 14 (1)
(42, 14, 'Daily Mix',              'Daily curated favorite tunes'),
-- User 15 (3)
(43, 15, 'Soulful Sunday',         'Warm soulful R&B classics'),
(44, 15, 'Energizer',              'Fuel for long work sessions'),
(45, 15, 'Acoustic Covers',        'Raw acoustic interpretations'),
-- User 16 (4)
(46, 16, 'Indie Essentials',       'Must-listen indie tracks'),
(47, 16, 'Late Night Talks',       'Songs for 3 AM conversations'),
(48, 16, 'Upbeat Funk',            'Groovy rhythm and brass'),
(49, 16, 'Melancholia',            'Quiet, emotional, heartfelt'),
-- User 17 (2)
(50, 17, 'Study Beats',            'Gentle rhythm for deep work'),
(51, 17, 'Weekend Vibes',          'Celebrating free time'),
-- User 18 (3)
(52, 18, 'Chillwave',              'Dreamy synths and vocals'),
(53, 18, 'Heavy Rotation',         'Most played songs this month'),
(54, 18, 'Nusantara Indie',        'Best contemporary Indonesian acts'),
-- User 19 (3)
(55, 19, 'Golden Hour',            'Sounds of the setting sun'),
(56, 19, 'Focus Zone',             'Zero distraction music'),
(57, 19, 'Party Anthems',          'Dancefloor favorites'),
-- User 20 (3)
(58, 20, 'Vocal Masterclass',      'Unforgettable vocal deliveries'),
(59, 20, 'Rainy Nights',           'Melodic piano and soft drums'),
(60, 20, 'Endless Summer',         'Warm sunny vacation tunes');

-- ========================================================
-- INSERT DATA: playlist_songs (600 rows, exactly 10 per playlist)
-- ========================================================
INSERT INTO playlist_songs (playlist_id, song_id) VALUES
-- Playlist 1
(1, 1), (1, 11), (1, 21), (1, 31), (1, 41), (1, 51), (1, 61), (1, 71), (1, 81), (1, 91),
-- Playlist 2
(2, 2), (2, 12), (2, 22), (2, 32), (2, 42), (2, 52), (2, 62), (2, 72), (2, 82), (2, 92),
-- Playlist 3
(3, 3), (3, 13), (3, 23), (3, 33), (3, 43), (3, 53), (3, 63), (3, 73), (3, 83), (3, 93),
-- Playlist 4
(4, 4), (4, 14), (4, 24), (4, 34), (4, 44), (4, 54), (4, 64), (4, 74), (4, 84), (4, 94),
-- Playlist 5
(5, 5), (5, 15), (5, 25), (5, 35), (5, 45), (5, 55), (5, 65), (5, 75), (5, 85), (5, 95),
-- Playlist 6
(6, 6), (6, 16), (6, 26), (6, 36), (6, 46), (6, 56), (6, 66), (6, 76), (6, 86), (6, 96),
-- Playlist 7
(7, 7), (7, 17), (7, 27), (7, 37), (7, 47), (7, 57), (7, 67), (7, 77), (7, 87), (7, 97),
-- Playlist 8
(8, 8), (8, 18), (8, 28), (8, 38), (8, 48), (8, 58), (8, 68), (8, 78), (8, 88), (8, 98),
-- Playlist 9
(9, 9), (9, 19), (9, 29), (9, 39), (9, 49), (9, 59), (9, 69), (9, 79), (9, 89), (9, 99),
-- Playlist 10
(10, 10), (10, 20), (10, 30), (10, 40), (10, 50), (10, 60), (10, 70), (10, 80), (10, 90), (10, 100),
-- Playlist 11
(11, 1), (11, 2), (11, 15), (11, 16), (11, 35), (11, 36), (11, 55), (11, 56), (11, 75), (11, 76),
-- Playlist 12
(12, 3), (12, 4), (12, 17), (12, 18), (12, 37), (12, 38), (12, 57), (12, 58), (12, 77), (12, 78),
-- Playlist 13
(13, 5), (13, 6), (13, 19), (13, 20), (13, 39), (13, 40), (13, 59), (13, 60), (13, 79), (13, 80),
-- Playlist 14
(14, 7), (14, 8), (14, 21), (14, 22), (14, 41), (14, 42), (14, 61), (14, 62), (14, 81), (14, 82),
-- Playlist 15
(15, 9), (15, 10), (15, 23), (15, 24), (15, 43), (15, 44), (15, 63), (15, 64), (15, 83), (15, 84),
-- Playlist 16
(16, 11), (16, 12), (16, 25), (16, 26), (16, 45), (16, 46), (16, 65), (16, 66), (16, 85), (16, 86),
-- Playlist 17
(17, 13), (17, 14), (17, 27), (17, 28), (17, 47), (17, 48), (17, 67), (17, 68), (17, 87), (17, 88),
-- Playlist 18
(18, 1), (18, 12), (18, 23), (18, 34), (18, 45), (18, 56), (18, 67), (18, 78), (18, 89), (18, 100),
-- Playlist 19
(19, 2), (19, 13), (19, 24), (19, 35), (19, 46), (19, 57), (19, 68), (19, 79), (19, 90), (19, 91),
-- Playlist 20
(20, 61), (20, 62), (20, 63), (20, 64), (20, 65), (20, 71), (20, 72), (20, 73), (20, 74), (20, 75),
-- Playlist 21
(21, 5), (21, 6), (21, 7), (21, 23), (21, 24), (21, 46), (21, 47), (21, 62), (21, 84), (21, 92),
-- Playlist 22
(22, 1), (22, 2), (22, 38), (22, 39), (22, 55), (22, 58), (22, 60), (22, 77), (22, 88), (22, 96),
-- Playlist 23
(23, 51), (23, 52), (23, 55), (23, 58), (23, 60), (23, 76), (23, 80), (23, 86), (23, 87), (23, 97),
-- Playlist 24
(24, 3), (24, 10), (24, 31), (24, 38), (24, 39), (24, 42), (24, 55), (24, 78), (24, 88), (24, 96),
-- Playlist 25
(25, 5), (25, 7), (25, 21), (25, 29), (25, 41), (25, 49), (25, 61), (25, 65), (25, 81), (25, 93),
-- Playlist 26
(26, 11), (26, 15), (26, 18), (26, 19), (26, 38), (26, 51), (26, 71), (26, 73), (26, 76), (26, 79),
-- Playlist 27
(27, 21), (27, 22), (27, 25), (27, 27), (27, 29), (27, 44), (27, 48), (27, 63), (27, 85), (27, 94),
-- Playlist 28
(28, 6), (28, 9), (28, 23), (28, 28), (28, 47), (28, 50), (28, 64), (28, 83), (28, 95), (28, 99),
-- Playlist 29
(29, 61), (29, 65), (29, 67), (29, 70), (29, 71), (29, 75), (29, 78), (29, 81), (29, 84), (29, 87),
-- Playlist 30
(30, 1), (30, 8), (30, 19), (30, 26), (30, 32), (30, 42), (30, 58), (30, 62), (30, 78), (30, 96),
-- Playlist 31
(31, 5), (31, 7), (31, 24), (31, 30), (31, 46), (31, 49), (31, 62), (31, 69), (31, 92), (31, 100),
-- Playlist 32
(32, 11), (32, 12), (32, 13), (32, 14), (32, 15), (32, 16), (32, 17), (32, 18), (32, 19), (32, 20),
-- Playlist 33
(33, 2), (33, 4), (33, 8), (33, 35), (33, 37), (33, 45), (33, 57), (33, 83), (33, 89), (33, 91),
-- Playlist 34
(34, 3), (34, 18), (34, 31), (34, 38), (34, 45), (34, 52), (34, 55), (34, 76), (34, 88), (34, 96),
-- Playlist 35
(35, 5), (35, 9), (35, 21), (35, 29), (35, 33), (35, 48), (35, 65), (35, 81), (35, 84), (35, 93),
-- Playlist 36
(36, 1), (36, 3), (36, 8), (36, 10), (36, 32), (36, 37), (36, 39), (36, 45), (36, 57), (36, 96),
-- Playlist 37
(37, 71), (37, 72), (37, 73), (37, 74), (37, 75), (37, 76), (37, 77), (37, 78), (37, 79), (37, 80),
-- Playlist 38
(38, 41), (38, 43), (38, 45), (38, 47), (38, 81), (38, 82), (38, 84), (38, 86), (38, 88), (38, 90),
-- Playlist 39
(39, 4), (39, 10), (39, 45), (39, 47), (39, 55), (39, 56), (39, 57), (39, 58), (39, 76), (39, 96),
-- Playlist 40
(40, 6), (40, 7), (40, 16), (40, 20), (40, 44), (40, 46), (40, 62), (40, 65), (40, 78), (40, 92),
-- Playlist 41
(41, 7), (41, 8), (41, 23), (41, 25), (41, 30), (41, 49), (41, 50), (41, 69), (41, 87), (41, 98),
-- Playlist 42
(42, 2), (42, 12), (42, 22), (42, 32), (42, 42), (42, 52), (42, 62), (42, 72), (42, 82), (42, 92),
-- Playlist 43
(43, 21), (43, 22), (43, 23), (43, 24), (43, 25), (43, 26), (43, 27), (43, 28), (43, 29), (43, 30),
-- Playlist 44
(44, 3), (44, 15), (44, 19), (44, 38), (44, 51), (44, 55), (44, 58), (44, 76), (44, 79), (44, 96),
-- Playlist 45
(45, 5), (45, 6), (45, 7), (45, 24), (45, 44), (45, 46), (45, 65), (45, 82), (45, 91), (45, 92),
-- Playlist 46
(46, 41), (46, 42), (46, 43), (46, 62), (46, 65), (46, 78), (46, 81), (46, 82), (46, 83), (46, 86),
-- Playlist 47
(47, 86), (47, 87), (47, 88), (47, 89), (47, 90), (47, 61), (47, 62), (47, 63), (47, 64), (47, 65),
-- Playlist 48
(48, 31), (48, 32), (48, 33), (48, 34), (48, 35), (48, 36), (48, 37), (48, 38), (48, 39), (48, 40),
-- Playlist 49
(49, 6), (49, 16), (49, 26), (49, 36), (49, 46), (49, 56), (49, 66), (49, 76), (49, 86), (49, 96),
-- Playlist 50
(50, 8), (50, 14), (50, 28), (50, 36), (50, 48), (50, 57), (50, 68), (50, 77), (50, 85), (50, 99),
-- Playlist 51
(51, 1), (51, 10), (51, 33), (51, 37), (51, 39), (51, 45), (51, 58), (51, 67), (51, 78), (51, 96),
-- Playlist 52
(52, 9), (52, 23), (52, 27), (52, 47), (52, 50), (52, 59), (52, 60), (52, 80), (52, 87), (52, 97),
-- Playlist 53
(53, 1), (53, 8), (53, 12), (53, 19), (53, 26), (53, 38), (53, 58), (53, 62), (53, 78), (53, 96),
-- Playlist 54
(54, 61), (54, 63), (54, 65), (54, 68), (54, 71), (54, 76), (54, 78), (54, 81), (54, 84), (54, 89),
-- Playlist 55
(55, 2), (55, 7), (55, 22), (55, 37), (55, 48), (55, 57), (55, 65), (55, 83), (55, 91), (55, 97),
-- Playlist 56
(56, 5), (56, 17), (56, 25), (56, 35), (56, 44), (56, 53), (56, 64), (56, 74), (56, 85), (56, 94),
-- Playlist 57
(57, 1), (57, 3), (57, 15), (57, 38), (57, 39), (57, 52), (57, 55), (57, 58), (57, 78), (57, 96),
-- Playlist 58
(58, 6), (58, 12), (58, 22), (58, 30), (58, 32), (58, 36), (58, 42), (58, 51), (58, 92), (58, 97),
-- Playlist 59
(59, 5), (59, 14), (59, 24), (59, 36), (59, 44), (59, 53), (59, 62), (59, 82), (59, 93), (59, 98),
-- Playlist 60
(60, 2), (60, 9), (60, 32), (60, 37), (60, 48), (60, 50), (60, 57), (60, 88), (60, 91), (60, 96);