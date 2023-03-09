import 'package:dio/dio.dart';
import '../config/doi_config.dart';
import '../models/postModel.dart';
import '../network/api.dart';
import 'log_service.dart';

class GetPostService {
  static final GetPostService _inheritance = GetPostService._init();
  static GetPostService get inheritance => _inheritance;
  GetPostService._init();

  static Future<List<PostModel>?> getPost() async {
    // Log.i('===============');
    try {
      Response res = await DioConfig.inheritentce.createRequest().get(Urls.getPosts);
      // Log.i('+++++++++++++++++++++');
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<PostModel> userList = [];
        for(var e in (res.data as List)) {
          userList.add(PostModel.fromJson(e));
        }

        return userList;
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

  static Future<bool> createPost(PostModel newPost) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().post(
          Urls.getPosts,
              data:  {
            "userId" : newPost.userId,
            "title" : newPost.title,
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

  static Future<bool> editPost(PostModel newPost) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().put(
          Urls.updatePosts + newPost.userId.toString(),
          data:  {
            "userId" : newPost.userId,
            "title" : newPost.title,
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

  static Future<bool> deletePost(int id) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().delete(
          Urls.deletePosts + id.toString(),
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

