import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // ============================================================
  // KEYS
  // ============================================================

  static const String _savedOutfitsKey =
      'style_ai_saved_outfits';

  // ============================================================
  // GET SAVED OUTFIT IDS
  // ============================================================

  Future<List<String>> getSavedOutfitIds() async {
    final prefs =
    await SharedPreferences.getInstance();

    final rawData =
    prefs.getString(_savedOutfitsKey);

    // Nothing has been saved yet.
    if (rawData == null || rawData.isEmpty) {
      return <String>[];
    }

    try {
      final decoded =
      jsonDecode(rawData);

      if (decoded is List) {
        return decoded
            .map(
              (item) => item.toString(),
        )
            .toList();
      }
    } catch (_) {
      // If the stored value is damaged,
      // return an empty list instead of crashing.
    }

    return <String>[];
  }

  // ============================================================
  // CHECK WHETHER AN OUTFIT IS SAVED
  // ============================================================

  Future<bool> isOutfitSaved(
      String outfitId,
      ) async {
    final savedIds =
    await getSavedOutfitIds();

    return savedIds.contains(
      outfitId.toString(),
    );
  }

  // ============================================================
  // SAVE OUTFIT
  // ============================================================

  Future<void> saveOutfit(
      String outfitId,
      ) async {
    final prefs =
    await SharedPreferences.getInstance();

    final savedIds =
    await getSavedOutfitIds();

    final id =
    outfitId.toString();

    // Prevent duplicate IDs.
    if (!savedIds.contains(id)) {
      savedIds.add(id);
    }

    await prefs.setString(
      _savedOutfitsKey,
      jsonEncode(savedIds),
    );
  }

  // ============================================================
  // REMOVE OUTFIT
  // ============================================================

  Future<void> removeOutfit(
      String outfitId,
      ) async {
    final prefs =
    await SharedPreferences.getInstance();

    final savedIds =
    await getSavedOutfitIds();

    savedIds.remove(
      outfitId.toString(),
    );

    await prefs.setString(
      _savedOutfitsKey,
      jsonEncode(savedIds),
    );
  }

  // ============================================================
  // TOGGLE SAVE / UN_SAVE
  // ============================================================
  //
  // Returns:
  // true  = outfit is now saved
  // false = outfit is now removed
  //
  // ============================================================

  Future<bool> toggleOutfit(
      String outfitId,
      ) async {
    final alreadySaved =
    await isOutfitSaved(outfitId);

    if (alreadySaved) {
      await removeOutfit(outfitId);
      return false;
    }

    await saveOutfit(outfitId);
    return true;
  }

  // ============================================================
  // CLEAR ALL SAVED OUTFITS
  // ============================================================

  Future<void> clearSavedOutfits() async {
    final prefs =
    await SharedPreferences.getInstance();

    await prefs.remove(
      _savedOutfitsKey,
    );
  }

  // ============================================================
  // SAVED OUTFIT COUNT
  // ============================================================

  Future<int> getSavedCount() async {
    final savedIds =
    await getSavedOutfitIds();

    return savedIds.length;
  }
}