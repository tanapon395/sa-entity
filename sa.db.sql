BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "members" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"username"	text,
	"password"	text,
	"email"	text,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "creators" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"username"	text,
	"password"	text,
	"email"	text,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "sounds" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"title"	text,
	"path"	text,
	"creator_id"	integer,
	CONSTRAINT "fk_creators_sounds" FOREIGN KEY("creator_id") REFERENCES "creators"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "playlists" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"title"	text,
	"member_id"	integer,
	CONSTRAINT "fk_members_playlists" FOREIGN KEY("member_id") REFERENCES "members"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "sound_playlists" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"playlist_id"	integer,
	"sound_id"	integer,
	CONSTRAINT "fk_sounds_sound_playlists" FOREIGN KEY("sound_id") REFERENCES "sounds"("id"),
	CONSTRAINT "fk_playlists_sound_playlists" FOREIGN KEY("playlist_id") REFERENCES "playlists"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE INDEX IF NOT EXISTS "idx_members_deleted_at" ON "members" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_creators_deleted_at" ON "creators" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_sounds_deleted_at" ON "sounds" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_playlists_deleted_at" ON "playlists" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_sound_playlists_deleted_at" ON "sound_playlists" (
	"deleted_at"
);
COMMIT;
