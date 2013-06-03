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


PHP_MESSAGES = [
  {'msg': '', 'img': 'http://i.imgur.com/VNgxK.gif'},
  {'msg': '', 'img': 'http://i.imgur.com/BzLph.gif'},
  {'msg': '', 'img': 'http://i.imgur.com/ZGRbj.gif'},
  {'msg': 'NO!', 'img': 'http://i.imgur.com/IzUaG.gif'},
  {'msg': 'OMFG' , 'img':'http://i.imgur.com/nzOn3.gif'},
  {'msg': 'OMFG' , 'img':'http://i.imgur.com/hPOCQ.gif'},
  {'msg': 'wait wait, WHATCHU SAY?', 'img': 'http://i.imgur.com/0Dbrp.gif'},
  {'msg': '', 'img': 'http://media.tumblr.com/tumblr_m5j44q1psI1rqfksw.gif'},
]

PHP_TAGS = ['what-the-fuck', 'nope', 'are-you-kidding-me', 'disgust', 'horrified']


module.exports = (robot) ->
  robot.hear ///(
    ?: amo
     | adoro
     | i?\s+like(?:s)?
     | i?\s+love(?:s)?
     | me\s+gusta
    )\s+php///i, (msg) ->
    username = msg.message.user.name

    if msg.random([0, 1])
      tag = msg.random PHP_TAGS
      msg.send "#{username}, http://apps.whatcheerinc.com/replygif/#{tag}.gif"
    else
      message = msg.random PHP_MESSAGES
      msg.send "#{username}, #{message.msg} #{message.img}"
