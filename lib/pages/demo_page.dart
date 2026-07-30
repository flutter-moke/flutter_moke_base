/// DemoPage — 通用演示宿主页
///
/// 根据文章 ID 查找对应的演示组件并展示。如果未注册演示，显示占位信息。
/// 页面标题自动从 manifest 中读取。
library;

import 'package:flutter/material.dart';

import '../data/chapter_manifest.dart';
import '../demos/demo_frame.dart';

// ═══════════════════════════════════════════════════════════════
// Demo 注册表
// 所有 128 个演示组件在此注册，通过文章 ID 查找。
// 添加新演示时：1) 创建 demo_xxx.dart 文件，2) 在此 import，3) 在 _registry 中注册
// ═══════════════════════════════════════════════════════════════

// 01-开发环境搭建
import '../demos/chapter_01/demo_001.dart';
import '../demos/chapter_01/demo_002.dart';
import '../demos/chapter_01/demo_003.dart';
import '../demos/chapter_01/demo_004.dart';
import '../demos/chapter_01/demo_005.dart';
import '../demos/chapter_01/demo_006.dart';
import '../demos/chapter_01/demo_007.dart';

// 02-框架与结构
import '../demos/chapter_02/demo_008.dart';
import '../demos/chapter_02/demo_009.dart';
import '../demos/chapter_02/demo_010.dart';
import '../demos/chapter_02/demo_011.dart';
import '../demos/chapter_02/demo_012.dart';

// 03-布局组件
import '../demos/chapter_03/demo_013.dart';
import '../demos/chapter_03/demo_014.dart';
import '../demos/chapter_03/demo_015.dart';
import '../demos/chapter_03/demo_016.dart';
import '../demos/chapter_03/demo_017.dart';
import '../demos/chapter_03/demo_018.dart';
import '../demos/chapter_03/demo_019.dart';
import '../demos/chapter_03/demo_020.dart';
import '../demos/chapter_03/demo_021.dart';
import '../demos/chapter_03/demo_022.dart';
import '../demos/chapter_03/demo_023.dart';
import '../demos/chapter_03/demo_024.dart';
import '../demos/chapter_03/demo_025.dart';
import '../demos/chapter_03/demo_026.dart';
import '../demos/chapter_03/demo_027.dart';

// 04-按钮组件
import '../demos/chapter_04/demo_028.dart';
import '../demos/chapter_04/demo_029.dart';
import '../demos/chapter_04/demo_030.dart';
import '../demos/chapter_04/demo_031.dart';
import '../demos/chapter_04/demo_032.dart';
import '../demos/chapter_04/demo_033.dart';
import '../demos/chapter_04/demo_034.dart';
import '../demos/chapter_04/demo_035.dart';
import '../demos/chapter_04/demo_036.dart';

// 05-输入与表单
import '../demos/chapter_05/demo_037.dart';
import '../demos/chapter_05/demo_038.dart';
import '../demos/chapter_05/demo_039.dart';
import '../demos/chapter_05/demo_040.dart';
import '../demos/chapter_05/demo_041.dart';
import '../demos/chapter_05/demo_042.dart';
import '../demos/chapter_05/demo_043.dart';
import '../demos/chapter_05/demo_044.dart';
import '../demos/chapter_05/demo_045.dart';
import '../demos/chapter_05/demo_046.dart';
import '../demos/chapter_05/demo_047.dart';
import '../demos/chapter_05/demo_048.dart';
import '../demos/chapter_05/demo_049.dart';

// 06-导航组件
import '../demos/chapter_06/demo_050.dart';
import '../demos/chapter_06/demo_051.dart';
import '../demos/chapter_06/demo_052.dart';
import '../demos/chapter_06/demo_053.dart';
import '../demos/chapter_06/demo_054.dart';
import '../demos/chapter_06/demo_055.dart';
import '../demos/chapter_06/demo_056.dart';
import '../demos/chapter_06/demo_057.dart';
import '../demos/chapter_06/demo_058.dart';
import '../demos/chapter_06/demo_059.dart';

// 07-信息展示组件
import '../demos/chapter_07/demo_060.dart';
import '../demos/chapter_07/demo_061.dart';
import '../demos/chapter_07/demo_062.dart';
import '../demos/chapter_07/demo_063.dart';
import '../demos/chapter_07/demo_064.dart';
import '../demos/chapter_07/demo_065.dart';
import '../demos/chapter_07/demo_066.dart';
import '../demos/chapter_07/demo_067.dart';
import '../demos/chapter_07/demo_068.dart';
import '../demos/chapter_07/demo_069.dart';
import '../demos/chapter_07/demo_070.dart';
import '../demos/chapter_07/demo_071.dart';
import '../demos/chapter_07/demo_072.dart';
import '../demos/chapter_07/demo_073.dart';
import '../demos/chapter_07/demo_074.dart';

// 08-反馈与弹窗
import '../demos/chapter_08/demo_075.dart';
import '../demos/chapter_08/demo_076.dart';
import '../demos/chapter_08/demo_077.dart';
import '../demos/chapter_08/demo_078.dart';
import '../demos/chapter_08/demo_079.dart';
import '../demos/chapter_08/demo_080.dart';

// 09-菜单与选择
import '../demos/chapter_09/demo_081.dart';
import '../demos/chapter_09/demo_082.dart';
import '../demos/chapter_09/demo_083.dart';
import '../demos/chapter_09/demo_084.dart';
import '../demos/chapter_09/demo_085.dart';

// 10-列表与滚动
import '../demos/chapter_10/demo_086.dart';
import '../demos/chapter_10/demo_087.dart';
import '../demos/chapter_10/demo_088.dart';
import '../demos/chapter_10/demo_089.dart';
import '../demos/chapter_10/demo_090.dart';
import '../demos/chapter_10/demo_091.dart';
import '../demos/chapter_10/demo_092.dart';
import '../demos/chapter_10/demo_093.dart';
import '../demos/chapter_10/demo_094.dart';
import '../demos/chapter_10/demo_095.dart';
import '../demos/chapter_10/demo_096.dart';
import '../demos/chapter_10/demo_097.dart';
import '../demos/chapter_10/demo_098.dart';

// 11-日期与时间
import '../demos/chapter_11/demo_099.dart';
import '../demos/chapter_11/demo_100.dart';
import '../demos/chapter_11/demo_101.dart';
import '../demos/chapter_11/demo_102.dart';

// 12-进度指示
import '../demos/chapter_12/demo_103.dart';
import '../demos/chapter_12/demo_104.dart';

// 13-装饰与样式
import '../demos/chapter_13/demo_105.dart';
import '../demos/chapter_13/demo_106.dart';
import '../demos/chapter_13/demo_107.dart';
import '../demos/chapter_13/demo_108.dart';
import '../demos/chapter_13/demo_109.dart';
import '../demos/chapter_13/demo_110.dart';
import '../demos/chapter_13/demo_111.dart';

// 14-动画系统
import '../demos/chapter_14/demo_112.dart';
import '../demos/chapter_14/demo_113.dart';
import '../demos/chapter_14/demo_114.dart';
import '../demos/chapter_14/demo_115.dart';
import '../demos/chapter_14/demo_116.dart';
import '../demos/chapter_14/demo_117.dart';
import '../demos/chapter_14/demo_118.dart';
import '../demos/chapter_14/demo_119.dart';

// 15-实战与进阶
import '../demos/chapter_15/demo_120.dart';
import '../demos/chapter_15/demo_121.dart';
import '../demos/chapter_15/demo_122.dart';
import '../demos/chapter_15/demo_123.dart';
import '../demos/chapter_15/demo_124.dart';
import '../demos/chapter_15/demo_125.dart';
import '../demos/chapter_15/demo_126.dart';
import '../demos/chapter_15/demo_127.dart';
import '../demos/chapter_15/demo_128.dart';

/// 内部注册表
final Map<String, Widget Function()> _registry = <String, Widget Function()>{
  '001': () => const Demo001(),
  '002': () => const Demo002(),
  '003': () => const Demo003(),
  '004': () => const Demo004(),
  '005': () => const Demo005(),
  '006': () => const Demo006(),
  '007': () => const Demo007(),
  '008': () => const Demo008(),
  '009': () => const Demo009(),
  '010': () => const Demo010(),
  '011': () => const Demo011(),
  '012': () => const Demo012(),
  '013': () => const Demo013(),
  '014': () => const Demo014(),
  '015': () => const Demo015(),
  '016': () => const Demo016(),
  '017': () => const Demo017(),
  '018': () => const Demo018(),
  '019': () => const Demo019(),
  '020': () => const Demo020(),
  '021': () => const Demo021(),
  '022': () => const Demo022(),
  '023': () => const Demo023(),
  '024': () => const Demo024(),
  '025': () => const Demo025(),
  '026': () => const Demo026(),
  '027': () => const Demo027(),
  '028': () => const Demo028(),
  '029': () => const Demo029(),
  '030': () => const Demo030(),
  '031': () => const Demo031(),
  '032': () => const Demo032(),
  '033': () => const Demo033(),
  '034': () => const Demo034(),
  '035': () => const Demo035(),
  '036': () => const Demo036(),
  '037': () => const Demo037(),
  '038': () => const Demo038(),
  '039': () => const Demo039(),
  '040': () => const Demo040(),
  '041': () => const Demo041(),
  '042': () => const Demo042(),
  '043': () => const Demo043(),
  '044': () => const Demo044(),
  '045': () => const Demo045(),
  '046': () => const Demo046(),
  '047': () => const Demo047(),
  '048': () => const Demo048(),
  '049': () => const Demo049(),
  '050': () => const Demo050(),
  '051': () => const Demo051(),
  '052': () => const Demo052(),
  '053': () => const Demo053(),
  '054': () => const Demo054(),
  '055': () => const Demo055(),
  '056': () => const Demo056(),
  '057': () => const Demo057(),
  '058': () => const Demo058(),
  '059': () => const Demo059(),
  '060': () => const Demo060(),
  '061': () => const Demo061(),
  '062': () => const Demo062(),
  '063': () => const Demo063(),
  '064': () => const Demo064(),
  '065': () => const Demo065(),
  '066': () => const Demo066(),
  '067': () => const Demo067(),
  '068': () => const Demo068(),
  '069': () => const Demo069(),
  '070': () => const Demo070(),
  '071': () => Demo071(),
  '072': () => const Demo072(),
  '073': () => const Demo073(),
  '074': () => const Demo074(),
  '075': () => const Demo075(),
  '076': () => const Demo076(),
  '077': () => const Demo077(),
  '078': () => const Demo078(),
  '079': () => const Demo079(),
  '080': () => const Demo080(),
  '081': () => const Demo081(),
  '082': () => const Demo082(),
  '083': () => const Demo083(),
  '084': () => const Demo084(),
  '085': () => const Demo085(),
  '086': () => const Demo086(),
  '087': () => const Demo087(),
  '088': () => const Demo088(),
  '089': () => const Demo089(),
  '090': () => const Demo090(),
  '091': () => const Demo091(),
  '092': () => const Demo092(),
  '093': () => const Demo093(),
  '094': () => const Demo094(),
  '095': () => const Demo095(),
  '096': () => const Demo096(),
  '097': () => const Demo097(),
  '098': () => const Demo098(),
  '099': () => const Demo099(),
  '100': () => const Demo100(),
  '101': () => const Demo101(),
  '102': () => const Demo102(),
  '103': () => const Demo103(),
  '104': () => const Demo104(),
  '105': () => const Demo105(),
  '106': () => const Demo106(),
  '107': () => const Demo107(),
  '108': () => const Demo108(),
  '109': () => const Demo109(),
  '110': () => const Demo110(),
  '111': () => const Demo111(),
  '112': () => const Demo112(),
  '113': () => const Demo113(),
  '114': () => const Demo114(),
  '115': () => const Demo115(),
  '116': () => const Demo116(),
  '117': () => const Demo117(),
  '118': () => const Demo118(),
  '119': () => const Demo119(),
  '120': () => const Demo120(),
  '121': () => const Demo121(),
  '122': () => const Demo122(),
  '123': () => const Demo123(),
  '124': () => const Demo124(),
  '125': () => const Demo125(),
  '126': () => const Demo126(),
  '127': () => const Demo127(),
  '128': () => const Demo128(),
};

/// Demo 宿主页面
class DemoPage extends StatelessWidget {
  const DemoPage({super.key, required this.articleId});

  final String articleId;

  @override
  Widget build(BuildContext context) {
    final article = findArticleById(articleId);
    final demoBuilder = _registry[articleId];

    return Scaffold(
      appBar: AppBar(
        title: Text(article?.title ?? '演示 #$articleId'),
        centerTitle: true,
      ),
      body: demoBuilder != null
          ? demoBuilder()
          : Center(
              child: DemoFrame.placeholderInfo(
                context: context,
                icon: Icons.construction,
                message: '演示组件开发中\n#$articleId ${article?.title ?? ""}',
              ),
            ),
    );
  }
}
