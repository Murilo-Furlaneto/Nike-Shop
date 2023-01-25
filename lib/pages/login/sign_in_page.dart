import 'package:flutter/material.dart';
import 'package:nike_shop/pages/home/home_page.dart';
import 'package:nike_shop/pages/login/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Form(
                            key: formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
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
                                ],
                              ),
                            )),
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
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              }
                              return;
                            },
                            child: const Text(
                              'Entrar',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),

                        //Esqueceu a senha
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Esqueceu a senha?',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              )),
                        ),

                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpPage()));
                            },
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
