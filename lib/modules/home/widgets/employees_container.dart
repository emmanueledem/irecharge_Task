import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_assessment/common/colors.dart';
import 'package:mobile_assessment/common/text_styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class EmployessContainer extends StatelessWidget {
  const EmployessContainer({
    required this.onTap,
    super.key,
    required this.firstName,
    required this.lastName,
    required this.designation,
    required this.level,
    required this.productivityScore,
    required this.currentSalary,
    required this.employmentStatus,
  });
  final String firstName;
  final String lastName;
  final String designation;
  final int level;
  final double productivityScore;
  final String currentSalary;
  final int employmentStatus;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey14,

              blurRadius: 4,
              offset: Offset(
                0,
                4,
              ), // changes position of shadow
            ),
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.06),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextRegular(
                    designation,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      child: TextRegular(
                        '4d',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextRegular(
                            'First name: ',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          TextRegular(
                            firstName,
                            fontSize: 13,
                          ),
                        ],
                      ),
                      const Gap(4),
                      Row(
                        children: [
                          TextRegular(
                            'Last name: ',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          TextRegular(
                            lastName,
                            fontSize: 13,
                          ),
                        ],
                      ),
                      const Gap(4),
                      Row(
                        children: [
                          TextRegular(
                            'Level: ',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          TextRegular(
                            '$level',
                            fontSize: 13,
                          ),
                        ],
                      ),
                      const Gap(4),
                      Row(
                        children: [
                          TextRegular(
                            'Current Salary: ',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          TextRegular(
                            currentSalary,
                            fontSize: 13,
                          ),
                        ],
                      ),
                      const Gap(4),
                      Row(
                        children: [
                          TextRegular(
                            'Employment Status: ',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          TextRegular(
                            '$employmentStatus',
                            fontSize: 13,
                          ),
                        ],
                      ),
                      const Gap(4),
                    ],
                  ),
                  CircularPercentIndicator(
                    radius: 25,
                    lineWidth: 2,
                    percent: 0.50,
                    center: TextRegular(
                      productivityScore.toString(),
                      fontWeight: FontWeight.w500,
                      color: AppColors.green3,
                    ),
                    progressColor: AppColors.green3,
                    backgroundColor: AppColors.green4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
