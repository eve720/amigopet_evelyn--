import 'package:flutter/material.dart';
import '../styles/app_styles.dart';
import 'detalhes_cuidador_pages.dart';

class CuidadoresPage extends StatelessWidget {
  const CuidadoresPage({super.key});

  final List<Map<String, dynamic>> cuidadores = const [
    {
      'nome': 'Ana Souza',
      'servico': 'Passeio e hospedagem',
      'avaliacao': 4.9,
      'distancia': '0,8 km',
    },
    {
      'nome': 'Carlos Lima',
      'servico': 'Passeio com cães',
      'avaliacao': 4.8,
      'distancia': '1,2 km',
    },
    {
      'nome': 'Mariana Alves',
      'servico': 'Hospedagem de pets',
      'avaliacao': 4.7,
      'distancia': '1,5 km',
    },
    {
      'nome': 'João Santos',
      'servico': 'Banho e tosa',
      'avaliacao': 4.6,
      'distancia': '2,0 km',
    },
    {
      'nome': 'Beatriz Costa',
      'servico': 'Passeio e hospedagem',
      'avaliacao': 4.9,
      'distancia': '2,3 km',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('AmigoPet'),
        backgroundColor: AppStyles.primaryColor,
        foregroundColor: Colors.white,

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        actions: [
          PopupMenuButton<String>(
            onSelected: (opcao) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ordenação: $opcao'),
                ),
              );
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'Mais próximos',
                child: Text('Mais próximos'),
              ),
              PopupMenuItem(
                value: 'Melhor avaliados',
                child: Text('Melhor avaliados'),
              ),
            ],
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppStyles.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.pets,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'AmigoPet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Cuidados para seu pet',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Cuidadores'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Meus agendamentos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cuidadores.length,
        itemBuilder: (context, index) {
          final cuidador = cuidadores[index];

          return Card(
            color: AppStyles.cardColor,
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,

            child: ListTile(
              contentPadding: const EdgeInsets.all(12),

              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.teal.shade100,
                child: const Icon(
                  Icons.person,
                  color: AppStyles.primaryColor,
                  size: 30,
                ),
              ),

              title: Text(
                cuidador['nome'],
                style: AppStyles.cardTitle,
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),

                  Text(
                    cuidador['servico'],
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),

                      Text(
                        ' ${cuidador['avaliacao']}',
                      ),

                      const SizedBox(width: 15),

                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 18,
                      ),

                      Text(
                        ' ${cuidador['distancia']}',
                      ),
                    ],
                  ),
                ],
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetalhesCuidadorPage(
                        nome: cuidador['nome'],
                        servico: cuidador['servico'],
                        avaliacao: cuidador['avaliacao'],
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}