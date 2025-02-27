import 'package:flutter/material.dart';
import 'package:sanggar_budaya/domain/model/detail_item.dart';
import 'package:sanggar_budaya/presentation/widgets/adat_detail_list.dart';
import 'package:sanggar_budaya/presentation/widgets/sanggar_bottom_navigation.dart';

class DetailItemScreen extends StatelessWidget {
  final DetailItem item;

  const DetailItemScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRect(
                    child: SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: Image.asset(
                        item.mainImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    left: 2,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Betawi',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 10,
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                        ),
                        const Text(
                          '4.5',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          '(30+)',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'See Review',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      item.desc,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'Booking',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      spacing: 10,
                      children: [
                        Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: const Text('Lorem'),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: const Text('Lorem'),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: const Text('Lorem'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const Text(
                                'Betawi',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                item.cardDesc,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Rp. 75.000',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(Icons.remove),
                                ),
                                const SizedBox(width: 10),
                                const Text('1',
                                    style: TextStyle(color: Colors.white)),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: AdatDetailList(),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SanggarBottomNavigation(initialIndex: 1),
    );
  }
}
