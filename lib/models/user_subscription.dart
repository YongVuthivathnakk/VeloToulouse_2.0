enum PassType {
  oneTimeTicket(
    title: 'One Time Ticket',
    subtitle: '',
    price: 1.00,
    description: '',
    benefits: [],
  ),
  daily(
    title: 'Daily',
    subtitle: '1-day ticket',
    price: 1.20,
    description:
        'Perfect for tourists and occasional riders exploring the city.',
    benefits: ['Unlimited rides for 1 day', 'No account needed'],
  ),

  monthly(
    title: 'Monthly',
    subtitle: '30-day subscription',
    price: 19.90,
    description: 'Ideal for regular commuters and frequent city travellers.',
    benefits: ['Unlimited rides for 30 days', 'Priority bike reservation'],
  ),

  yearly(
    title: 'Yearly',
    subtitle: '365-day subscription',
    price: 159.00,
    description:
        'Best value for daily riders who rely on bikes all year round.',
    benefits: [
      'Unlimited rides for 1 year',
      'Guest pass (2 per month)',
      'Dedicated support line',
      'Early access to new stations',
    ],
  );

  const PassType({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.description,
    required this.benefits,
  });

  final String title;
  final String subtitle;
  final double price;
  final String description;
  final List<String> benefits;

  String get formattedPrice => '€${price.toStringAsFixed(2)}';

  String get priceSuffix {
    switch (this) {
      case PassType.daily:
        return '/ day';
      case PassType.monthly:
        return '/ month';
      case PassType.yearly:
        return '/ year';
      case PassType.oneTimeTicket:
        throw PassType.oneTimeTicket;
    }
  }

  Duration get validFor {
    switch (this) {
      case PassType.daily:
        return const Duration(days: 1);
      case PassType.monthly:
        return const Duration(days: 30);
      case PassType.yearly:
        return const Duration(days: 365);
      case PassType.oneTimeTicket:
        return Duration.zero;
    }
  }
}

class UserSubscription {
  final String id;
  final DateTime? expirationDate;
  final PassType passType;

  UserSubscription({
    required this.id,
    this.expirationDate,
    required this.passType,
  });

  bool get isExpired {
    if (passType == PassType.oneTimeTicket) return false; 
    return DateTime.now().isAfter(expirationDate!);
  }

  UserSubscription copyWith({DateTime? expirationDate, PassType? passType}) {
    return UserSubscription(
      id: id,
      expirationDate: expirationDate ?? this.expirationDate,
      passType: passType ?? this.passType,
    );
  }
}
