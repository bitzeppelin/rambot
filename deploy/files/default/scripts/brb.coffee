# Description:
#   Natural availability tracking.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   brb (or afk, or bbl)
#
# Author:
#   jmhobbs

module.exports = (robot) ->
  AWAY_USERS = {}
  AWAY_REGEX = /\b(brb|afk|bbl)\b/i

  # IRC adapter
  if robot.adapter.bot?
    robot.adapter.bot.addListener 'raw', (message) ->
      username = message.args[1]
      condition = message.args[2]

      if message.command is 'rpl_away'
        robot.emit 'away', {
          username: username,
          message: message,
        }

    robot.adapter.bot.addListener 'message', (from, to, message) ->
      if message.match /((yo)?u\s+)?(there)/i
        robot.adapter.bot.whois(to)

  robot.on 'away', (data) ->
    user = robot.brain.userForName(data.username)
    robot.send user, "Is currently away."

  robot.hear /./i, (msg) ->
    username = msg.message.user.name
    if AWAY_USERS[username] and not msg.message.text.match AWAY_REGEX
      delete AWAY_USERS[username]
      msg.send "Welcome back #{username}!"
    else
      for user, status of AWAY_USERS
        if msg.message.text.match user
          msg.reply "#{user} is currently away."
          break

  robot.hear AWAY_REGEX, (msg) ->
    AWAY_USERS[username] = true
    username = msg.message.user.name
