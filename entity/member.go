package entity

import "gorm.io/gorm"

type Member struct {
	gorm.Model
	Username string
	Password string
	Email    string

	// 1 member เป็นเจ้าของได้หลาย Playlist
	Playlists []Playlist `gorm:"foreignKey:MemberID"`
}
