import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailShimmer extends StatelessWidget {
  const ProductDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image carousel placeholder
          shimmerBox(width: double.infinity, height: 300, radius: 0),
          const SizedBox(height: 10),

          // Page indicator placeholder
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: shimmerCircle(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Vendor text
          shimmerBox(width: 100, height: 16),
          const SizedBox(height: 10),

          // Title text
          shimmerBox(width: 200, height: 20),
          const SizedBox(height: 20),

          // Price row
          Row(
            children: [
              shimmerBox(width: 80, height: 20),
              const SizedBox(width: 10),
              shimmerBox(width: 60, height: 18),
            ],
          ),
          const SizedBox(height: 20),

          // Variant buttons
          Row(
            children: [
              shimmerBox(width: 80, height: 35, radius: 8),
              const SizedBox(width: 10),
              shimmerBox(width: 80, height: 35, radius: 8),
            ],
          ),
          const SizedBox(height: 20),

          // Quantity + Add to Cart
          Row(
            children: [
              shimmerBox(width: 120, height: 45, radius: 24),
              const SizedBox(width: 12),
              Expanded(child: shimmerBox(width: double.infinity, height: 45, radius: 24)),
            ],
          ),
          const SizedBox(height: 20),

          // Description text placeholders
          Column(
            children: List.generate(
              5,
                  (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: shimmerBox(width: double.infinity, height: 12),
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }

  Widget shimmerBox({required double width, required double height, double radius = 4}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  Widget shimmerCircle(double size) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
