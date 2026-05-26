import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 40,
          bottom: 30,
        ),
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Jobspot',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 215),

                Center(
                  child: SvgPicture.asset(
                    'assets/images/onboarding.svg',
                    width: 240,
                    height: 240,
                    fit: BoxFit.contain,
                  ),
                ),

                const Spacer(),

                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 28,
                      height: 1.02,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: 'Find Your\n'),
                      TextSpan(
                        text: 'Dream Job\n',
                        style: TextStyle(
                          color: Color(0xFFFF9F4A),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFFF9F4A),
                          decorationThickness: 2,
                        ),
                      ),
                      TextSpan(text: 'Here!'),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                const Text(
                  'Explore all the most exciting job roles based\n'
                      'on your interest and study major.',
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.35,
                    color: Color(0xFF55506E),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 18),

                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFF16006B),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}