
import { NativeModules } from 'react-native';

const { RNMarketingCloud } = NativeModules;


module.exports = {
    init: () => RNMarketingCloud.initializeSDK(),
    register:() => RNMarketingCloud.registerForNotifications(),
    setContactKey:(contactKey) => RNMarketingCloud.setContactKey(contactKey),
    setDeviceToken:(token) => RNMarketingCloud.setDeviceToken(token)
};
