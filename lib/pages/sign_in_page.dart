import 'package:flutter/material.dart';
import 'HomePage.dart'; // استيراد الصفحة الرئيسية بعد تسجيل الدخول

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _employeeIdController = TextEditingController();
  final _companyIdController = TextEditingController();
  bool _rememberMe = false; // حالة "تذكرني"
  final _formKey = GlobalKey<FormState>();

  // دالة تسجيل الدخول
  void _signIn() {
    if (_formKey.currentState?.validate() ?? false) {
      // إذا كانت البيانات المدخلة صحيحة
      final employeeId = _employeeIdController.text;
      final companyId = _companyIdController.text;

      // من هنا يمكنك إضافة منطق للتحقق من بيانات المستخدم (على سبيل المثال، الاتصال بالخادم)

      // بعد التحقق من البيانات بنجاح، الانتقال إلى الصفحة الرئيسية
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // حقل "معرف الموظف"
              TextFormField(
                controller: _employeeIdController,
                decoration: const InputDecoration(
                  labelText: 'معرف الموظف',
                  hintText: 'أدخل معرف الموظف',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال معرف الموظف';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // حقل "معرف الشركة"
              TextFormField(
                controller: _companyIdController,
                decoration: const InputDecoration(
                  labelText: 'معرف الشركة',
                  hintText: 'أدخل معرف الشركة',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال معرف الشركة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // مربع "تذكرني"
              CheckboxListTile(
                title: const Text('تذكرني'),
                value: _rememberMe,
                onChanged: (bool? newValue) {
                  setState(() {
                    _rememberMe = newValue!;
                  });
                },
              ),
              const SizedBox(height: 32),

              // زر "تسجيل الدخول"
              ElevatedButton(
                onPressed: _signIn,
                child: const Text('تسجيل الدخول'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(height: 16),

              // رابط "نسيت كلمة المرور"
              TextButton(
                onPressed: () {
                  // منطق لإعادة تعيين كلمة المرور
                  print('إعادة تعيين كلمة المرور');
                },
                child: const Text('نسيت كلمة المرور؟'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
