# Description:
#   *drink*
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
  robot.hear /lisp/i, (msg) ->
    msg.send "*drink*"
