import 'package:aplikasipendataanwarga/providers/berita_panel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class beritapanel extends StatelessWidget {
  const beritapanel({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BeritaPanelProvider>().muatdata();

    return Scaffold(
      appBar: AppBar(
        title: Text('berita'),
      ),
      body: Consumer<BeritaPanelProvider>(builder: (context, prov, w) {
        return ListView(
          children: [
            for (final data in prov.data)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${data['title']}'),
                  Image.network(data['image'] ?? '',
                      errorBuilder: (context, Error, StackTrace) {
                    return Image.asset('asset/logo.png');
                  }),
                  Text('${data['description']}')
                ],
              )
          ],
        );
      }),
    );
  }
}
