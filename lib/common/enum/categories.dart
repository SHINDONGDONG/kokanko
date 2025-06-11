enum CategoryType {
  furniture(name: '家具', imagePath: 'assets/logos/category_furniture.svg'),
  homeAppliances(
    name: '生活家電',
    imagePath: 'assets/logos/category_homeAppliances.svg',
  ),
  kitchen(name: 'キッチン用品', imagePath: 'assets/logos/category_kitchen.svg'),
  digitalDevices(
    name: 'デジタル機器',
    imagePath: 'assets/logos/category_digitalDevices.svg',
  ),
  smallElectronicdevices(
    name: '小型電子機器',
    imagePath: 'assets/logos/category_smallElectronicdevices.svg',
  ),
  gamesAndHobbies(
    name: 'ゲーム・ホビー',
    imagePath: 'assets/logos/category_gamesAndHobbies.svg',
  ),
  wClothing(name: 'レディース服', imagePath: 'assets/logos/category_wClothing.svg'),
  mClothing(name: 'メンズ服', imagePath: 'assets/logos/category_mClothing.svg'),
  wShoes(name: 'レディース靴', imagePath: 'assets/logos/category_wShoes.svg'),
  mShoes(name: 'メンス靴', imagePath: 'assets/logos/category_mShoes.svg'),
  accAndSundries(
    name: '小物・雑貨',
    imagePath: 'assets/logos/category_accAndSundries.svg',
  ),
  beautyAndCos(
    name: '美容・コスメ',
    imagePath: 'assets/logos/category_beautyAndCos.svg',
  ),
  bClothing(name: 'ベビー服', imagePath: 'assets/logos/category_bClothing.svg'),
  bProducts(name: 'ベビー用品', imagePath: 'assets/logos/category_bProducts.svg'),
  kToys(name: 'キッズトイ', imagePath: 'assets/logos/category_kToys.svg'),
  pSupplies(name: 'ペット用品', imagePath: 'assets/logos/category_pSupplies.svg'),
  sports(name: 'スポーツ', imagePath: 'assets/logos/category_sports.svg'),
  vehicles(name: '乗り物', imagePath: 'assets/logos/category_vehicles.svg'),
  books(name: '本', imagePath: 'assets/logos/category_books.svg');

  // 생성자 (required 키워드로 필수 필드 지정)
  const CategoryType({required this.name, required this.imagePath});

  // 각 enum 값이 가질 데이터 필드
  final String name;
  final String imagePath;
}
