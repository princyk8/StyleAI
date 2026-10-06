import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // ------------------------------------------------------------
  // API BASE URL
  // ------------------------------------------------------------
  //
  // Run with:
  //
  // flutter run --dart-define=API_BASE_URL=http://10.0.2.2:3000
  //
  // When no URL is provided, the service can still return demo
  // data so the UI does not crash.
  //
  // ------------------------------------------------------------

  static const String baseUrl =
  String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: '',
  );

  // ------------------------------------------------------------
  // GET
  // ------------------------------------------------------------

  Future<dynamic> get(
      String endpoint,
      ) async {
    if (baseUrl.isEmpty) {
      return null;
    }

    final url = Uri.parse(
      '$baseUrl$endpoint',
    );

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        if (response.body.isEmpty) {
          return null;
        }

        return jsonDecode(response.body);
      }
    } catch (_) {
      return null;
    }

    return null;
  }

  // ------------------------------------------------------------
  // POST
  // ------------------------------------------------------------

  Future<dynamic> post(
      String endpoint, {
        Map<String, dynamic>? body,
      }) async {
    if (baseUrl.isEmpty) {
      return null;
    }

    final url = Uri.parse(
      '$baseUrl$endpoint',
    );

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          body ?? {},
        ),
      );

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        if (response.body.isEmpty) {
          return null;
        }

        return jsonDecode(response.body);
      }
    } catch (_) {
      return null;
    }

    return null;
  }

  // ------------------------------------------------------------
  // PUT
  // ------------------------------------------------------------

  Future<dynamic> put(
      String endpoint, {
        Map<String, dynamic>? body,
      }) async {
    if (baseUrl.isEmpty) {
      return null;
    }

    final url = Uri.parse(
      '$baseUrl$endpoint',
    );

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          body ?? {},
        ),
      );

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        if (response.body.isEmpty) {
          return null;
        }

        return jsonDecode(response.body);
      }
    } catch (_) {
      return null;
    }

    return null;
  }

  // ------------------------------------------------------------
  // DELETE
  // ------------------------------------------------------------

  Future<dynamic> delete(
      String endpoint,
      ) async {
    if (baseUrl.isEmpty) {
      return null;
    }

    final url = Uri.parse(
      '$baseUrl$endpoint',
    );

    try {
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        if (response.body.isEmpty) {
          return null;
        }

        return jsonDecode(response.body);
      }
    } catch (_) {
      return null;
    }

    return null;
  }

  // ------------------------------------------------------------
  // OUTFITS
  // ------------------------------------------------------------

  Future<List<Map<String, dynamic>>> getOutfits() async {
    final result = await get(
      '/api/outfits',
    );

    if (result is List) {
      return result
          .whereType<Map>()
          .map(
            (item) => Map<String, dynamic>.from(item),
      )
          .toList();
    }

    return _demoOutfits;
  }

  // ------------------------------------------------------------
  // OUTFITS BY CATEGORY
  // ------------------------------------------------------------

  Future<List<Map<String, dynamic>>> getOutfitsByCategory(
      String category,
      ) async {
    final outfits =
    await getOutfits();

    if (category.trim().isEmpty ||
        category.toLowerCase() == 'all') {
      return outfits;
    }

    final search =
    category.trim().toLowerCase();

    return outfits.where(
          (outfit) {
        final outfitCategory =
        (outfit['category'] ?? '')
            .toString()
            .toLowerCase();

        final style =
        (outfit['style'] ?? '')
            .toString()
            .toLowerCase();

        return outfitCategory == search ||
            style == search;
      },
    ).toList();
  }

  // ------------------------------------------------------------
  // SINGLE OUTFIT
  // ------------------------------------------------------------

  Future<Map<String, dynamic>?> getOutfitById(
      String id,
      ) async {
    final outfits =
    await getOutfits();

    for (final outfit in outfits) {
      if (outfit['id'].toString() == id.toString()) {
        return outfit;
      }
    }

    return null;
  }

  // ------------------------------------------------------------
  // DEMO OUTFITS
  // ------------------------------------------------------------

  final List<Map<String, dynamic>> _demoOutfits = [
    {
      'id': '1',
      'name': 'Elegant Evening Dress',
      'category': 'Dresses',
      'style': 'Date Night',
      'rating': '4.8',
      'image': 'assets/images/dress.png',
    },
    {
      'id': '2',
      'name': 'Casual White Top',
      'category': 'Tops',
      'style': 'Casual',
      'rating': '4.6',
      'image': 'assets/images/look1.png',
    },
    {
      'id': '3',
      'name': 'Classic Denim Look',
      'category': 'Bottoms',
      'style': 'Casual',
      'rating': '4.7',
      'image': 'assets/images/look2.png',
    },
    {
      'id': '4',
      'name': 'Office Blazer',
      'category': 'Tops',
      'style': 'Office',
      'rating': '4.8',
      'image': 'assets/images/model.png',
    },
    {
      'id': '5',
      'name': 'Smart Office Trousers',
      'category': 'Bottoms',
      'style': 'Office',
      'rating': '4.7',
      'image': 'assets/images/look3.png',
    },
    {
      'id': '6',
      'name': 'Dinner Party Look',
      'category': 'Dresses',
      'style': 'Date Night',
      'rating': '4.9',
      'image': 'assets/images/reference.png',
    },
  ];
}