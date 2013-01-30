# Description:
#   HansyFacts megabot
#
# Dependencies:
#   ntwitter
#
# Configuration:
#
#
# Commands:
#   hubot hansy <phrase> - Update @HansyFacts status with <phrase>.
#
# Author:
#   marsam

twitter       = require 'ntwitter'

options =
  consumer_key: process.env.HANSY_CONSUMER_KEY
  consumer_secret: process.env.HANSY_CONSUMER_SECRET
  access_token_key: process.env.HANSY_TOKEN_KEY
  access_token_secret: process.env.HANSY_TOKEN_SECRET

twit = new twitter options

module.exports = (robot) ->
  robot.respond /hansy(facts)? (.*)$/i, (msg) ->
    status = msg.match[2].replace(/'/g, "\'")
    twit
      .updateStatus "#{status}", (err, data) -> if err then msg.send(err) else msg.send('ok')

# vim:cuc:cc=80:
