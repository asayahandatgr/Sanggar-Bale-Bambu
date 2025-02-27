import 'package:flutter/material.dart';
import 'package:sanggar_budaya/domain/model/detail_item.dart';
import 'package:sanggar_budaya/presentation/screen/detail_item_screen.dart';

class AdatGrid extends StatelessWidget {
  AdatGrid({super.key});

  // final List<Map<String, String>> items = [
  //   {'image': 'assets/palangpintu.png', 'title': 'Palang Pintu'},
  //   {'image': 'assets/musikbetawi.png', 'title': 'Musik Betawi'},
  //   {'image': 'assets/pencaksilat.png', 'title': 'Pencak Silat'},
  //   {'image': 'assets/aksesorisbetawi.png', 'title': 'Aksesoris Betawi'},
  //   {'image': 'assets/ondel.png', 'title': 'Ondel Ondel'},
  //   {'image': 'assets/lenong.png', 'title': 'Lenong'},
  // ];

  final List<DetailItem> items = [
    DetailItem(
      mainImage: 'assets/main_detail_palang_pintu.png',
      image: 'assets/palangpintu.png',
      title: 'Palang Pintu',
      desc:
          'Palang pintu Betawi adalah sebuah elemen arsitektur tradisional yang khas dari budaya Betawi. Palang pintu Betawi memiliki desain yang rumit dan indah.',
      cardDesc: 'Nyok ah Mpok Abang di Pesen Palang Pintu Kite...',
    ),
    DetailItem(
      mainImage: 'assets/main_detail_musik_betawi.png',
      image: 'assets/musikbetawi.png',
      title: 'Musik Betawi',
      desc:
          'Musik betawi adalah musik tradisional yang berasal dari Betawi, yaitu kelompok etnis yang mendiami daerah Jakarta dan sekitarnya di Indonesia. Musik Betawi merupakan hasil dari perpaduan berbagai budaya yang pernah berinteraksi di wilayah tersebut, termasuk budaya Melayu, Tionghoa, Arab, dan Portugis.',
      cardDesc: 'Nyok ah Mpok Abang di Pesen Musik Betawi Kite...',
    ),
    DetailItem(
      mainImage: 'assets/main_detail_pencak_silat.png',
      image: 'assets/pencaksilat.png',
      title: 'Pencak Silat',
      desc:
          'Pencak silat memiliki arti dari dua kata yang menyusunnya. Pencak berarti gerak dasar bela diri yang memiliki peraturan. Sedang silat memiliki arti gerakan bela diri yang paripurna dan bersumber dari rohani.',
      cardDesc: 'Nyok ah Mpok Abang di Pesen Pencak Silat Kite...',
    ),
    DetailItem(
      mainImage: 'assets/main_detail_aksesoris.png',
      image: 'assets/aksesorisbetawi.png',
      title: 'Aksesoris Betawi',
      desc:
          'Aksesoris Betawi merupakan bagian penting dari budaya dan tradisi masyarakat Betawi yang mendiami Jakarta dan sekitarnya. Aksesoris ini tidak hanya digunakan dalam kehidupan sehari-hari tetapi juga dalam upacara adat, perayaan, dan pertunjukan seni.',
      cardDesc: 'Nyok ah Mpok Abang di Pesen Aksesoris Betawi Kite...',
    ),
    DetailItem(
      mainImage: 'assets/main_detail_ondel.png',
      image: 'assets/ondel.png',
      title: 'Ondel Ondel',
      desc:
          'Lenong adalah kesenian teater tradisional atau sandiwara rakyat Betawi yang dibawakan dalam dialek Betawi yang berasal dari Jakarta, Indonesia.',
      cardDesc: 'Nyok ah Mpok Abang Pesen Ondel-Ondel Kite...',
    ),
    DetailItem(
      mainImage: 'assets/main_detail_lenong.png',
      image: 'assets/lenong.png',
      title: 'Lenong',
      desc:
          'Lenong adalah kesenian teater tradisional atau sandiwara rakyat Betawi yang dibawakan dalam dialek Betawi yang berasal dari Jakarta, Indonesia.',
      cardDesc: 'Nyok ah Mpok Abang Pesen Ondel-Ondel Kite...',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailItemScreen(item: item),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: 2,
                      child: IconButton(
                        onPressed: () {
                          // Action for favorite icon
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
