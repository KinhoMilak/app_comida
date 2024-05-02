import 'package:app_comida/components/mein_drawer.dart';
import 'package:app_comida/models/meal.dart';
import 'package:app_comida/screen/categories_screen.dart';
import 'package:app_comida/screen/favorite_screm.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  const TabScreen(this.favoriteMeal, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>>? _screen;

  @override
  void initState() {
    super.initState();
    _screen = [
      {
        'title': 'Lista de cateorias',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScren(widget.favoriteMeal),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screen![_selectedScreenIndex]['title'] as String),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const MainDrawer(),
      body: _screen![_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        type:
            BottomNavigationBarType.shifting, // animação da barra de favoritos
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex:
            _selectedScreenIndex, // para mudar a cor do item selecionado
      ),
    );
  }
}
