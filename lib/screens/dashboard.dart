import 'package:flutter/material.dart';
import '../controllers/dashboard_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to My Personal Finance Manager!",
                    style: GoogleFonts.caveat(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 80),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Quick Access",
                          style: GoogleFonts.kalam(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent.shade200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildDashboardFeature(
                              context,
                              icon: Icons.add_circle_outline,
                              title: "Add Expense",
                              description: "Record your daily spending easily.",
                              color: Colors.pink.shade100,
                              onPressed: () {
                                DashboardController.navigateToExpenseEntry(context);
                              },
                            ),
                            _buildDashboardFeature(
                              context,
                              icon: Icons.account_balance_wallet_outlined,
                              title: "Check Budget",
                              description: "View and adjust your monthly budget.",
                              color: Colors.amber.shade100,
                              onPressed: () {
                                DashboardController.navigateToBudgetSetup(context);
                              },
                            ),
                            _buildDashboardFeature(
                              context,
                              icon: Icons.bar_chart_outlined,
                              title: "Reports & Charts",
                              description: "Visualize your expenses and savings.",
                              color: Colors.teal.shade100,
                              onPressed: () {
                                DashboardController.navigateToReportsAndCharts(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardFeature(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String description,
        required Color color,
        required VoidCallback onPressed,
        bool isLarge = false,
      }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                minimumSize: Size(isLarge ? 130 : 110, isLarge ? 80 : 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                side: const BorderSide(color: Colors.black, width: 1.5),
              ),
              onPressed: onPressed,
              child: Column(
                children: [
                  Icon(icon, color: Colors.black, size: isLarge ? 32 : 26),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kalam(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: isLarge ? 17 : 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
