package entity

import "gorm.io/gorm"

type SoundPlaylist struct {
	gorm.Model

	// PlaylistID ทำหน้าที่เป็น FK
	PlaylistID *uint
	Playlist   Playlist `gorm:"foreignKey:PlaylistID"`

	// SoundID ทำหน้าที่เป็น FK
	SoundID *uint
	Sound   Sound `gorm:"foreignKey:SoundID"`
}
