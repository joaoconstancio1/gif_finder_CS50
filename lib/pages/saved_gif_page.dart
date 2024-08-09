import 'package:flutter/material.dart';
import 'package:gif_finder/pages/gif_page.dart'; // Importe da GifPage
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';

class SavedGifsPage extends StatefulWidget {
  const SavedGifsPage({super.key});

  @override
  State<SavedGifsPage> createState() => _SavedGifsPageState();
}

class _SavedGifsPageState extends State<SavedGifsPage> {
  Future<List<String>> _getSavedGifs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('saved_gifs') ?? [];
  }

  Future<void> _removeGif(String gifUrl) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedGifs = prefs.getStringList('saved_gifs') ?? [];

    // Remove o GIF da lista de salvos
    savedGifs.remove(gifUrl);

    await prefs.setStringList('saved_gifs', savedGifs);

    // Atualiza a tela
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text("Saved GIFs", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<List<String>>(
        future: _getSavedGifs(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No GIFs saved yet.",
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String gifUrl = snapshot.data![index];

                return Stack(
                  children: <Widget>[
                    GestureDetector(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: gifUrl,
                        height: 300.0,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        Map gifData = {
                          "title": "Saved GIF",
                          "images": {
                            "fixed_height": {"url": gifUrl}
                          }
                        };

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GifPage(gifData),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          _removeGif(gifUrl);
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
