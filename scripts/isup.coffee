# Description:
#   Is up?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot is <domain> up? - Checks if <domain> is up.
#
# Author:
#   marsam

module.exports = (robot) ->
  robot.respond /is (.*?) (up|down)(\?)?/i, (msg) ->
    domain = msg.match[1]
    msg.http("http://isitup.org/#{domain}.json")
      .header('User-Agent', 'Rambot')
      .get() (err, res, body) ->
        response = JSON.parse(body)
        if response.status_code is 1
          msg.send "#{response.domain} looks UP from here."
        else if response.status_code is 2
          msg.send "#{response.domain} looks DOWN from here."
        else if status_code is 3
          msg.send "Not sure, #{response.domain} returned an error."
