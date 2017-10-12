rimraf  = require "rimraf"
path    = require "path"

gitignore = path.resolve __dirname, ".gitignore"
gitfolder = path.resolve __dirname, ".git"

rimraf gitignore, ->
    console.log "Done removing .gitignore file."

rimraf gitfolder, ->
    console.log "Done removing .git folder."
