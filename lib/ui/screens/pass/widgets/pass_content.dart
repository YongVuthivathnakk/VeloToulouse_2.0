import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/models/user_subscription.dart';
import 'package:velotoulouse/ui/screens/pass/view_model/pass_view_model.dart';
import 'package:velotoulouse/ui/screens/pass/widgets/one_time_ticket_active_card.dart';
import 'package:velotoulouse/ui/screens/pass/widgets/pass_card.dart';
import 'package:velotoulouse/ui/screens/pass/widgets/payment_bottom_sheet.dart';
import 'package:velotoulouse/ui/themes/theme.dart';
import 'package:velotoulouse/utils/async_value_state.dart';


class PassContent extends StatelessWidget {
  const PassContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Pass Options", style: AppText.h2)),
      ),
      body: PassCarousel(),
    );
  }
}

class PassCarousel extends StatefulWidget {
  const PassCarousel({super.key});

  @override
  State<PassCarousel> createState() => _PassCarouselState();
}

class _PassCarouselState extends State<PassCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  String? _lastSuccessMessage;

  void _showPassSelectionBottomSheet(
    BuildContext context,
    PassType selectedPass,
    PassViewModel vm,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => PaymentBottomSheet(
        pass: selectedPass,
        isLoading: vm.isLoading,
        onConfirm: () {
          Navigator.pop(context);
          vm.handlePassContent(selectedPass);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PassViewModel>();
    final currentPassType = vm.currentPass;
    final isUsingOneTimeTicket = currentPassType == PassType.oneTimeTicket;

    // Show snackbar on successful payment
    if (vm.passData.state == AsyncValueState.success &&
        vm.passData.data != null &&
        vm.passData.data!.isNotEmpty &&
        _lastSuccessMessage != vm.passData.data) {
      _lastSuccessMessage = vm.passData.data;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(vm.passData.data ?? 'Success!'),
            backgroundColor: AppColors.primaryDark,
            duration: const Duration(seconds: 2),
          ),
        );
        // Clear the success message after showing
        vm.clearSuccess();
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Show current pass info only when using one-time ticket
        if (isUsingOneTimeTicket) OneTimeTicketActiveCard(),
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: PassType.values.length - 1,
          itemBuilder: (context, index, pageViewIndex) {
            final pass = PassType.values[index + 1];
            final isCurrentPass = currentPassType == pass;

            return PassCard(
              pass: pass,
              isCurrentPass: isCurrentPass,
              isLoading: vm.isLoading,
              onChoose: () => _showPassSelectionBottomSheet(context, pass, vm),
            );
          },
          options: CarouselOptions(
            height: 560,
            viewportFraction: 0.88,
            enlargeCenterPage: true,
            enlargeFactor: 0.05,
            enableInfiniteScroll: false,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),
        const SizedBox(height: 12),

        // Dot indicatior ...
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            PassType.values.length - 1,
            (index) => GestureDetector(
              onTap: () => _controller.animateToPage(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 20 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? AppColors.primaryDark
                      : AppColors.grey300,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
