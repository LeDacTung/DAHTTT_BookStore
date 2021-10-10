import 'dart:html';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_page.dart';
import 'package:flutter_doan/SCREEN/SCREEN_USER/sreen/screen_dashboard/screen_dashboard.dart';
import 'package:flutter_doan/SCREEN/screen_login/screen_login.dart';
import 'package:flutter_doan/bloc/login_bloc.dart';
import 'package:flutter_doan/model/model_thanhvien.dart';
import 'package:flutter_doan/service.dart';
import 'package:flutter_doan/sharepre/sharepreferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenSignUp extends StatefulWidget {
  static String routeName = "/signup";

  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  _ScreenSignUpState createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  bool isHover =false;
  String emailSignIn="";
  String passSignIn="";

  String emailSignUp="";
  String passSignUp="";
  String nameSignUp="";
  String phoneSignUp="";
  String addressSignUp="";
  String answerSignUp="";
  final String sCauhoi="Bạn thích con vật gì";
  final String sMaTV="2";

  TextEditingController _emailControllerSignUp=  new TextEditingController();
  TextEditingController _passControllerSignUp=  new TextEditingController();
  TextEditingController _nameControllerSignUp=  new TextEditingController();
  TextEditingController _diachiControllerSignUp=  new TextEditingController();
  TextEditingController _sdtControllerSignUp=  new TextEditingController();
  TextEditingController _cautraloiControllerSignUp=  new TextEditingController();


  LoginBloc bloc = new LoginBloc();

  List<ModelThanhVien> modelTvs=[];

  SharePrefer prefer = new SharePrefer();

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Stack(
                    children: [
                      Image.asset(
                        "bg.png",
                        fit: BoxFit.cover,
                        height: size.height,
                        width: size.width,
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child:  Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white,
                                    width: 3
                                ),
                              ),
                              child:  Icon(
                                Icons.book,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8,),
                            Text(
                              "WEB BOOK",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "WELCOME BACK",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 28,
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                "To keep connected with us please\nlogin with your personal info",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.green.shade100,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: size.height*0.1,),
                              CustomBtnSignInUp(
                                isHover: isHover,
                                func: (){
                                  //Navigator.pushNamed(context, ScreenLogin.routeName);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ScreenLogin())
                                  );
                                },
                                size: size,
                                text: "Sign In",
                              ),

                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child:  Container(
                      color: Colors.white,
                      child:SingleChildScrollView(
                          child: SafeArea(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "SIGN UP TO THE WEB BOOK",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff045808),
                                    fontSize: 30,
                                  ),
                                ),
                                SizedBox(height: size.height*0.01,),
                                Text(
                                  "Sign up continue\nHãy điền đủ thông tin để đăng ký tài khoản",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    color: Colors.green.shade200,
                                    fontSize: 16,
                                  ),
                                ),

                                SizedBox(height: size.height*0.05,),
                                CustomTextFielEmail(
                                  iconData: Icons.email_outlined,
                                  size: size,
                                  hintText: "Email",
                                  errorText: "",
                                  onChanged: (value){

                                  },
                                  textInputAction: TextInputAction.next,
                                  controller:  _emailControllerSignUp,
                                ),

                                SizedBox(height: size.height*0.01,),
                                CustomTextFielEmail(
                                  iconData: Icons.people_outline,
                                  size: size,
                                  hintText: "Name",
                                  errorText: "",
                                  onChanged: (value){

                                  },
                                  textInputAction: TextInputAction.next,
                                  controller:  _nameControllerSignUp,
                                ),

                                SizedBox(height: size.height*0.01,),
                                CustomTextFielEmail(
                                  iconData: Icons.phone_outlined,
                                  size: size,
                                  hintText: "Phone",
                                  errorText: "",
                                  onChanged: (value){

                                  },
                                  textInputAction: TextInputAction.next,
                                  controller:  _sdtControllerSignUp,
                                ),

                                SizedBox(height: size.height*0.01,),
                                CustomTextFielEmail(
                                  iconData: Icons.location_on_outlined,
                                  size: size,
                                  hintText: "Address",
                                  errorText: "",
                                  onChanged: (value){

                                  },
                                  textInputAction: TextInputAction.next,
                                  controller:  _diachiControllerSignUp,
                                ),

                                SizedBox(height: size.height*0.01,),
                                CustomTextFielPasseword(
                                  iconData: Icons.lock_outline_rounded,
                                  size: size,
                                  hintText: "Password",
                                  errorText: "",
                                  onChanged: (value){

                                  },
                                  textInputAction: TextInputAction.next,
                                  controller: _passControllerSignUp,
                                ),

                                SizedBox(height: size.height*0.02,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "  Question : "+sCauhoi,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: Colors.green.shade500,
                                        fontSize: 16,
                                      ),
                                    ),

                                    CustomTextFielEmail(
                                      iconData: Icons.question_answer_outlined,
                                      size: size,
                                      hintText: "Answer",
                                      errorText: "",
                                      onChanged: (value){

                                      },
                                      textInputAction: TextInputAction.next,
                                      controller:  _cautraloiControllerSignUp,
                                    ),
                                  ],
                                ),


                                SizedBox(height: size.height*0.05,),
                                InkWell(
                                  onHover: (value){
                                  },
                                  onTap: (){
                                    EasyLoading.show(status: "Loading...");
                                    signUpUser(
                                        _emailControllerSignUp.text,
                                        _passControllerSignUp.text,
                                        _nameControllerSignUp.text,
                                        _diachiControllerSignUp.text,
                                        _sdtControllerSignUp.text,
                                        sCauhoi,
                                        _cautraloiControllerSignUp.text,
                                        sMaTV
                                    ).then((value){
                                      if(value == "success"){
                                        Fluttertoast.showToast(msg:"Log: "+value);
                                        EasyLoading.showSuccess("Sign up success");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => ScreenDashboard(email: _emailControllerSignUp.text))
                                        );
                                      }else{
                                        EasyLoading.showError("Error");
                                      }
                                    });

                                  },
                                  child: Container(
                                    width:size.width/3,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color:  Color(0xff045808),
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child:Text(
                                      "Sign Up",
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white ,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 22
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                      )
                  )

              ),
            ],
          ),
        ),
      ),
    );
  }

}


