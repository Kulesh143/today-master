import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
final FirebaseAuth auth=FirebaseAuth.instance;
final GoogleSignIn googleSignIn=new GoogleSignIn();
Future<bool>signInWithGoogle()async{
  final GoogleSignInAccount account=await googleSignIn.signIn();
  final GoogleSignInAuthentication authentication=await account.authentication;
  final GoogleAuthCredential credential=GoogleAuthProvider.credential(idToken: authentication.idToken,accessToken: authentication.accessToken);
  final UserCredential authResult=await auth.signInWithCredential(credential);
  final User user=authResult.user;
  if(user!=null&&user.isAnonymous==false){
    return true;
  }else{
    return false;
  }
}
Future<bool>SignOut()async{
  await auth.signOut();
  return true;
}