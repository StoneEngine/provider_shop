import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/providers/item_provider.dart';
import 'package:provider_shop/providers/user_profile_provider.dart';
import 'package:provider_shop/screens/edit_item_screen.dart';
import 'package:provider_shop/screens/edit_username_screen.dart';

class ItemListScreen extends StatelessWidget {
  static const routeName = '/';
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ดึงชื่อผู้ใช้มาแสดงใน AppBar
    final username = context.watch<UserProfileProvider>().username;

    return Scaffold(
      appBar: AppBar(
        title: Text('รายการสินค้า (ผู้ใช้: $username)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditUsernameScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<ItemProvider>(
        builder: (ctx, itemProvider, child) => ListView.builder(
          itemCount: itemProvider.items.length,
          itemBuilder: (_, i) {
            final item = itemProvider.items[i];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.description),
              trailing: Text('฿${item.price.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.of(
                  context,
                ).pushNamed(EditItemScreen.routeName, arguments: item.id);
              },
            );
          },
        ),
      ),
    );
  }
}
