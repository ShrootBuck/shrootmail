import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class Compose extends StatelessWidget {
  const Compose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration.collapsed(hintText: "hintText"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const Compose(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0),
                    end: const Offset(0, 1),
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          );
        },
        tooltip: 'Send',
        child: const Icon(Icons.send),
      ),
    );
  }
}
