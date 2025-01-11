import 'package:flutter/material.dart';
// تم تعليق استيراد Firebase مؤقتاً لأننا لا نحتاج إليه الآن
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class AddEmployeePage extends StatefulWidget {
  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final _employeeNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _employeeIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _companyIdController = TextEditingController();

  // دالة وهمية لإضافة الموظف
  // في الوقت الحالي، نقوم بمحاكاة إضافة الموظف فقط
  Future<void> addEmployee() async {
    String employeeName = _employeeNameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String employeeId = _employeeIdController.text;
    String password = _passwordController.text;
    String companyId = _companyIdController.text;

    if (employeeName.isNotEmpty && email.isNotEmpty && phone.isNotEmpty &&
        employeeId.isNotEmpty && password.isNotEmpty && companyId.isNotEmpty) {
      try {
        // محاكاة إضافة الموظف بنجاح
        // هنا يمكنك ربط الكود مع Firebase لاحقًا
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم إضافة الموظف بنجاح')));
      } catch (e) {
        // في حال حدوث خطأ، يتم إظهار رسالة الخطأ
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('فشل في إضافة الموظف: $e')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('يرجى ملء جميع الحقول')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة موظف'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _employeeNameController,
              decoration: InputDecoration(labelText: 'اسم الموظف'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'رقم الهاتف'),
            ),
            TextField(
              controller: _employeeIdController,
              decoration: InputDecoration(labelText: 'ID الموظف'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'كلمة المرور'),
            ),
            TextField(
              controller: _companyIdController,
              decoration: InputDecoration(labelText: 'ID الشركة'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addEmployee, // عند الضغط على الزر، يتم تنفيذ دالة إضافة الموظف
              child: Text('إضافة الموظف'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
