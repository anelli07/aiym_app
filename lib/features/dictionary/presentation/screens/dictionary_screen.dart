import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_header.dart';

// Dictionary Screen
class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DictionaryScreenContent();
  }
}

class DictionaryScreenContent extends StatelessWidget {
  const DictionaryScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Upper header with logo and profile button
        const AppHeader(),

        // Search bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search for a word...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.inputBorder),
              ),
            ),
          ),
        ),

        // Categories Section
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Display 2 categories per row
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: categories.length, // Number of categories
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    // When a category is tapped, navigate to CategoryDetailScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryDetailScreen(category: category),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.inputBorder),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.lightBackground,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Category image (increased size)
                        Image.asset(
                          category.iconPath,
                          width: 120, // Increased size
                          height: 120, // Increased size
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        // Category name (bold)
                        Text(
                          category.name,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// Category class to represent each category
class Category {
  final String name;
  final String iconPath;

  Category({required this.name, required this.iconPath});
}

// Example categories
final List<Category> categories = [
  Category(name: 'Galaxy', iconPath: 'assets/images/galaxy.png'),
  Category(
    name: 'Infrastructure',
    iconPath: 'assets/images/infrastructure.png',
  ),
  Category(name: 'Household', iconPath: 'assets/images/household.png'),
  Category(name: 'Acquaintance', iconPath: 'assets/images/acquaintance.png'),
  Category(name: 'Job', iconPath: 'assets/images/job.png'),
  Category(name: 'Letter', iconPath: 'assets/images/letter.png'),
  Category(name: 'Medicine', iconPath: 'assets/images/medicine.png'),
  Category(name: 'Time', iconPath: 'assets/images/time.png'),
  Category(
    name: 'Countries and Cities',
    iconPath: 'assets/images/countries_and_cities.png',
  ),
  Category(name: 'IT', iconPath: 'assets/images/it.png'),
  Category(name: 'Clothes', iconPath: 'assets/images/clothes.png'),
  Category(name: 'Leisure', iconPath: 'assets/images/leisure.png'),
  Category(name: 'Country', iconPath: 'assets/images/country.png'),
  Category(name: 'Feeling', iconPath: 'assets/images/feeling.png'),
  Category(name: 'Education', iconPath: 'assets/images/education.png'),
  Category(name: 'Plant', iconPath: 'assets/images/plant.png'),
  Category(name: 'Nature', iconPath: 'assets/images/nature.png'),
  Category(name: 'Animal', iconPath: 'assets/images/animal.png'),
  Category(name: 'Family', iconPath: 'assets/images/family.png'),
  Category(name: 'Nutrition', iconPath: 'assets/images/nutrition.png'),
  Category(name: 'Fashion', iconPath: 'assets/images/fashion.png'),
  Category(name: 'Shopping', iconPath: 'assets/images/shopping.png'),
];

// Category Detail Screen
class CategoryDetailScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailScreen({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              category.iconPath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              category.name,
              style: AppTextStyles.headerMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(height: 20),
            // Add more details for the category
            Text(
              'Details about ${category.name} will be displayed here.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
