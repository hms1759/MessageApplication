import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lovemessage/model/model.dart';
class MessageForHerApiService{
  static Future<List<MessageModel>> getAllMessage() async{
    final getMessage=
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    final List responseBody = jsonDecode(getMessage.body);
    return responseBody.map((e) => MessageModel.fromJson(e)).toList();
  }
}



class FeatureMessageApiService{
  static Future<FeaturedModel> getFeaturedMSG() async{
    final getMessage=
    await http.get(Uri.parse('https://api.quotable.io/random?tags=technology,famous-quotes'));
    if(getMessage.statusCode== 200)
    {
      return FeaturedModel.fromJson(jsonDecode(getMessage.body));
    }
    else{
      throw Exception("Error loading request URL info");
    }
  }
}

// https://10.0.2.2:44343/api/MessageForHer/Message
// https://localhost:44388/api/Messages/Messages