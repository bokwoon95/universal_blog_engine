package main

import (
	"database/sql"
	"log"
	"net/http"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	_ "github.com/mattn/go-sqlite3"
)

type Server struct {
	DB *sql.DB
}

func main() {
	db, err := sql.Open("sqlite3", "./ube.db")
	if err != nil {
		log.Fatalln(err)
	}
	err = db.Ping()
	if err != nil {
		log.Fatalln(err)
	}
	srv := Server{
		DB: db,
	}
	r := chi.NewRouter()
	r.Use(middleware.Logger)
	r.Use(srv.DBLookup)
	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("welcome"))
	})
	http.ListenAndServe(":3000", r)
}
