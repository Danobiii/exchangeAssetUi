import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Myhomepage extends StatelessWidget {
  const new({super.key});
  Widget lastCard(String left, String right) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            left,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            right,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,

        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: GestureDetector(
            onTap: () {
              Navigator.maybePop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 44, 43, 43),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.chevron_left, color: Colors.white, size: 28.sp),
            ),
          ),
        ),
        title: Text(
          "Exchange Assets",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 89, 4, 90), Colors.black],
            stops: [0.0, 0.4],
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 30.h),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        AssetCard(
                          label: 'You pay',
                          amount: '6',
                          symbol: 'assets/icons/lottie/usdc.json',
                          currency: 'USDC',
                          usdValue: '\$6.75',
                          balance: '2.4123 USDC',
                        ),
                        SizedBox(height: 8.h), 
                        AssetCard(
                          label: 'You receive',
                          amount: '0.00348',
                          symbol: 'assets/icons/lottie/eth.json',
                          currency: 'ETH',
                          usdValue: '\$4.79',
                          balance: '0.0023 ETH',
                        ),
                      ],
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7B3FA0),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 4),
                      ),
                      child: const Icon(
                        Icons.u_turn_left_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                Card(
                  margin: EdgeInsets.zero,
                  color: const Color(0xFF141414),
                  elevation: 0,
                  surfaceTintColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        lastCard('Provider', 'Inch Protocol'),
                        lastCard('Fees', '\$0.12'),
                        lastCard('Price Impact', '0.02%'),
                        lastCard('Slippage', '1.0%'),
                      ],
                    ),
                  ),
                ),

                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7B3FA0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                    child: Text(
                      "Confirm Swap",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AssetCard extends StatelessWidget {
  final String label;
  final String amount;
  final String symbol;
  final String currency;
  final String usdValue;
  final String balance;

  const AssetCard({
    super.key,
    required this.label,
    required this.amount,
    required this.symbol,
    required this.currency,
    required this.usdValue,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF141414),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      child: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Lottie.asset(symbol, width: 20.w, height: 20.h),
                    Text(
                      currency,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      usdValue,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  balance,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
