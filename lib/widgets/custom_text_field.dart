import 'package:application/utils/import.dart';

/// A customizable text field widget that supports various styles and functionalities.
/// It can be used for password fields, multi-line input, and more.
class CustomTextField extends StatefulWidget {
  final double borderRadius;

  /// Indicates whether the text field is a password field.
  /// If true, the text will be obscured by default and a visibility toggle icon will be shown.
  final bool isPasswordField;

  /// Indicates whether to show a suffix icon.
  /// If true, a visibility toggle icon (for passwords) or a clear icon (for regular fields) will be displayed.
  final bool showSuffixIcon;

  /// The controller for the text field. This allows you to control the text programmatically.
  final TextEditingController controller;

  /// The type of keyboard to display. For example, [TextInputType.text], [TextInputType.number], etc.
  final TextInputType? keyboardType;

  /// A validation function that checks the input value.
  /// It should return null if the input is valid, or an error message if invalid.
  final String? Function(String?)? validator;

  /// A callback function that is called whenever the text changes.
  final Function(String)? onChanged;

  /// The placeholder text to display when the text field is empty.
  final String? hintText;

  /// An optional label to display above the text field.
  final String? label;

  /// The style of the text inside the text field.
  final TextStyle? textStyle;

  /// The style of the hint text.
  final TextStyle? hintStyle;

  /// A list of input formatters to apply to the text field.
  /// These can restrict the input format, such as allowing only numbers or limiting the length.
  final List<TextInputFormatter>? inputFormatters;

  /// The number of lines for the text field. Defaults to 1 for single-line input.
  final int lines;

  ///
  final bool autofocus;

  /// The text direction for the text field. Can be [TextDirection.ltr] or [TextDirection.rtl].
  final TextDirection? textDirection;

  ///
  final Color fillColor;

  /// Creates an instance of [CustomTextField].
  ///
  /// [controller] is required and is used to manage the text field's content.
  /// [isPasswordField] is optional and defaults to false.
  /// [showSuffixIcon] is optional and defaults to true.
  /// [keyboardType], [validator], [onChanged], [hintText], [label], [textStyle], [hintStyle], [inputFormatters], [lines], and [textDirection] are all optional.
  const CustomTextField({
    super.key,
    this.isPasswordField = false,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.showSuffixIcon = true,
    this.hintText,
    this.label,
    this.textStyle,
    this.hintStyle,
    this.inputFormatters,
    this.lines = 1,
    this.textDirection,
    this.autofocus = false,
    this.borderRadius = 8,
    this.fillColor = const Color(0xFFF5F5F5),
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  /// Controls whether the password text is visible or obscured.
  /// This is toggled when the visibility icon is pressed.
  bool obscureText = true;

  /// Toggles the visibility of the password text.
  void _toggleVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  /// Returns a widget for toggling password visibility.
  /// Displays an eye icon that switches between "visible" and "hidden" states.
  Widget _toggleVisibilityWidget() {
    return GestureDetector(
      onTap: _toggleVisibility,
      child: Icon(
        obscureText ? Icons.visibility : Icons.visibility_off,
        size: 16,
        color: Colors.grey.shade400,
      ),
    );
  }

  /// Returns a widget for clearing the text field's content.
  /// Displays a cancel icon that clears the text when tapped.
  Widget _clearTextWidget() {
    return GestureDetector(
      onTap: widget.controller.clear,
      child: Icon(Icons.cancel, size: 16, color: Colors.grey.shade400),
    );
  }

  UnderlineInputBorder buildBorder() {
    return UnderlineInputBorder(
      borderSide: const BorderSide(style: BorderStyle.none),
      borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Label
        ///
        /// Displays an optional label above the text field.
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              widget.label!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

        /// Text Field
        ///
        /// A customizable text field with support for password visibility, clear button, and more.
        CustomDirectionality(
          textDirection: widget.textDirection,
          child: TextFormField(
            maxLines: widget.lines,
            minLines: widget.lines,
            obscuringCharacter: '●', // Character used to obscure password text
            cursorColor: const Color(0xFF7738C7), // Cursor color
            autofocus: widget.autofocus,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            obscureText:
                widget.isPasswordField
                    ? obscureText
                    : false, // Obscure text if it's a password field
            validator: widget.validator, // Validation logic
            onChanged: widget.onChanged, // Callback on text change
            style:
                widget.textStyle != null
                    ? widget.textStyle!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )
                    : TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ), // Default text style
            decoration: InputDecoration(
              fillColor: widget.fillColor,
              filled: true,

              counterText: '', // Hide character counter
              contentPadding:
                  widget.lines > 1
                      ? const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 8.0,
                      ) // Padding for multi-line text field
                      : // Padding for single-line text field
                      const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ), // Padding inside the text field

              hintText: widget.hintText, // Placeholder text
              hintStyle:
                  widget.hintStyle ??
                  TextStyle(
                    fontFamily: ConstantsText.fontFamily,
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ), // Default hint style
              /// Suffix Icon
              ///
              /// Displays a visibility toggle icon for password fields or a clear icon for regular fields.
              suffix:
                  widget.showSuffixIcon
                      ? Padding(
                        padding: const EdgeInsets.only(bottom: 7.5),
                        child: Transform.translate(
                          offset: const Offset(0, 4),
                          child:
                              widget.isPasswordField
                                  ? _toggleVisibilityWidget() // Visibility toggle icon
                                  : _clearTextWidget(), // Clear icon
                        ),
                      )
                      : null,
              errorStyle: const TextStyle(fontSize: 10, color: Colors.red),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(),
              border: buildBorder(),
              errorBorder: buildBorder(),
              disabledBorder: buildBorder(),
              focusedErrorBorder: buildBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
