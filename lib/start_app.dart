import 'package:flutter/material.dart';
import 'package:lemon_guard_frontend/constants/images_path.dart';
import 'package:lemon_guard_frontend/crops/home_crops.dart';
import 'package:lemon_guard_frontend/crops/monitoring_screen.dart';
import 'package:lemon_guard_frontend/upload_image/pick_image.dart';
import 'package:lemon_guard_frontend/users/signin_screen.dart';
import 'package:lemon_guard_frontend/users/signup_screen.dart';
//import 'package:lemon_guard_frontend/upload_image/pick_image.dart';


class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: Container(
                  height: h * 79,
                  width: w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            ImagesPath.cropBg,
                          ),
                          fit: BoxFit.cover)),
                )),
            Center(
              child: Container(
                  height: h * 79,
                  width: w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            ImagesPath.fondoSolo,
                          ),
                          fit: BoxFit.cover)),
                )
            ),
            Positioned(
              top: 300,
              child: Container(
                width: h * .49,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagesPath.logo), 
                    fit: BoxFit.scaleDown,
                  ),
                  borderRadius: BorderRadius.circular(1)
                ),
              ),
            ),
            Positioned(
                bottom: 30,
                child: Center(
                  child: Container(
                    height: h * .443, //.443
                    width: w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40)
                    ),
                    ),
                    
                    child: Padding(
                        padding: EdgeInsets.only(top: h * .032),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: w * .55,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const SignInScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green, // 
                                      //onSurface: Colors.white, //
                                       side: const BorderSide(
                                        color: Colors.white, // 
                                        width: 2.0, // 
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0), //
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 15.0), // 
                                    ),
                                    child: const Text(
                                      'Ingresar a cuenta',
                                      style: TextStyle(
                                        color: Colors.white, // 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0, // 
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: w*.08,
                                ),
                                SizedBox(
                                  width: w * .55,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green, // 
                                      //onSurface: Colors.white, //
                                       side: const BorderSide(
                                        color: Colors.white, // 
                                        width: 2.0, // 
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0), //
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 15.0), // 
                                    ),
                                    child: const Text(
                                      'Registrarse',
                                      style: TextStyle(
                                        color: Colors.white, // 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0, // 
                                      ),
                                    ),
                                  ),
                                ), // temporal
                                SizedBox(
                                  width: w * .55,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const HomeCrops()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green, // 
                                      //onSurface: Colors.white, //
                                       side: const BorderSide(
                                        color: Colors.white, // 
                                        width: 2.0, // 
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0), //
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 15.0), // 
                                    ),
                                    child: const Text(
                                      'temp',
                                      style: TextStyle(
                                        color: Colors.white, // 
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0, // 
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
    
}