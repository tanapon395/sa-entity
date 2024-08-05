package entity

import "gorm.io/gorm"

type Playlist struct {
	gorm.Model
	Title string

	// MemberID ทำหน้าที่เป็น FK
	MemberID *uint
	Member   Member `gorm:"foriegnKey:MemberID"`

	// 1 playlist เป็นเจ้าของได้หลาย SoundPlaylists
	SoundPlaylists []SoundPlaylist `gorm:"foreignKey:PlaylistID"`
}
