import "package:flutter/material.dart";

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: const Text('e'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 100),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const SecondRoute(),
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
