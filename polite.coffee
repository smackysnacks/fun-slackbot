module.exports = (robot) ->
    robot.hear new RegExp("thank(s| you) #{robot.name}", "i"), (res) ->
        user = res.message.user.name
        thanks = [
            "You're welcome #{user}",
            "No problem #{user}",
            "Think nothing of it #{user}",
            "My pleasure #{user}",
            "Yea, whatever #{user}"
        ]
        res.send res.random thanks