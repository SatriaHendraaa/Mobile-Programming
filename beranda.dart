import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Strimo",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle, color: Colors.white),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Video Populer 🔥",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Grid Video
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12, // jumlah video
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // jumlah kolom
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 16 / 9,
              ),
              itemBuilder: (context, index) {
                return VideoCard(index: index);
              },
            ),

            const SizedBox(height: 30),
            const Text(
              "Rekomendasi Untuk Anda 🎬",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 16 / 9,
              ),
              itemBuilder: (context, index) {
                return VideoCard(index: index + 100);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatefulWidget {
  final int index;
  const VideoCard({super.key, required this.index});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke detail video
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Membuka Video ${widget.index + 1}')),
        );
      },
      onHover: (hover) {
        setState(() {
          _hovering = hover;
        });
      },
      borderRadius: BorderRadius.circular(15),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: _hovering ? Colors.blue[100] : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: _hovering ? Colors.blueAccent : Colors.grey[300]!,
            width: _hovering ? 2 : 1,
          ),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
        ),
        child: Stack(
          children: [
            // Simulasi area video kosong
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            // Ikon play di tengah
            Center(
              child: Icon(
                Icons.play_circle_fill,
                color: _hovering ? Colors.blueAccent : Colors.black54,
                size: 48,
              ),
            ),

            // Teks judul di bawah
            Positioned(
              bottom: 8,
              left: 10,
              right: 10,
              child: Text(
                "Video ${widget.index + 1}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: _hovering ? Colors.blueAccent : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
