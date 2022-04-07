import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/consts.dart';

class TermsAndPrivacyPolicy extends StatefulWidget {
  const TermsAndPrivacyPolicy({Key? key}) : super(key: key);

  @override
  _TermsAndPrivacyPolicyState createState() => _TermsAndPrivacyPolicyState();
}

class _TermsAndPrivacyPolicyState extends State<TermsAndPrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: scaffoldColorlight,
      appBar: AppBar(
        leading: GestureDetector(
          child: Image.asset(
            'assets/icons/back.png',
            color: isDark ? generaltextColor : lightthemetextColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: scaffoldColorDark,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Terms and Privacy Policy',
              style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? specialtext : headingColorLight),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey.shade100,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Terms and Privacy Policy',
                        style: GoogleFonts.workSans(
                            color: scaffoldColorDark,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    SvgPicture.asset("assets/icons/union.svg"),
                  ],
                ),
              ),
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Privacy Policy',
                        style: GoogleFonts.workSans(
                            color: scaffoldColorDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 400,
                          child: Text(
                            'At Election Runner, we collect and manage user data according to the following Privacy Policy, with the goal of incorporating our company values: transparency, accessibility, sanity, usability. This document is part of Election Runners Terms of Service, and by using ElectionRunner.com (the “Website”), you agree to the terms of this Privacy Policy and the Terms of Service. Please read the Terms of Service in their entirety, and refer to those for definitions and contacts',
                            style: GoogleFonts.workSans(
                                color: bluetext, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Data Collected',
                        style: GoogleFonts.workSans(
                            color: scaffoldColorDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 400,
                          child: Text(
                            'We collect anonymous data from every visitor of the Website to monitor traffic and fix bugs. For example, we collect information like web requests, the data sent in response to such requests, the Internet Protocol address, the browser type, the browser language, and a timestamp for the request.\n\nWe ask you to log in and provide certain personal information (such as your name and email address) in order to be able to save your profile and the documents and comments associated with it. In order to enable these or any other login based features, we use cookies to store session information for your convenience. You can block or delete cookies and still be able to use Election Runner, although if you do you will then be asked for your username and password every time you log in to the Website. In order to take advantage of certain features of the Website, you may also choose to provide us with other personal information, such as your picture or personal website, but your decision to utilize these features and provide such data will always be voluntary.\n\nYou are able to view, change and remove your data associated with your profile. Should you choose to delete your account, please contact us at support@electionrunner.com and we will follow up with such request as soon as possible.\n\nMinors and children should not use Election Runner. By using the Website, you represent that you have the legal capacity to enter into a binding agreemen',
                            style: GoogleFonts.workSans(
                                color: bluetext, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Row(
                    children: [
                      Text(
                        'Use Of Data',
                        style: GoogleFonts.workSans(
                            color: scaffoldColorDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 400,
                          child: Text(
                            'We only use your personal information to provide you the Election Runner services or to communicate with you about the services or the Website.\n\nWith respect to any documents you may choose to upload to Election Runner, we take the privacy and confidentiality of such documents seriously. If you choose to make an election and its contents public, we recommend you redact any and all references to people and addresses, as we cant protect public data and we are not responsible for any violation of privacy law you may be liable for.\n\nWe employ industry standard techniques to protect against unauthorized access of data about you that we store, including personal information.',
                            style: GoogleFonts.workSans(
                                color: bluetext, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 400,
                        child: Text(
                          'We do not share personal information you have provided to us without your consent, unless:',
                          style: GoogleFonts.workSans(
                              color: scaffoldColorDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 400,
                          child: Text(
                            '1. doing so is appropriate to carry out your own request;\n2.we believe its needed to enforce our Terms of Service, or that is legally required;\n3.we believe its needed to detect, prevent or address fraud, security or technical issues;\n4.otherwise protect our property, legal rights, or that of others.\n\nElection Runner is operated from the United States by Eko Internet Marketing, LLC. If you are visiting the Website from outside the U.S., you agree to any processing of any personal information you provide us according to this policy.\n\nElection Runner may contact you, by email or other means. For example, Election Runner may send you promotional emails relating to Election Runner or other third parties Election Runner feels you would be interested in, or communicate with you about your use of the Election Runner website. Election Runner may also use technology to alert us via a confirmation email when you open an email from us. If you do not want to receive email from Election Runner, please opt out of receiving emails at the bottom of any Election Runner emails or by editing your profile preferences.',
                            style: GoogleFonts.workSans(
                                color: bluetext, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 400,
                        child: Text(
                          'Share Of Data',
                          style: GoogleFonts.workSans(
                              color: scaffoldColorDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 400,
                          child: Text(
                            'We dont share your personal information with third parties. Only aggregated, anonymized data is periodically transmitted to external services to help us improve the Election Runner Website and service. We may use anonymized ballot data to improve our service and publicly share information related to this anonymized data. We currently use Google Analytics (traffic analysis, SEO optimization), Mailchimp (mailing list management), Zendesk (email support). We listed below what data these third parties extract exactly. Feel free to check out their own Privacy Policies to find out more.\n\nWe dont share your personal information with third parties. Only aggregated, anonymized data is periodically transmitted to external services to help us improve the Election Runner Website and service. We may use anonymized ballot data to improve our service and publicly share information related to this anonymized data. We currently use Google Analytics (traffic analysis, SEO optimization), Mailchimp (mailing list management), Zendesk (email support). We listed below what data these third parties extract exactly. Feel free to check out their own Privacy Policies to find out more. We also use social buttons provided by services like Twitter, Google+, LinkedIn and Facebook. Your use of these third party services is entirely optional. We are not responsible for the privacy policies and/or practices of these third party services, and you are responsible for reading and understanding those third party services privacy policies.\n\nWe employ and contract with people and other entities that perform certain tasks on our behalf and who are under our control (our “Agents”). We may need to share personal information with our Agents in order to provide products or services to you. Unless we tell you differently, our Agents do not have any right to use Personal Information or other information we share with them beyond what is necessary to assist us. You hereby consent to our sharing of Personal Information with our Agents.\n\nWe may choose to buy or sell assets. In these types of transactions, user information is typically one of the transferred business assets. Moreover, if we, or substantially all of our assets, were acquired, or if we go out of business or enter bankruptcy, user information would be one of the assets that is transferred or acquired by a third party. You acknowledge that such transfers may occur, and that any acquirer of us or our assets may continue to use your personal information as set forth in this policy.',
                            style: GoogleFonts.workSans(
                                color: bluetext, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
