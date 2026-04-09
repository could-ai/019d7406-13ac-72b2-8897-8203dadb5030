import 'package:flutter/material.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Early-Warning System'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.memory, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'LSTM & Ensemble Models',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Our framework utilizes Recurrent Deep Learning (LSTM), Random Forest, and Gradient Boosting to capture temporal dynamics and nonlinear dependencies for high-fidelity short-term forecasting.',
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'PM2.5 Short-Term Forecast',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildBar('Now', 45, Colors.green),
                  _buildBar('+6h', 52, Colors.yellow.shade700),
                  _buildBar('+12h', 68, Colors.yellow.shade700),
                  _buildBar('+18h', 85, Colors.orange),
                  _buildBar('+24h', 110, Colors.orange.shade800),
                  _buildBar('+36h', 75, Colors.yellow.shade700),
                  _buildBar('+48h', 50, Colors.green),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            const Text(
              'Sensitivity Analysis (Main Factors)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Factors most influencing pollutant variability:',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            _buildFactorTile('Temperature', 'High Impact', 0.88, Colors.red),
            _buildFactorTile('Humidity', 'High Impact', 0.82, Colors.orange),
            _buildFactorTile('Wind Speed', 'High Impact', 0.75, Colors.blue),
            
            const SizedBox(height: 32),
            const Text(
              'Model Performance Metrics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMetricCard(context, 'RMSE', '12.4'),
                _buildMetricCard(context, 'MAE', '8.7'),
                _buildMetricCard(context, 'R²', '0.92'),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(BuildContext context, String label, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
        ],
      ),
    );
  }

  Widget _buildBar(String time, double value, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(value.toInt().toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 8),
        Container(
          width: 35,
          height: value * 1.2, // Scale factor
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
        const SizedBox(height: 8),
        Text(time, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildFactorTile(String name, String impact, double confidence, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
              Text(impact, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: confidence,
            backgroundColor: Colors.grey.shade200,
            color: color,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}
