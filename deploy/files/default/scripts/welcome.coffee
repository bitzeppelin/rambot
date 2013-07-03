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
  robot.brain.on 'loaded', =>
    robot.brain.data.welcomeUsers ||= []

  # IRC adapter
  if robot.adapter.bot?
    robot.adapter.bot.on "join", (channel, who) ->
      envelope =
        user: who
        room: channel
      robot.adapter.reply envelope, "Bienvenid@ a #limaJS, una congregación del Church of NaN, también conocida como: python.js, el club del debate y AA."
      robot.brain.data.welcomeUsers.push who
