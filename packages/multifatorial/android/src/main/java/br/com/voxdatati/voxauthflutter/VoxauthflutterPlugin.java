package br.com.voxdatati.voxauthflutter;

import android.app.Activity;
import android.os.AsyncTask;

import androidx.annotation.NonNull;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import br.com.voxdatati.voxauth.OTP.Util.CryptoAlgorithms;
import br.com.voxdatati.voxauth.SDK.AuthenticationMethod;
import br.com.voxdatati.voxauth.SDK.Callback.GetDeviceInfoCallBack;
import br.com.voxdatati.voxauth.SDK.CodReturn;
import br.com.voxdatati.voxauth.SDK.DeviceInfo;
import br.com.voxdatati.voxauth.SDK.Exception.GenericException;
import br.com.voxdatati.voxauth.SDK.Return;
import br.com.voxdatati.voxauth.SDK.SDKClient;
import br.com.voxdatati.voxauth.SDK.Transaction;


/** VoxauthflutterPlugin */
public class VoxauthflutterPlugin  implements FlutterPlugin, MethodCallHandler, ActivityAware {

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    public Activity activity;
    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "voxauthflutter");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {

    }


    public class  voxAuthFlutter {

        private SDKClient client = null;
        private Transaction transaction = new Transaction();
        private DeviceInfo info = null;
        private String WebService = "";
        private String Channel = "";
        private String Password = "";
        private String ClientId = "";
        private String DeviceName = "";

        public void   voxAuthFlutter(String webServiceUrl, String channelName, String password, String clientId, String deviceName, Result result) {

            try {
                if (client == null || WebService != webServiceUrl || ClientId != clientId || Password != password || DeviceName != deviceName) {
                    WebService = webServiceUrl;
                    ClientId = clientId;
                    Password = password;
                    DeviceName = deviceName;
                    info = null;
                    ExecutorService executor = Executors.newSingleThreadExecutor();
                    executor.execute(() -> {
                        client = new SDKClient(webServiceUrl, channelName, password, clientId, deviceName);
                        client.SyncDate();
                    });
                    executor.shutdown();
                }
               result.success("ok");

            } catch (final Exception exception) {
                    result.error("400",exception.getMessage(), exception );
            }
        }

        public void  GetDeviceInfo(Result result) {
            try {
                    if (info == null) {
                        ExecutorService executor = Executors.newSingleThreadExecutor();
                        executor.execute(() -> client.GetDeviceInfo(activity, new GetDeviceInfoCallBack() {
                            @Override
                            public void OnSuccess(DeviceInfo deviceInfo) {
                                List IMEI = Arrays.asList();
                                for (Object i : deviceInfo.IMEI) {
                                    IMEI.add(i);
                                }
                                JSONObject res = new JSONObject();
                                try {
                                    res.put("Board", deviceInfo.Board);
                                    res.put("Device", deviceInfo.Device);
                                    res.put("Brand", deviceInfo.Brand);
                                    res.put("MAC", deviceInfo.MAC);
                                    res.put("Latitude", deviceInfo.Latitude);
                                    res.put("Longitude", deviceInfo.Longitude);
                                    res.put("Model", deviceInfo.Model);
                                    res.put("NicknameDevice", deviceInfo.NicknameDevice);
                                    res.put("RegistrationAppID", deviceInfo.RegistrationAppID);
                                    res.put("SerialNumber", deviceInfo.SerialNumber);
                                    res.put("Software", deviceInfo.Software);
                                    res.put("SoftwareEmulator", deviceInfo.SoftwareEmulator);
                                    res.put("SoftwareVersion", deviceInfo.SoftwareVersion);
                                    res.put("IMEI", IMEI);
                                    res.put("SoftwareRooted", deviceInfo.SoftwareRooted);
                                    info = deviceInfo;
                                    result.success(res.toString());
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }
                            }

                            @Override
                            public void OnFail(GenericException exception) {
                                result.error("400", "notOk", exception);
                            }
                        }));
                        executor.shutdown();
                    }
                else {
                    Exception exception = new Exception("Device info has already been loaded");
                    result.error("400","Device info has already been loaded", exception);
                }
            } catch (final Exception exception) {
                result.error("400",exception.getMessage(), exception);
            }
        }

        public void GetDeviceID (Result result) {
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        String DeviceID = client.GetDeviceID(activity);
                        if (DeviceID == "ok") {
                        }
                        result.success(DeviceID);
                    } catch (final Exception exception) {
                        result.error("400", exception.getMessage(), exception);
                    }
                }
            });
            executor.shutdown();
        }

        public void SyncAuthenticationMethodsConfigs(Result result) {
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(() -> {
                try {
                    if
                    (info != null) {
                        List<AuthenticationMethod> methods = client.SyncAuthenticationMethodsConfigs(info);
                        List<JSONObject> jsonArray = new ArrayList<JSONObject>();
                        for (AuthenticationMethod authMethod : methods) {
                            String criptoString = "";
                            JSONObject jsonObject = new JSONObject();
                            if (authMethod.Cryptography != null) {
                                criptoString = authMethod.Cryptography.toString();
                            } else if (authMethod.Cryptography == null) {
                                criptoString = "";
                            }
                            jsonObject.put("NameAuthenticationMethodType", authMethod.NameAuthenticationMethodType);
                            jsonObject.put("CanCreateNew", authMethod.CanCreateNew);
                            jsonObject.put("IDAuthenticationMethod", authMethod.IDAuthenticationMethod);
                            jsonObject.put("DisplayNumber", authMethod.DisplayNumber);
                            jsonObject.put("Status", authMethod.Status);
                            jsonObject.put("Cryptography", criptoString);
                            jsonObject.put("Key", authMethod.Key);
                            jsonObject.put("PassSize", authMethod.PassSize);
                            jsonObject.put("PassGenerationTime", authMethod.PassGenerationTime);
                            jsonArray.add(jsonObject);
                        }
                        result.success(jsonArray.toString());
                    } else {
                        Exception exception = new Exception("No device info");
                        result.error("400", exception.getMessage(), exception);
                    }
                } catch (final Exception exception) {
                    result.error("400", exception.getMessage(), exception);
                }
            });
            executor.shutdown();
        }

        public void InsertMobileToken (Result result) {
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(() -> {
                try {
                    if (info != null) {
                        AuthenticationMethod method = client.InsertMobileToken(info);
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("NameAuthenticationMethodType", method.NameAuthenticationMethodType);
                        jsonObject.put("CanCreateNew", method.CanCreateNew);
                        jsonObject.put("IDAuthenticationMethod", method.IDAuthenticationMethod);
                        result.success(jsonObject.toString());
                    } else {
                        Exception exception = new Exception("No device info");
                        result.error("400", exception.getMessage(), exception);
                    }
                } catch (final Exception exception) {
                    result.error("400", exception.getMessage(), exception);
                }
            });
            executor.shutdown();
        }

        public void GetPassword (String Cryptography, String Key, int PassSize, int PassGenerationTime,Result result) {
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(() -> {
                try {
                    CryptoAlgorithms CryptographyEnum = CryptoAlgorithms.valueOf(Cryptography);
                    String token = client.GetPassword(CryptographyEnum, Key, PassSize, PassGenerationTime);
                    result.success(token);
                } catch (final Exception exception) {
                    result.error("400", exception.getMessage(), exception);
                }
            });
            executor.shutdown();
        }

        public void GetAuthenticationMethodsMobile(String transactionCode,Double transactionValue, Result result) {
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(() -> {
                try {
                    Transaction transaction = new Transaction();
                    transaction.setCode(transactionCode);
                    transaction.setDate(Calendar.getInstance().getTime());
                    transaction.setValue(transactionValue);
                    List<AuthenticationMethod> methods = client.GetAuthenticationMethodsMobile(info, transaction);
                    List<JSONObject> jsonArray = new ArrayList<JSONObject>();
                    for (AuthenticationMethod authMethod : methods) {
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("NameAuthenticationMethodType", authMethod.NameAuthenticationMethodType);
                        jsonObject.put("CanCreateNew", authMethod.CanCreateNew);
                        jsonObject.put("IDAuthenticationMethod", authMethod.IDAuthenticationMethod);
                        jsonObject.put("DisplayNumber", authMethod.DisplayNumber);
                        jsonObject.put("Status", authMethod.Status);
                        jsonArray.add(jsonObject);
                    }
                    result.success(jsonArray.toString());
                } catch (final Exception exception) {
                    result.error("400", exception.getMessage(), exception);
                }
            });
            executor.shutdown();
        }

        public void MTokenAuthentication(String transactionCode,Double transactionValue,Double IDAuthenticationMethod, String token ,Result result){
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(() -> {
                try {
                    Transaction transaction = new Transaction();
                    transaction.setCode(transactionCode);
                    transaction.setDate(Calendar.getInstance().getTime());
                    transaction.setValue(transactionValue);
                    Return TransactionReturn = client.MTokenAuthentication(transaction, IDAuthenticationMethod.longValue(), token);
                    if (TransactionReturn.CodReturn == CodReturn.SUCCESS) {
                        result.success(Integer.toString(TransactionReturn.CodReturn));
                    } else {
                        String errorMessage = TransactionReturn.MessageReturn;
                        int codRet = TransactionReturn.CodReturn; // Verificar a classe CodReturn
                        Exception exception = new Exception(errorMessage + " - " + codRet);
                        result.error("400", exception.getMessage(), exception);
                    }
                } catch (final Exception exception) {
                    result.error("400", exception.getMessage(), exception);
                }
            });
            executor.shutdown();
        }

        public void SMSAuthentication(String transactionCode, Double transactionValue, Double IDAuthenticationMethod, String telephone, Result result){
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(() -> {
                try {
                    Transaction transaction = new Transaction();
                    transaction.setCode(transactionCode);
                    transaction.setDate(Calendar.getInstance().getTime());
                    transaction.setValue(transactionValue);
                    Return SMSAuthReturn = client.SMSAuthentication(transaction, IDAuthenticationMethod.longValue(), telephone);
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("CodReturn", SMSAuthReturn.CodReturn);
                    jsonObject.put("AuthenticationSignature", SMSAuthReturn.AuthenticationSignature);
                    jsonObject.put("MessageReturn", SMSAuthReturn.MessageReturn);
                    result.success(jsonObject.toString());
                } catch (final Exception exception) {
                    result.error("400", exception.getMessage(), exception);
                }
            });
            executor.shutdown();
        }

        public void ValidateAuthentication(String token, String authenticationSignature, Result result){
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(() -> {
                try {
                    Return validateAuthReturn = client.ValidateAuthentication(authenticationSignature, token);
                    result.success(Integer.toString(validateAuthReturn.CodReturn));
                } catch (final Exception exception) {
                    result.error("400", exception.getMessage(), exception);
                }
            });
            executor.shutdown();
        }

        public void ReverseSMSAuthentication(String transactionCode, Double transactionValue, Double IDAuthenticationMethod, String telephone, Result result){
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(() -> {
                try {
                    Transaction transaction = new Transaction();
                    transaction.setCode(transactionCode);
                    transaction.setDate(Calendar.getInstance().getTime());
                    transaction.setValue(transactionValue);
                    Return SMSAuthReturn = client.ReverseSMSAuthentication(transaction, IDAuthenticationMethod.longValue(), telephone);

                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("CodReturn", SMSAuthReturn.CodReturn);
                    jsonObject.put("AuthenticationSignature", SMSAuthReturn.AuthenticationSignature);
                    jsonObject.put("MessageReturn", SMSAuthReturn.MessageReturn);
                    result.success(jsonObject.toString());

                } catch (final Exception exception) {
                    result.error("400", exception.getMessage(), exception);
                }
            });
            executor.shutdown();
        }

        public void ResponseAuthentication(String authenticationSignature, Result result){
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(() -> {
                try {
                    Return responseAuthReturn = client.ResponseAuthentication(authenticationSignature);
                    result.success(Integer.toString(responseAuthReturn.CodReturn));
                } catch (final Exception exception) {
                    result.error("400", exception.getMessage(), exception);
                }
            });
            executor.shutdown();
        }
    }

    private static voxAuthFlutter SDK;

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        }
        else if (call.method.equals("SDKClient")) {
            String webServiceUrl = call.argument("webServiceUrl");
            String channelName = call.argument("channelName");
            String password = call.argument("password");
            String clientId  = call.argument("clientId");
            String deviceName = call.argument("deviceName");
            SDK = new voxAuthFlutter();
            SDK.voxAuthFlutter(webServiceUrl,channelName, password, clientId, deviceName, result);
        }
        else if (call.method.equals("GetDeviceInfo")){
            SDK.GetDeviceInfo(result);
        }
        else if (call.method.equals("GetAuthenticationMethodsMobile")){
            String transactionCode = call.argument("transactionCode");
            Double transactionValue = call.argument("transactionValue");
            SDK.GetAuthenticationMethodsMobile(transactionCode,transactionValue,result);
        }
        else if (call.method.equals("GetDeviceID")){
            SDK = new voxAuthFlutter();
            SDK.GetDeviceID(result);
        }
        else if (call.method.equals("SyncAuthenticationMethodsConfigs")){
            SDK.SyncAuthenticationMethodsConfigs(result);
        }
        else if (call.method.equals("InsertMobileToken")) {
            SDK.InsertMobileToken(result);
        }
        else if (call.method.equals("GetPassword")){
            String Cryptography = call.argument("Cryptography");
            String Key = call.argument("Key");
            Integer PassSize = call.argument("PassSize");
            Integer PassGenerationTime  = call.argument("PassGenerationTime");
            SDK.GetPassword(Cryptography, Key, PassSize, PassGenerationTime, result);
        }
        else if (call.method.equals("MTokenAuthentication")) {
            String transactionCode = call.argument("transactionCode");
            Double transactionValue = call.argument("transactionValue");
            Double IDAuthenticationMethod = call.argument("IDAuthenticationMethod");
            String token  = call.argument("token");
            SDK.MTokenAuthentication(transactionCode, transactionValue, IDAuthenticationMethod, token, result);
        }
        else if (call.method.equals("SMSAuthentication")) {
            String transactionCode = call.argument("transactionCode");
            Double transactionValue = call.argument("transactionValue");
            Double IDAuthenticationMethod = call.argument("IDAuthenticationMethod");
            String phone  = call.argument("phone");
            SDK.SMSAuthentication(transactionCode, transactionValue, IDAuthenticationMethod, phone, result);
        }
        else if (call.method.equals("ValidateAuthentication")) {
            String token = call.argument("token");
            String authenticationSignature  = call.argument("authenticationSignature");
            SDK.ValidateAuthentication(token, authenticationSignature, result);
        }
        else if (call.method.equals("ReverseSMSAuthentication")) {
            String transactionCode = call.argument("transactionCode");
            Double transactionValue = call.argument("transactionValue");
            Double IDAuthenticationMethod = call.argument("IDAuthenticationMethod");
            String phone  = call.argument("phone");
            SDK.ReverseSMSAuthentication(transactionCode, transactionValue, IDAuthenticationMethod, phone, result);
        }
        else if (call.method.equals("ResponseAuthentication")) {
            String authenticationSignature  = call.argument("authenticationSignature");
            SDK.ResponseAuthentication(authenticationSignature, result);
        }
        else {
            result.notImplemented();
        }
    }
    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

}
