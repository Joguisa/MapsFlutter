import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NuevoUsuarioForm extends StatefulWidget {
  const NuevoUsuarioForm({Key? key}) : super(key: key);

  @override
  State<NuevoUsuarioForm> createState() => _NuevoUsuarioFormState();
}

class _NuevoUsuarioFormState extends State<NuevoUsuarioForm> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _claveController = TextEditingController();

  bool _formIsValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: const Text(
                'Formulario de Nuevo Usuario',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildInput('Usuario', _usuarioController),
                  _buildInput('Nombres', _nombresController),
                  _buildInput('Apellidos', _apellidosController),
                  _buildInput('Teléfono', _telefonoController),
                  _buildInput('Dirección', _direccionController),
                  _buildInput('Clave', _claveController, isPassword: true),
                  const SizedBox(height: 20), // Espacio entre campos y botón
                  Center(
                    // Centrar el botón en la pantalla
                    child: SizedBox(
                      width: 200, // Ancho deseado para el botón
                      height: 60,
                      child: ElevatedButton(
                        onPressed: _formIsValid ? _guardarUsuario : null,
                        style: ButtonStyle(
                          backgroundColor: _formIsValid
                              ? MaterialStateProperty.all<Color>(Colors.indigo)
                              : MaterialStateProperty.all<Color>(Colors.grey),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Guardar Usuario',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
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

  Widget _buildInput(String labelText, TextEditingController controller,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          onChanged: (_) => _validateForm(),
          decoration: InputDecoration(
            labelText: labelText,
            filled: true,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void _validateForm() {
    setState(() {
      _formIsValid = _usuarioController.text.isNotEmpty &&
          _nombresController.text.isNotEmpty &&
          _apellidosController.text.isNotEmpty &&
          _telefonoController.text.isNotEmpty &&
          _direccionController.text.isNotEmpty &&
          _claveController.text.isNotEmpty;
    });
  }

  void _guardarUsuario() {
    if (kDebugMode) {
      print('Usuario: ${_usuarioController.text}');
      print('Nombres: ${_nombresController.text}');
      print('Apellidos: ${_apellidosController.text}');
      print('Teléfono: ${_telefonoController.text}');
      print('Dirección: ${_direccionController.text}');
      print('Clave: ${_claveController.text}');
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: NuevoUsuarioForm(),
  ));
}
