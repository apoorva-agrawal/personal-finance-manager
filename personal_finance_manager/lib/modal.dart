import 'categories.dart';

class Expense {
  final String tranName;
  final String category;
  final String date;
  final String iconUrl;
  final String amount;

  Expense({
    this.tranName,
    this.category,
    this.date,
    this.iconUrl,
    this.amount,
  });
}

final Category grocery = Category(
  category: 'Grocery',
  iconUrl: 'assets/images/dish.png',
);
final Category medicine = Category(
  category: 'medicine',
  iconUrl: 'assets/images/dish.png',
);
final Category movie = Category(
  category: 'Movies',
  iconUrl: 'assets/images/dish.png',
);
final Category debt = Category(
  category: 'debt repaid',
  iconUrl: 'assets/images/dish.png',
);
final Category travel = Category(
  category: 'travel',
  iconUrl: 'assets/images/dish.png',
);
final Category lunch = Category(
  category: 'lunch',
  iconUrl: 'assets/images/dish.png',
);

List<Expense> expenses = [
  Expense(
    tranName: 'grocery shopping',
    category: grocery.category,
    date: 'Nov 25',
    iconUrl: grocery.iconUrl,
    amount: '1000',
  ),
  Expense(
    tranName: 'bus tickets (RNC-CAL)',
    category: travel.category,
    date: 'Nov 25',
    iconUrl: travel.iconUrl,
    amount: '600',
  ),
  Expense(
    tranName: 'Riya repaid her debt',
    category: debt.category,
    date: 'Nov 25',
    iconUrl: debt.iconUrl,
    amount: '500',
  ),
  Expense(
    tranName: 'medicine and hospital bill',
    category: medicine.category,
    date: 'Nov 24',
    iconUrl: medicine.iconUrl,
    amount: '1000',
  ),
  Expense(
    tranName: 'No time to die',
    category: movie.category,
    date: 'Nov 24',
    iconUrl: movie.iconUrl,
    amount: '400',
  ),
  Expense(
    tranName: 'lunch',
    category: lunch.category,
    date: 'Nov 24',
    iconUrl: lunch.iconUrl,
    amount: '700',
  ),
];
