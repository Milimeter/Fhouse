//import 'package:connect/models/user.dart';

class Username{
  static String getUsername(String email){
     return "${email.split('@')[0]}";
  }
   
  

}
