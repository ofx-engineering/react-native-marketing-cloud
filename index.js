
import { NativeModules } from 'react-native';

const { RNMarketingCloud } = NativeModules;


module.exports = {
    setContactKey: (contactKey) => RNMarketingCloud.setContactKey(contactKey),
    setTag: (tag) => RNMarketingCloud.setTag(tag),
    removeTag: (tag) => RNMarketingCloud.removeTag(tag),
    setAttributeNamed: (name,value) => RNMarketingCloud.setAttributeNamed(name, value),
    removeAttributeNamed: (name) => RNMarketingCloud.removeAttributeNamed(name),
};
