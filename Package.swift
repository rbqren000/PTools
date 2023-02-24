// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PTools",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "DataEncrypt",targets: ["DataEncrypt"]),
        .library(name: "Animation", targets: ["Animation"]),
        .library(name: "YB_Attributed", targets: ["YB_Attributed"]),
        .library(name: "BankCard", targets: ["BankCard"]),
        .library(name: "BilogyID", targets: ["BilogyID"]),
        .library(name: "Calendar", targets: ["Calendar"]),
        .library(name: "Telephony", targets: ["Telephony"]),
        .library(name: "CheckBox", targets: ["CheckBox"]),
        .library(name: "CheckDirtyWord", targets: ["CheckDirtyWord"]),
        .library(name: "CodeView", targets: ["CodeView"]),
        .library(name: "Country", targets: ["Country"]),
        .library(name: "DarkModeSetting", targets: ["DarkModeSetting"]),
        .library(name: "Guide", targets: ["Guide"]),
        .library(name: "Input", targets: ["Input"]),
        .library(name: "CustomerNumberKeyboard", targets: ["CustomerNumberKeyboard"]),
        .library(name: "KeyChain", targets: ["KeyChain"]),
        .library(name: "CustomerLabel", targets: ["CustomerLabel"]),
        .library(name: "LanguageSetting", targets: ["LanguageSetting"]),
        .library(name: "Line", targets: ["Line"]),
        .library(name: "Loading", targets: ["Loading"]),
        .library(name: "MediaViewer", targets: ["MediaViewer"]),
        .library(name: "Motion", targets: ["Motion"]),
        .library(name: "PhoneInfo", targets: ["PhoneInfo"]),
        .library(name: "RateView", targets: ["RateView"]),
        .library(name: "Rotation", targets: ["Rotation"]),
        .library(name: "ScrollBanner", targets: ["ScrollBanner"]),
        .library(name: "SearchBar", targets: ["SearchBar"]),
        .library(name: "Segmented", targets: ["Segmented"]),
        .library(name: "Slider", targets: ["Slider"]),
//        .library(name: "NetWork", targets: ["NetWork"]),
        .library(name: "CheckUpdate", targets: ["CheckUpdate"]),
        .library(name: "Layout", targets: ["Layout"]),
        .library(name: "Tabbar", targets: ["Tabbar"]),
        .library(name: "SmartScreenshot", targets: ["SmartScreenshot"]),
        .library(name: "ZipArchive", targets: ["ZipArchive"]),
        .library(name: "GCDWebServer", targets: ["GCDWebServer"]),
        .library(name: "ColorPicker", targets: ["ColorPicker"]),
        .library(name: "ImageColors", targets: ["ImageColors"]),
        .library(name: "FocusFaceImageView", targets: ["FocusFaceImageView"]),
        .library(name: "PagingControl", targets: ["PagingControl"]),
        .library(name: "ImagePicker", targets: ["ImagePicker"]),
        .library(name: "Picker", targets: ["Picker"]),
        .library(name: "Instructions", targets: ["Instructions"]),
        .library(name: "Appz", targets: ["Appz"]),
        .library(name: "LaunchTimeProfiler", targets: ["LaunchTimeProfiler"]),
        .library(name: "StepCount", targets: ["StepCount"]),
        .library(name: "Speech", targets: ["Speech"]),
        .library(name: "Harbeth", targets: ["Harbeth"]),
        .library(name: "ScanQRCode", targets: ["ScanQRCode"]),
        .library(name: "Stepper", targets: ["Stepper"])
    ],
    dependencies: [],
    targets: [
        .target(name: "PTools",resources: [.process("Resources")],swiftSettings: [.define("PTOOLS_SPM")]),
        .target(name: "DataEncrypt",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_DATAENCRYPT"),.define("PTOOLS_SPM")]),
        .target(name: "Animation",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_ANIMATION"),.define("PTOOLS_SPM")]),
        .target(name: "YB_Attributed",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_YB_ATTRIBUTED"),.define("PTOOLS_SPM")]),
        .target(name: "BankCard",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_BANKCARD"),.define("PTOOLS_SPM")]),
        .target(name: "BilogyID",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_BILOGYID"),.define("PTOOLS_SPM")]),
        .target(name: "Calendar",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_CALENDAR"),.define("PTOOLS_SPM")]),
        .target(name: "Telephony",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_TELEPHONY"),.define("PTOOLS_SPM")]),
        .target(name: "CheckBox",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_CHECKBOX"),.define("PTOOLS_SPM")]),
        .target(name: "CheckDirtyWord",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_CHECKDIRTYWORD"),.define("PTOOLS_SPM")]),
        .target(name: "CodeView",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_CODEVIEW"),.define("PTOOLS_SPM")]),
        .target(name: "Country",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_COUNTRY"),.define("PTOOLS_SPM")]),
        .target(name: "DarkModeSetting",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_DARKMODESETTING"),.define("PTOOLS_SPM")]),
        .target(name: "Guide",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_GUIDE"),.define("PTOOLS_SPM")]),
        .target(name: "Input",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_INPUT"),.define("PTOOLS_SPM")]),
        .target(name: "CustomerNumberKeyboard",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_CUSTOMERNUMBERKEYBOARD"),.define("PTOOLS_SPM")]),
        .target(name: "KeyChain",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_KEYCHAIN"),.define("PTOOLS_SPM")]),
        .target(name: "CustomerLabel",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_CUSTOMERLABEL"),.define("PTOOLS_SPM")]),
        .target(name: "LanguageSetting",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_LANGUAGESETTING"),.define("PTOOLS_SPM")]),
        .target(name: "Line",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_LINE"),.define("PTOOLS_SPM")]),
        .target(name: "Loading",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_LOADING"),.define("PTOOLS_SPM")]),
        .target(name: "MediaViewer",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_MEDIAVIEWER"),.define("PTOOLS_SPM")]),
        .target(name: "Motion",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_MOTION"),.define("PTOOLS_SPM")]),
        .target(name: "PhoneInfo",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_PHONEINFO"),.define("PTOOLS_SPM")]),
        .target(name: "RateView",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_RATEVIEW"),.define("PTOOLS_SPM")]),
        .target(name: "Rotation",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_ROTATION"),.define("PTOOLS_SPM")]),
        .target(name: "ScrollBanner",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_SCROLLBANNER"),.define("PTOOLS_SPM")]),
        .target(name: "SearchBar",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_SEARCHBAR"),.define("PTOOLS_SPM")]),
        .target(name: "Segmented",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_SEGMENTED"),.define("PTOOLS_SPM")]),
        .target(name: "Slider",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_SLIDER"),.define("PTOOLS_SPM")]),
//        .target(name: "NetWork",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_NETWORK"),.define("PTOOLS_SPM")]),
        .target(name: "CheckUpdate",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_CHECKUPDATE"),.define("PTOOLS_SPM")]),
        .target(name: "Layout",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_LAYOUT"),.define("PTOOLS_SPM")]),
        .target(name: "Tabbar",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_TABBAR"),.define("PTOOLS_SPM")]),
        .target(name: "SmartScreenshot",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_SMARTSCREENSHOT"),.define("PTOOLS_SPM")]),
        .target(name: "ZipArchive",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_ZIPARCHIVE"),.define("PTOOLS_SPM")]),
        .target(name: "GCDWebServer",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_GCDWEBSERVER"),.define("PTOOLS_SPM")]),
        .target(name: "ColorPicker",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_COLORPICKER"),.define("PTOOLS_SPM")]),
        .target(name: "ImageColors",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_IMAGECOLOR"),.define("PTOOLS_SPM")]),
        .target(name: "FocusFaceImageView",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_FOCUSFACE"),.define("PTOOLS_SPM")]),
        .target(name: "PagingControl",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_PAGINGCONTROL"),.define("PTOOLS_SPM")]),
        .target(name: "ImagePicker",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_IMAGEPICKER"),.define("PTOOLS_SPM")]),
        .target(name: "Picker",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_PICKER"),.define("PTOOLS_SPM")]),
        .target(name: "Instructions",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_INSTRUCTIONS"),.define("PTOOLS_SPM")]),
        .target(name: "Appz",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_APPZ"),.define("PTOOLS_SPM")]),
        .target(name: "LaunchTimeProfiler",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_LAUNCHTIMEPROFILER"),.define("PTOOLS_SPM")]),
        .target(name: "StepCount",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_STEPCOUNT"),.define("PTOOLS_SPM")]),
        .target(name: "Speech",dependencies: [.target(name: "PTools")],swiftSettings: [.define("PTOOLS_SPEECH"),.define("PTOOLS_SPM")]),
        .target(name: "Harbeth",dependencies: [.target(name: "PTools")],swiftSettings: [.define("POOTOOLS_HARBETH"),.define("PTOOLS_SPM")]),
        .target(name: "ScanQRCode",dependencies: [.target(name: "PTools")],swiftSettings: [.define("POOTOOLS_SCANQRCODE"),.define("PTOOLS_SPM")]),
        .target(name: "Stepper",dependencies: [.target(name: "PTools")],swiftSettings: [.define("POOTOOLS_STEPPER"),.define("PTOOLS_SPM")])

    ],
    swiftLanguageVersions: [.v5]
)
