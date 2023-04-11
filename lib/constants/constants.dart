import 'package:get/get.dart';
import 'package:supabase_app/view/Auth/login_screen.dart';
import 'package:supabase_app/view/Auth/registration_screen.dart';
import 'package:supabase_app/view/employee/add_employee_screen.dart';
import 'package:supabase_app/view/home_screen.dart';
import 'package:supabase_app/view/profile/edit_profile_screen.dart';
import 'package:supabase_app/view/profile/profile_screen.dart';

const SUPABASE_URL = 'https://nuuccpdulpkjnlqfxkdi.supabase.co';
const SUPABASE_ANON_KEY =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51dWNjcGR1bHBram5scWZ4a2RpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODA3NzUyNTgsImV4cCI6MTk5NjM1MTI1OH0.-lL4ZGF_sGRuWiMRYv9SxAeKTa3pEaNk8JN2dqWc5VA';

List<GetPage<dynamic>> pageRoute = [
  GetPage(name: '/', page: () => HomeScreen()),
  GetPage(name: '/login', page: () => LoginScreen()),
  GetPage(name: '/register', page: () => RegisterScreen()),
  GetPage(name: '/profile', page: () => ProfileScreen()),
  GetPage(name: '/editProfileScreen', page: () => EditProfileScreen()),
  GetPage(name: '/addEmployeeScreen', page: () => AddEmployeeScreen()),
];
