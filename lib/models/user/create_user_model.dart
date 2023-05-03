import 'dart:convert';

CreateUserModel createUserModelFromJson(String str) => CreateUserModel.fromJson(json.decode(str));
String createUserModelToJson(CreateUserModel data) => json.encode(data.toJson());
class CreateUserModel {

  CreateUserModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _msg = json['msg'];
    _status = json['status']==1;
  }
  Data? _data;
  String? _msg;
  bool? _status;

  Data? get data => _data;
  String? get msg => _msg;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }
}


Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? uid, 
      String? firstName, 
      String? lastName, 
      String? createdAt, 
      dynamic kycReviewStatus, 
      dynamic kycApplicantId, 
      dynamic faOn, 
      dynamic faSecret, 
      dynamic strigaId, 
      dynamic strigaAccountRequestPaymentId, 
      dynamic eventSubCreated, 
      String? email, 
      dynamic kycLink, 
      dynamic neoCircleId, 
      dynamic loanToken, 
      dynamic tinkUID, 
      dynamic title, 
      String? dob, 
      String? phoneNumber, 
      String? zipCode, 
      String? city, 
      String? country, 
      dynamic facebook, 
      dynamic instagram, 
      dynamic twitter, 
      dynamic telegram, 
      dynamic modifiedOn, 
      String? countryCode, 
      String? address1, 
      String? address2, 
      String? state, 
      dynamic imgURL, 
      dynamic referralId, 
      dynamic referredId, 
      dynamic referredNeoCircleId, 
      dynamic currentNeodashMembership, 
      num? deleted, 
      dynamic refferedId, 
      dynamic neoxUser,}){
    _uid = uid;
    _firstName = firstName;
    _lastName = lastName;
    _createdAt = createdAt;
    _kycReviewStatus = kycReviewStatus;
    _kycApplicantId = kycApplicantId;
    _faOn = faOn;
    _faSecret = faSecret;
    _strigaId = strigaId;
    _strigaAccountRequestPaymentId = strigaAccountRequestPaymentId;
    _eventSubCreated = eventSubCreated;
    _email = email;
    _kycLink = kycLink;
    _neoCircleId = neoCircleId;
    _loanToken = loanToken;
    _tinkUID = tinkUID;
    _title = title;
    _dob = dob;
    _phoneNumber = phoneNumber;
    _zipCode = zipCode;
    _city = city;
    _country = country;
    _facebook = facebook;
    _instagram = instagram;
    _twitter = twitter;
    _telegram = telegram;
    _modifiedOn = modifiedOn;
    _countryCode = countryCode;
    _address1 = address1;
    _address2 = address2;
    _state = state;
    _imgURL = imgURL;
    _referralId = referralId;
    _referredId = referredId;
    _referredNeoCircleId = referredNeoCircleId;
    _currentNeodashMembership = currentNeodashMembership;
    _deleted = deleted;
    _refferedId = refferedId;
    _neoxUser = neoxUser;
}

  Data.fromJson(dynamic json) {
    _uid = json['uid'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _createdAt = json['createdAt'];
    _kycReviewStatus = json['kycReviewStatus'];
    _kycApplicantId = json['kycApplicantId'];
    _faOn = json['_2faOn'];
    _faSecret = json['_2faSecret'];
    _strigaId = json['striga_id'];
    _strigaAccountRequestPaymentId = json['striga_account_request_payment_id'];
    _eventSubCreated = json['eventSubCreated'];
    _email = json['email'];
    _kycLink = json['kycLink'];
    _neoCircleId = json['neoCircleId'];
    _loanToken = json['loanToken'];
    _tinkUID = json['tinkUID'];
    _title = json['title'];
    _dob = json['dob'];
    _phoneNumber = json['phoneNumber'];
    _zipCode = json['zipCode'];
    _city = json['city'];
    _country = json['country'];
    _facebook = json['facebook'];
    _instagram = json['instagram'];
    _twitter = json['twitter'];
    _telegram = json['telegram'];
    _modifiedOn = json['modifiedOn'];
    _countryCode = json['countryCode'];
    _address1 = json['address1'];
    _address2 = json['address2'];
    _state = json['state'];
    _imgURL = json['imgURL'];
    _referralId = json['referralId'];
    _referredId = json['referredId'];
    _referredNeoCircleId = json['referredNeoCircleId'];
    _currentNeodashMembership = json['currentNeodashMembership'];
    _deleted = json['deleted'];
    _refferedId = json['refferedId'];
    _neoxUser = json['neoxUser'];
  }
  num? _uid;
  String? _firstName;
  String? _lastName;
  String? _createdAt;
  dynamic _kycReviewStatus;
  dynamic _kycApplicantId;
  dynamic _faOn;
  dynamic _faSecret;
  dynamic _strigaId;
  dynamic _strigaAccountRequestPaymentId;
  dynamic _eventSubCreated;
  String? _email;
  dynamic _kycLink;
  dynamic _neoCircleId;
  dynamic _loanToken;
  dynamic _tinkUID;
  dynamic _title;
  String? _dob;
  String? _phoneNumber;
  String? _zipCode;
  String? _city;
  String? _country;
  dynamic _facebook;
  dynamic _instagram;
  dynamic _twitter;
  dynamic _telegram;
  dynamic _modifiedOn;
  String? _countryCode;
  String? _address1;
  String? _address2;
  String? _state;
  dynamic _imgURL;
  dynamic _referralId;
  dynamic _referredId;
  dynamic _referredNeoCircleId;
  dynamic _currentNeodashMembership;
  num? _deleted;
  dynamic _refferedId;
  dynamic _neoxUser;
Data copyWith({  num? uid,
  String? firstName,
  String? lastName,
  String? createdAt,
  dynamic kycReviewStatus,
  dynamic kycApplicantId,
  dynamic faOn,
  dynamic faSecret,
  dynamic strigaId,
  dynamic strigaAccountRequestPaymentId,
  dynamic eventSubCreated,
  String? email,
  dynamic kycLink,
  dynamic neoCircleId,
  dynamic loanToken,
  dynamic tinkUID,
  dynamic title,
  String? dob,
  String? phoneNumber,
  String? zipCode,
  String? city,
  String? country,
  dynamic facebook,
  dynamic instagram,
  dynamic twitter,
  dynamic telegram,
  dynamic modifiedOn,
  String? countryCode,
  String? address1,
  String? address2,
  String? state,
  dynamic imgURL,
  dynamic referralId,
  dynamic referredId,
  dynamic referredNeoCircleId,
  dynamic currentNeodashMembership,
  num? deleted,
  dynamic refferedId,
  dynamic neoxUser,
}) => Data(  uid: uid ?? _uid,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  createdAt: createdAt ?? _createdAt,
  kycReviewStatus: kycReviewStatus ?? _kycReviewStatus,
  kycApplicantId: kycApplicantId ?? _kycApplicantId,
  faOn: faOn ?? _faOn,
  faSecret: faSecret ?? _faSecret,
  strigaId: strigaId ?? _strigaId,
  strigaAccountRequestPaymentId: strigaAccountRequestPaymentId ?? _strigaAccountRequestPaymentId,
  eventSubCreated: eventSubCreated ?? _eventSubCreated,
  email: email ?? _email,
  kycLink: kycLink ?? _kycLink,
  neoCircleId: neoCircleId ?? _neoCircleId,
  loanToken: loanToken ?? _loanToken,
  tinkUID: tinkUID ?? _tinkUID,
  title: title ?? _title,
  dob: dob ?? _dob,
  phoneNumber: phoneNumber ?? _phoneNumber,
  zipCode: zipCode ?? _zipCode,
  city: city ?? _city,
  country: country ?? _country,
  facebook: facebook ?? _facebook,
  instagram: instagram ?? _instagram,
  twitter: twitter ?? _twitter,
  telegram: telegram ?? _telegram,
  modifiedOn: modifiedOn ?? _modifiedOn,
  countryCode: countryCode ?? _countryCode,
  address1: address1 ?? _address1,
  address2: address2 ?? _address2,
  state: state ?? _state,
  imgURL: imgURL ?? _imgURL,
  referralId: referralId ?? _referralId,
  referredId: referredId ?? _referredId,
  referredNeoCircleId: referredNeoCircleId ?? _referredNeoCircleId,
  currentNeodashMembership: currentNeodashMembership ?? _currentNeodashMembership,
  deleted: deleted ?? _deleted,
  refferedId: refferedId ?? _refferedId,
  neoxUser: neoxUser ?? _neoxUser,
);
  num? get uid => _uid;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get createdAt => _createdAt;
  dynamic get kycReviewStatus => _kycReviewStatus;
  dynamic get kycApplicantId => _kycApplicantId;
  dynamic get faOn => _faOn;
  dynamic get faSecret => _faSecret;
  dynamic get strigaId => _strigaId;
  dynamic get strigaAccountRequestPaymentId => _strigaAccountRequestPaymentId;
  dynamic get eventSubCreated => _eventSubCreated;
  String? get email => _email;
  dynamic get kycLink => _kycLink;
  dynamic get neoCircleId => _neoCircleId;
  dynamic get loanToken => _loanToken;
  dynamic get tinkUID => _tinkUID;
  dynamic get title => _title;
  String? get dob => _dob;
  String? get phoneNumber => _phoneNumber;
  String? get zipCode => _zipCode;
  String? get city => _city;
  String? get country => _country;
  dynamic get facebook => _facebook;
  dynamic get instagram => _instagram;
  dynamic get twitter => _twitter;
  dynamic get telegram => _telegram;
  dynamic get modifiedOn => _modifiedOn;
  String? get countryCode => _countryCode;
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get state => _state;
  dynamic get imgURL => _imgURL;
  dynamic get referralId => _referralId;
  dynamic get referredId => _referredId;
  dynamic get referredNeoCircleId => _referredNeoCircleId;
  dynamic get currentNeodashMembership => _currentNeodashMembership;
  num? get deleted => _deleted;
  dynamic get refferedId => _refferedId;
  dynamic get neoxUser => _neoxUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['createdAt'] = _createdAt;
    map['kycReviewStatus'] = _kycReviewStatus;
    map['kycApplicantId'] = _kycApplicantId;
    map['_2faOn'] = _faOn;
    map['_2faSecret'] = _faSecret;
    map['striga_id'] = _strigaId;
    map['striga_account_request_payment_id'] = _strigaAccountRequestPaymentId;
    map['eventSubCreated'] = _eventSubCreated;
    map['email'] = _email;
    map['kycLink'] = _kycLink;
    map['neoCircleId'] = _neoCircleId;
    map['loanToken'] = _loanToken;
    map['tinkUID'] = _tinkUID;
    map['title'] = _title;
    map['dob'] = _dob;
    map['phoneNumber'] = _phoneNumber;
    map['zipCode'] = _zipCode;
    map['city'] = _city;
    map['country'] = _country;
    map['facebook'] = _facebook;
    map['instagram'] = _instagram;
    map['twitter'] = _twitter;
    map['telegram'] = _telegram;
    map['modifiedOn'] = _modifiedOn;
    map['countryCode'] = _countryCode;
    map['address1'] = _address1;
    map['address2'] = _address2;
    map['state'] = _state;
    map['imgURL'] = _imgURL;
    map['referralId'] = _referralId;
    map['referredId'] = _referredId;
    map['referredNeoCircleId'] = _referredNeoCircleId;
    map['currentNeodashMembership'] = _currentNeodashMembership;
    map['deleted'] = _deleted;
    map['refferedId'] = _refferedId;
    map['neoxUser'] = _neoxUser;
    return map;
  }

}