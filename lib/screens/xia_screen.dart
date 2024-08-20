import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_295/utils/utils.dart';
import 'package:id_295/widgets/widgets.dart';

class XiaScreen extends StatelessWidget {
  const XiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.white1,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/items/bg2.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Gap(8.h),
                  SizedBox(
                    width: 327.w,
                    height: 42.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ArrowWidget(icon: 'assets/items/left.png'),
                        Text('Xia', style: AppTextStyles.semibold16),
                        Gap(42.w),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 32.h),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/items/man.png',
                            width: 196.w,
                            height: 196.h,
                          ),
                          Gap(16.h),
                          Text(
                            'The Concept of Chinese Xia\n侠',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.semibold24Red,
                          ),
                          Gap(24.h),
                          SizedBox(
                            width: 311.w,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    style: AppTextStyles.medium16Red3,
                                    text:
                                        '''The xiá (俠) is a Chinese term and concept that refers to a righteous person who excels in Chinese martial arts and who uses their armed expertise to protect the innocent and right social unfairness or injustice (鋤強扶弱). Such a person is said to possess "martial virtue" (wǔ dé 武德), and usually regarded as a people's champion. 


The xiá concept is the basis for the Wuxia genre of Chinese literature and cinema, and is fundamental to the understanding of the genre. Liang Yusheng, a founder of the post-war "new school" wuxia literature, once asserted: "I'd rather write a wuxia story with no force or martial arts, than to devoid them of the spirit of xiá (宁可无武，不可无侠)". 


''',
                                  ),
                                  TextSpan(
                                    style: AppTextStyles.semibold20Red3,
                                    text: 'Cultural correlations\n\n',
                                  ),
                                  TextSpan(
                                    text: '''Xiá could be roughly compared to "chivalry" or 'heroes/heroines", and similar in part to (and often translated as) the Western concept of knights and knighthood, but owing to differences in cultural contexts, there are both major and minor differences:


The feudal overtones of Charlemagne's or William the Conqueror's enfeoffed cavalry made up of nobles by birth are wholly missing from the Chinese concept. Unlike a knight, the xiá ("chivalrous man") need not serve a lord or hold any military power; neither are they required to be from an aristocratic class. In comparison, the main identification of a xiá is a code of conduct and an ideology of honor and social justice dedicated to serving the good of the people. The philosophy's expectations of good character in teacher-student relationships is a fundamental feature of traditional Chinese martial arts training. Another difference from western knights is that considerable numbers of these xiá are women. 

Japanese bushido is a warrior code. As with western knights, it is based on a military caste's allegiance to a lord. 

A well-known description comes from the historian Sima Qian's Records of the Grand Historian: 


“He will honor his words; he will definitely carry out his actions. What he promises he will fulfill. He does not care his bodily self, putting his life and death aside to come forward for another's troubled besiegement. He does not boast about his ability, or shamelessly extol his own virtues.”


''',
                                    style: AppTextStyles.medium16Red3,
                                  ),
                                  TextSpan(
                                    style: AppTextStyles.semibold20Red3,
                                    text: 'History\n\n',
                                  ),
                                  TextSpan(
                                    text: '''The concept of xiá goes back to the Zhou dynasty, especially the Spring and Autumn period. Referring to a class of warriors (the shi 士) whose social position is sandwiched between the commoners and the royalties, the xiá (sometimes known as xia ke 俠客 or xia shi 俠士) is originally the military counterpart (wu shi 武士) of the more scholarly shi (仕), who eventually developed into Confucian scholars. Both are highly prized by feudal princes and warlords, one becoming intellectual advisors who contribute to the governing of the state, and the other ending up as guest residents of their masters living by the blade. In ancient China, these warriors' preference to use force to resolve a conflict sometimes made them unpopular and inseparable from the common ruffians in the eyes of bureaucrats. The legalist Han Feizi, for example, listed the xiá among the five vermins of society. 

The concept of xiá however underwent many transformations through the centuries. By the end of the Qing dynasty it has come to represent an ideal hero who wielded power by force, but could withhold it if necessary, and more importantly, possesses a sense of moral justice. 


''',
                                    style: AppTextStyles.medium16Red3,
                                  ),
                                  TextSpan(
                                    style: AppTextStyles.semibold20Red3,
                                    text: 'Equivalence in Western Cultures\n\n',
                                  ),
                                  TextSpan(
                                    text: '''A close equivalence of xiá to the English world can be found in Robin Hood, frequently identified by the Chinese as a "xiá-robber" (俠盜) — one with his own morally justifiable code of conduct despite being a law-breaker. Cartoon superheroes such as Batman and Spider-Man are also called xiá in Chinese translation (Bat-xiá 蝙蝠俠 and Spider-xiá 蜘蛛侠 respectively). Although not addressed as xiá in the Chinese translation, Johnston McCulley's legendary fictional hero Zorro is often regarded as a closest resemblance to the Chinese stereotype of xiá. 


Youxia (Traditional: 遊俠 Simplified: 游侠 Pinyin: yóuxiá [jǒʊɕjǎ]) was a type of Chinese hero celebrated in classical Chinese poetry.

Youxia literally means "wandering force", but is commonly translated as "knight-errant" or less commonly as "cavalier", "adventurer", "soldier of fortune", or "underworld stalwart".


The term 遊俠 yóuxiá, "wandering force", refers to the way these men solely traveled the land using force (or influence through association with powerful people) to right the wrongs done to the common people and the monarchy if need be. Youxia did not come from any social class in particular. Various historical documents, wuxia novels, and folktales describe them as being princes, government officials, poets, musicians, physicians, professional soldiers, merchants, and butchers. Some were just as handy with a calligraphy brush as others were with swords and spears.


According to Dr. James J. Y. Liu (1926–1986), a professor of Chinese and comparative literature at Stanford University, it was a person's temperament and need for freedom, and not their social status, that caused them to roam the land and help those in need. Dr. Liu believes this is because a very large majority of these knights came from northern China, which borders the territory of "northern nomadic tribes, whose way of life stressed freedom of movement and military virtues". Many knights seem to have come from Hebei and Henan provinces. A large majority of the characters from the Water Margin, which is considered one of China's best examples of knight-errant literature, come from these provinces.

One good example of Youxia poetry is The Swordsman by Jia Dao (Tang Dynasty):

For ten years I have been polishing this sword;

Its frosty edge has never been put to the test.

Now I am holding it and showing it to you, sir:

Is there anyone suffering from injustice?

According to Dr. Liu, Jia’s poem "seems...to sum up the spirit of knight-errantry in four lines. At the same time, one can also take it as a reflection of the desire of all those who have prepared themselves for years to put their abilities to the test for some justice."''',
                                    style: AppTextStyles.medium16Red3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap(50.h),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
