import 'package:securedtrade/config/path_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FieldData {
  final String data;
  final bool valid;
  FieldData({required this.data, required this.valid});
}

enum VALIDATE { USER, EMAIL, PASSWORD, PHONE, ADDRESS, DOB, CIVIL }

const double app_padding = 16;

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String text;
  final String labelText;
  final String hintText;
  final String? valText, suffixText;
  final TextInputAction? action;
  final Function(FieldData)? onChanged;
  final VALIDATE validate;
  final bool obscureText, isFilledColor, isPrefixIcon, isSuffixIcon;
  final IconData icon;
  final List<String>? items;
  final bool hasList;
  final TextInputType textInputType;
  final double? borderWidth, padding, radius;
  final Color? fillColor, borderColor;
  final TextAlign align;

  const AppTextField({
    Key? key,
    this.suffixText,
    this.align=TextAlign.start,
    this.radius = 8,
    this.isPrefixIcon = true,
    this.borderColor = AppColors.grey2,
    this.isSuffixIcon = false,
    this.action,
    this.onChanged,
    this.padding = 15,
    this.fillColor = AppColors.white,
    this.labelText = '',
    this.borderWidth = 1,
    this.hintText = '',
    this.isFilledColor = true,
    this.validate = VALIDATE.USER,
    this.obscureText = false,
    this.icon = Icons.check,
    this.items,
    this.controller,
    this.hasList = false,
    this.text = '',
    this.textInputType = TextInputType.text,
    this.valText,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController _controller = TextEditingController();
  String _value = '';
  bool _isValid = false;
  bool _obscureText = false;


  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    if (widget.controller != null) {
      _controller = widget.controller ?? _controller;
      _controller.addListener(() {
        _value = _controller.text;
        _isValid = _validate(widget.validate);
        if (mounted)
          setState(() {
            print('_value: $_value, _isValid: $_isValid');
          });
      });
    } else {
      _controller.text = widget.text;
      if (widget.onChanged != null)
        widget.onChanged!(FieldData(data: widget.text, valid: _isValid));
    }
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText.isEmpty
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  widget.labelText,
                  style: getDmSansTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black2,
                  ),
                ),
              ),
        SizedBox(height: 5, width: 0),
        TextFormField(
          textAlign: widget.align,
          cursorColor: AppColors.primary,
          inputFormatters: [
            LengthLimitingTextInputFormatter(38),
            FilteringTextInputFormatter.deny(RegExp('[ ]')),
          ],
          style: getInterTextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          keyboardType: widget.textInputType,
          textInputAction: TextInputAction.next,
          controller: _controller,
          onChanged: (val) {
            _value = val;
            _isValid = _validate(widget.validate);
            print('${widget.validate} val: $_isValid');
            if (widget.onChanged != null)
              widget.onChanged!(FieldData(data: val, valid: _isValid));
            // widget.onChanged!(val, _isValid);
            if (mounted) setState(() => _value = val);
          },
          obscureText: _obscureText,
          // textInputAction: widget.action,
          /* onTap: widget.hasList
              ? () {
                  FocusScope.of(context).unfocus();
                  if (widget.items != null)
                    _showAlertDialog(widget.items!, (data) {
                      _value = data;
                      _isValid = _validate(widget.validate);
                      _controller.text = data;
                      if (widget.onChanged != null)
                        widget
                            .onChanged!(FieldData(data: data, valid: _isValid));
                      // widget.onChanged!(data, _isValid);
                      print('print Item $data _isValid $_isValid');
                      if (mounted) setState(() => _value = data);
                    });
                }
              : widget.obscureText
                  ? () {
                      setState(() => _obscureText = !_obscureText);
                    }
                  : null,*/
          cursorHeight: 18,
          cursorWidth: 1,

          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: widget.fillColor,
            filled: widget.isFilledColor,
            prefixIcon: widget.isPrefixIcon
                ? Icon(widget.icon, size: 19, color: AppColors.black)
                : null,
            contentPadding: EdgeInsets.only(
              bottom: widget.padding!,
              left: 10,
              top: widget.padding!,
            ),
            hintStyle: GoogleFonts.dmSans(
              letterSpacing: 1.1,
              color: AppColors.grey3,
              fontSize: 14.3,
              fontWeight: FontWeight.w500,
            ),
            suffixText: widget.suffixText,
            suffixStyle: getDmSansTextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            hintText: widget.hintText,
            suffixIcon: widget.isSuffixIcon
                ? IconButton(
                    onPressed: () {
                      setState(() => _obscureText = !_obscureText);
                    },
                    icon: Icon(
                      _obscureText
                          ? CupertinoIcons.eye_slash_fill
                          : CupertinoIcons.eye_fill,
                      color: _obscureText ? AppColors.black4 : AppColors.black,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius!),
              borderSide: BorderSide(
                width: widget.borderWidth!,
                color: widget.borderColor!,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius!),
              borderSide: BorderSide(
                width: widget.borderWidth!,
                color: widget.borderColor!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius!),
              borderSide: BorderSide(
                width: widget.borderWidth!,
                color: widget.borderColor!,
              ),
            ),
          ),
        ),
        !_isValid && _value.length > 0 && widget.valText != null
            ? Row(
                children: [
                  Icon(
                    Icons.warning_amber_outlined,
                    size: 16,
                    color: Colors.red,
                  ),
                  Text(
                    '${widget.valText}',
                    style: getPTSandTextStyle(color: Colors.red),
                  ),
                ],
              )
            : Container(),
        // Align(alignment: Alignment.centerLeft, child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.warning_amber_outlined), label: Text('Name required')),)
      ],
    );
  }

  bool _validate(valid) {
    switch (valid) {
      case VALIDATE.USER:
        return validateUser(_value);
      case VALIDATE.EMAIL:
        return validEmail(_value);
      case VALIDATE.DOB:
        return validDOB(_value);
      case VALIDATE.PASSWORD:
        return validPassword(_value);
      case VALIDATE.CIVIL:
        return validCivilNumber(_value);
      case VALIDATE.PHONE:
        return validPhone(_value);
      default:
        return false;
    }
  }

  bool validateUser(String data) {
    return data.length > 3;
  }

  bool validEmail(emailAddress) {
    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(emailAddress);
    return emailValid;
  }

  bool validDOB(String dob) {
    bool isValid = dob.length > 0;
    return isValid;
  }

  bool validCivilNumber(String data) {
    return data.length > 6;
  }

  bool valid(String data) {
    return data.length > 3;
  }

  bool validContact(String data) {
    bool isValid = RegExp(r"^[6-9]\d{9}$").hasMatch(data);
    return isValid;
  }

  bool validPassword(String data) {
    return data.length > 6;
  }

  bool validPhone(String data) {
    bool isValid = RegExp(r"^[6-9]\d{9}$").hasMatch(data);
    return isValid;
  }

  _showAlertDialog(List<String> items, onTap) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Show Dialog"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(
              items.length,
              (index) => ListTile(
                title: Text(items.elementAt(index)),
                onTap: () {
                  Navigator.of(context).pop();
                  onTap(items.elementAt(index));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
