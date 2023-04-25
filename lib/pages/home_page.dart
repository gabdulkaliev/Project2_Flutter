import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bmi_calc_flutter/controllers/app_theme.dart';
import 'package:bmi_calc_flutter/pages/config_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('IMC'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => ConfigPage()));
          }, icon: const Icon(Icons.settings))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          calcIMC();
        },
        child: const Icon(Icons.man_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width < 500 ?
                  300 : MediaQuery.of(context).size.height - 75,
                  width: MediaQuery.of(context).size.width < 500 ?
                  500 : (MediaQuery.of(context).size.width/2)-30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                    child: ListView(
                      controller: scrollControllerScreen,
                      children: [
                        Column(
                          children: [
                            TextField(
                              controller: altura,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 20
                              ),
                              decoration: InputDecoration(
                                label: const Text('Бойыңыз'),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.shadow
                                  )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: peso,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 20
                              ),
                              decoration: InputDecoration(
                                label: const Text('Салмағыңыз'),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.shadow
                                  )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text('Сіздің BMI:',
                            style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context).colorScheme.onSurface
                            ),),
                            Text('${imc.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.onSurface
                            ),)
                          ],
                        ),
                      ],
                    )
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width < 500 ?
                      300 : MediaQuery.of(context).size.height - 75,
                      width: MediaQuery.of(context).size.width < 500 ?
                      500 : MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 10),
                        child: ListView(
                          controller: scrollControllerScreen,
                          children: [
                            Column(
                              children: [
                                Text(textImc,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width < 500 ?
                                  20 : 25,
                                  color: Theme.of(context).colorScheme.surfaceVariant
                                ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}