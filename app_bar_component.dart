import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/base.dart';
import '../helpers/system_ui_overlay_style_helper.dart';

class AppBarComponent extends StatelessWidget
    implements PreferredSizeWidget, Base {
  const AppBarComponent({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        // backgroundColor: Colors.blue,
        systemOverlayStyle: systemUiOverlayStyle(),
        titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: InkWell(
              onTap: () => Base.navigationController.globalKey.currentState!
                  .openDrawer(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://plus.unsplash.com/premium_photo-1689539137236-b68e436248de?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: Colors.white,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Habibur Rahman',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Base.locationTreceController.userAddress.value,
                    style: TextStyle(fontSize: 14),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFFF7643),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              // color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
