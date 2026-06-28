import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 850;

        return Container(
          height: 240,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff6D5DFB),
                Color(0xff8A70FF),
              ],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        "Top Rating Project",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Text(
                      "Trending Project\nThis Week",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isSmall ? 26 : 34,
                        height: 1.1,
                      ),
                    ),

                    const SizedBox(height: 18),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepPurple,
                        minimumSize: const Size(130, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Learn More"),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              const Expanded(
                flex: 4,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(
                    Icons.auto_graph,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}