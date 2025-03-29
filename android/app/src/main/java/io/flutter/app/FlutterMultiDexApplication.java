// Generated file.
//
// If you wish to remove Flutter's multidex support, delete this entire file.
//
// Modifications to this file should be done in a copy under a different name
// as this file may be regenerated.

package io.flutter.app;

import android.app.Application;
import android.content.Context;
import android.provider.Settings;
import androidx.annotation.CallSuper;
import androidx.multidex.MultiDex;
import com.google.android.gms.ads.MobileAds;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.trilobitech.zapify.BuildConfig;

/**
 * Extension of {@link android.app.Application}, adding multidex support.
 */
public class FlutterMultiDexApplication extends Application {

  @Override
  @CallSuper
  public void onCreate() {
    super.onCreate();
    if (!BuildConfig.DEBUG && isInFirebaseTestLab()) {
      FirebaseAnalytics.getInstance(this).setAnalyticsCollectionEnabled(false);
    }
    MobileAds.initialize(this);
  }

  @Override
  @CallSuper
  protected void attachBaseContext(Context base) {
    super.attachBaseContext(base);
    MultiDex.install(this);
  }

  private boolean isInFirebaseTestLab() {
    return Settings.System.getString(getContentResolver(), "firebase.test.lab").equals("true");
  }
}
