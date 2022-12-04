import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemonapp/info_page.dart';
import 'package:pokemonapp/model/model_pokemon.dart';
import 'package:pokemonapp/model/search_model.dart';
import 'package:pokemonapp/service/get_pokemon_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokemonModel> _searchData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FutureBuilder(
          future: GetPokemonService.getPokemon(),
          builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
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
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 31),
                          child: Image.asset("assets/image.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1),
                          child: TextFormField(
                            showCursor: false,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: "Buscar Pokemon",
                                filled: true,
                                fillColor: Color(0xffE5E5E5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                )),
                            onChanged: (String userInput) {
                              SearchModel.searchedData.clear();
                              setState(() {});
                              for (Pokemon element
                                  in GetPokemonService.resData!.pokemon) {
                                setState(
                                  () {
                                    if (userInput.isEmpty) {
                                      SearchModel.searchedData.add(element);
                                    } else if (element.name!
                                        .toLowerCase()
                                        .contains(userInput.toLowerCase())) {
                                      SearchModel.searchedData.add(element);
                                    }
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoPage(
                                        data:
                                            SearchModel.searchedData[index])));
                          },
                          child: Stack(
                            children: [
                              // SvgPicture.asset("assets/PokemonImg.svg"),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 80, right: 10, left: 10),
                                child: Container(
                                  width: 177,
                                  height: 115.18,
                                  decoration: BoxDecoration(
                                    color: Color(0xfFFC7CFF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 10,
                                child: Column(
                                  children: [
                                    Image.network(snapshot
                                        .data!.pokemon[index].img
                                        .toString()),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 15,
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        height: 27.42,
                                        width: 154,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff676767),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                                "#${snapshot.data!.pokemon[index].num.toString()}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xffF993FB))),
                                            Text(
                                                snapshot
                                                    .data!.pokemon[index].name
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: (snapshot.data!.pokemon.length),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
