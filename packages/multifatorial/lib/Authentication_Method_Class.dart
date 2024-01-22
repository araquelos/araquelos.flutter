class AuthenticationMethod {
  bool? CanCreateNew;
  String? Cryptography;
  String? DisplayNumber;
  int? IDAuthenticationMethod;
  int? IDAuthenticationMethodType;
  String? Key;
  String? NameAuthenticationMethodType;
  int? PassGenerationTime;
  int? PassSize;
  int? Percentual;
  String? ProjectID;
  String? Status;
  DateTime? Validity;
  String? IDMobileDevice;

  AuthenticationMethod({
    this.CanCreateNew,
    this.Cryptography,
    this.DisplayNumber,
    this.IDAuthenticationMethod,
    this.IDAuthenticationMethodType,
    this.Key,
    this.NameAuthenticationMethodType,
    this.PassGenerationTime,
    this.PassSize,
    this.Percentual,
    this.ProjectID,
    this.Status,
    this.Validity,
    this.IDMobileDevice,
  });

  AuthenticationMethod.fromJson(Map<String, dynamic> json) {
    CanCreateNew = json['CanCreateNew'] ?? '';
    Cryptography = json['Cryptography'] ?? '';
    DisplayNumber = json['DisplayNumber'] ?? '';
    IDAuthenticationMethod = json['IDAuthenticationMethod'] ?? 0;
    IDAuthenticationMethodType = json['IDAuthenticationMethodType'] ?? 0;
    Key = json['Key'] ?? '';
    NameAuthenticationMethodType = json['NameAuthenticationMethodType'] ?? '';
    PassGenerationTime = json['PassGenerationTime'] ?? 0;
    PassSize = json['PassSize'] ?? 0;
    Percentual = json['Percentual'] ?? 0;
    ProjectID = json['ProjectID'] ?? '';
    Status = json['Status'] ?? '';
    Validity = json.containsKey('Validity')
        ? DateTime.tryParse(json['Validity'])
        : null;
    IDMobileDevice = json['IDMobileDevice'] ?? '';
  }

  List<AuthenticationMethod> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => AuthenticationMethod.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CanCreateNew'] = CanCreateNew;
    data['Cryptography'] = Cryptography;
    data['DisplayNumber'] = DisplayNumber;
    data['IDAuthenticationMethod'] = IDAuthenticationMethod;
    data['IDAuthenticationMethodType'] = IDAuthenticationMethodType;
    data['Key'] = Key;
    data['NameAuthenticationMethodType'] = NameAuthenticationMethodType;
    data['PassGenerationTime'] = PassGenerationTime;
    data['PassSize'] = PassSize;
    data['Percentual'] = Percentual;
    data['ProjectID'] = ProjectID;
    data['Status'] = Status;
    data['Validity'] = Validity;
    data['IDMobileDevice'] = IDMobileDevice;
    return data;
  }
}
