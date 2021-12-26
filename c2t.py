import gi
gi.require_version('Geoclue', '2.0')

from sys import argv
from gi.repository import Geoclue
from timezonefinder import TimezoneFinder

clue = Geoclue.Simple.new_sync(
        '',
        Geoclue.AccuracyLevel.NEIGHBORHOOD,
        None)

location = clue.get_location()
latitude = location.get_property('latitude')
longitude = location.get_property('longitude')

tzf = TimezoneFinder()

print(tzf.timezone_at(lat=latitude, lng=longitude))
