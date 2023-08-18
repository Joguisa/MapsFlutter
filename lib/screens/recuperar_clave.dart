import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.jpg'), // Ruta de la imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeader(),
            _buildBody(),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'Recuperar Contraseña de usuario',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBody() {
    return Container(); // Placeholder for body content
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Correo Electrónico',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _handleSendRequest(context);
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.indigo),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            fixedSize: const MaterialStatePropertyAll(
              Size(250, 60),
            ),
          ),
          child: const Text(
            'Enviar Solicitud',
            style: TextStyle(
              color: Colors.white, // Color del texto blanco
              fontSize: 20, // Tamaño de la fuente aumentado
            ),
          ),
        ),
      ],
    );
  }

  void _handleSendRequest(BuildContext context) {
    final String enteredEmail = emailController.text;

    // Basic email validation
    if (_isValidEmail(enteredEmail)) {
      // Implement your logic for sending password reset request here

      // Show a confirmation dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Solicitud Enviada'),
          content: const Text(
              'Se ha enviado la solicitud de recuperación de contraseña.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    } else {
      // Show an error dialog for invalid email format
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content:
              const Text('Por favor, ingresa un correo electrónico válido.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    }
  }

  bool _isValidEmail(String email) {
    // Basic email validation logic (you can use a more comprehensive solution)
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
