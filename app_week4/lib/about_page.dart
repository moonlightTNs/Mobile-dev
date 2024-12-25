import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // ให้เนื้อหาซ้อนใต้ AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/EV logo.png',
          width: 70,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white, // สีขาวด้านบน
              Colors.black12, // ไล่ลงมาสีเทาอ่อน
              Colors.black45, // ไล่ลงมาสีเทาเข้ม
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 110),
              const Text(
                'Neta v EV Car - Clear Sky Gray',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/cargray.png',
                width: 300,
              ),
              const SizedBox(height: 20),
              //----------------------------------------------
              Container(
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Center(
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // จัดให้ Column มีขนาดเท่าที่จำเป็น
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // จัดให้อยู่กึ่งกลางแนวนอน
                    mainAxisAlignment:
                        MainAxisAlignment.center, // จัดให้อยู่กึ่งกลางแนวตั้ง
                    children: [
                      ListTile(
                        leading:
                            Icon(Icons.timelapse, color: Colors.black54),
                        title: Text(
                          'Charging Time (hrs)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'NULL',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                
                      ListTile(
                        leading: Icon(Icons.battery_full, color: Colors.black54),
                        title: Text(
                          'Bat Capacity (kWh)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          '38.5',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      
                      ListTile(
                        leading: Icon(Icons.flag, color: Colors.black54),
                        title: Text(
                          'Efficiency (%)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          '0.84',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),

              //----------------------------------------------
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    CustomInputField(
                      title: 'Current SOC %',
                      hintText: 'Enter Current SOC',
                      icon: Icons.battery_4_bar_sharp,
                    ),
                    CustomInputField(
                      title: 'Target SOC %',
                      hintText: 'Enter Target SOC',
                      icon: Icons.battery_charging_full,
                    ),
                    CustomInputField(
                      title: 'Charging Rate (kWh)',
                      hintText: 'Enter Charging Rate',
                      icon: Icons.speed,
                    ),
                    CustomInputField(
                      title: 'Voltage (V)',
                      hintText: 'Enter Voltage',
                      icon: Icons.electrical_services,
                    ),
                    CustomInputField(
                      title: 'Charge Power (kWh)',
                      hintText: 'Enter Charge Power',
                      icon: Icons.power,
                    ),
                    SizedBox(height: 20),
                    SubmitButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData icon;

  const CustomInputField({
    super.key,
    required this.title,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black26),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // เพิ่มการทำงานเมื่อกดปุ่ม
          debugPrint("Data Submitted");
        },
        child: const Text(
          'Submit',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
  
