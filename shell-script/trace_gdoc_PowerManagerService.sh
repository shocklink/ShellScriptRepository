在Android中,申请"WakeLock"可以让你的进程持续执行即使手机进入睡眠模式,比较实用的是比如后台有网络功能,可以保证操作持续进行.

方法: 在操作之前加入

            PowerManager pm = (PowerManager) mContext.getSystemService(Context.POWER_SERVICE);
            wakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, Constants.TAG);
            wakeLock.acquire();

别忘了在操作完毕之后释放掉

      if (wakeLock != null) {
                wakeLock.release();
                wakeLock = null;
            }

frameworks/base/services/java/com/android/server/KeyInputQueue.java
	run()->preprocessEvent()->
frameworks/base/services/java/com/android/server/WindowManagerService.java
	preprocessEvent() ## 看這個service可不可以handle這個event

		##測試這個event可不可以pass 給user或自己處理掉 改寫action |= ACTION_POKE_USER_ACTIVITY;
		int actions = mPolicy.interceptKeyTq(event, !screenIsOff); 
		if ((actions & WindowManagerPolicy.ACTION_POKE_USER_ACTIVITY & event.keycode == KeyEvent.KEYCODE_POWER)
			mPowerManager.userActivity("force")
			設定特別flag"force"傳給PowerManagerService處理
~/building_speedy/frameworks/policies/base/phone/com/android/internal/policy/impl/PhoneWindowManager.java
	interceptKeyTq()



frameworks/base/services/java/com/android/server/PowerManagerService.java
	systemReady() // get Psensor
	SensorEventListener mProximityListener = new SensorEventListener()
			這種寫法是內嵌匿名類別(Inner Anonymous Class),看起來是Interface但其實已經衍生一個Class並改寫好其中的Method了.
			Adapter是用來轉接Interface用的,讓你可以不需要寫所有Interface的Method

			inner anonymous class 宣告方式
			new interface(){ [改寫interface method]}
			^^^^^^^^^^
			其實可以看成==>
			new anonymousClass() implement interface{ [改寫interface method]}
		onSensorChanged()
			if (timeSinceLastEvent < PROXIMITY_SENSOR_DELAY)
				mHandler.postDelayed
			else
				proximityChangedLocked(active) // active means near the trigger
					if (mProximityWakeLockCount == 0) {
						// disable sensor if we have no listeners left after proximity negative
						disableProximityLockLocked();  
					}
					
	initInThread()
		Cursor settingsCursor = null;
		settingsCursor = resolver.query(
			android 提供了一个class 来对数据库的数据进行操作----Cursor
			但是 Cursor 并不能自行构造 而只能从数据库查询而来 这就给使用带来诸多不便. 
		mSettings = new ContentQueryMap(settingsCursor
		SettingsObserver settingsObserver = new SettingsObserver();
		mSettings.addObserver(settingsObserver);//加入observer，之後若setting有變settingsObserver.update()就會自動更新
		settingsObserver.update(mSettings, null);//主動更新

		a檔案是由aidl.exe工具程式所產出的。
		首先，calInterface介面繼承了Android提供的IInterface介面，如下述程式碼：
		public interface calInterface extends android.os.

PowerManagerService這個服務本身用Stub
class PowerManagerService extends IPowerManager.Stub

public interface IPowerManager extends android.os.IInterface
	public static abstract class Stub extends android.os.Binder implements android.os.IPowerManager
		public Stub() {
			this.attachInterface(this, DESCRIPTOR);
		}
