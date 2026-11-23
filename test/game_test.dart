import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_klavye_hiz_oyunu/oyun_klavye_hiz_oyunu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hizliKlavyeConfig.title.length, 33);
    expect(hizliKlavyeConfig.tagline.length, 33);
    for (final s in hizliKlavyeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hizliKlavyeConfig.gameId, hizliKlavyeId);
    expect(hizliKlavyeRules.gameId, hizliKlavyeId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hizliKlavyeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hizliKlavyeId, optionalMechanics: hizliKlavyeRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      hizliKlavyeRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(hizliKlavyeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
