module.exports = (robot) ->

    getSummonCount = (user) ->
        return robot.brain.get("summon_" + user + "_count") or 0

    setSummonCount = (user, value) ->
        robot.brain.set("summon_" + user + "_count", value)

    robot.listenerMiddleware (context, next, done) ->
        # don't increment summon count on summon commands
        if !context.listener.options?.summon
            user = context.response.message.user.name
            summonCount = getSummonCount(user)
            setSummonCount(user, summonCount + 1)
        next()

    robot.respond /summon count/i, summon: true, (res) ->
        users = []
        for _, v of robot.brain.users() or {}
            users.push({name: v.name, count: getSummonCount(v.name)})

        res.send "Summon counts"
        response = ""
        if users.length > 0
            response += "```#{users[0].name} - #{users[0].count}"
            for user in users[1..]
                response += "\n#{user.name} - #{user.count}"
            response += "```"
        res.send response
