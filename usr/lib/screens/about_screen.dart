import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Research Details'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'An Integrated Mathematical Modeling with Machine Learning Framework for Meteorological Air Quality Prediction',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 16),
            _buildAuthorsSection(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Abstract'),
            const SizedBox(height: 8),
            const Text(
              'Rapid urbanization, industrial emissions, and climate variability all contribute to air quality degradation, which poses difficult problems for public health and sustainable urban management. Forecasting accuracy and early-warning capabilities are limited by the nonlinear and high-dimensional interactions between atmospheric pollutants and meteorological variables, which are not well captured by traditional statistical models.\n\nThis study creates an integrated meteorological–machine learning framework that integrates important meteorological parameters like temperature, humidity, wind speed, rainfall, and solar radiation with multi-source pollutant data (PM2.5, PM10, NO₂, SO₂, CO, and O₃). Missing value handling, normalization, and feature engineering with rolling statistics and temporal lags are all included in data preprocessing.\n\nRecurrent deep learning networks (LSTM) and ensemble models (Random Forest, Gradient Boosting) are used to capture temporal dynamics and nonlinear dependencies. RMSE, MAE, and R2 metrics are used to evaluate the model\'s performance, and the results demonstrate a notable improvement over traditional regression-based method. Temperature, humidity, and wind speed are the main factors influencing pollutant variability, according to sensitivity analysis.\n\nFor real-time air quality prediction and early-warning systems, the suggested framework offers a scalable, interpretable, and adaptable tool that offers practical insights for public health mitigation, urban planning, and environmental policy. This work adds a high-fidelity prediction methodology to urban climatology and environmental informatics.',
              style: TextStyle(fontSize: 15, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Keywords'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'Air Quality Prediction',
                'Meteorological Data',
                'Machine Learning',
                'LSTM Networks',
                'Ensemble Models',
                'PM2.5 Short-Term Forecasting',
                'Urban Air Pollution'
              ].map((keyword) => Chip(
                label: Text(keyword, style: const TextStyle(fontSize: 12)),
                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                side: BorderSide.none,
              )).toList(),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildAuthorsSection(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Authors',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildAuthor('Md Abdullah Al Mamun', '1', '221206@ku.ac.bd'),
            _buildAuthor('Urmi Mondal', '2', '221211@ku.ac.bd'),
            _buildAuthor('Ferdous Hossain', '3', '221222@ku.ac.bd'),
            _buildAuthor('Md. Rakib Mahmud', '4', '221231@ku.ac.bd'),
            _buildAuthor('Lasker Ershad Ali', '5', 'ershad@math.ku.ac.bd'),
            _buildAuthor('Md. Haider Ali Biswas', '6, *', 'mhabiswas@math.ku.ac.bd'),
            const Divider(height: 24),
            const Text(
              'Affiliations:',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            const SizedBox(height: 4),
            const Text(
              '1-4 Undergraduate Student of Mathematics Discipline, Khulna University, Bangladesh\n5-6 Mathematics Discipline, Khulna University, Bangladesh',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            const Text(
              '* Corresponding Author',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthor(String name, String superscript, String email) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          children: [
            TextSpan(text: name, style: const TextStyle(fontWeight: FontWeight.w500)),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(2, -4),
                child: Text(
                  superscript,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextSpan(
              text: '  ($email)',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
