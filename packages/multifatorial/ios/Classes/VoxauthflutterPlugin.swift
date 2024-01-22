import Flutter
import UIKit
import VoxAuth

public class VoxauthflutterPlugin: NSObject, FlutterPlugin {
    var client:VoxAuth.VOXAUTHSDKClient!;
    var transation:Transaction! = Transaction();
    var deviceInfo:DeviceInfo!;
    var WebService:String = "";
    var Channel:String = "";
    var Password:String = "";
    var ClientId:String = "";
    var DeviceName:String = "";

    func SDKClient(webServiceUrl: String, channelName: String ,password: String, clientId: String, deviceName: String, result: FlutterResult) -> Void  {
            do {
                if (client == nil || WebService != webServiceUrl || ClientId != clientId || Password != password || DeviceName != deviceName) {
                    WebService = webServiceUrl;
                    ClientId = clientId;
                    Password = password;
                    DeviceName = deviceName;
                    Channel = channelName;
                    // info = null;
                    client = VoxAuth.VOXAUTHSDKClient(webServiceUrl: webServiceUrl, channelName: channelName, password: password, clientId: clientId, nicknameDevice: deviceName);
                    //try client.syncDate();
                }else{
                    throw "SDKClient Error"
                }
                
                result("ok");
                
            } catch let error {
                result(
                        FlutterError( code: "invalidArgs",
                        message: "Erro SDKClient",
                        details: error.localizedDescription )
                )
            }
        }
    
    func GetDeviceInfo(result: FlutterResult){
           do{
               deviceInfo = try client.getDeviceInfo();
               if(deviceInfo != nil){
                   deviceInfo.set(nickname: DeviceName);
                   result("ok");
               }else{
                   throw "GetDeviceInfo Error"
               }
           } catch let error {
               result(
                       FlutterError( code: "invalidArgs",
                       message: "Erro GetDeviceInfo",
                       details: error.localizedDescription )
               )
           }
       }
    
    func GetDeviceID(result: FlutterResult){
                do{
                    let deviceID: String = try VoxAuth.VOXAUTHSDKClient.getDeviceID();
                        result(deviceID);
                } catch let error {
                    result(
                            FlutterError( code: "invalidArgs",
                            message: "Erro GetDeviceID",
                            details: error.localizedDescription )
                    )
                 }
            }
    
    func SyncAuthenticationMethodsConfigs(result: FlutterResult){
            var dictionaryMethods:Array<Any> = []
                do{
                    let methods: [AuthenticationMethod] = try client.syncAuthenticationMethodsConfigs(info: deviceInfo)
                    
                    struct STAuthenticationMethod: Codable {
                        var IDAuthenticationMethod : Int64 = 0
                        var IDAuthenticationMethodType : Int = 0
                        var NameAuthenticationMethodType : String = ""
                        var Validity : String = ""
                        var PassSize : Int = 0
                        var PassGenerationTime : Int = 0
                        var Cryptography : String = ""
                        var DisplayNumber : String = ""
                        var Key : String = ""
                        var Status : String = ""
                        var ProjectID : String = ""
                        var Percentual : UInt8 = 0
                        var CanCreateNew : Bool = false
                        var IDMobileDevice : String = ""
                    }
                    
                    for m in methods {
                        
                        let instance = STAuthenticationMethod(IDAuthenticationMethod: m.IDAuthenticationMethod, IDAuthenticationMethodType: m.IDAuthenticationMethodType, NameAuthenticationMethodType: m.NameAuthenticationMethodType, Validity: m.Validity, PassSize: Int(m.PassSize) ?? 0, PassGenerationTime: Int(m.PassGenerationTime) ?? 0, Cryptography: m.Cryptography, DisplayNumber: m.DisplayNumber, Key: m.Key, Status: m.Status, ProjectID: m.ProjectID, Percentual: m.Percentual, CanCreateNew: m.CanCreateNew, IDMobileDevice: m.IDMobileDevice)
                        
                        
                        let jsonEncoder = JSONEncoder()
                        jsonEncoder.outputFormatting = .prettyPrinted
                        let jsonData:Data = try jsonEncoder.encode(instance)
                        let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
    
                        
                        dictionaryMethods.append(json)
                        
                    }
                    	let jsonString = json(from: dictionaryMethods)!
                    result(jsonString);
                    
                } catch let error {
                    result(
                            FlutterError( code: "invalidArgs",
                            message: "Erro SyncAuthenticationMethodsConfigs",
                            details: error.localizedDescription )
                    )
                }
            }
    func json(from object:Any) -> String? {
                guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
                    return nil
                }
                return String(data: data, encoding: String.Encoding.utf8)
            }


    func InsertMobileToken(result: FlutterResult){
            do{
                let methods: AuthenticationMethod = try client.insertMobileToken(info: deviceInfo)

                
                struct STAuthenticationMethod: Codable {
                       var NameAuthenticationMethodType : String = ""
                       var CanCreateNew : Bool = false
                       var IDAuthenticationMethod : Int64 = 0
                }
                let instance = STAuthenticationMethod(NameAuthenticationMethodType: methods.NameAuthenticationMethodType,
                                 CanCreateNew: methods.CanCreateNew,
                                 IDAuthenticationMethod: methods.IDAuthenticationMethod)

                             let jsonEncoder = JSONEncoder()
                             jsonEncoder.outputFormatting = .prettyPrinted
                             let jsonData:Data = try jsonEncoder.encode(instance)
                             let jsonString =  String(data: jsonData, encoding: String.Encoding.utf8);
                            result(jsonString);

            } catch let error {
                result(
                        FlutterError( code: "invalidArgs",
                        message: "Erro InsertMobileToken",
                        details: error.localizedDescription )
                );
            }
        }
    
    func GetPassword(Cryptography:String ,Key:String ,PassSize:String ,PassGenerationTime:String , result: FlutterResult){
                do{
                    let method:AuthenticationMethod! = AuthenticationMethod()
                    method.Cryptography = Cryptography;
                    method.Key = Key;
                    method.PassSize = PassSize;
                    method.PassGenerationTime = PassGenerationTime;

                    let token:String = try client.getMobileToken(algorithm: method.getOTPAlgorithm(), secret: method.Key, size: method.PassSize, interval: method.PassGenerationTime)
                    result(token)
                } catch let error {
                    result(
                            FlutterError( code: "invalidArgs",
                            message: "Erro GetPassword",
                            details: error.localizedDescription )
                    );
                }
            }
    
    func GetAuthenticationMethodsMobile(transactionCode:String, transactionValue:Float , result: FlutterResult){
            var dictionaryMethods:Array<Any> = []
            do{
                let transation:Transaction = Transaction();
                
                transation.Code = transactionCode;
                transation.Value = Double(transactionValue);
                
                let methods: [AuthenticationMethod] = try client.getAuthenticationMethodsMobile(info: deviceInfo,transaction: transation)

                struct STAuthenticationMethod: Codable {
                    var NameAuthenticationMethodType : String = ""
                    var CanCreateNew : Bool = false
                    var IDAuthenticationMethod : Int64 = 0
                    var DisplayNumber : String = ""
                    var Status : String = ""
                }

                for m in methods {
                    let instance = STAuthenticationMethod(NameAuthenticationMethodType: m.NameAuthenticationMethodType,
                                                            CanCreateNew: m.CanCreateNew,
                                                            IDAuthenticationMethod: m.IDAuthenticationMethod,
                                                            DisplayNumber: m.DisplayNumber,
                                                            Status: m.Status)

                    let jsonEncoder = JSONEncoder()
                    jsonEncoder.outputFormatting = .prettyPrinted
                    let jsonData:Data = try jsonEncoder.encode(instance)
                    let jsonString = try JSONSerialization.jsonObject(with: jsonData, options: [])

                    dictionaryMethods.append(jsonString)

                    }
               let jsonResult = json(from: dictionaryMethods)!
                result(jsonResult);

                } catch let error {
                    result(
                            FlutterError( code: "invalidArgs",
                            message: "Erro GetAuthenticationMethodsMobile",
                            details: error.localizedDescription )
                    );
                }
        }

    
    func MTokenAuthentication(transactionCode:String, transactionValue:Float, IDAuthenticationMethod:Float, token:String, result: FlutterResult){
                do{
                    let transation:Transaction = Transaction();
                    
                    transation.Code = transactionCode;
                    
                    transation.Value = Double(transactionValue);
                    
                    let method:AuthenticationMethod! = AuthenticationMethod();
                    
                    let idInt = Int(IDAuthenticationMethod);
                    
                    let idInt64 = Int64(exactly: idInt);
                    
                    method.IDAuthenticationMethod   = idInt64!;

                    let transactionReturn = try client.MTokenAuthentication(transaction: transation, idAuthenticationMethod: method.IDAuthenticationMethod, mtoken: token)
                    
                    result(transactionReturn.CodReturn.description)

                } catch let error {
                    result(
                            FlutterError( code: "invalidArgs",
                            message: "Erro MTokenAuthentication",
                            details: error.localizedDescription )
                    );
                }
            }
    
    func SMSAuthentication(transactionCode:String, transactionValue:Float, IDAuthenticationMethod:Float, telephone:String,result: FlutterResult){
            
            struct STReturnSMS: Codable {
                var CodReturn : Int;
                var AuthenticationSignature : String;
            }
            
            do{
                let transation:Transaction = Transaction();
                
                transation.Code = transactionCode;
                
                transation.Value = Double(transactionValue);
                
                let method:AuthenticationMethod! = AuthenticationMethod();
                
                let idInt = Int(IDAuthenticationMethod);
                
                let idInt64 = Int64(exactly: idInt);
                
                method.IDAuthenticationMethod   = idInt64!;

                let transactionReturn = try client.SMSAuthentication(transaction: transation, idAuthenticationMethod: method.IDAuthenticationMethod, telephone: telephone)
                
                let returnSMS = STReturnSMS(CodReturn: transactionReturn.CodReturn ,AuthenticationSignature: transactionReturn.AuthenticationSignature )

                let jsonEncoder = JSONEncoder()
                
                jsonEncoder.outputFormatting = .prettyPrinted
                
                let jsonData: Data = try jsonEncoder.encode(returnSMS)
                
                let jsonString =  String(data: jsonData, encoding: String.Encoding.utf8);
                 result(jsonString);

            } catch let error {
                result(
                        FlutterError( code: "invalidArgs",
                        message: "Erro SMSAuthentication",
                        details: error.localizedDescription )
                );
            }
        }

    func ValidateAuthentication(token: String, authenticationSignature: String, result: FlutterResult){
            do{
                let validationReturn = try client.validateAuthentication(authSignature: authenticationSignature, passwordReceived: token )

                result(validationReturn.CodReturn.description)

            } catch let error {
                result(
                        FlutterError( code: "invalidArgs",
                        message: "Erro ValidateAuthentication",
                        details: error.localizedDescription )
                );
            }
        }
    
    func ReverseSMSAuthentication(transactionCode:String, transactionValue:Float, IDAuthenticationMethod:Float, telephone:String, result: FlutterResult){
           
           struct STReturnReverseSMS: Codable {
               var CodReturn : Int;
               var AuthenticationSignature : String;
           }
           
           do{
               let transation:Transaction = Transaction();
               
               transation.Code = transactionCode;
               
               transation.Value = Double(transactionValue);
               
               let method:AuthenticationMethod! = AuthenticationMethod();
               
               let idInt = Int(IDAuthenticationMethod);
               
               let idInt64 = Int64(exactly: idInt);
               
               method.IDAuthenticationMethod   = idInt64!;

               let transactionReturn = try client.ReverseSMSAuthentication(transaction: transation, idAuthenticationMethod: method.IDAuthenticationMethod, telephone: telephone)
               
               let returnSMS = STReturnReverseSMS(CodReturn: transactionReturn.CodReturn ,AuthenticationSignature: transactionReturn.AuthenticationSignature )

               let jsonEncoder = JSONEncoder()
               
               jsonEncoder.outputFormatting = .prettyPrinted
               
               let jsonData: Data = try jsonEncoder.encode(returnSMS)
               
               let jsonString =  String(data: jsonData, encoding: String.Encoding.utf8);
                result(jsonString);

           } catch let error {
               result(
                       FlutterError( code: "invalidArgs",
                       message: "Erro ReverseSMSAuthentication",
                       details: error.localizedDescription )
               );
           }
       }
    
    func ResponseAuthentication(authenticationSignature: String, result: FlutterResult){
            do{
                let authenticationReturn = try client.ResponseAuthentication(authSignature: authenticationSignature)

                result(authenticationReturn.CodReturn.description)

            } catch let error {
                result(
                        FlutterError( code: "invalidArgs",
                        message: "Erro ResponseAuthentication",
                        details: error.localizedDescription )
                );
            }
        }







          

    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "voxauthflutter", binaryMessenger: registrar.messenger())
    let instance = VoxauthflutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method { 
        case "SDKClient":
        if let args = call.arguments as? Dictionary<String, Any>,
           let webServiceUrl = args["webServiceUrl"] as? String,
           let password = args["password"] as? String,
           let clientId = args["clientId"] as? String,
           let deviceName = args["deviceName"] as? String,
           let channelName = args["channelName"] as? String {
            SDKClient(webServiceUrl: webServiceUrl,channelName: channelName, password: password,clientId: clientId, deviceName: deviceName,result: result);
         } else {
           result(FlutterError.init(code: "bad args", message: nil, details: nil))
         }
    case "GetDeviceInfo":
        GetDeviceInfo(result: result);
    case "GetDeviceID":
        GetDeviceID(result: result);
    case "SyncAuthenticationMethodsConfigs":
        SyncAuthenticationMethodsConfigs(result: result);
    case "InsertMobileToken":
        InsertMobileToken(result: result);
    case "GetPassword":
            if let args = call.arguments as? Dictionary<String, Any>,
               let Cryptography = args["Cryptography"] as? String,
               let PassGenerationTime = args["PassGenerationTime"] as? Int32,
               let PassSize = args["PassSize"] as? Int32,
               let Key = args["Key"] as? String
                    {
                    let auxPass:String = String(PassSize);
                    let auxTime:String = String(PassGenerationTime)
                    GetPassword(Cryptography: Cryptography, Key: Key, PassSize: auxPass, PassGenerationTime: auxTime, result: result);
                }
        
    case "GetAuthenticationMethodsMobile":
            if let args = call.arguments as? Dictionary<String, Any>,
               let transactionCode = args["transactionCode"] as? String,
               let transactionValue = args["transactionValue"] as? Float
                    {
                GetAuthenticationMethodsMobile(transactionCode: transactionCode, transactionValue: transactionValue, result: result);
                }
    case "MTokenAuthentication":
            if let args = call.arguments as? Dictionary<String, Any>,
               let transactionCode = args["transactionCode"] as? String,
               let transactionValue = args["transactionValue"] as? Float,
               let IDAuthenticationMethod = args["IDAuthenticationMethod"] as? Float,
               let token = args["token"] as? String
                    {
                MTokenAuthentication(transactionCode: transactionCode, transactionValue: transactionValue, IDAuthenticationMethod: IDAuthenticationMethod, token: token, result: result);
                }
    case "SMSAuthentication":
            if let args = call.arguments as? Dictionary<String, Any>,
               let transactionCode = args["transactionCode"] as? String,
               let transactionValue = args["transactionValue"] as? Float,
               let IDAuthenticationMethod = args["IDAuthenticationMethod"] as? Float,
               let telephone = args["phone"] as? String
                    {
                SMSAuthentication(transactionCode: transactionCode, transactionValue: transactionValue, IDAuthenticationMethod: IDAuthenticationMethod, telephone: telephone, result: result);
                }
    case "ValidateAuthentication":
            if let args = call.arguments as? Dictionary<String, Any>,
               let token = args["token"] as? String,
               let authenticationSignature = args["authenticationSignature"] as? String
                    {
                ValidateAuthentication(token: token, authenticationSignature: authenticationSignature, result: result);
                }
        
    case "ReverseSMSAuthentication":
            if let args = call.arguments as? Dictionary<String, Any>,
               let transactionCode = args["transactionCode"] as? String,
               let transactionValue = args["transactionValue"] as? Float,
               let IDAuthenticationMethod = args["IDAuthenticationMethod"] as? Float,
               let telephone = args["phone"] as? String
                    {
                ReverseSMSAuthentication(transactionCode: transactionCode, transactionValue: transactionValue, IDAuthenticationMethod: IDAuthenticationMethod, telephone: telephone, result: result);
                }
    case "ResponseAuthentication":
            if let args = call.arguments as? Dictionary<String, Any>,
               let authenticationSignature = args["authenticationSignature"] as? String
                    {
                ResponseAuthentication(authenticationSignature: authenticationSignature, result: result);
                }

        
    default:
            result("iOS " + UIDevice.current.systemVersion) 
    }
  }
}
	
