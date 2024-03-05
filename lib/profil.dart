import 'package:applicationpef/EditProfile.dart';
import 'package:applicationpef/mainscreen.dart';
import 'package:applicationpef/widgets/Modif.dart';
import 'package:applicationpef/widgets/checkbox.dart';
import 'package:applicationpef/widgets/post.dart';
import 'package:flutter/material.dart';

class profil extends StatefulWidget {
  const profil({super.key});

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Center(
          child: Text(
            "Profil",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: "flu",
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // icône du menu ou de retour
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mainscreen()),
            );
            // Gérer l'action du bouton Leading ici
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 130,
                width: 130,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/4.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                "Meryam",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: Text(
                "Gamer",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EDIT()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 231, 226, 226),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text(
                    "Edit profil",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 19, 19, 19)),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Meryam@gmail.com",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                      color: Color.fromARGB(
                          255, 230, 221, 221)), // Add a line between the texts
                  const SizedBox(height: 20),
                  const Text(
                    "99 312 297",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                      color: Color.fromARGB(
                          255, 230, 221, 221)), // Add a line between the texts
                  const SizedBox(height: 20),
                  const Text(
                    "Tunisia",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                      color: Color.fromARGB(
                          255, 230, 221, 221)), // Add a line between the texts
                  const SizedBox(height: 20),
                  const Text(
                    "English",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                      color: Color.fromARGB(
                          255, 230, 221, 221)), // Add a line between the texts
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const Text("Hosting",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20),
                      Switch(
                          value: isSwitched,
                          activeColor: const Color(0xFF9BAB7C),
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          }),
                    ],
                  ),
                  if (isSwitched)
                    Column(
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text("Length of Stay "),
                            SizedBox(
                              width: 60,
                            ),
                            Modif(
                              taille: 180.0,
                              tailleh: 30,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          children: [
                            Text("Number of Guests "),
                            SizedBox(
                              width: 42,
                            ),
                            Modif(
                              taille: 180.0,
                              tailleh: 30,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          children: [
                            Text("I Live With"),
                            SizedBox(
                              width: 90,
                            ),
                            Modif(
                              taille: 180.0,
                              tailleh: 40,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("I can offer "),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text("Transport"),
                            const SizedBox(
                              width: 130,
                            ),
                            CustomCheckbox(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text("Dinner"),
                            const SizedBox(
                              width: 150,
                            ),
                            CustomCheckbox(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text("Tour Guide "),
                            const SizedBox(
                              width: 118,
                            ),
                            CustomCheckbox(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Restrictions: "),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text("No Smoking"),
                            const SizedBox(
                              width: 110,
                            ),
                            CustomCheckbox(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text("No Alcohol"),
                            const SizedBox(
                              width: 118,
                            ),
                            CustomCheckbox(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text("No Drugs"),
                            const SizedBox(
                              width: 128,
                            ),
                            CustomCheckbox(),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 231, 226, 226),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Text(
                              "Save ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 19, 19, 19)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      "Publication",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: "flu",
                          color: Color.fromARGB(255, 19, 19, 19)),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Post(
                      title:
                          "I would like to share my best trip ever to Switzerland with you.",
                      place: "Switzerland",
                      asset: "assets/images/10.jpg",
                      profil: "assets/images/4.jpg",
                      name: "Meryam",
                      date: "15/02/2024")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
