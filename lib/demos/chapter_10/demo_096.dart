import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo096 extends StatefulWidget {
  const Demo096({super.key});

  @override
  State<Demo096> createState() => _Demo096State();
}

class _Demo096State extends State<Demo096> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '096',
      title: 'Stepper 步骤条',
      description: 'Stepper 分步引导用户完成流程。',
      child: Stepper(
        currentStep: _currentStep,
        onStepContinue: _currentStep < 2
            ? () => setState(() => _currentStep++)
            : null,
        onStepCancel: _currentStep > 0
            ? () => setState(() => _currentStep--)
            : null,
        onStepTapped: (step) => setState(() => _currentStep = step),
        controlsBuilder: (ctx, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                FilledButton(
                  onPressed: details.onStepContinue,
                  child: Text(_currentStep == 2 ? '完成' : '继续'),
                ),
                const SizedBox(width: 8),
                if (_currentStep > 0)
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('返回'),
                  ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('选择模板'),
            subtitle: const Text('选择一个起始模板'),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            content: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.web),
                  title: const Text('Web 应用'),
                  selected: true,
                ),
                ListTile(
                  leading: const Icon(Icons.phone_android),
                  title: const Text('移动应用'),
                ),
              ],
            ),
          ),
          Step(
            title: const Text('配置项目'),
            subtitle: const Text('填写项目信息'),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            content: const TextField(
              decoration: InputDecoration(
                labelText: '项目名称',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Step(
            title: const Text('确认创建'),
            subtitle: const Text('确认信息并创建'),
            isActive: _currentStep >= 2,
            state: _currentStep == 2 ? StepState.indexed : StepState.disabled,
            content: const Text('确认以上信息无误后，点击"完成"创建项目。'),
          ),
        ],
      ),
    );
  }
}
