import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

// Categories provider
final categoriesProvider = Provider<List<String>>((ref) {
  return ['All', 'Fruits', 'Bakery', 'Dairy', 'Vegetables', 'Meat'];
});

// Mock products provider
final productsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: '1',
      name: 'Fresh Apples',
      description: 'Crispy red apples, perfect for snacking',
      price: 2.99,
      imageUrl: 'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?w=300&h=300&fit=crop',
      category: 'Fruits',
      stock: 50,
    ),
    Product(
      id: '2',
      name: 'Organic Bananas',
      description: 'Sweet organic bananas, rich in potassium',
      price: 1.99,
      imageUrl: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=300&h=300&fit=crop',
      category: 'Fruits',
      stock: 30,
    ),
    Product(
      id: '3',
      name: 'Fresh Bread',
      description: 'Freshly baked whole wheat bread',
      price: 3.49,
      imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=300&h=300&fit=crop',
      category: 'Bakery',
      stock: 20,
    ),
    Product(
      id: '4',
      name: 'Organic Milk',
      description: 'Fresh organic milk from local farms',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=300&h=300&fit=crop',
      category: 'Dairy',
      stock: 25,
    ),
    Product(
      id: '5',
      name: 'Farm Eggs',
      description: 'Fresh eggs from free-range chickens',
      price: 5.99,
      imageUrl: 'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?w=300&h=300&fit=crop',
      category: 'Dairy',
      stock: 40,
    ),
    Product(
      id: '6',
      name: 'Fresh Tomatoes',
      description: 'Ripe red tomatoes, perfect for cooking',
      price: 2.49,
      imageUrl: 'https://images.unsplash.com/photo-1546470427-b5382b1a6ad0?w=300&h=300&fit=crop',
      category: 'Vegetables',
      stock: 35,
    ),
    Product(
      id: '7',
      name: 'Organic Carrots',
      description: 'Fresh organic carrots, high in vitamin A',
      price: 1.79,
      imageUrl: 'https://images.unsplash.com/photo-1582515073490-39981397c445?w=300&h=300&fit=crop',
      category: 'Vegetables',
      stock: 28,
    ),
    Product(
      id: '8',
      name: 'Ground Beef',
      description: 'Fresh lean ground beef, 80/20 blend',
      price: 8.99,
      imageUrl: 'https://images.unsplash.com/photo-1603048297172-c92544798d5a?w=300&h=300&fit=crop',
      category: 'Meat',
      stock: 15,
    ),
    Product(
      id: '9',
      name: 'Chicken Breast',
      description: 'Boneless skinless chicken breast',
      price: 7.49,
      imageUrl: 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=300&h=300&fit=crop',
      category: 'Meat',
      stock: 22,
    ),
    Product(
      id: '10',
      name: 'Fresh Oranges',
      description: 'Sweet and juicy navel oranges',
      price: 3.99,
      imageUrl: 'https://images.unsplash.com/photo-1580052614034-c55d20bfee3b?w=300&h=300&fit=crop',
      category: 'Fruits',
      stock: 45,
    ),
  ];
});

// Search query provider
final searchQueryProvider = StateProvider<String>((ref) => '');

// Filtered products provider with search functionality
final filteredProductsProvider = Provider<List<Product>>((ref) {
  final products = ref.watch(productsProvider);
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();
  
  if (searchQuery.isEmpty) {
    return products;
  }
  
  return products.where((product) {
    return product.name.toLowerCase().contains(searchQuery) ||
           product.description.toLowerCase().contains(searchQuery) ||
           product.category.toLowerCase().contains(searchQuery);
  }).toList();
});

// Category filtered products provider
final categoryFilteredProductsProvider = StateProvider.family<List<Product>, String>((ref, category) {
  final products = ref.watch(filteredProductsProvider);
  if (category == 'All') {
    return products;
  }
  return products.where((p) => p.category == category).toList();
});
