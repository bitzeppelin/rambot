# Description:
#   Update commits.
#
# Dependencies:
#   underscore.js
#
# Configuration:
#   1. Change your "room"
#   2. Add your hubot route (e.g myhubot.example.com/hubot/commits/) in
#      https://github.com/:user/:repo/admin/hooks
#
# Author:
#   marsam

_ = require('underscore')


module.exports = (robot) ->
  robot.router.post '/hubot/commits', (req, res) ->
    payload = JSON.parse(req.body.payload)
    url = payload.repository.url
    name = payload.repository.name

    user = robot.userForId 'broadcast'
    user.room = '#mula2'
    user.type = 'groupchat'

    if payload.ref is "refs/heads/master"
      robot.send user, "New commits in #{name}: #{url}"
      nro_commits = payload.commits.length
      if nro_commits <= 3
        _.each payload.commits, (data) -> robot.send user, "#{data.author.name}: #{data.message} // #{data.id}"

      else
        robot.send user, "#{nro_commits} new commits to #{payload.after}"

    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end "Thanks"

# vim:cuc:cc=80:
