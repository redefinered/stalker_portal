--
SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `video`(
    `id` int NOT NULL auto_increment,
    `owner` varchar(64) NOT NULL default '',
    `name` varchar(255) NOT NULL default '',
    `old_name` varchar(255) NOT NULL default '',
    `o_name` varchar(255) NOT NULL default '',
    `fname` varchar(128) NOT NULL default '',
    `description` text,
    `pic` varchar(128) NOT NULL default '',
    `cost` int NOT NULL default 0,
    `time` varchar(64) NOT NULL default '',
    `file` varchar(128) NOT NULL default '',
    `path` varchar(255) NOT NULL default '',
    `protocol` varchar(64) NOT NULL default 'nfs',
    `rtsp_url` varchar(255) NOT NULL default '',
    `censored` tinyint default 0, /* 0-off, 1-on */
    `hd` tinyint default 0,
    `series` text,
    `volume_correction` int NOT NULL default 0,
    `category_id` int NOT NULL default 0,
    `genre_id` int NOT NULL default 0,
    `genre_id_1` int NOT NULL default 0,
    `genre_id_2` int NOT NULL default 0,
    `genre_id_3` int NOT NULL default 0,
    `genre_id_4` int NOT NULL default 0,
    `cat_genre_id_1` int NOT NULL default 0,
    `cat_genre_id_2` int NOT NULL default 0,
    `cat_genre_id_3` int NOT NULL default 0,
    `cat_genre_id_4` int NOT NULL default 0,
    `director` varchar(128) NOT NULL default '',
    `actors` varchar(255) NOT NULL default '',
    `year` varchar(128) NOT NULL default '',
    `accessed` tinyint default 0, /* 0-off, 1-on */
    `status` tinyint default 0, /* 0-red, 1-green */
    `disable_for_hd_devices` tinyint default 0,
    `added` datetime,
    `count` int  NOT NULL default 0,
    `count_first_0_5` int  NOT NULL default 0,
    `count_second_0_5` int  NOT NULL default 0,
    `vote_sound_good` int NOT NULL default 0,
    `vote_sound_bad` int NOT NULL default 0,
    `vote_video_good` int NOT NULL default 0,
    `vote_video_bad` int NOT NULL default 0,
    `rate` text,
    `last_rate_update` date,
    `last_played` date,
    PRIMARY KEY (`id`),
    KEY `path` (`path`),
    KEY `genre_id` (`genre_id`),
    KEY `genre_id_1` (`genre_id_1`),
    KEY `genre_id_2` (`genre_id_2`),
    KEY `genre_id_3` (`genre_id_3`),
    KEY `genre_id_4` (`genre_id_4`),
    KEY `status` (`status`),
    KEY `accessed` (`accessed`),
    KEY `hd` (`hd`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `genre`(
    `id` int NOT NULL auto_increment,
    `title` varchar(128) NOT NULL default '',
    `category_id` int(11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `genre` VALUES (1,'Action',0),(2,'Detective',0),(3,'Documentary',0),(4,'Drama',0),(5,'Historical',0),(6,'Clips',0),(7,'Comedy',0),(8,'Melodrama',0),(24,'Humour',0),(10,'Adventures',0),(11,'Thriller',0),(12,'Horrors',0),(13,'Fiction',0),(14,'Erotica',0),(15,'Fantasy',0),(16,'Animation',0),(17,'Childrens',0),(18,'Musical',0),(19,'Western',0),(21,'Serial',0),(22,'Sports',0),(23,'Teach',0),(25,'Information',0);

CREATE TABLE IF NOT EXISTS `cat_genre`(
    `id` int NOT NULL auto_increment,
    `title` varchar(128) NOT NULL default '',
    `category_alias` varchar(255) NOT NULL default '',
    PRIMARY KEY (`id`),
    KEY `category_alias` (`category_alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `cat_genre`
VALUES (1, 'Action', 'movies'),
  (2, 'Adventure', 'movies'),
  (3, 'Documentary', 'movies'),
  (4, 'Drama', 'movies'),
  (5, 'Comedy', 'movies'),
  (6, 'Family', 'movies'),
  (7, 'Musical', 'movies'),
  (8, 'Horror', 'movies'),
  (9, 'Action', 'tv_shows'),
  (10, 'Adventure', 'tv_shows'),
  (11, 'Documentary', 'tv_shows'),
  (12, 'Drama', 'tv_shows'),
  (13, 'Comedy', 'tv_shows'),
  (14, 'Family', 'tv_shows'),
  (15, 'Musical', 'tv_shows'),
  (16, 'Horror', 'tv_shows'),
  (17, 'Action', 'cartoons'),
  (18, 'Adventure', 'cartoons'),
  (19, 'Drama', 'cartoons'),
  (20, 'Comedy', 'cartoons'),
  (21, 'Family', 'cartoons'),
  (22, 'Musical', 'cartoons'),
  (23, 'Horror', 'cartoons'),
  (24, 'Clips', 'music_videos'),
  (25, 'Concerts', 'music_videos');

CREATE TABLE IF NOT EXISTS `itv`(
    `id` int NOT NULL auto_increment,
    `name` varchar(128) NOT NULL default '',
    `number` int NOT NULL default 0,
    `censored` tinyint default 0,
    `cmd` varchar(128) NOT NULL default '',
    `descr` text,
    `cost` int NOT NULL default 0,
    `count` int  NOT NULL default 0,
    `status` tinyint unsigned NOT NULL default 1,
    `tv_genre_id` int NOT NULL default 0,
    `base_ch` tinyint default 0, /* 1 - base channel */
    `hd` tinyint default 0,
    `xmltv_id` varchar(128) NOT NULL default '',
    `service_id` varchar(32) NOT NULL default '',
    `bonus_ch` tinyint default 0, /* 1 - bonus channel */
    `volume_correction` int NOT NULL default 0,
    `use_http_tmp_link` tinyint default 0,
    `mc_cmd` varchar(128) NOT NULL default '',
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`),
    KEY `status` (`status`),
    KEY `tv_genre_id` (`tv_genre_id`),
    KEY `status_3` (`status`,`number`,`hd`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `itv` (`name`, `number`, `cmd`, `tv_genre_id`, `base_ch`) VALUES ('Test channel', 1, 'rtp rtp://239.1.1.1:1234', 1, 1);

CREATE TABLE IF NOT EXISTS `tv_genre`(
    `id` int NOT NULL auto_increment,
    `title` varchar(128) NOT NULL default '',
    PRIMARY KEY (`id`),
    UNIQUE KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `tv_genre`
VALUES (1, 'Documentary'), (2, 'Entertainment'), (3, 'For Kids'),
  (4, 'Movies'), (5, 'Music'), (6, 'News'),
  (7, 'Nature'), (8, 'Sports'), (19, 'For Adults');

CREATE TABLE IF NOT EXISTS `last_id`(
    `id` int NOT NULL auto_increment,
    `ident` varchar(64) NOT NULL default '',
    `last_id` int unsigned NOT NULL default 0,
    UNIQUE KEY (`ident`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `screenshots`(
    `id` int NOT NULL auto_increment,
    `name` varchar(64) NOT NULL default '',
    `size` varchar(255) NOT NULL default '',
    `type` varchar(255) NOT NULL default '',
    `media_id` varchar(255) NOT NULL default '',
    PRIMARY KEY (`id`),
    KEY `media_id` (`media_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `epg`(
    `id` int NOT NULL auto_increment,
    `ch_id` int NOT NULL default 0,
    `time` timestamp NULL DEFAULT NULL,
    `time_to` timestamp NULL DEFAULT NULL,
    `duration` int NOT NULL default 0,
    `name` varchar(128) NOT NULL default '',
    `descr` varchar(255) NOT NULL default '',
    PRIMARY KEY (`id`),
    KEY `ch_id_time` (`ch_id`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `karaoke`(
    `id` int NOT NULL auto_increment,
    `owner` varchar(64) NOT NULL default '',
    `name` varchar(128) NOT NULL default '',
    `fname` varchar(128) NOT NULL default '',
    `description` text,
    `protocol` varchar(64) NOT NULL default 'nfs',
    `rtsp_url` varchar(255) NOT NULL default '',
    `pic` varchar(128) NOT NULL default '',
    `cost` int NOT NULL default 0,
    `time` varchar(64) NOT NULL default '',
    `file` varchar(128) NOT NULL default '',
    `path` varchar(128) NOT NULL default '',
    `genre_id` int NOT NULL default 0,
    `singer` varchar(128) NOT NULL default '',
    `author` varchar(128) NOT NULL default '',
    `year` varchar(128) NOT NULL default '',
    `accessed` tinyint default 0,
    `status` tinyint default 0,
    `added` datetime,
    `add_by` int NOT NULL default 0,
    `done` tinyint default 0,
    `done_time` datetime,
    `archived` tinyint default 0,
    `archived_time` datetime,
    `returned` tinyint default 0,
    `reason` varchar(255) NOT NULL default '',
    `count` int NOT NULL default 0,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `karaoke_genre`(
    `id` int NOT NULL auto_increment,
    `title` varchar(128) NOT NULL default '',
    PRIMARY KEY (`id`),
    UNIQUE KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `karaoke_genre` VALUES (1,'Pop'),(2,'Rock'),(3,'Chanson'),(4,'From cartoon films'),(5,'Nurseries'),(6,'National'),(7,'Jazz'),(8,'From films'); 

CREATE TABLE IF NOT EXISTS `user_log`(
    `id` int NOT NULL auto_increment,
    `mac` varchar(128) NOT NULL default '',
    `uid` int NOT NULL default 0,
    `action` varchar(128) NOT NULL default '',
    `param` varchar(128) NOT NULL default '',
    `time` datetime,
    `type` tinyint(4) default '0',
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `users`(
    `id` int NOT NULL auto_increment,
    `name` varchar(64) NOT NULL default '',
    `sname` varchar(64) NOT NULL default '',
    `pass` varchar(64) NOT NULL default '',
    `parent_password` varchar(64) NOT NULL default '0000',
    `bright` varchar(64) NOT NULL default '200',
    `contrast` varchar(64) NOT NULL default '127',
    `saturation` varchar(64) NOT NULL default '127',
    `aspect` int NOT NULL default 16,
    `video_out` varchar(64) NOT NULL default 'rca',
    `volume` varchar(64) NOT NULL default '100',
    `playback_buffer_bytes` int NOT NULL default 0,
    `playback_buffer_size` int NOT NULL default 0,
    `audio_out` int NOT NULL default 0,
    `mac` varchar(64) NOT NULL default '',
    `ip` varchar(128) NOT NULL default '',
    `ls` int not null default 0,
    `version` varchar(255) NOT NULL default '',
    `lang` varchar(32) NOT NULL default '',
    `locale` varchar(32) NOT NULL default '',
    `city_id` int NOT NULL default 0,
    `status` tinyint default 0,
    `hd` tinyint default 0,
    `main_notify` tinyint default 1,
    `fav_itv_on` tinyint default 0,
    `now_playing_start` timestamp NULL default NULL,
    `now_playing_type` tinyint default 0,
    `now_playing_content` varchar(255) NOT NULL default '',
    `additional_services_on` tinyint default 1,
    `time_last_play_tv` timestamp NULL default NULL,
    `time_last_play_video` timestamp null default null,
    `operator_id` int NOT NULL default 0,
    `storage_name` varchar(255) NOT NULL default '',
    `hd_content` tinyint default 0,
    `image_version` varchar(255) NOT NULL default '0',
    `last_change_status` timestamp null default null,
    `last_start` timestamp null default null,
    `last_active` timestamp null default null,
    `keep_alive` timestamp null default null,
    PRIMARY KEY (`id`),
    UNIQUE KEY `mac` (`mac`),
    KEY `keep_alive` (`keep_alive`),
    KEY `status` (`status`,`keep_alive`,`storage_name`,`hd_content`),
    KEY `keep_alive_2` (`keep_alive`,`now_playing_type`,`storage_name`,`hd_content`),
    KEY `now_playing_type` (`now_playing_type`,`storage_name`,`hd_content`),
    KEY `now_playing_type_2` (`now_playing_type`,`hd`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `moderators` (
    `id` int NOT NULL auto_increment,
    `name` varchar(128) NOT NULL default '',
    `mac` varchar(64) NOT NULL default '',
    `status` tinyint default 1,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `events`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `type` varchar(128) NOT NULL default '',
    `event` varchar(128) NOT NULL default '',
    `msg` text,
    `rec_id` int NOT NULL default 0,
    `sended` tinyint default 0,
    `need_confirm` tinyint default 0,
    `confirmed` tinyint default 0,
    `ended` tinyint default 0,
    `reboot_after_ok` tinyint default 0,
    `priority` tinyint default 2, /* 1-system events, 2-system message */
    `addtime` datetime,
    `eventtime` timestamp null default null,
    PRIMARY KEY (`id`),
    KEY `eventtime` (`eventtime`),
    KEY `uid` (`uid`),
    KEY `ended` (`ended`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `fav_itv`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `fav_ch` text,
    `addtime` datetime,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `audio`(
    `id` int NOT NULL auto_increment,
    `name` varchar(128) NOT NULL default '',
    `singer_id` int NOT NULL default 0,
    `album_id` int NOT NULL default 0,
    `time` int NOT NULL default 0,
    `count` int NOT NULL default 0,
    `lang` tinyint default 0, /*0-rus, 1-eng, 2-num*/
    `status` tinyint default 0,
    `addtime` datetime,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `singer`(
    `id` int NOT NULL auto_increment,
    `singer` varchar(128) NOT NULL default '',
    `path` varchar(128) NOT NULL default '',
    `lang` tinyint default 0, /*0-rus, 1-eng, 2-num*/
    `addtime` datetime,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`singer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `album`(
    `id` int NOT NULL auto_increment,
    `name` varchar(128) NOT NULL default '',
    `singer_id` int NOT NULL default 0,
    `year` int NOT NULL default 0,
    `addtime` datetime,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `playlist`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `tracks` text,
    `addtime` datetime,
    `edittime` datetime,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `radio`(
    `id` int NOT NULL auto_increment,
    `name` varchar(128) NOT NULL default '',
    `number` int NOT NULL default 0,
    `cmd` varchar(128) NOT NULL default '',
    `count` int  NOT NULL default 0,
    `status` tinyint unsigned NOT NULL default 1,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`name`),
    KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `fav_vclub`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `fav_video` text,
    `addtime` datetime,
    `edittime` datetime,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `administrators`(
    `id` int NOT NULL auto_increment,
    `login` varchar(128) NOT NULL default '',
    `pass`  varchar(128) NOT NULL default '',
    `name` varchar(128) NOT NULL default '',
    `fname` varchar(128) NOT NULL default '',
    `access` tinyint default 0, /*1-admin, 2-moderator, 3-subscribe moderator*/
    `operator_id` int NOT NULL default 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `administrators` (`login`, `pass`, `access`) values ('admin', md5('1'), 0);

CREATE TABLE IF NOT EXISTS `video_log`(
    `id` int NOT NULL auto_increment,
    `moderator_id` int NOT NULL default 0,
    `action` varchar(128) NOT NULL default '',
    `video_id` int NOT NULL default 0,
    `actiontime` datetime,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `played_video`(
    `id` int NOT NULL auto_increment,
    `video_id` int NOT NULL default 0,
    `storage` int NOT NULL default 0,
    `uid` int NOT NULL default 0,
    `playtime` timestamp not null,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `played_itv`(
    `id` int NOT NULL auto_increment,
    `itv_id` int NOT NULL default 0,
    `uid` int NOT NULL default 0,
    `playtime` datetime,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `video_records`(
    `id` int NOT NULL auto_increment,
    `descr` varchar(255) NOT NULL default '',
    `cmd` varchar(255) NOT NULL default '',
    `status` tinyint default 1, /* 1-on, 0-off */
    `accessed` tinyint default 0, /* 0-off, 1-on */
    `addtime` datetime,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rec_files`(
    `id` int NOT NULL auto_increment,
    `ch_id` int NOT NULL default 0,
    `t_start` timestamp null default null,
    `t_stop`  timestamp null default null,
    `atrack`  varchar(32) NOT NULL default '',
    `vtrack`  varchar(32) NOT NULL default '',
    `length` int NOT NULL default 0,
    `ended`  tinyint default 0, /* 0-not ended, 1-ended */
    `storage_name` varchar(128) NOT NULL default '',
    `file_name` varchar(128) NOT NULL default '',
    `local` tinyint default 0,
    `uid` int NOT NULL default 0,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `users_rec`(
    `id` int NOT NULL auto_increment,
    `ch_id` int NOT NULL default 0,
    `program` varchar(64) NOT NULL default '',
    `program_id` int NOT NULL default 0,
    `uid` int NOT NULL default 0,
    `file_id` int NOT NULL default 0,
    `t_start` timestamp null default null,
    `t_stop` timestamp null default null,
    `end_record` timestamp null default null,
    `atrack` varchar(32) NOT NULL default '',
    `vtrack` varchar(32) NOT NULL default '',
    `length` int NOT NULL default 0,
    `last_play` datetime,
    `ended` tinyint default 0, /* 0-not ended, 1-ended */
    `started` tinyint default 0,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pvr`(
    `id` int NOT NULL auto_increment,
    `ch_id` int NOT NULL default 0,
    `t_start` timestamp null default null,
    `t_stop`  timestamp null default null,
    `atrack`  varchar(32) NOT NULL default '',
    `vtrack`  varchar(32) NOT NULL default '',
    `length` int NOT NULL default 0,
    `ended`  tinyint default 0, /* 0-not ended, 1-ended */
    `uid` int NOT NULL default 0,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `moderator_tasks`(
    `id` int NOT NULL auto_increment,
    `to_usr` int NOT NULL default 0,
    `media_type` int NOT NULL default 0,
    `media_id` int NOT NULL default 0,
    `media_length` int NOT NULL default 0,
    `start_time` datetime,
    `end_time` datetime,
    `ended` tinyint default 0,
    `rejected` tinyint default 0, /* 1 - rejected, 0 - ended */
    `archived` tinyint default 0,
    `archived_time` datetime,
    PRIMARY KEY (`id`),
    KEY `to_user` (`ended`,`archived`,`to_usr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `moderators_history`(
    `id` int NOT NULL auto_increment,
    `task_id` int NOT NULL default 0,
    `from_usr` int NOT NULL default 0,
    `to_usr` int NOT NULL default 0,
    `comment` text,
    `send_time` datetime,
    `readed` tinyint default 0,
    `reply_to` int NOT NULL default 0,
    `read_time` datetime,
    PRIMARY KEY (`id`),
    KEY `msqs` (`task_id`,`to_usr`,`readed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tasks_archive`(
    `id` int NOT NULL auto_increment,
    `date` date,
    `year` int NOT NULL default 0,
    `month` tinyint default 0,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `daily_played_video`(
    `id` int NOT NULL auto_increment,
    `date` date,
    `count` int NOT NULL default 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `itv_subscription`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `sub_ch` text,
    `bonus_ch` text,
    `addtime` datetime,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `storages`(
    `id` int NOT NULL auto_increment,
    `storage_name` varchar(128) NOT NULL default '',
    `storage_ip` varchar(128) NOT NULL default '',
    `nfs_home_path` varchar(128) NOT NULL default '',
    `max_online` int NOT NULL default 0,
    `status` tinyint default 1,
    `for_moderator` tinyint default 0,
    `for_records` tinyint default 0,
    UNIQUE KEY (`storage_name`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `stream_error`(
    `id` int NOT NULL auto_increment,
    `ch_id` int NOT NULL default 0,
    `mac` varchar(128) NOT NULL default '',
    `error_time` timestamp not null,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `karaoke_archive`(
    `id` int NOT NULL auto_increment,
    `date` datetime,
    `year` int NOT NULL default 0,
    `month` tinyint default 0,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `permitted_video`(
    `id` int NOT NULL auto_increment,
    `o_name` varchar(255) NOT NULL default '',
    `year` int not null default 0,
    `genre` tinyint default 0,
    `added` datetime,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `video_clips`(
    `id` int NOT NULL auto_increment,
    `name` varchar(128) NOT NULL default '',
    `singer` varchar(128) NOT NULL default '',
    `censored` tinyint default 0, /* 0-off, 1-on */
    `genre_id` int NOT NULL default 0,
    `accessed` tinyint default 0,
    `status` tinyint default 0,
    `added` datetime,
    `add_by` int NOT NULL default 0,
    `done` tinyint default 0,
    `done_time` datetime,
    `archived` tinyint default 0,
    `archived_time` datetime,
    `returned` tinyint default 0,
    `reason` varchar(255) NOT NULL default '',
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `video_clip_genres`(
    `id` int NOT NULL auto_increment,
    `title` varchar(128) NOT NULL default '',
    PRIMARY KEY (`id`),
    UNIQUE KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `vclub_paused`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `mac` varchar(128) NOT NULL default '',
    `pause_time` timestamp not null,
    PRIMARY KEY (`id`),
    KEY `mac` (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `storage_deny`(
    `id` int NOT NULL auto_increment,
    `name` varchar(255) NOT NULL default '',
    `counter` int NOT NULL default 0,
    `updated` datetime,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rss_cache_weather`(
    `id` int NOT NULL auto_increment,
    `url` varchar(255) NOT NULL default '',
    `content` text,
    `crc` varchar(64) NOT NULL default '',
    `updated` datetime,
    UNIQUE KEY (`crc`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rss_cache_horoscope`(
    `id` int NOT NULL auto_increment,
    `url` varchar(255) NOT NULL default '',
    `content` text,
    `crc` varchar(64) NOT NULL default '',
    `updated` datetime,
    UNIQUE KEY (`crc`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `media_category`(
    `id` int NOT NULL auto_increment,
    `category_name` varchar(255) NOT NULL default '',
    `category_alias` varchar(255) NOT NULL default '',
    `num` int NOT NULL default 0,
    UNIQUE KEY (`category_name`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `media_category`
VALUES (1, 'Movies', 'movies', 1),
  (2, 'TV shows', 'tv_shows', 2),
  (3, 'Cartoons', 'cartoons', 3),
  (4, 'Music videos', 'music_videos', 4);

CREATE TABLE IF NOT EXISTS `main_city_info`(
    `id` int NOT NULL auto_increment,
    `num` int NOT NULL default 0,
    `title` varchar(255) NOT NULL default '',
    `number` varchar(255) NOT NULL default '',
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `other_city_info`(
    `id` int NOT NULL auto_increment,
    `num` int NOT NULL default 0,
    `title` varchar(255) NOT NULL default '',
    `number` varchar(255) NOT NULL default '',
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `help_city_info`(
    `id` int NOT NULL auto_increment,
    `num` int NOT NULL default 0,
    `title` varchar(255) NOT NULL default '',
    `number` varchar(255) NOT NULL default '',
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `anec`(
    `id` int NOT NULL auto_increment,
    `title` varchar(255) NOT NULL default '',
    `anec_body` text,
    `added` datetime,
    PRIMARY KEY (`id`),
    KEY `added` (`added`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `readed_anec`(
    `id` int NOT NULL auto_increment,
    `mac` varchar(64) NOT NULL default '',
    `readed` datetime,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `anec_bookmark`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `anec_id` int NOT NULL default 0,
    UNIQUE KEY (`uid`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `anec_rating`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `anec_id` int NOT NULL default 0,
    PRIMARY KEY (`id`),
    KEY `uid` (`uid`,`anec_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `loading_fail`(
    `id` int NOT NULL auto_increment,
    `mac` varchar(64) NOT NULL default '',
    `ff_crash` int NOT NULL default 0,
    `added` timestamp not null,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `gapi_cache_cur_weather`(
    `id` int NOT NULL auto_increment,
    `url` varchar(255) NOT NULL default '',
    `content` text,
    `crc` varchar(64) NOT NULL default '',
    `updated` datetime,
    UNIQUE KEY (`crc`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `gismeteo_day_weather`(
    `id` int NOT NULL auto_increment,
    `url` varchar(255) NOT NULL default '',
    `content` text,
    `crc` varchar(64) NOT NULL default '',
    `updated` datetime,
    UNIQUE KEY (`crc`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `updated_places`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `anec` int NOT NULL default 0,
    `vclub` int NOT NULL default 0,
    UNIQUE KEY (`uid`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mastermind_wins`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `tries` int NOT NULL default 0,
    `total_time` int NOT NULL default 0,
    `points` int NOT NULL default 0,
    `added` timestamp not null,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `vclub_not_ended`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `video_id` int NOT NULL default 0,
    `series` int NOT NULL default 0,
    `end_time` int NOT NULL default 0,
    `added` datetime,
    PRIMARY KEY (`id`),
    KEY `uid` (`uid`,`video_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `course_cache`(
    `id` int NOT NULL auto_increment,
    `url` varchar(255) NOT NULL default '',
    `content` text,
    `crc` varchar(64) NOT NULL default '',
    `updated` datetime,
    UNIQUE KEY (`crc`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `recipe_cats`(
    `id` int NOT NULL auto_increment,
    `title` varchar(128) NOT NULL default '',
    `num` int NOT NULL default 0,
    UNIQUE KEY (`title`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `recipes`(
    `id` int NOT NULL auto_increment,
    `recipe_cat_id_1` int NOT NULL default 0,
    `recipe_cat_id_2` int NOT NULL default 0,
    `recipe_cat_id_3` int NOT NULL default 0,
    `recipe_cat_id_4` int NOT NULL default 0,
    `name` varchar(255) NOT NULL default '',
    `descr` text,
    `ingredients` text,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `fav_recipes`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `fav_recipes` text,
    `addtime` datetime,
    `edittime` datetime,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `stb_played_video`(
    `id` int NOT NULL auto_increment,
    `uid` int NOT NULL default 0,
    `video_id` int NOT NULL default 0,
    `playtime` timestamp null default null,
    PRIMARY KEY (`id`),
    KEY `uid_video_id` (`uid`,`video_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `storage_cache`(
    `id` int NOT NULL auto_increment,
    `cache_key` varchar(64) NOT NULL default '',
    `media_type` varchar(64) NOT NULL default '',
    `media_id` int NOT NULL default 0,
    `storage_name` varchar(255) NOT NULL default '',
    `storage_data` text,
    `status` tinyint default 1,
    `changed` datetime,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`cache_key`),
    KEY `media_id_status_type` (`media_id`,`status`,`media_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `master_log`(
    `id` int NOT NULL auto_increment,
    `log_txt` varchar(255) NOT NULL default '',
    `added` datetime,
    PRIMARY KEY (`id`),
    INDEX(`added`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `media_claims`(
    `id` int NOT NULL auto_increment,
    `media_type` varchar(64) NOT NULL default '',
    `media_id` int NOT NULL default 0,
    `sound_counter` int NOT NULL default 0,
    `video_counter` int NOT NULL default 0,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `media_claims_log`(
    `id` int NOT NULL auto_increment,
    `media_type` varchar(64) NOT NULL default '',
    `media_id` int NOT NULL default 0,
    `type` varchar(128) NOT NULL default '',
    `uid` int NOT NULL default 0,
    `added` timestamp not null,
    PRIMARY KEY (`id`),
    INDEX(`added`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `daily_media_claims`(
    `id` int NOT NULL auto_increment,
    `date` date,
    `vclub_sound` int NOT NULL default 0,
    `vclub_video` int NOT NULL default 0,
    `itv_sound` int NOT NULL default 0,
    `itv_video` int NOT NULL default 0,
    `karaoke_sound` int NOT NULL default 0,
    `karaoke_video` int NOT NULL default 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `epg_setting`(
    `id` int NOT NULL auto_increment,
    `uri` varchar(255) NOT NULL default '',
    `etag` varchar(255) NOT NULL default '',
    `updated` datetime,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`uri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `stb_groups`(
    `id` int NOT NULL auto_increment,
    `name` varchar(255) NOT NULL default '',
    PRIMARY KEY (`id`),
    UNIQUE KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `stb_in_group`(
    `id` int NOT NULL auto_increment,
    `stb_group_id` int NOT NULL default 0,
    `uid` int NOT NULL default 0,
    `mac` varchar(64) NOT NULL default '',
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `playlists`(
    `id` int NOT NULL auto_increment,
    `name` varchar(255) NOT NULL default '',
    `group_id` int NOT NULL default 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `playlist_members`(
    `id` int NOT NULL auto_increment,
    `playlist_id` int NOT NULL default 0,
    `time` int NOT NULL default -1, /* minutes from day beginning */
    `video_id` int NOT NULL default 0,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `testers`(
    `id` int NOT NULL auto_increment,
    `mac` varchar(64) NOT NULL default '',
    `status` tinyint default 1,
    UNIQUE KEY (`mac`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `generation_time`(
    `time` varchar(32),
    `counter` int unsigned NOT NULL default 0,
    KEY `time` (`time`)
) ENGINE=MEMORY;

INSERT INTO `generation_time` (`time`) values ('0ms'), ('100ms'), ('200ms'), ('300ms'), ('400ms'), ('500ms');

CREATE TABLE IF NOT EXISTS `weatherco_cache`(
    `id` int NOT NULL auto_increment,
    `city_id` int NOT NULL default 0,
    `current` text,
    `forecast` text,
    `updated` datetime,
    UNIQUE KEY (`city_id`),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tv_reminder`(
    `id` int NOT NULL auto_increment,
    `mac` varchar(64) NOT NULL default '',
    `ch_id` int NOT NULL default 0,
    `tv_program_id` int NOT NULL default 0,
    `fire_time` timestamp not null,
    `added` datetime,
    PRIMARY KEY (`id`),
    KEY `tv_program_id` (`tv_program_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `countries`(
    `id` int NOT NULL,
    `iso2` varchar(8) NOT NULL default '',
    `iso3` varchar(8) NOT NULL default '',
    `name` varchar(64) NOT NULL default '',
    `name_en` varchar(64) NOT NULL default '',
    `region` varchar(64) NOT NULL default '',
    `region_id` int NOT NULL default 0,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cities`(
    `id` int NOT NULL,
    `name` varchar(64) NOT NULL default '',
    `name_en` varchar(64) NOT NULL default '',
    `region` varchar(64) NOT NULL default '',
    `country` varchar(64) NOT NULL default '',
    `country_id` int NOT NULL default 0,
    `timezone` varchar(64) NOT NULL default '',
    PRIMARY KEY (`id`),
    KEY `country_id` (`country_id`),
    KEY `timezone` (`timezone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- //@UNDO

TRUNCATE `genre`;
TRUNCATE `cat_genre`;
TRUNCATE `itv`;
TRUNCATE `tv_genre`;
TRUNCATE `karaoke_genre`;
TRUNCATE `administrators`;
TRUNCATE `media_category`;
TRUNCATE `generation_time`;

--