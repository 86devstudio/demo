import 'package:flutter/services.dart';
//import '../models/category.dart';
import '../configs/constants.dart';

class ApiHelper {
  /*
  Future loadCategoryList() async {
    var assetPath = 'assets/jsons/word_category.json';
    var response = await rootBundle.loadString(assetPath);
    var data = json.decode(response).cast<Map<String, dynamic>>();

    try {
      var jsonData = data.map<UnitCarteory>((json) => UnitCarteory.fromJson(json)).toList();

      return jsonData;
    } catch (e) {
      Exception(e);
    }
  }

  Future<List<WordJa>?> getJapanWords() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "LIST";
      map['code'] = "japanese_verb100";
      map['api_key'] = Configs.BaseApiKey;
      map['secret_key'] = Configs.BaseApiSecret;
      //map['location'] = window.location.href;
      //print(map['location']);

      var url = Uri.parse(Constants.BaseApiUrlPath + "words/word_ctr.php");
      var client = http.Client();
      var response = await client.post(url, body: map);

      if (response.statusCode == 200) {
        var res = convert.jsonDecode(response.body);

        if (res['success']) {
          var data = res['data'].cast<Map<String, dynamic>>();
          return data.map<WordJa>((json) => WordJa.fromJson(json)).toList();
        } else {
          customSnackbar(title: 'Error',message: res['message'], backgroundColor: Colors.red.withOpacity(0.5));
        }
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
    return null;
  }
  */
}
