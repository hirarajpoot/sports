import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/auth-controllers/create_tournament_controller.dart';

class DateFieldsRow extends StatelessWidget {
  const DateFieldsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateTournamentController>();

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Start Date',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: controller.startDateController,
                  readOnly: true,
                  onTap: () => controller.selectDate(context, controller.startDateController),
                  decoration: InputDecoration(
                    hintText: 'dd/mm/yyyy',
                    hintStyle: const TextStyle(fontFamily: 'Inter'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today, size: 16),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'End Date',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: controller.endDateController,
                  readOnly: true,
                  onTap: () => controller.selectDate(context, controller.endDateController),
                  decoration: InputDecoration(
                    hintText: 'dd/mm/yyyy',
                    hintStyle: const TextStyle(fontFamily: 'Inter'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today, size: 16),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
