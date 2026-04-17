enum Pass {
  ticket(
    title: "One Time Ticket",
    subtitle: "",
    price: 1.00,
    description: 'For onetime use only.',
    features: [],
    footerNote: "",
  ),
  daily(
    title: 'Daily',
    subtitle: '1-day ticket',
    price: 1.20,
    description:
        'For a quick visit or a spontaneous day of exploring Toulouse.',
    features: [
      'First 30 min free per trip',
      '30–60 min: +€0.50',
      'Each extra hour: +€1.00',
      'No account or card needed',
      'Buy at any station or app',
    ],
    footerNote: 'No subscription required. Pay per day.',
  ),

  monthly(
    title: 'Monthly',
    subtitle: '30-day subscription',
    price: 19.90,
    description: 'Ideal for regular commuters and frequent city travellers.',
    features: [
      'Unlimited trips included',
      'First 60 min free per trip',
      'Priority bike reservation',
      'Pause & resume anytime',
      'Access via app or card',
    ],
    footerNote: 'Requires a subscriber card. Subscribe online or via the app.',
  ),

  yearly(
    title: 'Yearly',
    subtitle: '365-day subscription',
    price: 159.00,
    description:
        'The best deal for daily riders. One payment, full year access.',
    features: [
      'Everything in Monthly',
      'First 90 min free per trip',
      'Guest pass (2 per month)',
      'Dedicated support line',
      'Early access to new stations',
    ],
    footerNote: 'Requires a subscriber card. Subscribe online or via the app.',
  );

  const Pass({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.description,
    required this.features,
    required this.footerNote,
  });

  final String title;
  final String subtitle;
  final double price;
  final String description;
  final List<String> features;
  final String footerNote;

  // ── Helpers ──────────────────────────────────────────
  String get formattedPrice => '€${price.toStringAsFixed(2)}';

  String get priceSuffix {
    switch (this) {
      case Pass.ticket:
        return '/ use';
      case Pass.daily:
        return '/ day';
      case Pass.monthly:
        return '/ month';
      case Pass.yearly:
        return '/ year';
    }
  }

  Duration get validFor {
    switch (this) {
      case Pass.ticket:
        return const Duration(days: 1);
      case Pass.daily:
        return const Duration(days: 1);
      case Pass.monthly:
        return const Duration(days: 30);
      case Pass.yearly:
        return const Duration(days: 365);
    }
  }

  bool get requiresAccount => this != Pass.daily;
}
