import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Monitoring'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Air Quality Index (AQI)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.shade50,
                  border: Border.all(color: Colors.orange, width: 4),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '112',
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      'MODERATE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            // Pollutants Section
            Row(
              children: [
                Icon(Icons.cloud_outlined, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                const Text(
                  'Multi-Source Pollutants',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: const [
                StatCard(title: 'PM 2.5', value: '45 µg', icon: Icons.blur_on),
                StatCard(title: 'PM 10', value: '82 µg', icon: Icons.blur_circular),
                StatCard(title: 'NO₂', value: '22 ppb', icon: Icons.factory_outlined),
                StatCard(title: 'SO₂', value: '8 ppb', icon: Icons.smoke_free),
                StatCard(title: 'CO', value: '0.5 ppm', icon: Icons.directions_car),
                StatCard(title: 'O₃', value: '35 ppb', icon: Icons.wb_sunny_outlined),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Meteorological Section
            Row(
              children: [
                Icon(Icons.thermostat, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                const Text(
                  'Meteorological Parameters',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: const [
                StatCard(title: 'Temperature', value: '28°C', icon: Icons.thermostat),
                StatCard(title: 'Humidity', value: '65%', icon: Icons.water_drop),
                StatCard(title: 'Wind Speed', value: '14 km/h', icon: Icons.air),
                StatCard(title: 'Rainfall', value: '0 mm', icon: Icons.umbrella),
                StatCard(title: 'Solar Radiation', value: '450 W/m²', icon: Icons.solar_power),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
