
# react-native-marketing-cloud

## Getting started

`$ npm install react-native-marketing-cloud --save`

### Mostly automatic installation

`$ react-native link react-native-marketing-cloud`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-marketing-cloud` and add `RNMarketingCloud.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNMarketingCloud.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNMarketingCloudPackage;` to the imports at the top of the file
  - Add `new RNMarketingCloudPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-marketing-cloud'
  	project(':react-native-marketing-cloud').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-marketing-cloud/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-marketing-cloud')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNMarketingCloud.sln` in `node_modules/react-native-marketing-cloud/windows/RNMarketingCloud.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Marketing.Cloud.RNMarketingCloud;` to the usings at the top of the file
  - Add `new RNMarketingCloudPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNMarketingCloud from 'react-native-marketing-cloud';

// TODO: What to do with the module?
RNMarketingCloud;
```
  