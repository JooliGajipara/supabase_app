import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_app/constants/constants.dart';
import 'package:supabase_app/my_app.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );
  runApp(const MyApp());
}
