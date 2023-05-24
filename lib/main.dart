import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "탑건: 매버릭",
        "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
      },
      {
        "category": "마녀2",
        "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
      },
      {
        "category": "범죄도시2",
        "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
      },
      {
        "category": "헤어질 결심",
        "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
      },
      {
        "category": "브로커",
        "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
      },
      {
        "category": "문폴",
        "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie Reviews",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: (() => print("login")),
              color: Colors.black,
            ),
          ],
          elevation: 0.0,
        ),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "영화 제목을 검색해주세요.",
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)))),
            ),
          ),
          Divider(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          dataList[index]["imgUrl"],
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            dataList[index]["category"],
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          alignment: Alignment.center,
                        )
                      ],
                    ),
                  );
                }),
          ),
        ]));
  }
}
