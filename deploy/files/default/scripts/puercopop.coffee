# Description:
#   Ningún peruano decente y bien informado discute con PuercoPop.
#
# Dependencies:
#   twit
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   marsam

Twit       = require 'twit'

options =
  consumer_key: process.env.PUERCO_CONSUMER_KEY
  consumer_secret: process.env.PUERCO_CONSUMER_SECRET
  access_token: process.env.PUERCO_TOKEN_KEY
  access_token_secret: process.env.PUERCO_TOKEN_SECRET

# Max number of puercopop mentions
MAX_PUERCOPOP_MENTIONS = 3

module.exports = (robot) ->

  robot.hear /puercopop/i, (msg) ->
    name = msg.message.user.name
    user = robot.brain.userForName name

    if typeof user is 'object'
      user.puercopop_mentions ||= 0
      user.puercopop_mentions += 1
      if user.puercopop_mentions >= MAX_PUERCOPOP_MENTIONS
        user.puercopop_mentions = 0
        msg.send "#{name}, ningún peruano decente y bien informado discute con PuercoPop."

  robot.respond /puerco(?:pop)? (.*)$/i, (msg) ->
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
