import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo046 extends StatefulWidget {
  const Demo046({super.key});
  @override
  State<Demo046> createState() => _Demo046State();
}

class _Demo046State extends State<Demo046> {
  String _selectedCity = 'beijing';
  String? _selectedCountry;

  final _cities = {
    'beijing': '北京',
    'shanghai': '上海',
    'guangzhou': '广州',
    'shenzhen': '深圳',
    'hangzhou': '杭州',
    'chengdu': '成都',
  };

  final _countries = ['中国', '美国', '日本', '韩国', '英国'];

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '046',
      title: 'DropdownButton 下拉按钮',
      description: 'DropdownButton 下拉选择组件演示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('普通 DropdownButton (带图标):', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          DropdownButton<String>(
            value: _selectedCity,
            icon: const Icon(Icons.expand_more),
            underline: const Divider(height: 1),
            items: _cities.entries.map((e) {
              return DropdownMenuItem<String>(
                value: e.key,
                child: Row(
                  children: [
                    const Icon(Icons.location_on, size: 18),
                    const SizedBox(width: 8),
                    Text(e.value),
                  ],
                ),
              );
            }).toList(),
            onChanged: (v) => setState(() => _selectedCity = v!),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text('已选城市: ${_cities[_selectedCity]}',
                 style: Theme.of(context).textTheme.bodySmall),
          ),
          const SizedBox(height: 20),

          const Text('DropdownButtonFormField:', style: TextStyle(fontWeight: FontWeight.w600)),
          DropdownButtonFormField<String>(
            initialValue: _selectedCountry,
            decoration: const InputDecoration(
              labelText: '选择国家',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.public),
            ),
            items: _countries.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
            onChanged: (v) => setState(() => _selectedCountry = v),
          ),
          if (_selectedCountry != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text('已选国家: $_selectedCountry',
                   style: Theme.of(context).textTheme.bodySmall),
            ),
        ],
      ),
    );
  }
}
