
# react-native-marketing-cloud

## Getting started

`$ npm install react-native-marketing-cloud --save`

### Mostly automatic installation

`$ react-native link react-native-marketing-cloud`

### Manual installation


#### iOS

##### Pre Setup
 Add the MarketingCloud SDK to the root of your project. Follow the steps here (https://salesforce-marketingcloud.github.io/MarketingCloudSDK-iOS/get-started/apple.html). And follow the steps till 5. Implement the SDK point 4.

In the AppDelegate.m before the return of *didFinishLaunchingWithOptions* add this line 

``
  BOOL success = [[MarketingCloudSDK sharedInstance] sfmc_configure:&error];
``

And in the *didRegisterForRemoteNotificationsWithDeviceToken*  do 

`
  [[MarketingCloudSDK sharedInstance] sfmc_setDeviceToken:deviceToken];
`



##### Setup

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`

2. Go to `node_modules` ➜ `react-native-marketing-cloud` and add `RNMarketingCloud.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNMarketingCloud.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<
5. You can use the Tags and Attribute to control the marketing cloud setup

#### Android

##### pre setup


Implement the SDK as per the steps here

https://salesforce-marketingcloud.github.io/JB4A-SDK-Android/sdk-implementation/implement-sdk-google.html


##### Library Setup

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



## Usage
```javascript
import RNMarketingCloud from 'react-native-marketing-cloud';

setContactKey: sets the contact key

setTag: sets the Tag returns existing tags

removeTag: removes a tag , returns existing tags

setAttributeNamed: set a key value pair attributes, returns all attributes

removeAttributeNamed: removes a key from attributes, returns all attributes
```
  