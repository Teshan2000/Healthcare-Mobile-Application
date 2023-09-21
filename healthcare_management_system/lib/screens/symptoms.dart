import 'package:flutter/material.dart';
import 'package:healthcare_management_system/components/customAppBar.dart';
import '../components/doctorCard.dart';
import '../utils/config.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({
    Key? key,
    /*required this.doctor,
    required this.isFav,*/
  }) : super(key: key);

  /*final Map<String, dynamic> doctor;
  final bool isFav;*/

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Fever",
        //icon: const FaIcon(Icons.arrow_back_ios),
        icon: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(
              //icon: FaIcon(
              //isFav ? Icons.favourite_rounded : Icons.favourite_outline,
              //isFav ? Icons.favorite : Icons.favorite_border_outlined,
              Icons.favorite_border_outlined,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Center(
                    child: const Text(
                      "If you have Fever,",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    "                 Measure Your Temperature",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    "                 Take Paracetamol pills",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    "                 Take some rest",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Config.spaceSmall,
                // Container(
                //   padding: const EdgeInsets.all(80),
                //   margin: const EdgeInsets.only(bottom: 0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       Text(
                //         "Measure Your Temperature",
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         softWrap: true,
                //         textAlign: TextAlign.justify,
                //       ),
                //       Text(
                //         "Take Paracetamol pills",
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         softWrap: true,
                //         textAlign: TextAlign.justify,
                //       ),
                //       Text(
                //         "Take some rest",
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         softWrap: true,
                //         textAlign: TextAlign.justify,
                //       ),
                //     ]
                //   ),
                // ),
                Text(
                  "   Choose Your Doctor",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: List.generate(10, (index) {
                    return const DoctorCard();
                  }),
                )
              ]),
        ),
      ),
    );
  }
}
