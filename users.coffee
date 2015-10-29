# Description:
#   Get user statistics from server.
#
# Commands:
#   hubot list all users - List all users registered on server.
#   hubot list online users - List users currently online.

Util = require("util")

module.exports = (robot) ->

    getAllUsers = ->
        users = []
        for _, v of (robot.brain.users() or { })
            users.push(v)
        return users

    formatUsersResponse = (users) ->
        response = ""
        if users.length > 0
            response += "```  #{users[0].name}"
            for user in users[1..]
                response += "\n#{user.name}"
            response += "```"
        return response

    robot.respond /list all users/i, (res) ->
        users = getAllUsers()
        switch users.length
            when 0
                res.send "There are no users."
            when 1
                res.send "There is 1 total user."
            else
                res.send "There are #{users.length} total users."
        if users.length > 0
            res.send formatUsersResponse users

    robot.respond /list online users/i, (res) ->
        users = (user for user in getAllUsers() when user["slack"]["presence"] is "active")
        switch users.length
            when 0
                res.send "There are no online users."
            when 1
                res.send "There is 1 online user."
            else
                res.send "There are #{users.length} online users."
        if users.length > 0
            res.send formatUsersResponse users
