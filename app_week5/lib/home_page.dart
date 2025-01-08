import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _AboutPageState();
}

class _AboutPageState extends State<HomePage> {
  String _chargingtime = 'NULL';
  String _chargingpower = 'NULL';
  

  final currentSOC = TextEditingController();
  final targetSOC = TextEditingController();
  final chargingRate = TextEditingController();
  final voltage = TextEditingController();
  final chargePower = TextEditingController();
  final bat = TextEditingController();
  final efficiency = TextEditingController();

  @override
  void dispose() {
    // ปล่อยหน่วยความจำที่ใช้โดย TextEditingController
    currentSOC.dispose();
    targetSOC.dispose();
    chargingRate.dispose();
    voltage.dispose();
    chargePower.dispose();
    bat.dispose();
    efficiency.dispose();
    
    super.dispose();
  }

  void updateChargingInfo() {
    // อ่านค่าจาก TextEditingController และแปลงเป็นตัวเลข
    if (currentSOC.text == '' || targetSOC.text == '' || chargingRate.text == '' || voltage.text == '' || bat.text == '' || efficiency.text == '') {
      // กรณีข้อมูลไม่ถูกต้อง
      setState(() {
        _chargingtime = 'Invalid';
        _chargingpower = 'Invalid';
      });
      return;
    }
    double current = double.parse(currentSOC.text);
    double target = double.parse(targetSOC.text);
    double rate = double.parse(chargingRate.text);  
    double volt = double.parse(voltage.text);
    double batteryCapacity = double.parse(bat.text);  
    double efficiencyS = double.parse(efficiency.text);


    // คำนวณค่า
    double chargingpower =   (volt * rate) / 1000 ; 
    double chargingTime = ((target - current)* batteryCapacity) / (chargingpower * efficiencyS)/100;  
    
    // อัปเดต UI
    setState(() {
      _chargingtime = chargingTime.toStringAsFixed(2); // แปลงเป็น String และกำหนดให้มี 2 ตำแหน่งทศนิยม
      _chargingpower = chargingpower.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
              Colors.white,
              Colors.black12,
              Colors.black45,
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
                child: Center(
                  child: Column(
                    children: [
                      _buildListTile(
                        icon: Icons.timelapse,
                        title: 'Charging Time (hrs)',
                        value: _chargingtime,
                      ),
                      _buildListTile(
                        icon: Icons.power,
                        title: 'Charge Power (kWh) (%)',
                        value: _chargingpower,
                      ),
                    ],
                  ),
                ),
              ),
              _buildInputSection(),
            ],
          ),
        ),
      ),
        bottomNavigationBar: SubmitButton(
        onSubmit: updateChargingInfo,
      ),
    );
  }
  
  Widget _buildListTile({required IconData icon, required String title, required String value}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
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
      child: Column(
        children: [
          CustomInputField(
            controller: currentSOC,
            title: 'Current SOC %',
            hintText: 'Enter Current SOC',
            icon: Icons.battery_4_bar_sharp,
          ),
          CustomInputField(
            controller: targetSOC,
            title: 'Target SOC %',
            hintText: 'Enter Target SOC',
            icon: Icons.battery_charging_full,
          ),
          CustomInputField(
            controller: chargingRate,
            title: 'Charging Rate (kWh)',
            hintText: 'Enter Charging Rate',
            icon: Icons.speed,
          ),
          CustomInputField(
            controller: voltage,
            title: 'Voltage (V)',
            hintText: 'Enter Voltage',
            icon: Icons.electrical_services,
          ),
          CustomInputField(
            controller: bat,
            title: 'Bat Capacity (kWh)',
            hintText: 'Enter Bat Capacity',
            icon: Icons.power,
          ),
          CustomInputField(
            controller: efficiency,
            title: 'Efficiency (%)',
            hintText: 'Enter Bat Efficiency',
            icon: Icons.flag,
          ),
        ],
      ),
    );
  }
}

//_______________________________________________end of class____________________________________________________________________________

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final IconData icon;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          hintText: hintText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final VoidCallback onSubmit; 

  const SubmitButton({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          shape: const RoundedRectangleBorder(
            
          ),
        ),
        onPressed: onSubmit,
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
