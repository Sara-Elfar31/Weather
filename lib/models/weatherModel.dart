class WeatherModel {
  final String name;
  final String country;
  final String condition;
  final String icon;
  final String date;
  final double maxtemp;
  final double mintemp;
  final double avgtemp;

  WeatherModel({
    required this.name,
    required this.country,
    required this.condition,
    required this.icon,
    required this.date,
    required this.maxtemp,
    required this.mintemp,
    required this.avgtemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    String iconUrl = json['forecast']['forecastday'][0]['day']['condition']['icon'] ?? '';
    if (!iconUrl.startsWith('http')) {
      iconUrl = 'https:$iconUrl';
    }

    return WeatherModel(
      name: json['location']['name'] ?? '',
      country: json['location']['country'] ?? '',
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'] ?? '',
      icon: iconUrl,
      date: json['forecast']['forecastday'][0]['date'] ?? '',
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c']?.toDouble() ?? 0.0,
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c']?.toDouble() ?? 0.0,
      avgtemp: json['forecast']['forecastday'][0]['day']['avgtemp_c']?.toDouble() ?? 0.0,
    );
  }
}