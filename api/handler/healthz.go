package handler

import (
	"net/http"

	"github/CreatorNinja/code-challenge-songs/domain/healthz"

	"github.com/gin-gonic/gin"
)

func HealthzRouter(e *gin.Engine, s healthz.UseCase) {
	e.GET("/healthz", GetHealthz(s))
	
	// Here add all the methods for Create, Read, and Delete
	// Create methods
	 e.POST("/healthz/create-song", CreateSong(s))
	// e.POST("/healthz/create-artist", CreateArtist(s))
	// e.POST("/healthz/create-album", CreateAlbum(s))
	// e.POST("/healthz/create-playlist", CreatePlaylist(s))

	// Read Methods
	e.GET("/healthz/list-songs", GetAssetList(s, 0))
	e.GET("/healthz/list-artists", GetAssetList(s, 1))
	e.GET("/healthz/list-albums", GetAssetList(s, 2))
	e.GET("/healthz/list-playlists", GetAssetList(s, 3))

	// Testing of generic search function
	e.GET("/healthz/search", SearchObject(s))

	// Delete Methods
	// e.DELETE("/healthz/delete-song", DeleteSong(s))
	// e.DELETE("/healthz/delete-artist", DeleteArtist(s))
	// e.DELETE("/healthz/delete-album", DeleteAlbum(s))
	// e.DELETE("/healthz/delete-playlist", DeletePlaylist(s))
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

func CreateSong(s healthz.UseCase) gin.HandlerFunc {
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
	
		//Otherwise, create song into the database
		name := c.Query("name")
		
		// Add code for inserting into database here
		status, err = s.CreateSong(name)
		c.JSON(http.StatusOK, gin.H{
			"msg":    status,
			"status": http.StatusOK,
			"data":   "OK",
		})
		return
	}
}

// GET method to obtain the first 20 elements of each asset type
func GetAssetList(s healthz.UseCase, assetType int) gin.HandlerFunc {
	return func(c *gin.Context) {
		status, err := s.GetHealthz()

		if err != nil {
			c.JSON(http.StatusCreated, gin.H{
				"msg":    "Error on the request" + status,
				"status": http.StatusBadRequest,
				"data":   nil,
			})
			return
		}

		data, err := s.GetAssetList(assetType)
		
		c.JSON(http.StatusOK, gin.H{
			"msg":    "",
			"status": http.StatusOK,
			"data":   data,
		})
		return
	}
}

// GET method to obtain the first 20 elements of each asset type
func SearchObject(s healthz.UseCase, assetType int) gin.HandlerFunc {
	return func(c *gin.Context) {
		// Checking health of the service i.e. connection to the DB
		status, err := s.GetHealthz()

		if err != nil { // In case of errors
			c.JSON(http.StatusCreated, gin.H{
				"msg":    "Error on the request" + status,
				"status": http.StatusBadRequest,
				"data":   nil,
			})
			return
		}

		// Health: OK, executing instruction depending on parameters
		// Getting parameters
		objectType := c.Query("objectType")
		data, err := s.SearchObject(objectType)
		
		c.JSON(http.StatusOK, gin.H{
			"msg":    "",
			"status": http.StatusOK,
			"data":   data,
		})
		return
	}
}
