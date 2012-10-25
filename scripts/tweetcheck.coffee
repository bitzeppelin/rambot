# Description:
#   Echoes tweets from a given account with a certain checking time interval.
#   Made originally for our corporate twitter account.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot twtcheck - Enables or disables tweet periodically checking
#
# Author:
#   Xp'ktro
#

username = "bitzeppelin"
interval = 10

tweetChecker = null
currentTweet = null
check = false

module.exports = (robot) ->
  robot.respond /twtcheck/i, (msg) ->
    if check
      check = false
      msg.send "#{escape(username)}'s twittah check disabled"
    else
      check = true
      msg.send "#{escape(username)}'s twittah check enabled"
      tweetChecker = {}
      tweetChecker.func = ->
        if check
          msg.http("http://api.twitter.com/1/statuses/user_timeline/#{escape(username)}.json?count=1&include_rts=true")
            .get() (err, res, body) ->
              response = JSON.parse body
              if response[0] && (response[0]["id_str"] != currentTweet)
                msg.send "@#{escape(username)}: " + response[0]["text"].replace(/\n+/g, ' ')
                currentTweet = response[0]["id_str"]
          setTimeout(tweetChecker.func, interval * 1000)
      tweetChecker.func()
