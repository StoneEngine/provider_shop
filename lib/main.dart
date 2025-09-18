import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/providers/item_provider.dart';
import 'package:provider_shop/providers/user_profile_provider.dart';
import 'package:provider_shop/screens/edit_item_screen.dart';
import 'package:provider_shop/screens/item_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ItemProvider()),
        ChangeNotifierProvider(create: (ctx) => UserProfileProvider()),
      ],
      child: MaterialApp(
        title: 'Provider Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(secondary: Colors.deepOrange),
        ),
        initialRoute: '/',
        routes: {
          ItemListScreen.routeName: (ctx) => const ItemListScreen(),
          EditItemScreen.routeName: (ctx) => const EditItemScreen(),
        },
      ),
    );
  }
}
