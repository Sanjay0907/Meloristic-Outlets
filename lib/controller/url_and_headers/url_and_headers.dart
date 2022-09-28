// URL
import 'dart:convert';

Uri registerUserURL = Uri.parse('http://improp.in/api/create_regi.php');
Uri checkRegistrationURL = Uri.parse('http://improp.in/api/check_regi.php');

// Headers

var headersJson = jsonEncode({
  "Content-type": "application/json",
  "Accept": "application/json",
});
