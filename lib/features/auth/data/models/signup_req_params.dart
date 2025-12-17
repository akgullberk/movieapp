
class SignupReqParams {
    final String email;
    final String password;
    
  SignupReqParams({
    required this.email,
    required this.password,
  });


/*************  ✨ Windsurf Command ⭐  *************/
  /// Converts the object to a map that can be used to send a request to the API.
/*******  e0dedd88-d1cf-42fd-a556-fb6e4505e355  *******/
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

}
