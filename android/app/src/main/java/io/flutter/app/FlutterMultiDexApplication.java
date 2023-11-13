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
import com.trilobitech.zapify.BuildConfig;

/**
 * Extension of {@link android.app.Application}, adding multidex support.
 */
public class FlutterMultiDexApplication extends Application {

  @Override
  @CallSuper
  public void onCreate() {
    super.onCreate();
  }

  @Override
  @CallSuper
  protected void attachBaseContext(Context base) {
    super.attachBaseContext(base);
    MultiDex.install(this);
  }
}
