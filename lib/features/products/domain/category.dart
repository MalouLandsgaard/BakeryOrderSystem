enum Category {
  pastries,
  bread,
  cookies,
  desserts,
  muffins,
  undefined,
}

extension CategoryMapper on Category {
  static Category fromString(String value) {
    return categories[value] ?? Category.undefined;
  }

  static Map<String, Category> categories = {
    Category.pastries.name: Category.pastries,
    Category.bread.name: Category.bread,
    Category.cookies.name: Category.cookies,
    Category.desserts.name: Category.desserts,
    Category.muffins.name: Category.muffins
  };
}
