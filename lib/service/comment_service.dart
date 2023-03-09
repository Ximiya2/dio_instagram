import 'package:dio/dio.dart';
import '../config/doi_config.dart';
import '../models/commentModel.dart';
import '../network/api.dart';
import 'log_service.dart';

class GetCommetService {
  static final GetCommetService _inheritance = GetCommetService._init();
  static GetCommetService get inheritance => _inheritance;
  GetCommetService._init();

  static Future<List< CommentModel>?> getCommet() async {
    // Log.i('===============');
    try {
      Response res = await DioConfig.inheritentce.createRequest().get(Urls.getComment);
      // Log.i('+++++++++++++++++++++');
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<CommentModel> commetList = [];
        for(var e in (res.data as List)) {
          commetList.add(CommentModel.fromJson(e));
        }

        return commetList;
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

  static Future<bool> createCommet(CommentModel newPost) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().post(
          Urls.getComment,
          data:  {
            "name" : newPost.name,
            "email" : newPost.email,
            "body" : newPost.body,
          }
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      if(e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
    // return null;
  }

  static Future<bool> editComment(CommentModel newPost) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().put(
          Urls.updateComment + newPost.id.toString(),
          data:  {
            "name" : newPost.name,
            "email" : newPost.email,
            "body" : newPost.body,
          }
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      if(e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
    // return null;
  }

  static Future<bool> deleteCommet(int id) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().delete(
        Urls.deleteComment + id.toString(),
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      if(e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
    // return null;
  }
}

