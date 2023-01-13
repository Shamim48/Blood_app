import 'package:blood_app/utils/color_resources.dart';
import 'package:flutter/material.dart';

class AboutDonation extends StatefulWidget {
  const AboutDonation({Key? key}) : super(key: key);

  @override
  State<AboutDonation> createState() => _AboutDonationState();
}

class _AboutDonationState extends State<AboutDonation> {
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
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15,),
                Text("'হাসবে রোগী বাঁচবে প্রাণ,",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: Text("আসুন করি রক্তদান'",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 10,),
                Text("' হারুর রক্তে বেঁচেছে হারুন, রহিম দিয়েছে রাম কে, সামান্য দান অসামান্য হয় রক্ত বাঁচায় প্রাণ কে।'",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: ColorResources.BLOOD_COLOR),),
               SizedBox(height: 10,),
                Text("'রক্ত দিলে হয় না ক্ষতি, জাগ্রত হয় মানবিক অনুভূতি'",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Container(

                  width: MediaQuery.of(context).size.width,
                  child: Text("পড়াশোনার পাশাপাশি মানবিক ডাকে সাড়া দিতে জুড়ি নেই ফেনী কম্পিউটার ইনস্টিটিউটের শিক্ষার্থীদের।"
                      " ফেনী জেলার মধ্যে প্রচুর সংখ্যক রক্তের চাহিদা মেটাতে প্রতিনিয়ত কাজ করে যাচ্ছে আমাদের ব্লাড ডোনেশন গ্রুপ। "
                      "ইনস্টিটিউটের প্রায় সকল শিক্ষক এবং শিক্ষার্থী যারা রক্তদানে সক্ষম তারা সকলেই ৪ মাস পরপর রক্তদান করে মানবিক "
                      "ডাকে সাড়া প্রদান করে। পৃথিবীর মানুষেরা যখন বর্বরতার দিকে ধাবিত হচ্ছে তখন আমাদের ব্লাড ডোনেশন গ্রুপ কাজ করে "
                      "যাচ্ছে মানুষের জীবন বাঁচাতে।শুধুমাত্র রক্তদান নয়, সেটার পাশাপাশি বিভিন্ন মানবিক কাজেও সহায়তা করছে এই গ্রুপের সদস্যরা। "
                      "যার মধ্যে রয়েছে সুবিধা বঞ্চিতদের মাঝে ঈদ বস্ত্র বিতরণ, বিনামূল্যে রক্তের গ্রুপ নির্ণয় কর্মসূচী, বিভিন্ন দিবসে স্বেচ্ছায় রক্তদান,  "
                      "বৃক্ষরোপণ অভিযান , সাধারণ শিক্ষার্থীদের মাঝে রক্তদান বিষয়ে সচেতনতা সৃষ্টি, সবার মাঝে দেশপ্রেম তৈরি করা সহ মানব "
                      "হিতৈষী বিভিন্ন কার্যক্রম পরিচালনা করছে এই সংগঠন।এছাড়া যে কোনো জাতীয় বিপর্যয় (যেমন বন্যা বা প্রাকৃতিক দুর্যোগে) "
                      "সৃষ্টি হলে গ্রুপের স্বেচ্ছাসেবকরা কাজ করে দেশের স্বার্থে। নিজের পকেটের টাকায়, নিজের শারীরিক শ্রমের মাধ্যমে "
                      "দেশপ্রেম ও শৃঙ্খলাকে পুঁজি করে মানুষ তথা মানবতার জন্য কাজ করে যাচ্ছে ",style:TextStyle(fontSize: 16) ,),
                ),
                Text("FCI BLOOD BANK GROUP",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: ColorResources.BLOOD_COLOR),),
                SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    child:  Image.asset("assets/images/helal_sir1.jpeg",fit: BoxFit.cover,)
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    child:  Image.asset("assets/images/helal_sir2.jpeg",fit: BoxFit.cover,)
                  ),
                ),
                SizedBox(height: 15,),
                Text("'বর্তমান কমিটি বৃন্দঃ '",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 0,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    child:  Image.asset("assets/images/committee.jpg",fit: BoxFit.cover,)
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
