# Description:
#   Peanut butter jelly time.
#
# Commands:
#   hubot jelly time - You know what time it is.

module.exports = (robot) ->

    jellytimes = [
        "https://media.giphy.com/media/gxkAEIItFY33G/giphy.gif",
        "https://media.giphy.com/media/IB9foBA4PVkKA/giphy.gif",
        "http://i.imgur.com/Ys5cz0T.gif",
        "http://images6.fanpop.com/image/photos/35900000/pinkie-pie-__peanut-butter-jelly-time-my-little-pony-friendship-is-magic-35981359-150-150.gif",
        "http://orig15.deviantart.net/98ca/f/2011/362/b/f/peanut_butter_jelly_time_by_hawksmack-d4kjrp8.gif"
    ]

    robot.respond /jelly time/i, (res) ->
        res.send res.random jellytimes
