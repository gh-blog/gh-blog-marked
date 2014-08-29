{ Renderer } = require 'marked'
uslug = require 'uslug'

renderer = new Renderer

renderer.heading = (text, level) ->
    slug = uslug text
    "<h#{level} id=#{slug}>#{text}</h#{level}>"

module.exports = renderer