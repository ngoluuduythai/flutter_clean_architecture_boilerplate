build_runner: 
   dart run build_runner build --delete-conflicting-outputs

clean_and_build_android:
    flutter clean
    ./android/gradlew cleanBuildCache
    ./android/gradlew clean assembleDebug
    flutter pub get
    flutter run -t lib/main.dart  --release 

clean_and_build_ios:
    flutter clean
    rm -Rf ios/Pods
    rm ios/Podfile.lock
    rm -Rf ios/.symlinks
    rm -Rf ios/Flutter/Flutter.framework
    rm -Rf ios/Flutter/Flutter.podspec
    rm pubspec.lock
    rm ios/Runner/GeneratedPluginRegistrant.h
    rm ios/Runner/GeneratedPluginRegistrant.m
    pod repo update
    flutter pub get
    flutter build ipa -t lib/main.dart    

lint:
    cd native && cargo fmt
    dart format .

clean:
    flutter clean
    cd native && cargo clean

freezed:
  echo "mason make model_freezed_json --name <your model name> -o <your output path>"

web-run:
  flutter run -d chrome --web-renderer html --release
web-build:
  flutter build web --web-renderer html --release
web-optimizer-build: 
  flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true
  flutter pub run flutter_web_optimizer optimize --asset-base / --web-output build/web
web-skia:
  flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true
# web render auto: html for mobile and canvas for desktop  
web-auto:
  flutter build web --web-renderer auto --release    

android-build:
  flutter build apk --release
ios-impeller:
  flutter run ios —-enable-impeller
tree-shake-icons:
  flutter build apk
  cp -r build/app/intermediates/assets/release/mergeReleaseAssets/flutter_assets/fonts build/web/assets/

ci-cd:
 flutter clean
 flutter pub get
 flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true
  
junit_report:
  dart pub global activate junitreport  
  flutter test --machine | tojunit --output junit-unit-report.xml

coverage_test_report:
  flutter test --coverage 

create_splash_screen:
  dart run flutter_native_splash:create --path=flutter_native_splash.yaml

create_app_icons:
  flutter pub run flutter_launcher_icons -f  flutter_launcher_icons.yaml