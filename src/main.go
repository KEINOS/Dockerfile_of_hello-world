package main

import (
    "net/http"
    "encoding/json"
    "github.com/labstack/echo"
)

type M map[string]interface{}

func main() {

    response := M{
        "success": true,
        "message": "Request received successfully",
        "data": M{
            "responce" : "Hello, world!",
        },
    }

    bytes, _ := json.MarshalIndent(response, "", "    ")

    e := echo.New()
    e.GET("/", func(c echo.Context) error {
        return c.String(http.StatusOK, string(bytes))
    })
    e.Logger.Fatal(e.Start(":8080"))
}