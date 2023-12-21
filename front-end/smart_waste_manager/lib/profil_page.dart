import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.purple,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(50),
          height: 770,
          width: 500,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white,),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const Icon(
                Icons.account_circle,
                size: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 340, top: 10),
                child: Text(
                  "Nom :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
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

              const Padding(
                padding: EdgeInsets.only(right: 320, top: 30),
                child: Text(
                  "Prénom :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
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

              const Padding(
                padding: EdgeInsets.only(right: 300, top: 30),
                child: Text(
                  "Téléphone :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
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
              const Padding(
                padding: EdgeInsets.only(right: 280, top: 30),
                child: Text(
                  "Adresse mail :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
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
              const Padding(
                padding: EdgeInsets.only(right: 350, top: 30),
                child: Text(
                  "Role :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
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
        )
      )
    );
  }
}