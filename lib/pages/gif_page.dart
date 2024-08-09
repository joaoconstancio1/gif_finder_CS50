import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GifPage extends StatelessWidget {
  final Map _gifData;

  const GifPage(this._gifData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          _gifData["title"],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(_gifData["images"]["fixed_height"]["url"]),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.share, color: Colors.white),
                    label: const Text(
                      'Share',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Share.share(_gifData["images"]["fixed_height"]["url"]);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save_alt, color: Colors.white),
                    label: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await _saveGif(_gifData["images"]["fixed_height"]["url"]);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content:
                              Center(child: Text('GIF saved succefully!'))));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _saveGif(String gifUrl) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedGifs = prefs.getStringList('saved_gifs') ?? [];

    if (!savedGifs.contains(gifUrl)) {
      savedGifs.add(gifUrl);
    }

    await prefs.setStringList('saved_gifs', savedGifs);
  }
}
