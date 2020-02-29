import 'package:UVLightApp/models/service_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {


    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();


  Future<ServiceResultAndStatus> signInWithGoogle() async{

    try{

        final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

        if(googleSignInAccount == null){
          return new ServiceResultAndStatus(isSuccess: false,errormessage: "noselection",resultdata: null);
        }
       
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.getCredential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          final AuthResult authResult = await _auth.signInWithCredential(credential);
          final FirebaseUser user = authResult.user;

          assert(!user.isAnonymous);
          assert(await user.getIdToken() != null);

          final FirebaseUser currentUser = await _auth.currentUser();
          assert(user.uid == currentUser.uid);


          return new ServiceResultAndStatus(isSuccess: true,errormessage: null,resultdata: user);

        
    }
    catch(e){
         return new ServiceResultAndStatus(isSuccess: false,errormessage: e.toString(),resultdata: null);
    }



  }

  Future<bool> isUserLoggedIn() async {
    var user = await _auth.currentUser();
    return user != null;
  }

  Future<FirebaseUser> currentUserLoggedInInfo() async {
    var user = await _auth.currentUser();
    return user;
  }

  Future signOutWithGoogle() async{

    await googleSignIn.signOut();
   await googleSignIn.disconnect();

   var dssa = 0;

  }

    Future signInWithFacebook() async{

      //TODO
    await null;

  }

    Future signOutWithFacebook() async{

      //TODO
    await null;

  }


}