package handler

import (
	"net/http"

	"github/CreatorNinja/code-challenge-songs/domain/healthz"

	"github.com/gin-gonic/gin"
)

func HealthzRouter(e *gin.Engine, s healthz.UseCase) {
	e.GET("/healthz", GetHealthz(s))
}

func GetHealthz(s healthz.UseCase) gin.HandlerFunc {
	return func(c *gin.Context) {
		status, err := s.GetHealthz()
		if err != nil {
			c.JSON(http.StatusCreated, gin.H{
				"msg":    "Error on the request",
				"status": http.StatusBadRequest,
				"data":   nil,
			})
			return
		}
		c.JSON(http.StatusOK, gin.H{
			"msg":    status,
			"status": http.StatusOK,
			"data":   "OK",
		})
		return
	}
}
