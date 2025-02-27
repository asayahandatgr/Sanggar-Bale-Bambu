class DetailBudaya {
  final String coverImg;
  final String title;
  final String desc;
  final String cardTitle;
  final String cardDesc;
  final String cardImg;

  DetailBudaya({
    required this.coverImg,
    required this.title,
    required this.desc,
    required this.cardTitle,
    required this.cardDesc,
    required this.cardImg,
  });

  factory DetailBudaya.fromMap(Map<String, String> map) {
    return DetailBudaya(
      coverImg: map['coverImg'] ?? '',
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      cardTitle: map['cardTitle'] ?? '',
      cardDesc: map['cardDesc'] ?? '',
      cardImg: map['cardImg'] ?? '',
    );
  }
}
