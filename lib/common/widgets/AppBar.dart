import 'package:flutter/material.dart';

class MYAppBar extends StatelessWidget {
  final String? logoImagePath;
  final double? logoWidth;
  final double? logoHeight;
  final IconData? icon1;
  final IconData? icon2;
  final Widget? leadingIcon;
  final TextEditingController? textFieldController;
  final String? rightText; // Additional text to display
  final Gradient? appBarGradient;
  final VoidCallback? onTap;

  const MYAppBar({
    Key? key,
    this.logoImagePath,
    this.logoWidth = 120,
    this.logoHeight = 45,
    this.icon1,
    this.icon2,
    this.leadingIcon,
    this.textFieldController,
    this.rightText, // Added for right-side text
    this.appBarGradient,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (logoImagePath != null)
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                logoImagePath!,
                width: logoWidth!,
                height: logoHeight!,
              ),
            ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (textFieldController != null)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: TextFormField(
                          controller: textFieldController,
                          decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: onTap,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(top: 20),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  width: 0.8),
                            ),
                            hintText: 'Search BharatMart',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  // Simple Text Widget
                  if (rightText != null)
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20), // Padding from the right edge
                      child: Text(
                        rightText!,
                        style: TextStyle(
                          color: Colors.black, // Text color
                          fontSize: 16, // Text size
                        ),
                      ),
                    ),
                  // Icons
                  if (icon1 != null)
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(icon1),
                    ),
                  if (icon2 != null) Icon(icon2),
                ],
              ),
            ),
          ),
        ],
      ),
      flexibleSpace: appBarGradient != null
          ? Container(
              decoration: BoxDecoration(
                gradient: appBarGradient,
              ),
            )
          : null,
    );
  }
}
