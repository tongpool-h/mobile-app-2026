import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final TextEditingController searchController = TextEditingController();

  final List<ServiceItem> winterServices = const [
    ServiceItem(
      title: 'Furniture Assembly',
      imageUrl:
          'https://images.unsplash.com/photo-1586023492125-27b2c045efd7'
          '?auto=format&fit=crop&w=900&q=80',
      rating: '4.9',
      reviews: '3.9k',
    ),
    ServiceItem(
      title: 'Mounting',
      imageUrl:
          'https://images.unsplash.com/photo-1505798577917-a65157d3320a'
          '?auto=format&fit=crop&w=900&q=80',
      rating: '4.8',
      reviews: '2.1k',
    ),
    ServiceItem(
      title: 'Home Repair',
      imageUrl:
          'https://images.unsplash.com/photo-1581783898377-1c85bf937427'
          '?auto=format&fit=crop&w=900&q=80',
      rating: '4.7',
      reviews: '1.8k',
    ),
  ];

  final List<ServiceItem> checklistServices = const [
    ServiceItem(
      title: 'Help Moving',
      imageUrl:
          'https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea'
          '?auto=format&fit=crop&w=700&q=80',
      rating: '4.6',
      reviews: '4.9k',
    ),
    ServiceItem(
      title: 'Cleaning',
      imageUrl:
          'https://images.unsplash.com/photo-1581578731548-c64695cc6952'
          '?auto=format&fit=crop&w=700&q=80',
      rating: '4.8',
      reviews: '3.5k',
    ),
    ServiceItem(
      title: 'Home Organizing',
      imageUrl:
          'https://images.unsplash.com/photo-1616486338812-3dadae4b4ace'
          '?auto=format&fit=crop&w=700&q=80',
      rating: '4.9',
      reviews: '1.2k',
    ),
  ];

  final List<ServiceItem> homeServices = const [
    ServiceItem(
      title: 'Plumbing',
      imageUrl:
          'https://images.unsplash.com/photo-1621905251189-08b45d6a269e'
          '?auto=format&fit=crop&w=700&q=80',
      rating: '4.8',
      reviews: '2.3k',
    ),
    ServiceItem(
      title: 'Painting',
      imageUrl:
          'https://images.unsplash.com/photo-1562259949-e8e7689d7828'
          '?auto=format&fit=crop&w=700&q=80',
      rating: '4.7',
      reviews: '1.9k',
    ),
    ServiceItem(
      title: 'Electrical',
      imageUrl:
          'https://images.unsplash.com/photo-1621905252507-b35492cc74b4'
          '?auto=format&fit=crop&w=700&q=80',
      rating: '4.9',
      reviews: '2.8k',
    ),
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void selectNavigation(int index) {
    setState(() {
      selectedIndex = index;
    });

    final pages = [
      'Home',
      'Bookings',
      'Favorites',
      'Profile',
    ];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${pages[index]} selected'),
        duration: const Duration(milliseconds: 700),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFF1F4F3),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 0, 120),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: _buildLocationHeader(),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: _buildSearchBox(),
                  ),
                  const SizedBox(height: 24),

                  const SectionTitle(title: 'Winter Reset'),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 228,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(right: 20),
                      itemCount: winterServices.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        return LargeServiceCard(
                          item: winterServices[index],
                          onTap: () => _openService(winterServices[index]),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 22),
                  const SectionTitle(title: 'Moving Checklist'),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 178,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(right: 20),
                      itemCount: checklistServices.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return SmallServiceCard(
                          item: checklistServices[index],
                          onTap: () =>
                              _openService(checklistServices[index]),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 22),
                  const SectionTitle(title: 'Home Services'),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 178,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(right: 20),
                      itemCount: homeServices.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return SmallServiceCard(
                          item: homeServices[index],
                          onTap: () => _openService(homeServices[index]),
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Center(
          heightFactor: 1,
          child: FloatingBottomNavigation(
            selectedIndex: selectedIndex,
            onSelected: selectNavigation,
          ),
        ),
      ),
    );
  }

  Widget _buildLocationHeader() {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.location_on_outlined,
            size: 22,
            color: Color(0xFF202524),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 2),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
            const SizedBox(height: 2),
            const Text(
              'New York',
              style: TextStyle(
                color: Color(0xFF1D2221),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF1D2221),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBox() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          if (value.trim().isEmpty) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Searching for "$value"'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        decoration: InputDecoration(
          hintText: 'Search Services',
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.grey.shade500,
            size: 22,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              searchController.clear();
            },
            icon: const Icon(Icons.tune_rounded),
            color: const Color(0xFF087A63),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  void _openService(ServiceItem item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return ServiceDetailSheet(item: item);
      },
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF1D2221),
              fontSize: 19,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text(
              'See all',
              style: TextStyle(
                color: Color(0xFF087A63),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LargeServiceCard extends StatelessWidget {
  final ServiceItem item;
  final VoidCallback onTap;

  const LargeServiceCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width * 0.72;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth.clamp(240.0, 290.0),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.035),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: 'service-large-${item.title}',
                child: RemoteImage(
                  imageUrl: item.imageUrl,
                  borderRadius: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF202524),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.star_rounded,
                    size: 19,
                    color: Color(0xFFFF8A00),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '${item.rating}(${item.reviews})',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallServiceCard extends StatelessWidget {
  final ServiceItem item;
  final VoidCallback onTap;

  const SmallServiceCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width * 0.42;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: cardWidth.clamp(145.0, 175.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RemoteImage(
                imageUrl: item.imageUrl,
                borderRadius: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF252A29),
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  size: 17,
                  color: Color(0xFFFF8A00),
                ),
                const SizedBox(width: 3),
                Text(
                  '${item.rating}(${item.reviews})',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RemoteImage extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;

  const RemoteImage({
    super.key,
    required this.imageUrl,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: double.infinity,
        color: const Color(0xFFE2E7E5),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;

            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Color(0xFF087A63),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(
                Icons.home_repair_service_outlined,
                size: 42,
                color: Color(0xFF7A8581),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FloatingBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const FloatingBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  static const List<NavigationItemData> items = [
    NavigationItemData(
      label: 'Home',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
    ),
    NavigationItemData(
      label: 'Bookings',
      icon: Icons.receipt_long_outlined,
      selectedIcon: Icons.receipt_long_rounded,
    ),
    NavigationItemData(
      label: 'Favorites',
      icon: Icons.favorite_border_rounded,
      selectedIcon: Icons.favorite_rounded,
    ),
    NavigationItemData(
      label: 'Profile',
      icon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.97),
        borderRadius: BorderRadius.circular(36),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onSelected(index),
                borderRadius: BorderRadius.circular(28),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  height: 50,
                  padding: EdgeInsets.symmetric(
                    horizontal: isSelected ? 16 : 13,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF087A63)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isSelected ? item.selectedIcon : item.icon,
                        size: 22,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF7C8582),
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 220),
                        child: isSelected
                            ? Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Text(
                                  item.label,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ServiceDetailSheet extends StatelessWidget {
  final ServiceItem item;

  const ServiceDetailSheet({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFD5DAD8),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 210,
              child: RemoteImage(
                imageUrl: item.imageUrl,
                borderRadius: 24,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Icon(
                  Icons.star_rounded,
                  color: Color(0xFFFF8A00),
                ),
                const SizedBox(width: 4),
                Text(
                  '${item.rating} (${item.reviews})',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Professional home service provided by experienced and '
              'verified specialists. Select your preferred date and time '
              'to make a booking.',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF087A63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Book Service',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceItem {
  final String title;
  final String imageUrl;
  final String rating;
  final String reviews;

  const ServiceItem({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
  });
}

class NavigationItemData {
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  const NavigationItemData({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });
}