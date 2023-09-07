import 'package:flutter/material.dart';
import 'package:healthcare_management_system/screens/SymptomsPage.dart';
import 'package:healthcare_management_system/utils/config.dart';

class SymptomsCard extends StatelessWidget {
  const SymptomsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      width: 180,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.heart_broken,
                        color: Config.primaryColor,
                        size: 36,
                      ),
                      Config.spaceSmall,
                      Text(
                        "Dental",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SymptomsPage(),
            ),
          );
        },
      ),
    );
  }
}


/*class IconCard extends StatelessWidget {
  const IconCard({Key? key, required this.icon, required this.label})
      : super(key: key);

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 15
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            /*Icon(
              icon as IconData?,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}*/