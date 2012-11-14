# Description:
#   Returns a phrase for regex.
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


REGEX = [
  '"Some people, when confronted with a problem, think \'I know, I\'ll use regular expressions.\'  Now they have two problems." -- Jamie Zawinski',
  '"Regular Expressions are like violence: if it doesn\'t solve your problem, you aren\'t using enough of it."',
  ]

# regex mention threshold
threshold = 3

module.exports = (robot) ->
  robot.brain.data.regex_counter ||= 0
  robot.hear /regex(es)?/i, (msg) ->
    robot.brain.data.regex_counter += 1

    message = msg.random REGEX
    username = msg.message.user.name
    if robot.brain.data.regex_counter >= threshold
      msg.send "#{username}: #{message}"
      robot.brain.data.regex_counter = 0
