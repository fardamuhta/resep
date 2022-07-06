import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep/providers/resep_provider.dart';
import 'package:resep/screens/detail_resep_screen.dart';

class ResepScreen extends StatefulWidget {
  const ResepScreen({Key? key}) : super(key: key);

  @override
  State<ResepScreen> createState() => _ResepScreenState();
}

class _ResepScreenState extends State<ResepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Makanan'),
      ),
      body: Consumer<ResepProvider>(
        builder: (context, ResepProvider, child) {
          return ListView.builder(
            itemCount: ResepProvider.resepModel.results?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailResepScreen(
                        title: ResepProvider.resepModel.results![index].title,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                            "${ResepProvider.resepModel.results![index].thumb}"),
                        Text(
                          "${ResepProvider.resepModel.results![index].title}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            "Porsi : ${ResepProvider.resepModel.results![index].portion}"),
                        Text(
                            "Lama Pengerjaan : ${ResepProvider.resepModel.results![index].times}"),
                        Text(
                            "Level Pengerjaan : ${ResepProvider.resepModel.results![index].dificulty}"),
                      ],
                    ),
                  ),
                ),
              );
            },
            padding: const EdgeInsets.all(18),
          );
        },
      ),
    );
  }
}
