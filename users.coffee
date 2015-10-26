Util = require("util")

module.exports = (robot) ->

    getAllUsers = ->
        users = []
        for _, v of (robot.brain.users() or { })
            users.push(v)
        return users

    robot.respond /list all users/i, (res) ->
        users = getAllUsers()
        switch users.length
            when 0
                res.send "There are no users."
            when 1
                res.send "There is 1 total user."
            else
                res.send "There are #{users.length} total users."
        for user in users
            res.send "```  #{Util.inspect(user)}```"

    robot.respond /list online users/i, (res) ->
        users = (user for user in getAllUsers() when user["slack"]["presence"] is "active")
        switch users.length
            when 0
                res.send "There are no online users."
            when 1
                res.send "There is 1 online user."
            else
                res.send "There are #{users.length} online users."
        for user in users
            res.send "```  #{Util.inspect(user)}```"
