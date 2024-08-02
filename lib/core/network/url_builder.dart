class UrlBuilder {
  final String apiKey;
  final String baseUrl;

  UrlBuilder(this.apiKey, this.baseUrl);

  Uri getWeatherUrl(double lat, double lng) {
    return Uri.parse('$baseUrl/weather?lat=$lat&lon=$lng&appid=$apiKey');
  }

  Uri getForecastUrl(double lat, double lng) {
    return Uri.parse('$baseUrl/forecast?lat=$lat&lon=$lng&appid=$apiKey');
  }

  Uri getForecastFiveDaysUrl(double lat, double lng) {
    return Uri.parse('$baseUrl/forecast/daily?lat=$lat&lon=$lng&appid=$apiKey');
  }
}
