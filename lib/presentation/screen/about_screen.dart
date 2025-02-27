import 'package:flutter/material.dart';
import 'package:sanggar_budaya/presentation/widgets/sanggar_bottom_navigation.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final List<Map<String, String>> items = [
    {'image': 'assets/ondel.png', 'title': 'Ondel Ondel'},
    {'image': 'assets/pencaksilatinabout.png', 'title': 'Pencak Silat'},
    {'image': 'assets/palangpintu.png', 'title': 'Palang Pintu'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        title: const Text(
          'Sejarah Betawi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Image.asset('assets/sejarahbetawibw.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Ada beberapa versi soal asal-usul kata Betawi. Salah satunya dari nama lawas Jakarta, Batavia. Nama Betawi berasal dari kata Batavia, yang lama-kelamaan berubah menjadi Batavi, kemudian berubah menjadi Betawi. Pengucapan Betawi sendiri disesuaikan dengan lidah masyarakat lokal yang kesulitan mengucapkan kata Batavi. Secara historis, suku Betawi lahir karena adanya percampuran genetik atau akulturasi budaya antara masyarakat yang tinggal di Batavia. Setelah terjadi akulturasi budaya, adat-istiadat, tradisi, dan bahasa, akhirnya muncul sebuah komunitas besar di Batavia yang dinamakan Betawi.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 213, 212, 212),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/aboutmisi.png'),
                      const SizedBox(height: 20),
                      const Text(
                        'Misi Kami',
                        style: TextStyle(fontSize: 28),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Misi kami adalah untuk memperkenalkan budaya betawi melalui aplikasi ini kepada anak muda zaman sekarang, agar budaya betawi tetap diingat oleh generasi sekarang dan yang akan datang.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Beberapa Kebudayaan Kami',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Image.asset(item['image']!),
                          const SizedBox(height: 20),
                          Text(
                            item['title']!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SanggarBottomNavigation(initialIndex: null),
    );
  }
}
