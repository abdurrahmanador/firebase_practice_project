import 'package:firebase_practice_project/firebase_notification.dart';
import 'package:firebase_practice_project/first_match.dart';
import 'package:firebase_practice_project/second_match.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseNotification().initialization();
  // print(await FirebaseNotification().getToken());
  FirebaseNotification().onTokenRefresh();
  await FirebaseNotification().subscribeToTopic('Ostad');
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Firebase Assignment App",
      home: HomeScreen(),
    );

  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:   [
                  Text('Argentina vs Africa',style: TextStyle(fontSize: 20,),),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstMatch() ));
                  }, icon:const Icon(Icons.arrow_forward,color:Colors.blue,)
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5,),

            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:   [
                  Text('Italy vs Spain',style:  TextStyle(fontSize: 20,)),
                  IconButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SecondMatch() ));
                  }, icon:const Icon(Icons.arrow_forward,color:Colors.blue,)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}

