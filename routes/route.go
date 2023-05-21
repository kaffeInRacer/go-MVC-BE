package routes

import (
	"github.com/labstack/echo/v4"
	"point-of-sale/app/controller"
	"point-of-sale/app/middleware"
)

func Route(e *echo.Echo) {

	e.POST("/register", controller.Register)
	e.POST("/login", controller.Login)
	e.GET("/current", controller.Current, middleware.JWTMiddleware)

	

}
