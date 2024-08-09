import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_assessment/common/colors.dart';
import 'package:mobile_assessment/common/text_styles.dart';
import 'package:mobile_assessment/modules/home/cubit/home_cubit.dart';
import 'package:mobile_assessment/modules/home/cubit/home_cubit_state.dart';
import 'package:mobile_assessment/modules/home/repository/home_repository.dart';
import 'package:mobile_assessment/modules/home/widgets/employees_container.dart';
import 'package:mobile_assessment/modules/widgets/inputs/app_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  final homeRepository = HomeRepository();
  bool showInput = false;
  bool isSearch = false;

  _fetchData() async {
    await context.read<HomeCubit>().getEmployees(
          context,
        );
    setState(() {
      showInput = true;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, _fetchData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: SizedBox.new,
            );
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  const Gap(22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          TextBold(
                            'Hi Dexter',
                            fontWeight: FontWeight.w500,
                          ),
                          const Gap(1),
                          TextRegular(
                            'Welcome onboard',
                            fontSize: 12,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  showInput
                      ? CustomTextField(
                          hintText: "Search Employees",
                          maxLines: 1,
                          labelText: 'Search Employees',
                          controller: searchController,
                          onSaved: (p0) {},
                          onChanged: (p0) async {
                            await context.read<HomeCubit>().searchEmployees(
                                context,
                                searchText: p0.toString());
                          },
                          suffix: GestureDetector(
                            child: const Icon(
                              Icons.search_rounded,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  const Gap(20),
                  Container(
                      child: state.maybeWhen(
                    orElse: SizedBox.new,
                    error: (message) {
                      return Text(
                        message.toString(),
                      );
                    },
                    loading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    success: (data) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            final item = data[index];
                            return EmployessContainer(
                              firstName: item.firstName,
                              lastName: item.lastName,
                              designation: item.designation,
                              level: item.level,
                              productivityScore: item.productivityScore,
                              currentSalary: item.currentSalary,
                              employmentStatus: item.employmentStatus,
                              onTap: () {},
                            );
                          },
                        ),
                      );
                    },
                    searched: (data) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            final item = data[index];
                            return EmployessContainer(
                              firstName: item.firstName,
                              lastName: item.lastName,
                              designation: item.designation,
                              level: item.level,
                              productivityScore: item.productivityScore,
                              currentSalary: item.currentSalary,
                              employmentStatus: item.employmentStatus,
                              onTap: () {},
                            );
                          },
                        ),
                      );
                    },
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
