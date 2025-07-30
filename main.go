package main

import (
	"github.com/tanapon395/sa-67/entity"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

func main() {
	db, err := gorm.Open(sqlite.Open("sa.db"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}

	// Migrate the schema
	db.AutoMigrate(&entity.Member{}, &entity.Creator{}, &entity.Sound{}, &entity.SoundPlaylist{}, &entity.Playlist{})
}
