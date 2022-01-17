import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:recipe_app/recipe.dart';
import 'package:recipe_app/recipefields.dart';

class RecipeSheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "flutterrecipeapp-338212",
  "private_key_id": "f3f1118642ef6799e3db69d4a261dba8575dd473",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCjWiACPjfquXN0\nWLdtJ1XmtQmvowyt/he+zng7vJJA7WtLkpkK7NkmwjtdBs4S6/xHCNnQJMB2X7t0\noPUMraVCrqYO1qQCgwXwLeNDMiRSySU//OsIZGbg+m3QTz0vMa5e+Tt23JDADChf\nK4RTAlKV4saTwLoX0JrwsUxdk570BLrW6ciG40wYDC2rFhbF8h1IQ2p8/sNy0rkF\nDwRqW2jq3udc+w4OvfNhGItgj7AbmjXWJQFf+RLK74lN/W/tR/N/jwME9JIQJEtU\n5vTRjsgk4eV9Kk1I2HpM39zkz5JSZOpqvHmryx+O8EzzhrhazbR0K866YGNslFAV\nfkzpjJ8VAgMBAAECggEAQHdo+nmjh7b4oYoBmcpUVGBOGkq2zlPg+yRwvuKEtar9\nFS4dx/oBGRK+atAss7r+LOqJS2O1sQHG8Rg0nXRKLC7QyjpbL8KVrVvuvK4lN6a6\nVK5z8zPshg1PGU6sTtvEfSbPGPGjDqe9pxF9f2UDQrPkuprs1kk1XJgcEzIXISW6\n7iubS2A/JpycB/aU6mLvT2S3s8AElS3HlWAI0UmxCapJXkZXHcbF8ItxBH8zK+uL\n62nz5j06vDXPoqewVw4iTujtpwUlUrevINw7F4KiEvn/TYCWXoOKJvYeufY0sHlh\ne7WLDOsPlHAMXBnAjSTPGtCio7At83K7F2QrnmwaYQKBgQDa6tRLwX0kyDu1bHkB\ncZ93pPdrm8byt+AGKRtIJfyYEobqDnZia6FFdJ2SMrrxGcI+vIHwudS3xMORE9Fg\n+YvN5GNNVEcjh2i7fXUlCYLB0XaN46tbs6MT7s1Fdj6Ysum5VdRja+wn20AvF7Dq\nz0ez9uSRaT7E+lSXs7d5nr1GkwKBgQC/BcD78yHLEwseU33+wKWxkk/OLWUvJQfL\nIyRK8Ug5utrFPUJXL9eD9pon+h9C0RRN+YJywV60P+QcuebSjC2ablIl0HtEA5Nl\nyjAM377OIRj4B7hkfKSRGg0mmD9FaiF1IQgClm/obKoC+XfsrM5962zMM0BTbHY2\ngAgzeXOktwKBgQCVzGyarfrhKXbaDTC8ETDqoOKBKuY2/iV4cbZuZzfyI3NYQ680\nZ6vCKCsOeFI9Wr/1R+6ud6qcWTLtWh9C+V918tsUdh/7qtO6v/1h66Ei2R8Dto9y\nP3jO0fB6oI/y0zJllNqxcY72Muw3jUGNW2sYNVBwRBEknps1908MFNg1qwKBgG22\nl03eKhWh/WvQlnggG8qud0m7BveZ9Cz3JRwqEsqdiJNqiNTctJKlq4q0fQn6Xgge\n+45/g65RV+or1+gr/PFK1cHESVgaGamIBCsQw11O4zFp9b05Xae9Z7o4DXcH6umE\nLD6YOvQqnUcSE5AK/JqUAiwSb6q6i/bneE5gPkxnAoGATAGQa025wcequJIsK0GX\nhx4vAyz686QNQjt0HR2nlKC/Z5ASOwwbxOCEHwPABG6w8Mw7VtApLLlZi3QrhmHy\nBC+3vd1hk6VYo/cpRNPs4b4RMjn+Knvopy/zP15eSiI92HPJDM0yJTe4IztZ3gpD\nDZefOnmeAIDDtEsJlnIQs5U=\n-----END PRIVATE KEY-----\n",
  "client_email": "fluttergsheets@flutterrecipeapp-338212.iam.gserviceaccount.com",
  "client_id": "101683242241509876185",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fluttergsheets%40flutterrecipeapp-338212.iam.gserviceaccount.com"
}
''';
  static final _spreadsheetID = '19tgAQh70yxrXoXsVP8jfaq-fU63kIi1zCC5AAqbcIAU';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _recipeSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetID);
      _recipeSheet = await _getWorkSheet(spreadsheet, title: 'Recipes');

      final firstRow = RecipeFields.getFields();
      _recipeSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }

  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet, {required String title,}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_recipeSheet == null) return;

    _recipeSheet!.values.map.appendRows(rowList);
  }

  static Future<int> getRowCount() async {
    if (_recipeSheet == null) return 0;

    final lastRow = await _recipeSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;

  }

  static Future<List<Recipe>> fetchRecipes() async {
    if (_recipeSheet == null) return <Recipe>[];

    final recipes = await _recipeSheet!.values.map.allRows();
    return recipes == null ? <Recipe>[] : recipes.map(Recipe.newfromJson).toList();

  }

}