
# See:
# http://en.wikipedia.org/wiki/List_of_HTTP_status_codes
# http://www.iana.org/assignments/http-status-codes/http-status-codes.xml
# http://www.flickr.com/photos/girliemac/sets/72157628409467125/with/6508022985/
# http://httpstatuscats.com/
#


Array::pushArray = (arr) ->
  this.push.apply(this, arr)


# Unassigned http status codes
UNASSIGNED = []
UNASSIGNED.pushArray [103..199]
UNASSIGNED.pushArray [209..225]
UNASSIGNED.pushArray [227..299]
UNASSIGNED.pushArray [309..399]
UNASSIGNED.pushArray [432..499]
UNASSIGNED.pushArray [512..599]


HTTP_CODES =
  # 1xx: Informational
  100: [ # Continue
    'http://25.media.tumblr.com/tumblr_lwjgzc5VCs1qzhbl2o1_1280.jpg',
  ]
  101: [ # Switching Protocols
    'http://24.media.tumblr.com/tumblr_lwjgzc5VCs1qzhbl2o2_1280.jpg',
  ]
  102: [ # Processing
  ]
  # 2xx: Success
  200: [ # OK
    'http://24.media.tumblr.com/tumblr_lwjgxg7jrJ1qzhbl2o1_1280.jpg',
  ]
  201: [ # Created
    'http://25.media.tumblr.com/tumblr_lwjgxg7jrJ1qzhbl2o2_1280.jpg',
  ]
  202: [ # Accepted
    'http://25.media.tumblr.com/tumblr_lwjgxg7jrJ1qzhbl2o3_1280.jpg',
  ]
  203: [ # Non-Authoritative Information
  ]
  204: [ # No Content
    'http://24.media.tumblr.com/tumblr_lwjgxg7jrJ1qzhbl2o4_1280.jpg'
  ]
  205: [ # Reset Content
  ]
  206: [ # Partial Content
    'http://25.media.tumblr.com/tumblr_lwjgxg7jrJ1qzhbl2o5_1280.jpg',
  ]
  207: [ # Multi-Status
    'http://25.media.tumblr.com/tumblr_lwjgxg7jrJ1qzhbl2o6_1280.jpg',
  ]
  208: [ # Already Reported
  ]
  226: [ # IM Used
  ]
  # 3xx: Redirection
  300: [ # Multiple Choices
    'http://25.media.tumblr.com/tumblr_lwjgtfRJGj1qzhbl2o2_1280.jpg'
  ]
  301: [ # Moved Permanently
    'http://25.media.tumblr.com/tumblr_lwjgtfRJGj1qzhbl2o3_1280.jpg',
  ]
  302: [ # Found
    'http://24.media.tumblr.com/tumblr_lwjgtfRJGj1qzhbl2o1_1280.jpg',
  ]
  303: [ # See Other
    'http://25.media.tumblr.com/tumblr_lwjgtfRJGj1qzhbl2o4_1280.jpg'
  ]
  304: [ # Not Modified
    'http://25.media.tumblr.com/tumblr_lwjgtfRJGj1qzhbl2o5_1280.jpg',
  ]
  305: [ # Use Proxy
    'http://24.media.tumblr.com/tumblr_lwjgtfRJGj1qzhbl2o6_1280.jpg',
  ]
  306: [ # Reserved
  ]
  307: [ # Temporary Redirect
    'http://25.media.tumblr.com/tumblr_lwjgtfRJGj1qzhbl2o7_1280.jpg',
  ]
  308: [ # Permanent Redirect
  ]
  # 4xx: Client Error
  400: [ # Bad Request
    'http://24.media.tumblr.com/tumblr_lwjgmsfFs31qzhbl2o1_1280.jpg',
  ]
  401: [ # Unauthorized
    'http://24.media.tumblr.com/tumblr_lwjgmsfFs31qzhbl2o2_1280.jpg'
  ]
  402: [ # Payment Required
    'http://24.media.tumblr.com/tumblr_lwjgmsfFs31qzhbl2o3_1280.jpg'
  ]
  403: [ # Forbidden
    'http://25.media.tumblr.com/tumblr_lwjgmsfFs31qzhbl2o4_1280.jpg',
  ]
  404: [ #  Not Found
    'http://25.media.tumblr.com/tumblr_lwjgmsfFs31qzhbl2o5_1280.jpg',
  ]
  405: [ #  Method Not Allowed
    'http://25.media.tumblr.com/tumblr_lwjgmsfFs31qzhbl2o6_1280.jpg',
  ]
  406: [ #  Not Acceptable
    'http://25.media.tumblr.com/tumblr_lwjgmsfFs31qzhbl2o7_1280.jpg',
  ]
  407: [ #  Proxy Authentication Required
  ]
  408: [ #  Request Timeout
    'http://24.media.tumblr.com/tumblr_lwjgmsfFs31qzhbl2o8_1280.jpg',
  ]
  409: [ #  Conflict
    'http://24.media.tumblr.com/tumblr_lwjgmsfFs31qzhbl2o9_1280.jpg',
  ]
  410: [ #  Gone
    'http://25.media.tumblr.com/tumblr_lwjgd4GlG21qzhbl2o7_1280.jpg',
  ]
  411: [ #  Length Required
    'http://24.media.tumblr.com/tumblr_lwjgd4GlG21qzhbl2o6_1280.jpg',
  ]
  412: [ #  Precondition Failed
  ]
  413: [ #  Request Entity Too Large
    'http://25.media.tumblr.com/tumblr_lwjgd4GlG21qzhbl2o5_1280.jpg',
  ]
  414: [ #  Request-URI Too Long
    'http://25.media.tumblr.com/tumblr_lwjgd4GlG21qzhbl2o4_1280.jpg',
  ]
  415: [ #  Unsupported Media Type
  ]
  416: [ #  Requested Range Not Satisfiable
    'http://24.media.tumblr.com/tumblr_lwjgd4GlG21qzhbl2o3_1280.jpg',
  ]
  417: [ #  Expectation Failed
    'http://25.media.tumblr.com/tumblr_lwjgd4GlG21qzhbl2o2_1280.jpg',
  ]
  418: [ #  I'm a teapot
    'http://25.media.tumblr.com/tumblr_lwjgd4GlG21qzhbl2o1_1280.jpg'
  ]
  422: [ #  Unprocessable Entity
    'http://24.media.tumblr.com/tumblr_lwjg4pjFFI1qzhbl2o1_1280.jpg',
  ]
  423: [ #  Locked
    'http://24.media.tumblr.com/tumblr_lwjg4pjFFI1qzhbl2o2_1280.jpg',
  ]
  424: [ #  Failed Dependency
    'http://24.media.tumblr.com/tumblr_lwjg4pjFFI1qzhbl2o3_1280.jpg',
  ]
  425: [ #  Unassigned
    'http://24.media.tumblr.com/tumblr_lwjg4pjFFI1qzhbl2o4_1280.jpg',
  ]
  426: [ #  Upgrade Required
    'http://25.media.tumblr.com/tumblr_lwjg4pjFFI1qzhbl2o5_1280.jpg',
  ]
  427: [ #  Unassigned
  ]
  428: [ #  Precondition Required
  ]
  429: [ #  Too Many Requests
    'http://25.media.tumblr.com/tumblr_lwjg4pjFFI1qzhbl2o6_1280.jpg',
  ]
  430: [ #  Unassigned
  ]
  431: [ #  Request Header Fields Too Large
    'http://24.media.tumblr.com/tumblr_lwjg4pjFFI1qzhbl2o7_1280.jpg',
  ]
  444: [ #  No response
    'http://24.media.tumblr.com/tumblr_lwjg4pjFFI1qzhbl2o8_1280.jpg',
  ]
  450: [ # Blocked by Windows Parental Controls
    'http://24.media.tumblr.com/tumblr_lwjg4pjFFI1qzhbl2o8_1280.jpg',
  ]
  # 5xx: Server Error
  500: [ # Internal Server Error
    'http://25.media.tumblr.com/tumblr_lwjfwtx7P81qzhbl2o1_1280.jpg',
  ]
  501: [ # Not Implemented
  ]
  502: [ # Bad Gateway
    'http://24.media.tumblr.com/tumblr_lwjfwtx7P81qzhbl2o2_1280.jpg',
  ]
  503: [ # Service Unavailable
    'http://24.media.tumblr.com/tumblr_lwjfwtx7P81qzhbl2o11_1280.jpg',
  ]
  504: [ # Gateway Timeout
  ]
  505: [ # HTTP Version Not Supported
  ]
  506: [ # Variant Also Negotiates (Experimental)
    'http://25.media.tumblr.com/tumblr_lwjfwtx7P81qzhbl2o12_1280.jpg',
  ]
  507: [ # Insufficient Storage
    'http://25.media.tumblr.com/tumblr_lwjfwtx7P81qzhbl2o3_1280.jpg',
  ]
  508: [ # Loop Detected
    'http://24.media.tumblr.com/tumblr_lwjfwtx7P81qzhbl2o4_1280.jpg',
  ]
  509: [ # Bandwidth Limit Exceeded
    'http://24.media.tumblr.com/tumblr_lwjfwtx7P81qzhbl2o5_1280.jpg'
  ]
  510: [ # Not Extended
  ]
  511: [ # Network Authentication Required
  ]
  599: [ # Network connect timeout error
    'http://25.media.tumblr.com/tumblr_lwjfwtx7P81qzhbl2o6_1280.jpg',
  ]

module.exports = (robot) ->
  robot.respond /httpcats ?(\d{3})?/i, (msg) ->
    httpcode = parseInt msg.match[1]
    if httpcode
      unless HTTP_CODES[httpcode]? or httpcode in UNASSIGNED
        msg.send "Nice try #{httpcode} is an unassigned http code"
      else
        msg.send HTTP_CODES[httpcode]
    else
      msg.send '42'
