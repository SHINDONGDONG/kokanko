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
  category("category", "カテゴリ");

  final String en;
  final String jp;
  const Words(this.en, this.jp);

  String text() {
    int currentIndex = 1;
    return currentIndex == 0 ? en : jp;
  }
}
