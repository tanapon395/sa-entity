package entity

import (
	"time"

	"gorm.io/gorm"
)

type Member struct {
	gorm.Model
	Username  string
	Password  string
	Email     string
	FirstName string
	LastName  string
	Birthday  time.Time

	// 1 member เป็นเจ้าของได้หลาย Playlist
	Playlists []Playlist `gorm:"foreignKey:MemberID"`
}
