import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<dynamic> main() async {
  final httpPackageUrl = Uri.parse('https://random-data-api.com/api/v2/users?size=10');
  try {
  final httpPackageInfo = await http.get(httpPackageUrl);
  final httpPackageJson = (json.decode(httpPackageInfo.body) as List).cast<Map<String, dynamic>>().map((e) {
    return e.cast<String, String>();
  }).toList();
  Users users = Users(httpPackageJson);
  users.output();
  } catch (error){
    print('Error fetching data');
  }
}


class Users {
List<Map<String, String>> data;
Users(this.data);

output(){
  for (var user in data){
    print('UID: ${user['uid']}, NAME: ${user['first_name']} ${user['last_name']}');
  }
}

}
