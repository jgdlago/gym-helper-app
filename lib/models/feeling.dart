import 'package:flutter/foundation.dart';

class Feeling extends ChangeNotifier {
  String id;
  String feeling;
  String date;

  Feeling(
    {required this.id, required this.feeling, required this.date});

  Feeling.fromMap(Map<String, dynamic> map)
      :id = map["id"],
      feeling = map["feeling"],
      date = map["date"];

    Map<String, dynamic> toMap() {
    return {
      "id": id,
      "feeling": feeling,
      "date": date,
    };
  }
}

class FeelingState extends ChangeNotifier {
  final List<Feeling> feelings;

  FeelingState(this.feelings);

  void removeFeeling(Feeling feeling) {
    feelings.remove(feeling);
    notifyListeners();
    
  }
}