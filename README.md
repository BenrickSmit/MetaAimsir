# MetaAimsir
<Brief>A weather application (written in Qt/C++) portable to mobile platforms with the help of Qt's IDE
  
# Instructions
Meta Aimsir starts up and automatically uses the GPS data provided to report on the weather. Every 20 minutes the program will use these exact coordinates it received to update the data.

It is possible to circumvent the GPS process by entering a city's name the location bar at the top of the main weather page. This will automatically turn off the GPS and will instead return the weather data received from quering the OpenWeatherMap.org servers for the name provided.

Meta Aimsir doesn't store any data and hence requires no permission except for internet connection permissions\

Note: if this program is run on a computer without access to any GPS data, the program might not return your current city's weather. In tihs case the program will default to New York. It is then up to you to add in your own city to receive weather data.

# Screenshots
[screenshot 1](beijing_screenshot.png)
[screenshot 2](quebec_screenshot.png)
[screenshot 3](brisbane_screenshot.png)
[screenshot 4](new_york_screenshot.png)
[screenshot 5](options_screenshot.png)

# License
This program is licensed under [GPLv3](LICENSE) [2019-present].
