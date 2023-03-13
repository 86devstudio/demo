import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import '../services/api_helper.dart';
// import '../services/sqlite_helper.dart';
import '../services/theme_helper.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  // ApiHelper api = ApiHelper();
  // SqliteHelper sqliteHelper=SqliteHelper.instance;
  final box = GetStorage();
  RxBool isDark = false.obs;
  Map<String, dynamic> optionData = {};
  //var words = <WordJa>[];

  @override
  void onInit() {
    //initOptionData();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  changeTheme() {
    ThemeHelper().switchTheme();
    isDark.value = ThemeHelper().loadThemeFromBox();
  }

/*
  Future<void> initOptionData() async {
    box.writeIfNull('option', {"word_sound": true, "right_sound": true, "error_sound": true, "auto_login": true});
    optionData = await box.read('option');
    update();
  }

  Future<void> saveOption(String key, bool value) async {
    if (key == 'word') {
      box.write('option', {
        "word_sound": value,
        "right_sound": optionData['right_sound'],
        "error_sound": optionData['error_sound'],
        "auto_login": optionData['auto_login']
      });
    } else if (key == 'right') {
      box.write('option', {
        "word_sound": optionData['word_sound'],
        "right_sound": value,
        "error_sound": optionData['error_sound'],
        "auto_login": optionData['tauto_login']
      });
    } else if (key == 'error') {
      box.write('option', {
        "word_sound": optionData['word_sound'],
        "right_sound": optionData['right_sound'],
        "error_sound": value,
        "auto_login": optionData['auto_login']
      });
    } else if (key == 'auto_login') {
      box.write('option', {
        "word_sound": optionData['word_sound'],
        "right_sound": optionData['right_sound'],
        "error_sound": optionData['error_sound'],
        "auto_login": value
      });
    }
    optionData = await box.read('option');
    update();
  }


Future<void> getJapanWords() async {
    try {
      if (words.isEmpty) {
        await api.getJapanWords().then((value) {
          words.assignAll(value!);
          update();
        });
      }
    } catch (e) {
      print(e);
    }
  }

 Future<void> getMyWordList() async {
    List<Map<String, dynamic>> data = await sqliteHelper.queryRows();
    try {
      var items = data.map<Word>((json) => Word.fromJson(json)).toList();
      wordMyList.assignAll(items);
      update();
    } catch (e) {
      Exception(e);
    }
  }

   Future<void> getMyTodoList() async {
      List<Map<String, dynamic>> data = await sqliteHelper.queryRows();
      try {
        var items =
        data.map<TodoModel>((json) => TodoModel.fromJson(json)).toList();
        todos.assignAll(items);
        update();
      } catch (e) {
        Exception(e);
      }
   }

  */
}
