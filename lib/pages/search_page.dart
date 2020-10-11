/*import 'package:flutter/material.dart';
import 'package:vayfee/data/discovery.dart';
import 'package:vayfee/theme/colors.dart';
import 'package:vayfee/widgets/search_category_item.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: size.width - 30,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldBackground,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: white.withOpacity(0.3),
                      ),
                    ),
                    style: TextStyle(
                      color: white.withOpacity(0.3),
                    ),
                    cursorColor: white.withOpacity(0.4),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 5,
              ),
              child: Row(
                children: List.generate(searchCategories.length, (index) {
                  return CategoryStoryItem(name: searchCategories[index]);
                }),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          
        ],
      ),
    );
  }
}
*/
/*Wrap(
            spacing: 1,
            runSpacing: 1,
            children: List.generate(
              searchImages.length,
              (index) {
                return Container(
                  width: (size.width - 3) / 3,
                  height: (size.width - 3) / 1.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(searchImages[index]['postImg']),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),*/
