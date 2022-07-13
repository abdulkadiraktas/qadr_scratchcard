fx_version "bodacious"
games {"rdr3"}
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

shared_scripts {
	"conf.lua",
	"function.lua",
}

client_scripts {
	"client.lua",
}

server_scripts {
    "server.lua"
}

ui_page("html/index.html")

files {
	"html/scripts.js",
	"html/img/*.jpg",
	"html/img/*.png",
	"html/font/*.ttf",
	"html/styles.css",
    "html/index.html",
}