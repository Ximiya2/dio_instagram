import 'package:dio/dio.dart';

import '../config/doi_config.dart';
import '../models/AlbumsModel.dart';
import '../network/api.dart';
import 'log_service.dart';

class GetAlbumsService {
  static final GetAlbumsService _inheritance = GetAlbumsService._init();
  static GetAlbumsService get inheritance => _inheritance;
  GetAlbumsService._init();

  static Future<List<AlbumsModel>?> getAlbums() async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().get(Urls.getAlbums);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<AlbumsModel> AlbumsList = [];
        for(var e in (res.data as List)) {
          AlbumsList.add(AlbumsModel.fromJson(e));
        }

        return AlbumsList;
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

  static Future<bool> createAlbums(AlbumsModel newPost) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().post(
          Urls.getAlbums,
          data:  {
            "id" : newPost.id,
            "title" : newPost.title,
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

  static Future<bool> editAlbums(AlbumsModel newPost) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().put(
          Urls.updateAlbums + newPost.id.toString(),
          data:  {
            "id" : newPost.id,
            "title" : newPost.title,
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

  static Future<bool> deleteAlbums(int id) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().delete(
        Urls.deleteAlbums + id.toString(),
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

