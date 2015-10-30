# Description:
#   Peanut butter jelly time.
#
# Commands:
#   hubot jelly time - You know what time it is.

module.exports = (robot) ->

    robot.respond /jelly time/i, (res) ->
        res.send "https://media.giphy.com/media/gxkAEIItFY33G/giphy.gif"
