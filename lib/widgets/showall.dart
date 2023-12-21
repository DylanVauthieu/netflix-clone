import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';
import 'package:netflix_clone/screens/screens.dart';

class ShowAll extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const ShowAll({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 75.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 2/3,
              ),
              itemCount: contentList.length,
              itemBuilder: (BuildContext context, int index) {
                  final Content content = contentList[index];

                  return GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayContent(
                            contentInfo: content,
                          ),
                        ),
                      )
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(content.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                    ),
                  );
                },
            ),
          )
        ],
      ),
    );
  }
}