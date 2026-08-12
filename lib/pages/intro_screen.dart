import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nova Card',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090B12),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8C7BFF),
          brightness: Brightness.dark,
        ),
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingItem {
  const OnboardingItem({
    required this.eyebrow,
    required this.title,
    required this.description,
    required this.icon,
    required this.colors,
    required this.stat,
    required this.statLabel,
  });

  final String eyebrow;
  final String title;
  final String description;
  final IconData icon;
  final List<Color> colors;
  final String stat;
  final String statLabel;
}

const onboardingItems = <OnboardingItem>[
  OnboardingItem(
    eyebrow: 'ONE CARD. EVERYWHERE.',
    title: 'A smarter card\nfor your lifestyle',
    description:
        'Pay securely, manage every purchase, and keep your finances in one beautifully simple app.',
    icon: Icons.credit_card_rounded,
    colors: [Color(0xFF8B5CF6), Color(0xFF4F46E5)],
    stat: '3%',
    statLabel: 'cashback on everyday spending',
  ),
  OnboardingItem(
    eyebrow: 'REAL-TIME CONTROL',
    title: 'Know where every\nbaht goes',
    description:
        'Instant notifications and smart categories make it effortless to understand your spending.',
    icon: Icons.insights_rounded,
    colors: [Color(0xFF00C2A8), Color(0xFF00796B)],
    stat: '24/7',
    statLabel: 'live spending insights',
  ),
  OnboardingItem(
    eyebrow: 'BUILT-IN SECURITY',
    title: 'Your money,\nprotected by design',
    description:
        'Freeze your card instantly, set spending limits, and approve online purchases with biometrics.',
    icon: Icons.shield_rounded,
    colors: [Color(0xFFFF8A4C), Color(0xFFE53935)],
    stat: '< 1 sec',
    statLabel: 'to lock your card',
  ),
  OnboardingItem(
    eyebrow: 'REWARDS THAT FIT YOU',
    title: 'Spend normally.\nEarn automatically.',
    description:
        'Collect points on every purchase and redeem them for travel, dining, or statement credit.',
    icon: Icons.auto_awesome_rounded,
    colors: [Color(0xFFFFC857), Color(0xFFFF7A00)],
    stat: '1 point',
    statLabel: 'earned on every ฿20 spent',
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  bool get _isLast => _page == onboardingItems.length - 1;

  void _goTo(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
    );
  }

  void _finish() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Welcome to Nova Card!')),
    );
    // TODO: Replace with Navigator.pushReplacement(...) to your login/home.
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.75, -0.75),
                radius: 1.25,
                colors: [
                  onboardingItems[_page].colors.first.withValues(alpha: .25),
                  const Color(0xFF090B12),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 16, 0),
                  child: Row(
                    children: [
                      const _Brand(),
                      const Spacer(),
                      TextButton(
                        onPressed: _finish,
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Color(0xFFB6B9C8)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) => setState(() => _page = value),
                    itemCount: onboardingItems.length,
                    itemBuilder: (_, index) => _OnboardingPage(
                      item: onboardingItems[index],
                      compact: size.height < 720,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingItems.length,
                          (index) => _PageDot(active: index == _page),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          if (_page > 0) ...[
                            _CircleButton(
                              icon: Icons.arrow_back_rounded,
                              onPressed: () => _goTo(_page - 1),
                            ),
                            const SizedBox(width: 12),
                          ],
                          Expanded(
                            child: FilledButton(
                              onPressed: _isLast
                                  ? _finish
                                  : () => _goTo(_page + 1),
                              style: FilledButton.styleFrom(
                                minimumSize: const Size.fromHeight(58),
                                backgroundColor:
                                    onboardingItems[_page].colors.first,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _isLast ? 'Get Started' : 'Continue',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    _isLast
                                        ? Icons.check_rounded
                                        : Icons.arrow_forward_rounded,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.item, required this.compact});

  final OnboardingItem item;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: compact ? 18 : 40),
          _CardVisual(item: item, compact: compact),
          SizedBox(height: compact ? 28 : 46),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.eyebrow,
              style: TextStyle(
                color: item.colors.first,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.8,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: compact ? 32 : 39,
                height: 1.08,
                fontWeight: FontWeight.w800,
                letterSpacing: -1.1,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            item.description,
            style: const TextStyle(
              color: Color(0xFFA9ADBC),
              fontSize: 15,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardVisual extends StatelessWidget {
  const _CardVisual({required this.item, required this.compact});

  final OnboardingItem item;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: compact ? 225 : 270,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item.colors.first.withValues(alpha: .10),
              boxShadow: [
                BoxShadow(
                  color: item.colors.first.withValues(alpha: .22),
                  blurRadius: 65,
                  spreadRadius: 8,
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: -0.09,
            child: Container(
              width: 310,
              height: 188,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [item.colors.first, item.colors.last],
                ),
                border: Border.all(color: Colors.white.withValues(alpha: .22)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x66000000),
                    blurRadius: 32,
                    offset: Offset(0, 20),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(item.icon, color: Colors.white, size: 30),
                      const Spacer(),
                      const Icon(Icons.contactless_rounded, color: Colors.white),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    '••••  ••••  ••••  4826',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.8,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CARD HOLDER',
                            style: TextStyle(fontSize: 8, color: Colors.white70),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'TONGPOOL H.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: .95),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        'NOVA',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF171A24).withValues(alpha: .95),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white12),
              ),
              child: Row(
                children: [
                  Icon(Icons.bolt_rounded, color: item.colors.first, size: 20),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.stat,
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        item.statLabel,
                        style: const TextStyle(
                          color: Color(0xFFA9ADBC),
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.blur_on_rounded, color: Color(0xFF9B8BFF), size: 28),
        SizedBox(width: 8),
        Text(
          'NOVA',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, letterSpacing: 1.4),
        ),
      ],
    );
  }
}

class _PageDot extends StatelessWidget {
  const _PageDot({required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 28 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white24,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onPressed,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        minimumSize: const Size(58, 58),
        backgroundColor: const Color(0xFF1A1D28),
      ),
    );
  }
}
