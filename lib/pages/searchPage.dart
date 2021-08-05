import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course_clone/theme/color.dart';
import 'package:online_course_clone/utils/searchPageJson.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      appBar: getAppBar(),
      body: getBody(size),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      title: Text(
        'Search',
        style: TextStyle(
          color: black
        ),
      ),
      actions: [
        IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: Icon(Icons.shopping_cart_outlined, color: black,),
        ),
      ],
    );
  }

  Widget getBody(size) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            Container(
              height: 45,
              width: (size.width - 30) * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: grey)
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: TextField(
                  cursorColor: black.withOpacity(0.5),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: black.withOpacity(0.5),),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: black.withOpacity(0.5))
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 45,
              width: (size.width - 30) * 0.11,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primary
              ),
              child: SvgPicture.asset("assets/images/filter.svg", height: 24, color: white,),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Column(
          children: List.generate(searchItems.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: 80,
                width: size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: hightLightGrey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (size.width - 50) * 0.17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(searchItems[index]['imageUrl']),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        width: (size.width -50) * 0.66,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              searchItems[index]['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${searchItems[index]['lesson']} Lesson",
                              style: TextStyle(
                                color: grey,
                                fontSize: 13
                              ),
                            ),
                            SizedBox(height: 5),
                            RatingBarIndicator(
                              rating: searchItems[index]['rating'],
                              itemCount: 5,
                              itemSize: 12.0,
                              direction: Axis.horizontal,
                              itemBuilder: (context, index) => Icon(Icons.star, color: secondary,)
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: (size.width -50) * 0.1,
                        child: Icon(Icons.arrow_forward_ios, size: 20,),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}