import 'package:flutter/material.dart';
import 'map.dart'; 
import 'nuevo_usuario.dart';
// import 'recuperarClave.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: const Text(
        'Inicio de Sesión',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(); // Placeholder for body content
  }

  Widget _buildFooter() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Usuario',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              // const Divider(height: 1, color: Colors.grey),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  _handleLogin();
                },
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.indigo),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  fixedSize: const MaterialStatePropertyAll(
                    Size(100, 50),
                  ),
                ),
                child: const Text(
                  'Ingresar',
                  style: TextStyle(
                    color: Colors.white, // Color del texto blanco
                    fontSize: 18, // Tamaño de la fuente aumentado
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (context) => const ForgotPasswordPage(),
                      builder: (context) => const NuevoUsuarioForm(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.indigo),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  fixedSize: const MaterialStatePropertyAll(
                    Size(100, 50),
                  ),
                ),
                child: const Text(
                  'Recuperar Contraseña',
                  style: TextStyle(
                    color: Colors.white, // Color del texto blanco
                    fontSize: 18, // Tamaño de la fuente aumentado
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleLogin() {
    if (usernameController.text == 'admin' &&
        passwordController.text == '12345') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MapaScreen(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error de autenticación'),
          content: const Text('Usuario o contraseña incorrectos.'),
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
}
