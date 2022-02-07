import 'package:app06chat/components/auth_form.dart';
import 'package:app06chat/core/models/auth_form_data.dart';
import 'package:app06chat/core/services/auth/auth_mock_service.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;
  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);
      if (formData.isLogin) {
        await AuthMockService().login(formData.email, formData.password);
      } else {
        await AuthMockService().singup(
          formData.name,
          formData.email,
          formData.password,
          formData.image,
        );
      }
    } catch (error) {
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(
                onSubmit: _handleSubmit,
              ),
            ),
          ),
          if (_isLoading)
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              child: const CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}