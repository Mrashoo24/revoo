import 'package:http/http.dart' as http;

class AllApi{

  Future<String> sendEmail({
required String subject,
required String content,
 required String toEmail,
}) async {
var url = Uri.parse(
"http://faizeetech.com/post-mail.php?to=$toEmail&subject=$subject&content=$content");
var response = await http.get(url);

if (response.statusCode == 200) {
return 'success';
} else {
return 'failed';
}
}

}