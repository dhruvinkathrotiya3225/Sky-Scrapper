import 'dart:convert';

import 'package:corona_cases/models/cases.dart';
import 'package:http/http.dart' as http;

class CoronaCaseAPIheplers {
  CoronaCaseAPIheplers._();

  static final CoronaCaseAPIheplers coronaCaseAPIheplers =
      CoronaCaseAPIheplers._();

  final String API = "https://disease.sh/v3/covid-19/countries";

  Future<List<Coronacase>?> featchapidata() async {
    http.Response res = await http.get(Uri.parse(API));

    if (res.statusCode == 200) {
      List decodeCode = jsonDecode(res.body);

      print(decodeCode);

      List<Coronacase> cases =
          decodeCode.map((e) => Coronacase.fromMap(data: e)).toList();

      return cases;
    }
  }
}
