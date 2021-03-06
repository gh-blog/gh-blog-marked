path = require 'path'
through2 = require 'through2'
marked = require 'marked'
renderer = require './renderer'
marked.setOptions { renderer }

module.exports = (options) ->
    processFile = (file, enc, done) ->
        if path.extname(file.path).match /.md|.mdown|.markdown|.gfm/i
            md = file.contents.toString()
            html = marked md

            file.contents = new Buffer html
            oldExtname = path.extname file.path
            file.path = file.path.replace (new RegExp "#{oldExtname}$"), '.html'

        done null, file

    through2.obj processFile