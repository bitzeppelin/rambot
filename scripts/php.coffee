# Description:
#   Returns a phrase for php.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   marsam


PHP= [
  'http://i.imgur.com/hPOCQ.gif',
  'http://i.imgur.com/0Dbrp.gif',
  'http://i.imgur.com/BzLph.gif',
  ]


# regex mention threshold
threshold = 3

module.exports = (robot) ->
  robot.brain.data.regex_counter ||= 0

  robot.hear /php/i, (msg) ->
    username = msg.message.user.name

    message = msg.random REGEX
    msg.send "#{username}, wait wait, WHATCHU SAY? #{message}"
