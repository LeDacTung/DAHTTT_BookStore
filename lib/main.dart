import 'package:flutter/material.dart';
import 'package:flutter_doan/sharepre/sharepreferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'SCREEN/SCREEN_ADMIN/screen_page.dart';
import 'SCREEN/SCREEN_ADMIN/screen_product/screen_add_product.dart';
import 'SCREEN/SCREEN_USER/sreen/screen_dashboard/screen_dashboard.dart';
import 'SCREEN/screen_login/screen_login.dart';
import 'SCREEN/screen_test.dart';
import 'SCREEN/screen_test2.dart';
import 'model/model_cart.dart';
import 'model/model_like.dart';

void main() {
  runApp(MyApp());
  configLoading();
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
    //..customAnimation = CustomAnimation();
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  SharePrefer sharePrefer = new SharePrefer();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProvider.value(
            value: ModelLike(),
          ),
        ],
        child: MaterialApp(
          title: 'Web bán sách',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(

            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          home: Stack(
            children: [
              //ScreenPageAdmin(email: "",currentTools: 2,),
              //ScreenDashboard(email: "",),
              //ScreenAddProduct(),
              ScreenLogin(),
              if(sharePrefer.getBoolLogin()== true && sharePrefer.getAdimORUser()=="USER")
                ScreenDashboard(email: sharePrefer.getAdimORUser(),),
              if(sharePrefer.getBoolLogin()== false)
                ScreenLogin(),
            ],
          ),
          builder: EasyLoading.init(),
          // initialRoute: ScreenLogin.routeName,
          // routes: routes,
        )
    );
  }
}


