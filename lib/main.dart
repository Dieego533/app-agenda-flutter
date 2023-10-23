import 'package:flutter/material.dart';
import 'package:mobile_dev_test/components/appointment_form.dart';
import 'package:mobile_dev_test/components/sign_up_form.dart';
import 'package:mobile_dev_test/main_authenticated.dart';
import 'package:mobile_dev_test/main_unauthenticated.dart';
import 'package:mobile_dev_test/utils/config.dart';
import 'package:mobile_dev_test/views/auth_page.dart';
import 'package:mobile_dev_test/views/booking_page.dart';
import 'package:mobile_dev_test/views/form_appointment_page.dart';
import 'package:mobile_dev_test/views/register_page.dart';
import 'package:mobile_dev_test/views/success_booked.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({Key? key, required this.prefs}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Appointment App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.

        //pre-define input decoration
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Config.primaryColor,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey.shade700,
            elevation: 10,
            type: BottomNavigationBarType.fixed),
      ),
      initialRoute: '/',
      routes: {
        //initial route
        '/': (context) => const MainUnauthenticated(),
        '/authenticated': (context) => MainAuthenticated(prefs: prefs),
        'main': (context) => const MainUnauthenticated(),
        '/signup': (context) => const RegisterPage(),
        '/login': (context) => const AuthPage(),
        '/booking': (context) => const BookingPage(),
        '/success_booking': (context) => const SuccessBooked(),
        '/appointment_form': (context) => const FormAppointmentPage()
      },
    );
  }
}
