import 'package:project_prak_tpm/controller/SharedPreferenceController.dart';
import 'package:project_prak_tpm/main.dart';
import 'package:project_prak_tpm/model/FavoriteModel.dart';

class FavoriteController {
  late List<FavoriteModel> favorite;
  String userEmail =
      SharedPreferenceController.sharedPrefData!.getString('email')!;
  FavoriteController() {
    checkNull();
  }

  bool checkFavorite(String type, String uuid) {
    FavoriteModel data = FavoriteModel(type: type, uuid: uuid);
    if (favorite.contains(data) && favorite != null) {
      return true;
    }
    return false;
  }

  void setFavorite(String type, String uuid) {
    String status;
    FavoriteModel dataFavorit = FavoriteModel(type: type, uuid: uuid);

    print('${favorite[0].type}, ${favorite[0].uuid}');
    print('${dataFavorit.type}, ${dataFavorit.uuid}');
    print(favorite.contains(dataFavorit));
    if (favorite.contains(dataFavorit)) {
      favorite.remove(dataFavorit);
      status = 'Remove Favorite to $userEmail-fav';
    } else {
      status = 'Add Favorite to $userEmail-fav';
      favorite.add(dataFavorit);
    }
    print("FAVORITE LOGIC: $status");
  }

  List<FavoriteModel> getFavorite(){
    return favorite;
  }

  void checkNull(){
    if (dataBox.get('$userEmail-fav') == null) {
      favorite = [];
    } else {
      favorite = dataBox.get('$userEmail-fav');
    }
  }
}
