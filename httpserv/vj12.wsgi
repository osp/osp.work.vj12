import os
import sys

os.chdir(os.path.dirname(__file__))
sys.path.append(os.path.dirname(__file__))

import vj12
import bottle

application = bottle.default_app()
