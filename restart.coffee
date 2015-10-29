# Description:
#   Restart hubot
#
# Commands:
#   hubot restart - Restart the hubot daemon.

Process = require("child_process")

modules.exports = (robot) ->

    robot.respond /restart/i, (res) ->
        Process.spawn("sudo", ["systemctl", "restart", "hubot"])
