# Running locally
# fix: ImportError: No module named mysite.api.timeutils
from os import path
MIGU_HOME = path.abspath(
    path.dirname(path.dirname(__file__))).replace('\\', '/')
# print MIGU_HOME
PROJECT_MYSITE_HOME = path.abspath(path.dirname(MIGU_HOME)).replace('\\', '/')
# print PROJECT_MYSITE_HOME
import sys
# if MIGU_HOME not in sys.path:
#     sys.path.append(MIGU_HOME)
if PROJECT_MYSITE_HOME not in sys.path:
    sys.path.append(PROJECT_MYSITE_HOME)

from mysite.depend import requests
