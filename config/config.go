package config

import (
	"github.com/joho/godotenv"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"log"
	"os"
)

var (
	Db         *gorm.DB
	serverPort string
	JWT        string
)

func init() {
	// initialize environment
	if err := godotenv.Load(); err != nil {
		panic(err.Error())
	}

	// setup variable environment
	host := os.Getenv("DB_HOST")
	user := os.Getenv("DB_USER")
	pass := os.Getenv("DB_PASS")
	port := os.Getenv("DB_PORT")
	data := os.Getenv("DB_NAME")

	JWT = os.Getenv("KEY_SECRET")
	// setup connection database MySQL
	dsn := user + ":" + pass + "@tcp(" + host + ":" + port + ")/" + data + "?charset=utf8mb4&parseTime=True&loc=Asia%2FJakarta"
	conn, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	if err != nil {
		log.Fatalf("Error connecting to database: %v", err)
	}

	Db = conn
	serverPort = os.Getenv("APP_PORT")
}

func GetServer() string {
	return serverPort
}
