import 'package:nutrition_guru/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //drawer header: logo
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.gradient_sharp,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              //shop tile

              MyListTile(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () => Navigator.pushNamed(context, '/store_page')),

              //cart tile

              MyListTile(
                  text: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () => {
                        //go drawer first
                        Navigator.pop(context),
                        //go to cart
                        Navigator.pushNamed(context, '/cart_page')
                      }),
            ],
          ),

          //exit shop tile

          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
                text: "Exit",
                icon: Icons.logout,
                onTap: () => {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/intro_page', (route) => false)
                    }),
          )
        ],
      ),
    );
  }
}
