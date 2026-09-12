import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(BloodDonationApp());
}

class AppColors {
  static const Color primary = Color(0xFFB71C1C);
  static const Color primaryDark = Color(0xFF7F0000);
  static const Color accent = Color(0xFFE53935);
  static const Color bg = Color(0xFFF5F5F5);
}

class BloodDonationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تبرع بالدم',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.bg,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.primaryDark],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.bloodtype, size: 90, color: AppColors.primary),
              ),
              SizedBox(height: 30),
              Text('تبرع بالدم',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('أنقذ حياة إنسان 🩸',
                  style: TextStyle(color: Colors.white70, fontSize: 18)),
              SizedBox(height: 50),
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.accent],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bloodtype, size: 100, color: Colors.white),
                SizedBox(height: 20),
                Text('تبرع بالدم',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('أنقذ حياة إنسان 🩸',
                    style: TextStyle(color: Colors.white70, fontSize: 18)),
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'رقم الهاتف',
                      prefixIcon: Icon(Icons.phone, color: AppColors.primary),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(18),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text('إرسال رمز التحقق',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  child: Text('متابعة كزائر',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.primaryDark],
              ),
            ),
            child: Center(
              child: Opacity(
                opacity: 0.15,
                child: Icon(Icons.bloodtype, size: 400, color: Colors.white),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person,
                            size: 32, color: AppColors.primary),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('مرحباً أحمد 👋',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          Text('🩸 O+  |  ✓ متاح',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.1,
                      children: [
                        MenuCard(
                            icon: '🔍',
                            title: 'بحث عن متبرع',
                            onTap: () => _go(context, SearchScreen())),
                        MenuCard(
                            icon: '🚨',
                            title: 'طلب عاجل',
                            bgColor: Color(0xFFFFEBEE),
                            onTap: () => _go(context, EmergencyScreen())),
                        MenuCard(
                            icon: '🗓️',
                            title: 'حملات التبرع',
                            onTap: () => _go(context, CampaignsScreen())),
                        MenuCard(
                            icon: '📝',
                            title: 'اختبار الأهلية',
                            onTap: () => _go(context, EligibilityScreen())),
                        MenuCard(
                            icon: '🏥',
                            title: 'مراكز التبرع',
                            onTap: () => _go(context, CentersScreen())),
                        MenuCard(
                            icon: '🔔',
                            title: 'الإشعارات',
                            onTap: () => _snack(context, 'لا توجد إشعارات')),
                        MenuCard(
                            icon: '⚙️',
                            title: 'الإعدادات',
                            onTap: () => _go(context, SettingsScreen())),
                        MenuCard(
                            icon: '👤',
                            title: 'ملفي الشخصي',
                            onTap: () => _go(context, ProfileScreen())),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _go(BuildContext context, Widget s) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => s));
  }

  void _snack(BuildContext c, String m) {
    ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text(m)));
  }
}

class MenuCard extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color? bgColor;

  MenuCard(
      {required this.icon,
      required this.title,
      required this.onTap,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: Offset(0, 4))
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(icon, style: TextStyle(fontSize: 42)),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selected = 'O+';
  bool onlyAvailable = true;
  final bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  final donors = [
    {'name': 'أحمد محمد', 'blood': 'O+', 'last': 'منذ 4 أشهر', 'phone': '+213555000000'},
    {'name': 'سارة علي', 'blood': 'O+', 'last': 'منذ 5 أشهر', 'phone': '+213555000001'},
    {'name': 'يوسف كريم', 'blood': 'O-', 'last': 'منذ 3 أشهر', 'phone': '+213555000002'},
    {'name': 'فاطمة زهراء', 'blood': 'A+', 'last': 'منذ 6 أشهر', 'phone': '+213555000003'},
  ];

  Future<void> _call(String phone) async {
    final url = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final filtered = donors.where((d) => d['blood'] == selected).toList();
    return Scaffold(
      appBar: AppBar(
          title: Text('البحث عن متبرع'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('اختر زمرة الدم:',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: bloodTypes.map((t) {
                    final sel = t == selected;
                    return GestureDetector(
                      onTap: () => setState(() => selected = t),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color:
                              sel ? AppColors.primary : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(t,
                            style: TextStyle(
                                color: sel ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                    );
                  }).toList(),
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('المتاحون فقط'),
                  value: onlyAvailable,
                  activeColor: AppColors.primary,
                  onChanged: (v) => setState(() => onlyAvailable = v),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: filtered.length,
              itemBuilder: (c, i) {
                final d = filtered[i];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red.shade100,
                      child: Icon(Icons.person, color: AppColors.primary),
                    ),
                    title: Text(d['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('🩸 ${d['blood']} | ${d['last']}'),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: IconButton(
                        icon: Icon(Icons.phone, color: Colors.white),
                        onPressed: () => _call(d['phone']!),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EmergencyScreen extends StatefulWidget {
  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  String? bloodType;
  final _hospital = TextEditingController();
  final _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('طلب عاجل 🚨'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber,
                      color: AppColors.primary, size: 40),
                  SizedBox(width: 12),
                  Expanded(
                      child: Text('سيصل إشعار فوري لكل المتبرعين المطابقين')),
                ],
              ),
            ),
            SizedBox(height: 24),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'زمرة الدم',
                prefixIcon: Icon(Icons.bloodtype, color: AppColors.primary),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                  .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                  .toList(),
              onChanged: (v) => setState(() => bloodType = v),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _hospital,
              decoration: InputDecoration(
                labelText: 'اسم المستشفى',
                prefixIcon:
                    Icon(Icons.local_hospital, color: AppColors.primary),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'رقم هاتفك',
                prefixIcon: Icon(Icons.phone, color: AppColors.primary),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('✅ تم إرسال الطلب العاجل!'),
                    backgroundColor: Colors.green,
                  ));
                  Navigator.pop(context);
                },
                icon: Icon(Icons.warning, size: 28),
                label: Text('إرسال الطلب العاجل',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CampaignsScreen extends StatelessWidget {
  final campaigns = [
    {'center': 'مركز الجزائر', 'date': '15 سبتمبر - 9:00 ص', 'types': 'O+, A+, B+'},
    {'center': 'مستشفى وهران', 'date': '20 سبتمبر - 10:00 ص', 'types': 'جميع الزمر'},
    {'center': 'مركز قسنطينة', 'date': '25 سبتمبر - 8:30 ص', 'types': 'O-, AB+'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('حملات التبرع 🗓️'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: campaigns.length,
        itemBuilder: (c, i) {
          final camp = campaigns[i];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('حملة ${camp['center']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 10),
                  Text('📅 ${camp['date']}'),
                  Text('🩸 ${camp['types']}'),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('سجّل الآن'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EligibilityScreen extends StatefulWidget {
  @override
  _EligibilityScreenState createState() => _EligibilityScreenState();
}

class _EligibilityScreenState extends State<EligibilityScreen> {
  int current = 0;
  final questions = [
    'هل عمرك بين 18 و 65 سنة؟',
    'هل وزنك أكثر من 50 كغ؟',
    'هل مرّ أكثر من 3 أشهر على آخر تبرع؟',
    'هل أنت بصحة جيدة حالياً؟',
    'هل تتناول أدوية مزمنة؟',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('اختبار الأهلية 📝'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text('السؤال ${current + 1} من ${questions.length}'),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: (current + 1) / questions.length,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(AppColors.primary),
              minHeight: 8,
            ),
            SizedBox(height: 50),
            Text(questions[current],
                style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (current < questions.length - 1) {
                        setState(() => current++);
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('✅ مؤهل للتبرع'),
                            content: Text('يمكنك التبرع بالدم!'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text('حسناً'))
                            ],
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 18)),
                    child: Text('نعم', style: TextStyle(fontSize: 18)),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (current < questions.length - 1) {
                        setState(() => current++);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 18)),
                    child: Text('لا', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CentersScreen extends StatelessWidget {
  final centers = [
    {'name': 'مركز الجزائر', 'address': 'شارع ديدوش مراد', 'hours': '8:00 - 17:00', 'phone': '+213555000000'},
    {'name': 'مستشفى وهران', 'address': 'حي المدينة الجديدة', 'hours': '9:00 - 18:00', 'phone': '+213555000001'},
    {'name': 'مركز قسنطينة', 'address': 'وسط المدينة', 'hours': '8:30 - 16:30', 'phone': '+213555000002'},
  ];

  Future<void> _call(String phone) async {
    final url = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('مراكز التبرع 🏥'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: centers.length,
        itemBuilder: (c, i) {
          final cent = centers[i];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cent['name']!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 8),
                  Text('📍 ${cent['address']}'),
                  Text('🕐 ${cent['hours']}'),
                  Text('📞 ${cent['phone']}'),
                  SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () => _call(cent['phone']!),
                    icon: Icon(Icons.phone, size: 18),
                    label: Text('اتصال'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('الإعدادات ⚙️'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white),
      body: ListView(
        children: [
          SwitchListTile(
              secondary: Icon(Icons.dark_mode),
              title: Text('الوضع الليلي'),
              value: darkMode,
              activeColor: AppColors.primary,
              onChanged: (v) => setState(() => darkMode = v)),
          SwitchListTile(
              secondary: Icon(Icons.notifications),
              title: Text('الإشعارات'),
              value: notifications,
              activeColor: AppColors.primary,
              onChanged: (v) => setState(() => notifications = v)),
          ListTile(
              leading: Icon(Icons.info), title: Text('حول التطبيق')),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('ملفي الشخصي 👤'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.accent]),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.person, size: 60, color: AppColors.primary),
                  ),
                  SizedBox(height: 12),
                  Text('أحمد محمد',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text('🩸 O+',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  ListTile(
                      leading: Icon(Icons.phone, color: AppColors.primary),
                      title: Text('رقم الهاتف'),
                      subtitle: Text('+213 xxx xx xx')),
                  Divider(height: 0),
                  ListTile(
                      leading: Icon(Icons.bloodtype, color: AppColors.primary),
                      title: Text('زمرة الدم'),
                      subtitle: Text('O+')),
                  Divider(height: 0),
                  SwitchListTile(
                    secondary: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('حالة التوفر'),
                    value: isAvailable,
                    activeColor: AppColors.primary,
                    onChanged: (v) => setState(() => isAvailable = v),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
