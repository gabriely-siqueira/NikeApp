import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String email;

  const HomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003E87),
        elevation: 0,
        title: const Text(
          'NIKE',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              // Ação do botão de pesquisa
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              // Ação do botão de carrinho de compras
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            // Ação do botão de menu
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(title: 'Novos Produtos'),
                    const ProductRow(products: [
                      Product(
                        imagePath: 'assets/nike1.png',
                        name: 'Air Max Excee 365',
                        price: 'R\$ 503,99',
                      ),
                      Product(
                        imagePath: 'assets/nike1.png',
                        name: 'Air Max Plus',
                        price: 'R\$ 635,99',
                      ),
                    ]),
                    const Divider(height: 32, thickness: 1),
                    const SectionTitle(title: 'Popular'),
                    const ProductRow(products: [
                      Product(
                        imagePath: 'assets/nike1.png',
                        name: 'Running Revolution 6',
                        price: 'R\$ 533,99',
                      ),
                      Product(
                        imagePath: 'assets/nike1.png',
                        name: 'Air Force 1 Low',
                        price: 'R\$ 998,99',
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
          const BottomNavigationBarWidget(),
        ],
      ),
    );
  }
}

class Product {
  final String imagePath;
  final String name;
  final String price;

  const Product({
    required this.imagePath,
    required this.name,
    required this.price,
  });
}

class ProductRow extends StatelessWidget {
  final List<Product> products;

  const ProductRow({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: products
          .map(
            (product) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150, 
                  width: 150, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Image.asset(product.imagePath, fit: BoxFit.cover),
                ),
                const SizedBox(height: 8),
                Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16), 
                ),
                Text(
                  product.price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            // Ação do botão 'Ver mais'
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllProductsScreen()),
            );
          },
          child: const Text('Ver mais'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 90, 87, 87)),
          ),
        ),
      ],
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF003E87),
      unselectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.logout), label: ''),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            // Home
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen(email: 'email@example.com')),
            );
            break;
          case 1:
            // Favoritos
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesScreen()),
            );
            break;
          case 2:
            // Perfil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
            break;
          case 3:
            // Logout
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
            break;
        }
      },
    );
  }
}



class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: const Center(child: Text('Tela do Carrinho de Compras')),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: const Center(child: Text('Tela de Favoritos')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: const Center(child: Text('Tela de Perfil')),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(child: Text('Tela de Login')),
    );
  }
}

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos os Produtos'),
      ),
      body: const Center(child: Text('Tela com todos os produtos')),
    );
  }
}
