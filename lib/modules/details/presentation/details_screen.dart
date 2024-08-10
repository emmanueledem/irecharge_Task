import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_assessment/common/colors.dart';
import 'package:mobile_assessment/common/text_styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.params}) : super(key: key);

  final DetailsScreenParams params;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, determineEmployeePromotion);
    super.initState();
  }

  String? newSalary;
  int? newLevel;

  void determineEmployeePromotion() {
    if (widget.params.productivityScore! <= 100 &&
        80 <= widget.params.productivityScore!) {
      if (widget.params.level! < 5) {
        setState(() {
          newLevel = widget.params.level! + 1;
          switch (newLevel) {
            case 0:
              newSalary = '70,000';
            case 1:
              newSalary = '100,000';
            case 2:
              newSalary = '120,000';
            case 3:
              newSalary = '180,000';
            case 4:
              newSalary = '200,000';
            case 5:
              newSalary = '250,000';
              break;
            default:
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      body: Column(
        children: [
          Stack(
            // alignment: Alignment.topLeft,
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 130,
                        right: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircularPercentIndicator(
                            radius: 35,
                            lineWidth: 3,
                            percent: 0.50,
                            center: TextRegular(
                              widget.params.productivityScore.toString(),
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                            progressColor: AppColors.green3,
                            backgroundColor: AppColors.white,
                          ),
                          const Gap(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextBold(
                                    widget.params.employeeName.toString(),
                                    fontSize: 15,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const Gap(4),
                                  TextRegular(
                                    widget.params.designation.toString(),
                                    fontSize: 15,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              const Gap(12),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: widget.params.productivityScore! <= 39
                                      ? TextRegular(
                                          'Termination',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        )
                                      : widget.params.productivityScore! <=
                                                  49 &&
                                              40 <=
                                                  widget
                                                      .params.productivityScore!
                                          ? TextRegular(
                                              'A demotion',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            )
                                          : widget.params.productivityScore! <=
                                                      79 &&
                                                  50 <=
                                                      widget.params
                                                          .productivityScore!
                                              ? TextRegular(
                                                  'No change',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              : Column(
                                                  children: [
                                                    TextRegular(
                                                        textAlign:
                                                            TextAlign.center,
                                                        'A promotion'),
                                                  ],
                                                ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 70,
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          TextRegular(
            'Other Employee Infomration',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
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
                      children: [
                        TextRegular(
                          'Level: ',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        TextRegular(
                          widget.params.level.toString(),
                          fontSize: 13,
                        ),
                      ],
                    ),
                    const Gap(4),
                    const Divider(
                      color: AppColors.grey7,
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
                          widget.params.salary.toString(),
                          fontSize: 13,
                        ),
                      ],
                    ),
                    const Gap(4),
                    const Divider(
                      color: AppColors.grey7,
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
                          widget.params.employmentStatus.toString(),
                          fontSize: 13,
                        ),
                      ],
                    ),
                    const Gap(4),
                  ],
                ),
              ),
            ),
          ),
          TextRegular(
            'Eligibility information',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          const Gap(4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextRegular(
              'This refers to possible adjustments that will implemented to affect the status of this employee with company at the end of the year',
              fontSize: 13,
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(4),
          Padding(
            padding: const EdgeInsets.all(15),
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
                      children: [
                        TextRegular(
                          'New Level:',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        TextRegular(
                          widget.params.productivityScore! <= 100 &&
                                  80 <= widget.params.productivityScore!
                              ? newLevel.toString()
                              : 'Not Eligible',
                          fontSize: 13,
                        ),
                      ],
                    ),
                    const Gap(4),
                    const Divider(
                      color: AppColors.grey7,
                    ),
                    const Gap(4),
                    Row(
                      children: [
                        TextRegular(
                          'New Salary: ',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        TextRegular(
                          widget.params.productivityScore! <= 100 &&
                                  80 <= widget.params.productivityScore!
                              ? newSalary.toString()
                              : 'Not Eligible',
                          fontSize: 13,
                        ),
                      ],
                    ),
                    const Gap(4),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailsScreenParams {
  DetailsScreenParams({
    required this.employeeName,
    required this.designation,
    required this.level,
    required this.productivityScore,
    required this.salary,
    required this.employmentStatus,
  });
  final String? employeeName;
  final String? designation;
  final int? level;
  final int? productivityScore;
  final String? salary;
  final int? employmentStatus;
}
