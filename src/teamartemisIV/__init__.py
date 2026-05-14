"""Movie Recommendation.

Recommending movies to users
"""

from importlib.metadata import PackageNotFoundError, version

try:
    __version__ = version("teamartemisIV")
except PackageNotFoundError:
    __version__ = "0.0.0+unknown"

__author__ = "Your name (or your team name)"
__email__ = "your.email@depaul.edu"

__all__ = ["__version__", "__author__", "__email__"]
