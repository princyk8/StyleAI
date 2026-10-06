import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class TryOnService {
  static const String baseUrl =
  String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: '',
  );

  // ------------------------------------------------------------
  // TRY ON
  // ------------------------------------------------------------
  //
  // This method sends the selected image and outfit ID to the
  // backend when API_BASE_URL is configured.
  //
  // Otherwise it returns the original image path so the app
  // remains usable in demo mode.
  //
  // ------------------------------------------------------------

  Future<String?> tryOn({
    required File photo,
    required String outfitId,
  }) async {
    // Demo mode
    if (baseUrl.isEmpty) {
      return photo.path;
    }

    try {
      final uri = Uri.parse(
        '$baseUrl/api/tryon',
      );

      final request =
      http.MultipartRequest(
        'POST',
        uri,
      );

      request.fields['outfitId'] =
          outfitId;

      request.files.add(
        await http.MultipartFile.fromPath(
          'photo',
          photo.path,
        ),
      );

      final streamedResponse =
      await request.send();

      final response =
      await http.Response.fromStream(
        streamedResponse,
      );

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        if (response.body.isEmpty) {
          return photo.path;
        }

        final data =
        jsonDecode(response.body);

        if (data is Map<String, dynamic>) {
          final result =
              data['result'] ??
                  data['image'] ??
                  data['url'];

          if (result != null) {
            return result.toString();
          }
        }

        return photo.path;
      }
    } catch (_) {
      // Return the original image in demo/failure mode.
    }

    return photo.path;
  }

  // ------------------------------------------------------------
  // CHECK API CONFIGURATION
  // ------------------------------------------------------------

  bool get isApiConfigured {
    return baseUrl.isNotEmpty;
  }
}