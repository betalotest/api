package server

import (
	"net/http"

	"gopkg.in/gin-gonic/gin.v1"
)

// validHandler receives an iban number from the client
// and call the validate function to check if it is a valid iban
func validHandler(c *gin.Context) {
	iban := c.Param("iban")

	iban, err := sanitize(iban)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"status": "Internal Server Error",
		})
		return
	}

	resp, err := validate(iban)
	// HINT: check if openiban api is up!
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"status": "Internal Server Error",
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"iban":  resp.Iban,
		"valid": resp.Valid,
	})
}
