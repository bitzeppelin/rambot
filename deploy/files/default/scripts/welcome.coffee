# Description:
#   Welcome
#
# Dependencies:
#
#
# Configuration:
#
#
# Commands:
#   none
#
# Author:
#   marsam

module.exports = (robot) ->

  # IRC adapter
  if robot.adapter.bot?
    robot.adapter.bot.on "join", (channel, who) ->
      return if who is robot.name
      welcomeUsers = robot.brain.get("welcomeUsers") ? []
      user = robot.brain.userForName who
      if user.name not in welcomeUsers
        user.room = channel
        envelope =
          user: user
        robot.adapter.send envelope, "#{user.name}, Bienvenid@ a #limaJS, una congregación del Church of NaN, también conocida como: python.js, el club del debate y AA."
        welcomeUsers.push user.name
        robot.brain.set "welcomeUsers", welcomeUsers
