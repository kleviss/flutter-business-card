import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final bool hasNetworkImage;
  final String? imageUrl;
  final String title;
  final String subtitle;

  const ImageCard(
      {super.key,
      required this.hasNetworkImage,
      this.imageUrl,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 110.0,
        height: 100.0,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Asset Image is used to load the image from the assets folder
              Container(
                width: 45.0,
                height: 45.0,
                transform: Matrix4.translationValues(0.0, -2.0, 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: hasNetworkImage
                        ? NetworkImage(imageUrl!)
                        : // Asset image with path to the images/germany.jpg
                        AssetImage(
                            imageUrl!,
                          ) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 0.0,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 107, 4),
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  letterSpacing: 1.0,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
