import 'dart:developer';

import 'package:flutter/widgets.dart';

class PackageList extends StatelessWidget {
final double width;
final List<Widget> children;
const PackageList({super.key, required this.width, required this.children});

  @override
  Widget build(BuildContext context) {

   final width= MediaQuery.sizeOf(context).width;
    final height= MediaQuery.sizeOf(context).height;
    log('$width x $height');
    if(width > 1000) {
      return  GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 4/6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:  children);
    }
    if(width > 790) {
      return  GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 4/5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:  children,
    );
    }
     return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children:children,
      ),
    );
  }
}