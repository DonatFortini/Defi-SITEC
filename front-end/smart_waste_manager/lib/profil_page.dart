import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Center(
        child: Container(

            padding: const EdgeInsets.all(20),
            //color: ThemeData.light().primaryColor,
            child: Center(
                child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const Icon(
                      Icons.account_circle,
                      size: 50,
                    ),
                  ),
                  const Text(
                    "Nom :",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: const Text(
                      "Dupont",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Text(
                    "Prénom :",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: const Text(
                      "Jean",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Text(
                    "Téléphone :",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: const Text(
                      "06 94 61 38 74",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Text(
                    "Adresse mail :",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: const Text(
                      "dupont.dupond@gmail.com",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Text(
                    "Role :",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: const Text(
                      "Éboueur",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ))),
      ),
    );
  }
}
