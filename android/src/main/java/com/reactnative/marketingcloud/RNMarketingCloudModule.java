
package com.reactnative.marketingcloud;

import android.util.Log;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.salesforce.marketingcloud.MarketingCloudSdk;
import com.salesforce.marketingcloud.registration.RegistrationManager;

import java.util.Map;
import java.util.Set;

public class RNMarketingCloudModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNMarketingCloudModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNMarketingCloud";
  }

  @ReactMethod
  public void setContactKey(final String contactKey, Promise promise){
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override public void ready(MarketingCloudSdk sdk) {
        RegistrationManager registrationManager = sdk.getRegistrationManager();

        // Set contact key
        registrationManager
                .edit()
                .setContactKey(contactKey)
                .commit();

        // Get contact key
        String mcContact = registrationManager.getContactKey();

        Log.d("RNMarketingCloud", "Setting the contact as "+ mcContact);
      }
    });

    promise.resolve("true");

  }

  @ReactMethod
  public void setTag(final String tag, Promise promise){

      final Set<String>[] tags = new Set[0];
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override public void ready(MarketingCloudSdk sdk) {
        RegistrationManager registrationManager = sdk.getRegistrationManager();

        // Set contact key
        registrationManager
                .edit()
                .addTag(tag)
                .commit();

        // Get contact key
          tags[0] = registrationManager.getTags();

          Log.d("RNMarketingCloud", "Tags "+ tags[0]);
      }

    });
      promise.resolve(tags[0]);


  }

  @ReactMethod
  public void removeTag(final String tag, Promise promise){

    final Set<String>[] tags = new Set[0];
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {

      @Override public void ready(MarketingCloudSdk sdk) {
        RegistrationManager registrationManager = sdk.getRegistrationManager();

        // Set contact key
        registrationManager
                .edit()
                .removeTag(tag)
                .commit();

        // Get contact key
        tags[0] = registrationManager.getTags();

        Log.d("RNMarketingCloud", "Tags "+ tags[0]);
      }

    });
    promise.resolve(tags[0]);


  }

    @ReactMethod
    public void setAttributeNamed(final String name,final String value, final Promise promise){

        MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {

            @Override public void ready(MarketingCloudSdk sdk) {
                RegistrationManager registrationManager = sdk.getRegistrationManager();

                // Set contact key
                registrationManager
                        .edit()
                        .setAttribute(name, value)
                        .commit();

                // Get contact key

                Log.d("RNMarketingCloud", "Attributes "+ registrationManager.getAttributes());
                promise.resolve(registrationManager.getAttributes());
            }

        });
    }

    @ReactMethod
    public void removeAttributeNamed(final String name, final Promise promise){

        MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {

            @Override public void ready(MarketingCloudSdk sdk) {
                RegistrationManager registrationManager = sdk.getRegistrationManager();

                // Set contact key
                registrationManager
                        .edit()
                        .clearAttribute(name)
                        .commit();

                Log.d("RNMarketingCloud", "Attributes "+ registrationManager.getAttributes());
                promise.resolve(registrationManager.getAttributes());
            }

        });
    }
}