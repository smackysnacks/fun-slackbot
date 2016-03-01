# Description:
#   Restart hubot
#
# Commands:
#   hubot restart - Restart the hubot daemon.

Process = require("child_process")

module.exports = (robot) ->

    robot.respond /restart/i, (res) ->
        process.exit()
