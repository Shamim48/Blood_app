import 'package:blood_app/utils/color_resources.dart';
import 'package:flutter/material.dart';

class Communication extends StatefulWidget {
  const Communication({Key? key}) : super(key: key);

  @override
  State<Communication> createState() => _CommunicationState();
}

class _CommunicationState extends State<Communication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              child: Image.asset(
                "assets/images/fci_blood_donation_logo.png",fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        leadingWidth: 80,
        toolbarHeight: 80,
        title: const Text("FCI BLOOD BANK",style: TextStyle(fontWeight: FontWeight.bold,color: ColorResources.BLOOD_COLOR,fontSize: 25),),
        centerTitle: true,
      ),
      body: ListView(
        children: [

          //Rakibul Islam
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorResources.BLOOD_COLOR,
                        border: Border.all(width: 2,color: ColorResources.BLOOD_COLOR)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset("assets/images/shamim_vai.jpg"),
                      )
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Rakibul Islam Rakib",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                            width: 200,
                            child: Text("President",style: TextStyle(fontSize: 14,))),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,
          ),


          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorResources.BLOOD_COLOR,
                            border: Border.all(width: 2,color: ColorResources.BLOOD_COLOR)
                        ),
                        child: ClipRRect(
                          child: Image.asset("assets/images/shamim_vai.jpg"),
                          borderRadius: BorderRadius.circular(50),
                        )
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mizanur Islam Shakib",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                            width: 200,
                            child: Text("Vice President",style: TextStyle(fontSize: 14,))),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,
          ),

          //Nishan
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorResources.BLOOD_COLOR,
                            border: Border.all(width: 2,color: ColorResources.BLOOD_COLOR)
                        ),
                        child: ClipRRect(
                          child: Image.asset("assets/images/shamim_vai.jpg"),
                          borderRadius: BorderRadius.circular(50),
                        )
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mohosin Elahi Nishan",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                            width: 200,
                            child: Text("Vice President",style: TextStyle(fontSize: 14,))),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,
          ),



          //Minu
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorResources.BLOOD_COLOR,
                            border: Border.all(width: 2,color: ColorResources.BLOOD_COLOR)
                        ),
                        child: ClipRRect(
                          child: Image.asset("assets/images/shamim_vai.jpg"),
                          borderRadius: BorderRadius.circular(50),
                        )
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mahmuda Akhter Minu",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                            width: 200,
                            child: Text("Vice President",style: TextStyle(fontSize: 14,))),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,
          ),



          //Choyon
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorResources.BLOOD_COLOR,
                            border: Border.all(width: 2,color: ColorResources.BLOOD_COLOR)
                        ),
                        child: ClipRRect(
                          child: Image.asset("assets/images/shamim_vai.jpg"),
                          borderRadius: BorderRadius.circular(50),
                        )
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Choyon Sharker",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                            width: 200,
                            child: Text("General Secretary",style: TextStyle(fontSize: 14,))),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,
          ),



          //saif
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorResources.BLOOD_COLOR,
                            border: Border.all(width: 2,color: ColorResources.BLOOD_COLOR)
                        ),
                        child: ClipRRect(
                          child: Image.asset("assets/images/shamim_vai.jpg"),
                          borderRadius: BorderRadius.circular(50),
                        )
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mahfujur Rahman Saif",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                            width: 200,
                            child: Text("Joint General Secretary",style: TextStyle(fontSize: 14,))),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,
          ),



          //fariya
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorResources.BLOOD_COLOR,
                            border: Border.all(width: 2,color: ColorResources.BLOOD_COLOR)
                        ),
                        child: ClipRRect(
                          child: Image.asset("assets/images/shamim_vai.jpg"),
                          borderRadius: BorderRadius.circular(50),
                        )
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Farjana Akther Fariya",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                            width: 200,
                            child: Text("Joint General Secretary",style: TextStyle(fontSize: 14,))),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,
          ),



          //Arafat
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorResources.BLOOD_COLOR,
                            border: Border.all(width: 2,color: ColorResources.BLOOD_COLOR)
                        ),
                        child: ClipRRect(
                          child: Image.asset("assets/images/shamim_vai.jpg"),
                          borderRadius: BorderRadius.circular(50),
                        )
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mohammad Al Arafat",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                            width: 200,
                            child: Text("Organizing Secretary",style: TextStyle(fontSize: 14,))),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,
          ),



          //Tanjid
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorResources.BLOOD_COLOR,
                            border: Border.all(width: 2,color: ColorResources.BLOOD_COLOR)
                        ),
                        child: ClipRRect(
                          child: Image.asset("assets/images/shamim_vai.jpg"),
                          borderRadius: BorderRadius.circular(50),
                        )
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tanjid Hossain",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                            width: 200,
                            child: Text("Joint Organizing Secretary",style: TextStyle(fontSize: 14,))),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,
          ),


          //Mojumder
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorResources.BLOOD_COLOR,
                            border: Border.all(width: 2,color: ColorResources.BLOOD_COLOR)
                        ),
                        child: ClipRRect(
                          child: Image.asset("assets/images/shamim_vai.jpg"),
                          borderRadius: BorderRadius.circular(50),
                        )
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Atikur Rahman Mojumder",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                            width: 200,
                            child: Text("Finance Secretary",style: TextStyle(fontSize: 14,))),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Colors.grey,
          ),




        ],
      ),
    );
  }
}
