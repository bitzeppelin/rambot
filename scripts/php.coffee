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


PHP = [
  {'msg': '', 'img': 'http://i.imgur.com/VNgxK.gif'},
  {'msg': '', 'img': 'http://i.imgur.com/BzLph.gif'},
  {'msg': '', 'img': 'http://i.imgur.com/ZGRbj.gif'},
  {'msg': 'NO!', 'img': 'http://i.imgur.com/IzUaG.gif'},
  {'msg': 'OMFG' , 'img':'http://i.imgur.com/nzOn3.gif'},
  {'msg': 'OMFG' , 'img':'http://i.imgur.com/hPOCQ.gif'},
  {'msg': 'wait wait, WHATCHU SAY?', 'img': 'http://i.imgur.com/0Dbrp.gif'},
  {'msg': '', 'img': 'http://media.tumblr.com/tumblr_m5j44q1psI1rqfksw.gif'},
]


module.exports = (robot) ->
  robot.hear /(me\s+gusta|i\s+like|i\s+love|amo)\s+php/i, (msg) ->
    username = msg.message.user.name

    message = msg.random PHP
    msg.send "#{username}, #{message.msg} #{message.img}"
