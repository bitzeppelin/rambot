# Description:
#   Because we love whatever cibertoto says.
#
# Dependencies:
#   ntwitter
#
# Configuration:
#
#
# Commands:
#   hubot totosays <phrase> - Update @shittotosays status with <phrase>.
#
# Author:
#   marsam

twitter       = require 'ntwitter'

String::escape = ->
  this.replace /[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|\@]/g, "\\$&"


options =
  consumer_key: process.env.TOTO_CONSUMER_KEY
  consumer_secret: process.env.TOTO_CONSUMER_SECRET
  access_token_key: process.env.TOTO_TOKEN_KEY
  access_token_secret: process.env.TOTO_TOKEN_SECRET

twit = new twitter options

module.exports = (robot) ->
  robot.respond /(shit)?toto(says)? (.*)$/i, (msg) ->
    status = msg.match[3]
    msg.send("#{status.escape()}")
    twit
      .updateStatus "#{status}", (err, data) -> if err then msg.send(err) else msg.send('ok')

# vim:cuc:cc=80:
