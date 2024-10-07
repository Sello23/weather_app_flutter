enum WeatherCondition {
  clouds('clouds'),
  rain('rain'),
  snow('snow'),
  drizzle('drizzle'),
  clear('clear'),
  thunderstorm('thunderstorm');

  const WeatherCondition(this.name);

  final String name;
}

class Condition {
  Map<String, String> getBackgroundValue(String condition) {
    if (condition == WeatherCondition.clouds.name) {
      return {"cloudy_background": "cloudy_grey"};
    } else if (condition == WeatherCondition.clear.name) {
      return {"clear_background": "sunny_blue"};
    } else if (condition == WeatherCondition.drizzle.name) {
      return {"rainy_background": "rainy_grey"};
    } else if (condition == WeatherCondition.rain.name) {
      return {"rainy_background": "rainy_grey"};
    } else if (condition == WeatherCondition.snow.name) {
      return {"thunderstorm_background": "thunderstorm_grey"};
    } else if (condition == WeatherCondition.thunderstorm.name) {
      return {"thunderstorm_background": "thunderstorm_grey"};
    } else {
      return {"rainy_background": "rainy_grey"};
    }
  }
}
