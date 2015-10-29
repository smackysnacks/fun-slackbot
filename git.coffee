# Description:
#   Work with the scripts repository.
#
# Commands:
#   hubot git pull - Pull new scripts from Github repo.

Process = require("child_process")

module.exports = (robot) ->

    gitPull = (callback) ->
        git = Process.spawn("git", ["pull"], { cwd: "./scripts/" })
        git.stdout.on "data", callback

    robot.respond /git pull/i, (res) ->
        gitPull (data) ->
            res.send data.toString "utf8"
