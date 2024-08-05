package entity

import "gorm.io/gorm"

type Sound struct {
	gorm.Model
	Title string
	Path  string

	// CreatorID ทำหน้าที่เป็น FK
	CreatorID *uint
	Creator   Creator `gorm:"foreignKey:CreatorID"`

	// 1 sound เป็นเจ้าของได้หลาย SoundPlaylists
	SoundPlaylists []SoundPlaylist `gorm:"foreignKey:SoundID"`
}
