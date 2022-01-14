import 'dart:convert';
import 'dart:io';
import 'package:recipe_app/recipe.dart';
import 'package:http/http.dart' as http;

class HttpService {

  //List<Recipe> _recipes = List.empty();

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(
      Uri.parse('https://raw.githubusercontent.com/dscxnnected/recipe-list/main/recipe.json'),
      headers: {
        HttpHeaders.accessControlAllowOriginHeader: "*",
        HttpHeaders.accessControlAllowHeadersHeader: "*",
        HttpHeaders.authorizationHeader: '',
      },
    );

    print(response.body);
    var recipes = <Recipe>[];

    if (response.statusCode == 200) {
      /*List<dynamic> responseJson = jsonDecode(response.body);

    List<Recipe> recipes = responseJson.map((dynamic item) => Recipe.fromJson(item)).toList();

    return recipes;*/

      var responseJson = jsonDecode(response.body);
      for (var recipeJson in responseJson) {
        print(Recipe.fromJson(recipeJson));
        recipes.add(Recipe.fromJson(recipeJson));
      }

    }

    return recipes;
    //return Recipe.fromJson(responseJson);
  }
  
  void sendPUTrequest() async {
    String str = "{\"message\": \"message\", \"content\": \"WwogIHsKICAgICJuYW1lIjogIkhDVCBUb2FzdGllIiwKICAgICJkZXNjcmlwdGlvbiI6ICJBIHl1bW15IGNoYW5nZSBvZiB3b3JkcyIsCiAgICAic2VydmluZ3MiOiA0LAogICAgImlzVmVnYW4iOiBmYWxzZSwKICAgICJpc1ZlZ2V0YXJpYW4iOiBmYWxzZSwKICAgICJwcmVwVGltZSI6IDIwLAogICAgImNvb2tUaW1lIjogMTAsCiAgICAiaW5ncmVkaWVudHMiOiBbCiAgICAgICJIYW0iLAogICAgICAiQ2hlZXNlIiwKICAgICAgIlRvbWF0byIsCiAgICAgICJCcmVhZCIsCiAgICAgICJCdXR0ZXIiCiAgICBdLAogICAgImluc3RydWN0aW9ucyI6IFsKICAgICAgIlN0ZXAgMTogbG9hZCB1cCB0aGlzIiwKICAgICAgIlN0ZXAgMjogZG8gdGhpcyIsCiAgICAgICJTdGVwIDM6IGRvIHRoYXQiCiAgICBdCiAgfSwKICB7CiAgICAibmFtZSI6ICJCTFQgQnVyZ2VyIiwKICAgICJkZXNjcmlwdGlvbiI6ICJBIHl1bW15IGZvb2QiLAogICAgInNlcnZpbmdzIjogNCwKICAgICJpc1ZlZ2FuIjogZmFsc2UsCiAgICAiaXNWZWdldGFyaWFuIjogZmFsc2UsCiAgICAicHJlcFRpbWUiOiAyMCwKICAgICJjb29rVGltZSI6IDEwLAogICAgImluZ3JlZGllbnRzIjogWwogICAgICAiSGFtIiwKICAgICAgIkNoZWVzZSIsCiAgICAgICJUb21hdG8iLAogICAgICAiQnJlYWQiLAogICAgICAiQnV0dGVyIgogICAgXSwKICAgICJpbnN0cnVjdGlvbnMiOiBbCiAgICAgICJTdGVwIDE6IGxvYWQgdXAgdGhpcyIsCiAgICAgICJTdGVwIDI6IGRvIHRoaXMiLAogICAgICAiU3RlcCAzOiBkbyB0aGF0IgogICAgXQogIH0sCiAgewogICAgIm5hbWUiOiAiQ2Fib25hcmEiLAogICAgImRlc2NyaXB0aW9uIjogImFub3RoZXIgbmV3IGNoYW5nZSEiLAogICAgInNlcnZpbmdzIjogNCwKICAgICJpc1ZlZ2FuIjogZmFsc2UsCiAgICAiaXNWZWdldGFyaWFuIjogZmFsc2UsCiAgICAicHJlcFRpbWUiOiAyMCwKICAgICJjb29rVGltZSI6IDEwLAogICAgImluZ3JlZGllbnRzIjogWwogICAgICAiSGFtIiwKICAgICAgIkNoZWVzZSIsCiAgICAgICJUb21hdG8iLAogICAgICAiQnJlYWQiLAogICAgICAiQnV0dGVyIgogICAgXSwKICAgICJpbnN0cnVjdGlvbnMiOiBbCiAgICAgICJTdGVwIDE6IGxvYWQgdXAgdGhpcyIsCiAgICAgICJTdGVwIDI6IGRvIHRoaXMiLAogICAgICAiU3RlcCAzOiBkbyB0aGF0IgogICAgXQogIH0KXQ\", \"sha\": \"010430359ee7ab034cc39bd8b8371cedebef8127\"}";

    final response = await http.put(
      Uri.parse("https://api.github.com/repos/dscxnnected/recipe-list/contents/recipe.json"),
      headers: {
        HttpHeaders.accessControlAllowOriginHeader: "*",
        HttpHeaders.accessControlAllowHeadersHeader: "*",
        HttpHeaders.authorizationHeader: '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',
      },
      body: str
    );
    final response2 = await http.post(
        Uri.parse("https://api.github.com/repos/dscxnnected/recipe-list/contents/recipe.json"),
        headers: {
          HttpHeaders.accessControlAllowOriginHeader: "*",
          HttpHeaders.accessControlAllowHeadersHeader: "*",
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer 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',
        },
    );
    final response3 = http.Request('POST', Uri.parse("https://api.github.com/repos/dscxnnected/recipe-list/contents/recipe.json")/*Uri.parse("https://jsonplaceholder.typicode.com/posts")*/);
    var client = http.Client();
    response3.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer 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'});
    response3.body = str;
    var streamedResponse = await client.send(response3).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
    client.close();

    print("Response 1: "+ response.statusCode.toString());
    print("Response 2: "+ response2.statusCode.toString());
    /*
    if (response.statusCode == 200) {
      return true;
    }
    return false;*/
  }
}