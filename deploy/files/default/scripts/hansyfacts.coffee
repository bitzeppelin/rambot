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

Twit       = require 'twit'

options =
  consumer_key: process.env.HANSY_CONSUMER_KEY
  consumer_secret: process.env.HANSY_CONSUMER_SECRET
  access_token: process.env.HANSY_TOKEN_KEY
  access_token_secret: process.env.HANSY_TOKEN_SECRET

module.exports = (robot) ->
  robot.respond /hansy(?:fact(?:s)?)? (.*)$/i, (msg) ->
    status = msg.match[1]
    params =
      status: status
    T = new Twit options
    T.post 'statuses/update', params,
      (err, reply) ->
        if err
          msg.send "Human, Twitter gave me the following errors: #{err.data}"
        else
          msg.send "https://twitter.com/#{reply.user.screen_name}/status/#{reply.id_str}/"
