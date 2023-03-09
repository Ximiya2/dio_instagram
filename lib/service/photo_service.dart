import 'package:dio/dio.dart';
import '../config/doi_config.dart';
import '../models/photosModel.dart';
import '../network/api.dart';
import 'log_service.dart';

class GetPhotoService {
  static final GetPhotoService _inheritance = GetPhotoService._init();
  static GetPhotoService get inheritance => _inheritance;
  GetPhotoService._init();

  static Future<List<PhotosModel>?> getPhoto() async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().get(Urls.getPhoto);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<PhotosModel> photoList = [];
        for(var e in (res.data as List)) {
          photoList.add(PhotosModel.fromJson(e));
        }

        return photoList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if(e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());

    }
    return null;
  }
  //
  // static Future<bool> createCommet(CommentModel newPost) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().post(
  //         Urls.getComment,
  //         data:  {
  //           "name" : newPost.name,
  //           "email" : newPost.email,
  //           "body" : newPost.body,
  //         }
  //     );
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if(res.statusCode == 200 || res.statusCode == 201) {
  //       return true;
  //     } else {
  //       Log.e('${res.statusMessage} ${res.statusCode}');
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     if(e.response != null) {
  //       Log.e(e.response!.toString());
  //       return false;
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //     return false;
  //   }
  //   // return null;
  // }
  //
  // static Future<bool> editPhoto(PhotosModel newPost) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().put(
  //         Urls.updatePhoto + newPost.id.toString(),
  //         data:  {
  //           "title" : newPost.title,
  //           "url" : newPost.url,
  //           "thumbnailUrl" : newPost.thumbnailUrl,
  //         }
  //     );
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if(res.statusCode == 200 || res.statusCode == 201) {
  //       return true;
  //     } else {
  //       Log.e('${res.statusMessage} ${res.statusCode}');
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     if(e.response != null) {
  //       Log.e(e.response!.toString());
  //       return false;
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //     return false;
  //   }
  //   // return null;
  // }
  //
  // static Future<bool> deletePhoto(int id) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().delete(
  //       Urls.deleteComment + id.toString(),
  //     );
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if(res.statusCode == 200 || res.statusCode == 201) {
  //       return true;
  //     } else {
  //       Log.e('${res.statusMessage} ${res.statusCode}');
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     if(e.response != null) {
  //       Log.e(e.response!.toString());
  //       return false;
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //     return false;
  //   }
  //   // return null;
  // }
}

