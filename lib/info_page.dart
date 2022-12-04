import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemonapp/home_page.dart';
import 'package:pokemonapp/service/get_pokemon_service.dart';

import 'model/model_pokemon.dart';

class InfoPage extends StatelessWidget {
  final Pokemon data;
  const InfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: GetPokemonService.getPokemon(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Image.asset("assets/image.png")),
                  Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("#${data.num.toString()}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xffFC7CFF))),
                              Text(data.name.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff000000))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80, left: 7),
                          child: Container(
                            width: 375,
                            height: 205,
                            decoration: BoxDecoration(
                                color: Color(0xfFFC7CFF),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 75,
                          child: Column(
                            children: [
                              Image.network(
                                data.img.toString(),
                                scale: 0.52,
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 38,
                        width: 174,
                        decoration: BoxDecoration(
                            color: Color(0xffFCA600),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Fuego",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      Container(
                        height: 38,
                        width: 174,
                        decoration: BoxDecoration(
                            color: Color(0xff0083FC),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Volador",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      flex: 0,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xfFFC7CFF),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(60)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Altura",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Catergoria",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Debilidad",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Text(
                                        data.height.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40),
                                      child: Text(
                                        "Llama",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Water",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "Electric",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "Rock",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 130, top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Peso",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 10),
                                        child: Text(
                                          "Sexo",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 37, vertical: 8),
                                      child: Text(
                                        data.weight.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 35),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/vs_sex-female.svg"),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            SvgPicture.asset(
                                                "assets/vs_sex-male.svg"),
                                          ],
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 10),
                                                child: Text(
                                                  "Habilidades",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 1),
                                                child: Text(
                                                  "Mar Llamas",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset("assets/pokimg.png"),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
