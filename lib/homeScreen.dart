import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SphaApp extends StatefulWidget {
  const SphaApp({super.key});

  @override
  State<SphaApp> createState() => _SphaAppState();
}

int colorhex = 0XFF771313;

class _SphaAppState extends State<SphaApp> {
  setSaveData(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', value);

    getSave();
  }

  sethadef(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('hadef', value);

    getSave();
  }

  setresult(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('result', value);
    prefs.setInt('time', value);
    getSave();
  }

  settime(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('time', value);
    getSave();
  }

  getSave() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt("counter") ?? 0;
      _hadef = prefs.getInt("hadef") ?? 0;
      result = prefs.getInt("result") ?? 0;
      _time = prefs.getInt("time") ?? 0;
    });
  }

  void initState() {
    getSave();
    super.initState();
  }

  int result = 0;
  int _counter = 0;
  int _time = 0;
  int _hadef = 1;
  TextDirection textdirection = TextDirection.rtl;
  @override
  Widget build(BuildContext context) {
    Color bacgrond = Color(colorhex);
    return Directionality(
      textDirection: textdirection,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: bacgrond,
          onPressed: () {
            setState(() {
              setSaveData(_counter = 0);
              settime(_time = 0);
              sethadef(_hadef = 1);
              setresult(result = 0);
            });
          },
          child: const Icon(Icons.refresh_sharp, color: Colors.white),
        ),
        appBar: AppBar(
          backgroundColor: bacgrond,
          actions: [
            IconButton(
              onPressed: () {
                print(colorhex);
              },
              icon: const Icon(
                Icons.color_lens,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: bacgrond,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "الهدف",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _hadef == 1 ? null : _hadef--;
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$_hadef",
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            sethadef(_hadef + 1);
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Text("33"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Text("100"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Text("+100"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Text("+1000"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "الاستفار ",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: bacgrond),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$_counter ",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: bacgrond),
            ),
            const SizedBox(
              height: 20,
            ),
            CircularPercentIndicator(
              radius: 85.0,
              lineWidth: 5.0,
              percent: _counter / _hadef,
              center: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_counter == _hadef) {
                      settime(_time + 1);
                      setSaveData(_counter = 0);
                    }
                    result = _hadef * _time; 
                    setSaveData(_counter + 1);
                  });
                },
                child: Icon(
                  Icons.touch_app,
                  size: 70,
                  color: bacgrond,
                ),
              ),
              backgroundColor: bacgrond.withOpacity(0.2),
              progressColor: bacgrond,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "مرات التكرار: $_time ",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: bacgrond),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "المجموع : $result",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: bacgrond),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => Color(0XFF771313),
                      ),
                      value: 0XFF771313,
                      groupValue: colorhex,
                      onChanged: (val) {
                        setState(() {
                          colorhex = val!;
                        });
                      }),
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0XFF8631B0)),
                      value: 0XFF8631B0,
                      groupValue: colorhex,
                      onChanged: (val) {
                        setState(() {
                          colorhex = val!;
                        });
                      }),
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(0XFF000000)),
                      value: 0XFF000000,
                      groupValue: colorhex,
                      onChanged: (val) {
                        setState(() {
                          colorhex = val!;
                        });
                      }),
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => Color(0XFFB0519D),
                      ),
                      value: 0XFFB0519D,
                      groupValue: colorhex,
                      onChanged: (val) {
                        setState(() {
                          colorhex = val!;
                        });
                      }),
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => Color(0XFF4ABDA6),
                      ),
                      value: 0XFF4ABDA6,
                      groupValue: colorhex,
                      onChanged: (val) {
                        setState(() {
                          colorhex = val!;
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
