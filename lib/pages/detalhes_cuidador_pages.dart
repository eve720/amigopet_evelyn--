import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class DetalhesCuidadorPage extends StatelessWidget {
  final String nome;
  final String servico;
  final double avaliacao;

  const DetalhesCuidadorPage({
    super.key,
    required this.nome,
    required this.servico,
    required this.avaliacao,
  });

  void mostrarCancelamento(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Cancelar agendamento',
          ),

          content: const Text(
            'Tem certeza que deseja cancelar este agendamento?',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Não',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Agendamento cancelado.',
                    ),
                  ),
                );
              },
              child: const Text(
                'Sim, cancelar',
              ),
            ),
          ],
        );
      },
    );
  }

  void mostrarTipoServico(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            'Tipo de serviço',
          ),

          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Passeio',
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Hospedagem',
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Banho e tosa',
              ),
            ),
          ],
        );
      },
    );
  }

  void mostrarMaisOpcoes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.share,
                ),

                title: const Text(
                  'Compartilhar perfil',
                ),

                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Perfil compartilhado!',
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.flag,
                ),

                title: const Text(
                  'Denunciar',
                ),

                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Perfil denunciado.',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Detalhes do cuidador',
        ),

        backgroundColor: AppStyles.primaryColor,

        foregroundColor: Colors.white,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
            ),

            onPressed: () {
              mostrarMaisOpcoes(context);
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            const CircleAvatar(
              radius: 55,

              backgroundColor: AppStyles.primaryColor,

              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 60,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Text(
              nome,

              textAlign: TextAlign.center,

              style: AppStyles.title,
            ),

            const SizedBox(
              height: 8,
            ),

            Text(
              servico,

              textAlign: TextAlign.center,

              style: AppStyles.subtitle,
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),

                Text(
                  ' $avaliacao',

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 40,
            ),

            ElevatedButton.icon(
              style: AppStyles.primaryButton,

              onPressed: () {
                mostrarTipoServico(context);
              },

              icon: const Icon(
                Icons.pets,
              ),

              label: const Text(
                'Tipo de serviço',
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            OutlinedButton.icon(
              style: AppStyles.outlineButton,

              onPressed: () {
                mostrarMaisOpcoes(context);
              },

              icon: const Icon(
                Icons.more_horiz,
              ),

              label: const Text(
                'Mais opções',
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            TextButton(
              onPressed: () {
                mostrarCancelamento(context);
              },

              child: const Text(
                'Cancelar agendamento',

                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
