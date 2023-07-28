import 'dart:convert';

class CustomThemeM {
  CustomColors? colors;
  CustomFonts? fonts;
  CustomStyles? styles;

  CustomThemeM themeFromJson(String str) =>
      CustomThemeM.fromJson(json.decode(str));
  CustomThemeM({this.colors, this.fonts, this.styles});

  CustomThemeM.fromJson(Map<String, dynamic> json) {
    colors =
        json['Colors'] != null ? CustomColors.fromJson(json['Colors']) : null;
    fonts = json['Fonts'] != null ? CustomFonts.fromJson(json['Fonts']) : null;
    styles =
        json['Styles'] != null ? CustomStyles.fromJson(json['Styles']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.colors != null) {
      data['Colors'] = this.colors!.toJson();
    }
    if (this.fonts != null) {
      data['Fonts'] = this.fonts!.toJson();
    }
    if (this.styles != null) {
      data['Styles'] = this.styles!.toJson();
    }
    return data;
  }
}

class CustomColors {
  String? primarySwatch;
  String? primaryColor;
  String? accentColor;
  String? cardColor;
  String? buttonColor;
  String? buttonTextColor;
  String? errorColor;
  String? brightness;
  String? primaryContainer;
  String? secondary;
  String? dividerColor;
  String? iconColor;
  String? radioFillColor;
  String? onPrimaryContainer;
  String? onPrimary;
  String? onSecondary;
  String? onError;
  String? hoverColor;

  CustomColors(
      {this.primarySwatch,
      this.primaryColor,
      this.accentColor,
      this.cardColor,
      this.buttonColor,
      this.buttonTextColor,
      this.errorColor,
      this.brightness,
      this.primaryContainer,
      this.secondary,
      this.dividerColor,
      this.iconColor,
      this.radioFillColor,
      this.onPrimaryContainer,
      this.onPrimary,
      this.onSecondary,
      this.onError,
      this.hoverColor});

  CustomColors.fromJson(Map<String, dynamic> json) {
    primarySwatch = json['primarySwatch'];
    primaryColor = json['primary'];
    accentColor = json['accent'];
    cardColor = json['card'];
    buttonColor = json['button'];
    buttonTextColor = json['buttonText'];
    errorColor = json['error'];
    brightness = json['Brightness'];
    primaryContainer = json['primaryContainer'];
    secondary = json['Secondary'];
    dividerColor = json['divider'];
    iconColor = json['icon'];
    radioFillColor = json['radioFill'];
    onPrimaryContainer = json['onPrimaryContainer'];
    onPrimary = json['onPrimary'];
    onSecondary = json['onSecondary'];
    onError = json['onError'];
    hoverColor = json['hover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['primarySwatch'] = this.primarySwatch;
    data['primary'] = this.primaryColor;
    data['accent'] = this.accentColor;
    data['card'] = this.cardColor;
    data['button'] = this.buttonColor;
    data['buttonText'] = this.buttonTextColor;
    data['error'] = this.errorColor;
    data['Brightness'] = this.brightness;
    data['primaryContainer'] = this.primaryContainer;
    data['Secondary'] = this.secondary;
    data['divider'] = this.dividerColor;
    data['icon'] = this.iconColor;
    data['radioFill'] = this.radioFillColor;
    data['onPrimaryContainer'] = this.onPrimaryContainer;
    data['onPrimary'] = this.onPrimary;
    data['onSecondary'] = this.onSecondary;
    data['onError'] = this.onError;
    data['hover'] = this.hoverColor;
    return data;
  }
}

class CustomFonts {
  String? textTheme;
  int? buttonFontSize;
  int? buttonPadding;
  BodyLarge? bodyLarge;
  BodyLarge? bodyMedium;
  BodyLarge? bodySmall;
  BodyLarge? displayLarge;
  BodyLarge? displayMedium;
  BodyLarge? displaySmall;

  CustomFonts(
      {this.textTheme,
      this.buttonFontSize,
      this.buttonPadding,
      this.bodyLarge,
      this.bodyMedium,
      this.bodySmall,
      this.displayLarge,
      this.displayMedium,
      this.displaySmall});

  CustomFonts.fromJson(Map<String, dynamic> json) {
    textTheme = json['textTheme'];
    buttonFontSize = json['buttonFontSize'];
    buttonPadding = json['buttonPadding'];
    bodyLarge = json['bodyLarge'] != null
        ? BodyLarge.fromJson(json['bodyLarge'])
        : null;
    bodyMedium = json['bodyMedium'] != null
        ? BodyLarge.fromJson(json['bodyMedium'])
        : null;
    bodySmall = json['bodySmall'] != null
        ? BodyLarge.fromJson(json['bodySmall'])
        : null;
    displayLarge = json['displayLarge'] != null
        ? BodyLarge.fromJson(json['displayLarge'])
        : null;
    displayMedium = json['displayMedium'] != null
        ? BodyLarge.fromJson(json['displayMedium'])
        : null;
    displaySmall = json['displaySmall'] != null
        ? BodyLarge.fromJson(json['displaySmall'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['textTheme'] = this.textTheme;
    data['buttonPadding'] = this.buttonPadding;
    data['buttonFontSize'] = this.buttonFontSize;
    if (this.bodyLarge != null) {
      data['bodyLarge'] = this.bodyLarge!.toJson();
    }
    if (this.bodyMedium != null) {
      data['bodyMedium'] = this.bodyMedium!.toJson();
    }
    if (this.bodySmall != null) {
      data['bodySmall'] = this.bodySmall!.toJson();
    }
    if (this.displayLarge != null) {
      data['displayLarge'] = this.displayLarge!.toJson();
    }
    if (this.displayMedium != null) {
      data['displayMedium'] = this.displayMedium!.toJson();
    }
    if (this.displaySmall != null) {
      data['displaySmall'] = this.displaySmall!.toJson();
    }
    return data;
  }
}

class BodyLarge {
  int? fontSize;
  int? fontWeight;

  BodyLarge({this.fontSize, this.fontWeight});

  BodyLarge.fromJson(Map<String, dynamic> json) {
    fontSize = json['fontSize'];
    fontWeight = json['fontWeight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fontSize'] = this.fontSize;
    data['fontWeight'] = this.fontWeight;
    return data;
  }
}

class CustomStyles {
  bool? outlineBorderInput;

  CustomStyles({this.outlineBorderInput});

  CustomStyles.fromJson(Map<String, dynamic> json) {
    outlineBorderInput = json['outlineBorderInput'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['outlineBorderInput'] = this.outlineBorderInput;
    return data;
  }
}
