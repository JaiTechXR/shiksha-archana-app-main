import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermCondition {
  static Widget termCondition = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title("Privacy Policy for Shiksha Archana App"),
      // Text(
      //   "Privacy Policy for Shiksha Archana App",
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontWeight: FontWeight.w800,
      //     fontSize: 19.sp,
      //   ),
      // ),
      SizedBox(
        height: 15.h,
      ),
      // Text(
      //   "Effective Date: 15th May 2023",
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontSize: 16.sp,
      //   ),
      // )
      smallText("Effective Date: 15th May 2023"),
      SizedBox(
        height: 15.h,
      ),
      smallText(
          "At Shiksha Archana, we are committed to protecting the privacy and personal information of our users, especially special children. This Privacy Policy outlines the types of information we collect, how we use and protect it, and your rights regarding your personal data when you use our mobile application (\"Shiksha Archana\")."),
      SizedBox(
        height: 15.h,
      ),
      smallText(
          "Please read this Privacy Policy carefully to understand our practices regarding your personal information. By using the Shiksha Archana App, you agree to the collection, use, and disclosure of your personal information in accordance with this Privacy Policy."),
      SizedBox(
        height: 15.h,
      ),
      headLine("1 Information We Collect:"),
      SizedBox(
        height: 15.h,
      ),
      // Row(
      //   children: [
      //     title("1.1. Account Registration: "),
      //     smallText(
      //         "When you create an account on the Shiksha Archana App, we may collect the following personal information:\n"),
      //   ],
      // ),
      title("1.1. Account Registration: "),
      smallText(
          "When you create an account on the Shiksha Archana App, we may collect the following personal information:\n"),
      smallText(
          "● Child's name and date of birth\n● Parent or guardian's name\n● Parent or guardian's contact information, such as mobile number and email address\n● Child's specific educational requirements and special needs.\n\n"),
      // Row(
      //   children: [
      //     title("1.2 Usage Information: "),
      //     smallText(
      //         "We may collect certain information about how you use the Shiksha Archana App, such as the features you access, the content you view, and the actions you take within the App. This information helps us improve the App and provide a personalized experience."),
      //   ],
      // ),
      title("1.2 Usage Information: "),
      smallText(
          "We may collect certain information about how you use the Shiksha Archana App, such as the features you access, the content you view, and the actions you take within the App. This information helps us improve the App and provide a personalized experience."),
      SizedBox(
        height: 25.sp,
      ),
      headLine("2 Use of Information:"),
      SizedBox(
        height: 20.h,
      ),
      // Row(
      //   children: [
      //     title("2.1 Personalization: "),
      //     smallText(
      //         "We use the information we collect to provide customized educational content and features tailored to the specific needs and requirements of the special child."),
      //   ],
      // ),
      title("2.1 Personalization: "),
      smallText(
          "We use the information we collect to provide customized educational content and features tailored to the specific needs and requirements of the special child."),
      SizedBox(
        height: 15.h,
      ),
      // Row(
      //   children: [
      //     title("2.2 Account Management: "),
      //     smallText(
      //         "We use the personal information provided during account registration to manage your Shiksha Archana account, including communication with parents or guardians, account verification, and authentication purposes."),
      //   ],
      // ),
      title("2.2 Account Management: "),
      smallText(
          "We use the personal information provided during account registration to manage your Shiksha Archana account, including communication with parents or guardians, account verification, and authentication purposes."),
      SizedBox(
        height: 15.h,
      ),
      // Row(
      //   children: [
      //     title("2.3 Service Improvement: "),
      //     smallText(
      //         "We may use the information we collect to improve our services, enhance the App's functionality, and develop new features to better serve the educational needs of special children."),
      //   ],
      // ),
      title("2.3 Service Improvement: "),
      smallText(
          "We may use the information we collect to improve our services, enhance the App's functionality, and develop new features to better serve the educational needs of special children."),
      SizedBox(
        height: 15.h,
      ),
      // Row(
      //   children: [
      //     title("2.4 Analytics and Research: "),
      //     smallText(
      //         " We may aggregate and anonymize the information collected from users for analytical purposes, such as tracking trends, measuring the effectiveness of our educational materials, and conducting research to enhance our understanding of special education."),
      //   ],
      // ),
      title("2.4 Analytics and Research: "),
      smallText(
          " We may aggregate and anonymize the information collected from users for analytical purposes, such as tracking trends, measuring the effectiveness of our educational materials, and conducting research to enhance our understanding of special education.\n\n"),
//3rd
      headLine("3. Data Sharing and Disclosure:"),
      SizedBox(
        height: 20.h,
      ),
      // Row(
      //   children: [
      //     title("3.1 Third-Party Service Providers: "),
      //     smallText(
      //         "We may share your personal information with trusted third-party service providers who assist us in providing and improving the Shiksha Archana App. These providers are obligated to maintain the confidentiality and security of your personal information and are restricted from using it for any other purpose."),
      //   ],
      // ),
      title("3.1 Third-Party Service Providers: "),
      smallText(
          "We may share your personal information with trusted third-party service providers who assist us in providing and improving the Shiksha Archana App. These providers are obligated to maintain the confidentiality and security of your personal information and are restricted from using it for any other purpose."),
      SizedBox(
        height: 15.h,
      ),
      // Row(
      //   children: [
      //     title("3.2 Legal Requirements:"),
      //     smallText(
      //         "We may disclose your personal information if required to do so by law, regulation, or legal process, or if we believe in good faith that such disclosure is necessary to protect the rights, property, or safety of Shiksha Archana, its users, or other"),
      //   ],
      // ),
      title("3.2 Legal Requirements:"),
      smallText(
          "We may disclose your personal information if required to do so by law, regulation, or legal process, or if we believe in good faith that such disclosure is necessary to protect the rights, property, or safety of Shiksha Archana, its users, or other.\n\n"),
      //4th
      headLine("4 Data Security:"),
      SizedBox(
        height: 20.h,
      ),
      smallText(
          "We employ industry-standard security measures to protect your personal information from unauthorized access, disclosure, alteration, and destruction. However, no method of transmission over the internet or electronic storage is 100% secure. Therefore, while we strive to use commercially acceptable means to protect your personal information, we cannot guarantee its absolute security.\n\n"),

      // 5th

      headLine("5 Your Rights:"),
      smallText(
          "As a user of the Shiksha Archana App, you have certain rights concerning your personal formation. These rights include:\n\n"),
      smallText(
          "● The right to access and review the personal information we hold about your child and make any necessary updates or corrections.\n● The right to request the deletion of personal information we hold about your child, subject to any legal obligations."),
      SizedBox(
        height: 20.h,
      ),
      headLine("6 Changes to the Privacy Policy:"),
      smallText(
          "We reserve the right to update or modify this Privacy Policy at any time. If we make material changes, we will notify you by email or through the App. Please review this Privacy Policy periodically for any updates."),
      SizedBox(
        height: 20.h,
      ),
      smallTextBold("Archana Pandey (Founder)"),
      smallText("Contact Us:"),
      smallText("shiksha.archana.play@gmail.com"),
    ],
  );

  static Widget title(String head) {
    return Text(
      head,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontSize: 15.sp,
      ),
    );
  }

  static Widget headLine(String head) {
    return Text(
      head,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 17.sp,
      ),
    );
  }

  static Widget smallTextBold(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.bold),
    );
  }

  static Widget smallText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 13.sp,
      ),
    );
  }
}
