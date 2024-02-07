## BMI Калькулятор написанный на Flutter. 
Одна из простейших программ для высчитывания Индекса массы тела 
Далее идет основной класс приложения 
```java
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppThemeController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: AppThemeController.instance.color,
            brightness: AppThemeController.instance.themeDark ? Brightness.dark : Brightness.light,
            )
          ),
          home: HomePage(),
        );
      },
    );
  }
} 
```
### Главная страница на скриншоте
![one](https://github.com/gabdulkaliev/Project2_Flutter/blob/main/one.png)
___
### Класс `_HomePageState` и функция `calcIMC` для расчета ИМТ
```java
class _HomePageState extends State<HomePage> {
  final scrollControllerScreen = ScrollController();
  final TextEditingController altura = TextEditingController();
  final TextEditingController peso = TextEditingController();
  double imc = 0;
  String textImc = '';

  void calcIMC(){
    setState(() {
      try {
        imc = double.parse(peso.text)/(pow(double.parse(altura.text),2));
        if(imc.toInt() < 18){
          textImc = 'Сіз арықсыз!\n\nМен сіздің жақсы формада екеніңізді және арық болып көрінетініңізді түсінемін, бұл көптеген адамдар үшін жетістік болуы мүмкін. Алайда, егер сіздің денсаулығыңызға қатысты қандай да бір алаңдаушылық болса, бәрі жақсы екеніне көз жеткізу үшін дәрігерге барған дұрыс. Денсаулық бірінші орында екенін және әрбір дене бірегей екенін есте ұстаған жөн, сондықтан бір адам үшін сау болуы мүмкін нәрсе басқа адам үшін болмауы мүмкін. Күмән немесе қорқыныш болған жағдайда медициналық көмекке жүгінген дұрыс.';
        }
        else if(imc.toInt() >= 18 && imc.toInt() <= 25){
          textImc = 'Сіз саусыз!\n\nМенің бақылауларыма сүйене отырып, мен сіздің денсаулығыңыз жақсы деп айта аламын. Денсаулықты сақтау үшін денеңізге және ақыл-ойыңызға қамқорлық жасау маңызды және сіз оны жақсы басқарып жатқан сияқтысыз. Тұрақты жаттығулар, теңдестірілген тамақтану және психикалық денсаулықты сақтауды қоса алғанда, салауатты және теңдестірілген тәртіпті ұстануды жалғастырыңыз. Сіз сау екеніңізді құттықтаймын және сіз солай боласыз деп үміттенемін!';
        }
        else {
          textImc = 'Сіз семізсіз!\n\nСіздің BMI-ге қарап, сізде артық салмақ болуы мүмкін екенін түсінемін. Егер бұл сізге ыңғайсыздық немесе алаңдаушылық туғызса, денсаулығыңызды бағалау және сізге пайдалы болуы мүмкін өмір салтын өзгертуді талқылау үшін дәрігерге бару жақсы идея болуы мүмкін. Денсаулық бірінші орында екенін және әрбір дене бірегей екенін есте ұстаған жөн, сондықтан бір адам үшін сау болуы мүмкін нәрсе басқа адам үшін болмауы мүмкін. Егер сіз өзіңіздің салмағыңыз туралы алаңдасаңыз, кәсіби көмекке жүгіну әрқашан өміршең және ұсынылған нұсқа болып табылады.';
        }
      }
      on FormatException {
        textImc = 'Міндетті өрістерге дұрыс мән енгізіңіз!';
      }
    });
  }
```
### Расчитанный ИМТ, на основе данных с ввода
![two](https://github.com/gabdulkaliev/Project2_Flutter/blob/main/two.png)
