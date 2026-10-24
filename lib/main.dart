import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screen/Login_page.dart';
import 'Screen/signup_page.dart';
import 'Screen/Messger_chat.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MessengerScreen()),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //heade 1
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'mesenger',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.edit_square, size: 20),
                  SizedBox(width: 20),
                  Icon(Icons.facebook, size: 20),
                ],
              ),
            ],
          ),
        ),

        // header 2
        Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(179, 246, 244, 244),
            border: Border.all(
              color: const Color.fromARGB(255, 225, 220, 220),
              width: 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 100, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.search, color: Colors.black),
                Text(
                  'hỏi meta AI hoặc Tìm kiếm',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        //header 3
        Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'tạo tin',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'MẠNH',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'QUYÊN',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'THẮM',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),

                SizedBox(width: 10),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'TRUNG',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'ĐỨC',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'tạo tin',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'tạo tin',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // header 4
        Padding(
          padding: EdgeInsets.fromLTRB(16, 1, 0, 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 226, 226),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'ALL',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(width: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 234, 234),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'chưa đọc 1 ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 236, 236),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'nhóm 1',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 233, 233),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '...',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        // header 5
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văn uy',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văn I',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văn I',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văn I',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văn I',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văn I',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văn I',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văN Z',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văn B',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văn A',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phạm văn Q',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'có không dữ maasty đừng tìm',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '14:51',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class MyWidget2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Row(
//             children: [
//               Container(width: 40, height: 30, color: Colors.red),
//               SizedBox(width: 10),
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'nguyễn văn mạnh',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),

//                     Text('hòa lạc city', style: TextStyle(fontSize: 16)),
//                   ],
//                 ),
//               ),
//               Container(height: 15, width: 15, color: Colors.blue),
//               SizedBox(width: 10),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(width: 10, height: 10, color: Colors.amberAccent),
//                   Text(
//                     '4',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: const Color.fromARGB(255, 39, 38, 38),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyWidget3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Icon(Icons.message),
//             Text(
//               'Messenger',
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Đăng nhập để tiếp tục',
//               style: TextStyle(
//                 color: const Color.fromARGB(255, 100, 101, 101),
//                 fontSize: 10,
//               ),
//             ),
//             SizedBox(height: 30),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(color: Colors.black, width: 3),
//                 ),
//                 prefixIcon: Icon(Icons.account_box),
//                 hintText: 'nhập tài khoàn vào đây...',
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(color: Colors.black, width: 3),
//                 ),
//                 prefixIcon: Icon(Icons.lock_outline),
//                 hintText: 'nhập nhập mật khẩu vào đây...',
//               ),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 foregroundColor: Colors.white,
//                 minimumSize: Size(double.infinity, 60),
//               ),
//               onPressed: () {
//                 print('chán thí nhờ');
//               },
//               child: const Text('Đăng nhập'),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Quên mật khẩu?',
//               style: TextStyle(
//                 color: const Color.fromARGB(255, 90, 89, 89),
//                 fontSize: 15,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '---------------------hoặc--------------------',
//               style: TextStyle(
//                 color: const Color.fromARGB(255, 88, 87, 87),
//                 fontSize: 12,
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 243, 244, 245),
//                 foregroundColor: Colors.black,
//                 minimumSize: Size(double.infinity, 60),
//               ),
//               onPressed: () {
//                 print('login with gg');
//               },
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 4, 4, 4),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.g_mobiledata_outlined,
//                       size: 40,
//                       color: Color.fromARGB(255, 27, 27, 27),
//                     ),
//                     SizedBox(width: 30),
//                     Text(
//                       'Đăng nhập bằng google',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             SizedBox(height: 10),

//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 243, 244, 245),
//                 foregroundColor: Colors.black,
//                 minimumSize: Size(double.infinity, 60),
//               ),
//               onPressed: () {
//                 print('login with apple');
//               },
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(30, 4, 4, 4),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.apple,
//                       size: 40,
//                       color: Color.fromARGB(255, 33, 34, 34),
//                     ),
//                     SizedBox(width: 30),
//                     Text(
//                       'Đăng nhập bằng Apple',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 50),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Chưa có tài khoản?'),
//                 Text(
//                   'đăng ký',
//                   style: TextStyle(
//                     color: Colors.blueAccent,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyWidget4 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(1),
//           child: Row(
//             children: [
//               Icon(Icons.arrow_back_ios_new),
//               SizedBox(width: 25),
//               CircleAvatar(backgroundColor: Colors.blue, radius: 22),
//               SizedBox(width: 10),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Bùi Thắm ',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     Text('đang hoạt động', style: TextStyle(fontSize: 13)),
//                   ],
//                 ),
//               ),
//               Icon(
//                 Icons.call,
//                 size: 30,
//                 color: const Color.fromARGB(255, 16, 132, 199),
//               ),
//               SizedBox(width: 10),
//               Icon(
//                 Icons.video_call,
//                 size: 30,
//                 color: const Color.fromARGB(255, 16, 132, 199),
//               ),
//               SizedBox(width: 10),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
