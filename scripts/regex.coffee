# Description:
#   For hansy regex lover.
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


module.exports = (robot) ->
  REGEX = '"Some people, when confronted with a problem, think \'I know, I\'ll use regular expressions.\'  Now they have two problems." -- Jamie Zawinski'
  robot.hear /regex(es)?/i, (msg) ->
    msg.send REGEX
