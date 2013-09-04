#!/usr/bin/env python
import hipchat
import sys

token=sys.argv[1]
room=sys.argv[2]
application=sys.argv[3]
user=sys.argv[4]
message="Application %s deployed by %s" % (application, user)
hipster = hipchat.HipChat(token=token)
hipster.message_room(room, 'Amazon Opsworks', message, color='purple')
