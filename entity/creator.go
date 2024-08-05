package entity

import "gorm.io/gorm"

type Creator struct {
	gorm.Model
	Username string
	Password string
	Email    string

	// 1 creator เป็นเจ้าของได้หลาย Sound
	Sounds []Sound `gorm:"foreignKey:CreatorID"`
}
