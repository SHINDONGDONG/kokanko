enum Word {
  onboardingMainText("Kindness-related exchange apps", "やさしさがめぐる、モノの交換アプリ"),
  onboardingSubText(
    "Things that I don't use anymore\na place that turns into someone's want",
    "使わなくなったモノが\n誰かの「欲しい」に変わる場所",
  ),
  onboardingButtonText("Let's start with area settings", "エリア設定から始めよう");

  final String en;
  final String jp;
  const Word(this.en, this.jp);

  String text() {
    int currentIndex = 1;
    return currentIndex == 0 ? en : jp;
  }
}
