import 'package:flutter/material.dart';
import 'package:sanggar_budaya/core/resources/resources.dart';
import 'package:sanggar_budaya/domain/model/detail_budaya.dart';
import 'package:sanggar_budaya/presentation/screen/login_screen.dart';
import 'package:sanggar_budaya/presentation/viewmodel/home_screen_viewmodel.dart';
import 'package:sanggar_budaya/presentation/widgets/adat_grid.dart';
import 'package:sanggar_budaya/presentation/widgets/sanggar_bottom_navigation.dart';
import 'package:sanggar_budaya/presentation/widgets/sanggar_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndShowPopUp();
    });
  }

  Future<void> _checkAndShowPopUp() async {
    final prefs = await SharedPreferences.getInstance();
    final hasShownPopUp = prefs.getBool('hasShownPopUp') ?? false;

    if (!hasShownPopUp) {
      _showPopUp();
      await prefs.setBool('hasShownPopUp', false);
    }
  }

  void _showPopUp() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          Resources.homePopUpTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Resources.homePopUpDesc1),
              SizedBox(height: 20),
              Text(
                Resources.homePopUpDesc2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                Resources.homePopUpDesc3,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                Resources.homePopUpDesc4,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                Resources.homePopUpDesc5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text(
              'OK',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeScreenViewModel();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: TextField(
                          controller: _searchTextController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: Resources.homeTextFieldLabel,
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hoverColor: Colors.yellow,
                            filled: true,
                            fillColor: Colors.black,
                            suffixIcon: Icon(
                              Icons.filter_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      tooltip: 'Profile',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        final budayaDetail = DetailBudaya(
                          coverImg: 'assets/budayabetawi.png',
                          title: 'Mengenal Kebudayaan Betawi',
                          desc:
                              'Palang pintu Betawi adalah sebuah elemen arsitektur tradisional yang khas dari budaya Betawi. Palang pintu Betawi memiliki desain yang rumit dan indah.',
                          cardTitle: 'Pencak Silat',
                          cardDesc:
                              '"Kalo denger budaya Betawi, siapa sih yang kaga penasaran sama pencak silat nye? Seni bela diri yang satu ini bukan cuma soal gerakan, tapi juga soal kehormatan, keberanian, dan kebijaksanaan. Dengan gerakan yang lincah dan penuh makna, pencak silat jadi lambang kekuatan dan keluwesan masyarakat Betawi. Gak heran kalo banyak yang terpesona sama keindahan dan ketangguhan seni bela diri yang udah jadi bagian dari warisan budaya kita ini.” (Benyamin Sueb)',
                          cardImg: 'assets/pencaksilat.png',
                        );

                        viewModel.goToDetailScreen(context, budayaDetail);
                      },
                      child: const SanggarCard(
                        title: Resources.homeSanggarBudaya,
                        imgUrl: 'assets/budayabetawi.png',
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        viewModel.goToAboutScreen(context);
                      },
                      child: const SanggarCard(
                        title: Resources.homeSanggarSejarah,
                        imgUrl: 'assets/sejarah.png',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Resources.homeAdatTitle,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                Resources.homeAdatDesc,
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            Resources.homeAdatLink,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AdatGrid(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SanggarBottomNavigation(initialIndex: 0),
    );
  }
}
