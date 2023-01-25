import 'package:flutter/material.dart';

import '../home/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isActive = true;
  final formKey = GlobalKey<FormState>();

  void changePassword() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 40),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(45),
                          ),
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              //Nome
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  labelText: 'Nome',
                                  prefixIcon: Icon(Icons.person),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ' O campo nome precisa ser preenchido';
                                  }
                                  if (value.trim().length < 3) {
                                    return 'A nome precisa conter mais de 3 caracteres';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              //Email
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ' O campo email precisa ser preenchido';
                                  }
                                  if (value.trim().length < 5) {
                                    return 'O email não pode conter menos de 5 caracteres';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              //Senha
                              TextFormField(
                                obscureText: isActive ? true : false,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  labelText: 'Senha',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: changePassword,
                                    icon: isActive
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ' O campo senha precisa ser preenchido';
                                  }
                                  if (value.trim().length < 3) {
                                    return 'A senha precisa conter mais de 3 caracteres';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              const SizedBox(height: 20),

                              //Entrar
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff4E878C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   HomePage()));
                                    }
                                    return;
                                  },
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                    child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
