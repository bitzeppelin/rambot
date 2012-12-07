# Description:
#   Ningún peruano decente y bien informado discute con PuercoPop.
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


# Max number of puercopop mentions
MAX_PUERCOPOP_MENTIONS = 3

module.exports = (robot) ->

  robot.hear /puercopop/i, (msg) ->
    name = msg.message.user.name
    user = robot.userForName name

    if typeof user is 'object'
      user.puercopop_mentions ||= 0
      user.puercopop_mentions += 1
      if user.puercopop_mentions >= MAX_PUERCOPOP_MENTIONS
        user.puercopop_mentions = 0
        msg.send "#{username}, ningún peruano decente y bien informado discute con PuercoPop."
