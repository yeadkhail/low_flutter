# Ghorer Bazar - E-Commerce Flutter App 🛒

A complete e-commerce application built with Flutter, featuring user authentication, product browsing, shopping cart, and order management.

## Features ✨

### 🔐 Authentication
- **Sign Up**: Create new user accounts with Supabase authentication
- **Sign In**: Secure login with email and password
- **User Session Management**: Automatic login state persistence

### 🛍️ Product Management
- **Product Catalog**: Browse through various categories (Fruits, Bakery, Dairy, Vegetables, Meat)
- **Product Search**: Real-time search functionality across product names, descriptions, and categories
- **Category Filtering**: Filter products by specific categories
- **Product Details**: Detailed product information with high-quality images
- **Stock Management**: Real-time stock availability tracking

### 🛒 Shopping Cart
- **Add to Cart**: Add products with customizable quantities
- **Cart Management**: Update quantities, remove items, and view totals
- **Persistent Cart**: Cart state maintained across app sessions
- **Cart Badge**: Visual indicator showing number of items in cart

### 💳 Checkout & Orders
- **Checkout Process**: Complete shipping information form
- **Payment Options**: Multiple payment methods (Credit Card, PayPal, Cash on Delivery)
- **Order Placement**: Create and store orders with Supabase
- **Order History**: View past orders with detailed information
- **Order Tracking**: Monitor order status and shipping information

### 🎨 User Interface
- **Modern Design**: Clean, intuitive interface with Material Design
- **Responsive Layout**: Optimized for different screen sizes
- **Image Caching**: Efficient image loading with cached_network_image
- **Smooth Navigation**: GoRouter-powered navigation with deep linking
- **Loading States**: Proper loading indicators and error handling

## Tech Stack 🚀

- **Flutter**: Cross-platform UI framework
- **Riverpod**: State management solution
- **Supabase**: Backend-as-a-Service (Authentication, Database)
- **GoRouter**: Declarative routing solution
- **cached_network_image**: Efficient image loading and caching
- **intl**: Internationalization and date formatting

## Project Structure 📁

```
lib/
├── main.dart                 # App entry point
├── router.dart              # Navigation configuration
├── models/
│   ├── product.dart         # Product data model
│   └── cart.dart           # Cart and Order models
├── providers/
│   ├── auth_provider.dart   # Authentication state
│   ├── cart_provider.dart   # Shopping cart state
│   ├── orders_provider.dart # Order management
│   └── products_provider.dart # Product data and filtering
└── screens/
    ├── home_screen.dart     # Main dashboard
    ├── login_screen.dart    # User login
    ├── register_screen.dart # User registration
    ├── products_screen.dart # Product catalog
    ├── product_detail_screen.dart # Individual product details
    ├── cart_screen.dart     # Shopping cart management
    ├── checkout_screen.dart # Order placement
    └── order_history_screen.dart # Past orders
```

## Getting Started 🚦

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Supabase account

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ghorerbazar_clone
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Supabase**
   - Create a new project at [Supabase](https://supabase.com)
   - Update the Supabase URL and anon key in `lib/main.dart`
   - Set up authentication in your Supabase dashboard

4. **Run the application**
   ```bash
   flutter run
   ```

### Supabase Setup

1. **Create Tables** (Optional - currently using mock data)
   ```sql
   -- Products table
   CREATE TABLE products (
     id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
     name TEXT NOT NULL,
     description TEXT,
     price DECIMAL(10,2) NOT NULL,
     image_url TEXT,
     category TEXT,
     stock INTEGER DEFAULT 0,
     created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
   );

   -- Orders table
   CREATE TABLE orders (
     id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
     user_id UUID REFERENCES auth.users(id),
     total DECIMAL(10,2) NOT NULL,
     status TEXT DEFAULT 'pending',
     shipping_address TEXT,
     order_date TIMESTAMP WITH TIME ZONE DEFAULT NOW()
   );
   ```

2. **Enable Authentication**
   - Go to Authentication > Settings
   - Configure email authentication
   - Set up email templates (optional)

## Key Features Implementation 🔧

### State Management with Riverpod
- **Providers**: Centralized state management for cart, products, and orders
- **StateNotifier**: Mutable state management for complex operations
- **Family Providers**: Dynamic filtering and search functionality

### Authentication Flow
- **Route Guards**: Automatic redirection based on authentication state
- **Session Persistence**: Users remain logged in across app restarts
- **User Context**: Access to user information throughout the app

### Shopping Cart Logic
- **Optimistic Updates**: Immediate UI updates with proper error handling
- **Quantity Management**: Add, remove, and update item quantities
- **Total Calculations**: Real-time price calculations with tax considerations

### Product Management
- **Mock Data**: Comprehensive product catalog with realistic data
- **Image Optimization**: Cached network images with loading states
- **Search & Filter**: Real-time filtering across multiple product attributes

## Screenshots 📱

The app includes the following main screens:
- **Home Dashboard**: Quick navigation and statistics
- **Product Catalog**: Grid view with category filters and search
- **Product Details**: Detailed view with quantity selection
- **Shopping Cart**: Item management and checkout button
- **Checkout Form**: Shipping and payment information
- **Order History**: Past order tracking and details

## Contributing 🤝

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Future Enhancements 🚀

- [ ] Real-time order tracking
- [ ] Push notifications
- [ ] Wishlist functionality
- [ ] Product reviews and ratings
- [ ] Multiple payment gateway integration
- [ ] Admin panel for inventory management
- [ ] Multi-language support
- [ ] Dark mode theme

## License 📝

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact 📧

For questions or support, please reach out to the development team.

---

**Ghorer Bazar** - Your one-stop shop for fresh groceries and daily essentials! 🏪
