# Description:
#   Store log
#
# Dependencies:
#   cradle
#
# Configuration:
#
#
# Commands:
#   none
#
# Author:
#   marsam


COUCHDB_HOSTNAME = process.env.COUCHDB_HOSTNAME
COUCHDB_USERNAME = process.env.COUCHDB_USERNAME
COUCHDB_PASSWORD = process.env.COUCHDB_PASSWORD
COUCHDB_DATABASE = process.env.COUCHDB_DATABASE


cradle = require "cradle"

connection = new(cradle.Connection) COUCHDB_HOSTNAME, 443, {
  secure: true
  auth: {username: COUCHDB_USERNAME, password: COUCHDB_PASSWORD}
}


module.exports = (robot) ->
  db = connection.database(COUCHDB_DATABASE)
  db.exists (err, exists) ->
    if not exists
      db.create()

  robot.hear /.*$/i, (msg) ->
    #console.log msg.envelope
    message = msg.message
    return if not message.user.id?

    message.date = new Date().toJSON()

    db.save message, (err, res) ->
      if err then console.error(err)
