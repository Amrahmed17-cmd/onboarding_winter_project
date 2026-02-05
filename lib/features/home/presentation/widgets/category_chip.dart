import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';

class CategoryChip extends StatefulWidget {
  final String name;
  final String? imageUrl;
  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.name,
    this.imageUrl,
    this.onTap,
  });

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: AppColors.blackColor.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.greyC4Color.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: widget.imageUrl != null
                    ? Image.network(
                        widget.imageUrl!,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_outlined,
                            color: AppColors.greyA8Color,
                            size: 28,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF4169E1),
                              ),
                            ),
                          );
                        },
                      )
                    : Icon(
                        Icons.image_outlined,
                        color: AppColors.greyA8Color,
                        size: 28,
                      ),
              ),
            ),
            SizedBox(height: 6),
            SizedBox(
              width: 70,
              child: Text(
                widget.name,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
