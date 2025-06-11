enum Words {
  onboardingMainText("Kindness-related exchange apps", "やさしさがめぐる、モノの交換アプリ"),
  onboardingSubText(
    "Things that I don't use anymore\na place that turns into someone's want",
    "使わなくなったモノが\n誰かの「欲しい」に変わる場所",
  ),
  onboardingButtonText("Let's start with area settings", "エリア設定から始めよう"),
  bottomNavigationHome("Home", "ホーム"),
  bottomNavigationHelp("Help", "お手伝い"),
  bottomNavigationChat("Chat", "チャット"),
  bottomNavigationProfile("Profile", "マイページ"),
  emptyKokanItem("Empty Kokan Item", "まだ交換アイテムがありません"),
  emptyFreeItem("Empty Free Item", "まだゆずるアイテムがありません"),
  searchForItem("Search", "何をお探しですか？"),
  kokan("exchange", "交換"),
  free("free", "ゆずる"),
  searchHistory("Search History", "検索履歴"),
  allDelete("All Delete", "すべて削除"),
  category("category", "カテゴリ"),
  furniture("furniture", "家具"),
  homeAppliances("homeAppliances", "生活家電"),
  kitchen("kitchen", "キッチン用品"),
  digitalDevices("digitalDevices", "デジタル機器"),
  smallElectronicdevices("smallElectronicdevices", "小型電子機器"),
  gamesAndHobbies("gamesAndHobbies", "ゲーム・ホビー"),
  wClothing("wClothing", "レディース服"),
  mClothing("mClothing", "メンズ服"),
  wShoes("wShoes", "レディース靴"),
  mShoes("mShoes", "メンス靴"),
  accAndSundries("accAndSundries", "小物・雑貨"),
  beautyAndCos("beautyAndCos", "美容・コスメ"),
  bClothing("bClothing", "ベビー服"),
  bProducts("bProducts", "ベビー用品"),
  kToys("kToys", "キッズトイ"),
  pSupplies("pSupplies", "ペット用品"),
  sports("sports", "スポーツ"),
  vehicles("vehicles", "乗り物"),
  books("books", "本"),
  meanIcon("meanIcon", "アイコンの意味は");

  final String en;
  final String jp;
  const Words(this.en, this.jp);

  String text() {
    int currentIndex = 1;
    return currentIndex == 0 ? en : jp;
  }
}
