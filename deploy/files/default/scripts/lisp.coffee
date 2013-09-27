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
  robot.hear ///
         lisp
       | emacs
       | racket
       | clojure
       | symbolics
       | genera
       ///i, (msg) ->
    msg.send "*drink*"
