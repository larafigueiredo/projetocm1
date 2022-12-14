import 'package:tp1_ex3/exceptions/unexpected_age_exception.dart';
import 'package:tp1_ex3/models/insurance.dart';
import 'package:tp1_ex3/insurances/auto_insurance.dart';
import 'package:tp1_ex3/insurances/health_insurance.dart';
import 'package:tp1_ex3/insurances/housing_insurance.dart';
import 'package:tp1_ex3/insurances/work_insurance.dart';
import 'package:tp1_ex3/models/insurer.dart';
import 'package:tp1_ex3/models/person.dart';

class Insurances {
  Map<int, Insurance> _insurances = <int, Insurance>{};

  Map<int, Insurance> get list => _insurances;
  //excepction para idade
  void add(Insurance insurance) {
    if (age(insurance.policyholder.birthDate) < 18) {
      throw UnexpectedAgeException('data/insurances.dart');
    }

    int key = getMaxKey() + 1;
    _insurances.addEntries([MapEntry(key, insurance)]);
  }

  //alterar segurado
  void updateInsured(int key, Person person) {
    _insurances[key]!.insured = person;
  }

  //alterar data fim da apólice
  void updateEndDate(int key, DateTime date) {
    _insurances[key]!.endDate = date;
  }

  //alterar dados financeiros da apólice
  void updateFinancial(int key, Insurance insurance) {
    _insurances[key]!.chargeAmount = insurance.chargeAmount;
    _insurances[key]!.insuredAmount = insurance.insuredAmount;
    _insurances[key]!.periodicity = insurance.periodicity;
  }

  //alterar dados do seguro automovel
  void updateAutoInsurance(int key, AutoInsurance insurance) {
    (_insurances[key] as AutoInsurance).licensePlate = insurance.licensePlate;
    (_insurances[key] as AutoInsurance).brand = insurance.brand;
    (_insurances[key] as AutoInsurance).model = insurance.model;
    (_insurances[key] as AutoInsurance).seatCapacity = insurance.seatCapacity;
    (_insurances[key] as AutoInsurance).carYear = insurance.carYear;
    (_insurances[key] as AutoInsurance).carValuation = insurance.carValuation;
    (_insurances[key] as AutoInsurance).driverLicenseDate =
        insurance.driverLicenseDate;
  }

  //alterar dados do seguro saude
  void updateHealthInsurance(int key, HealthInsurance insurance) {
    (_insurances[key] as HealthInsurance).diseases = insurance.diseases;
    (_insurances[key] as HealthInsurance).medicalNetwork =
        insurance.medicalNetwork;
  }

  //alterar dados do seguro habitacao
  void updateHousingInsurance(int key, HousingInsurance insurance) {
    (_insurances[key] as HousingInsurance).address = insurance.address;
    (_insurances[key] as HousingInsurance).roomsCapacity =
        insurance.roomsCapacity;
    (_insurances[key] as HousingInsurance).constructionYear =
        insurance.constructionYear;
    (_insurances[key] as HousingInsurance).houseValuation =
        insurance.houseValuation;
    (_insurances[key] as HousingInsurance).garage = insurance.garage;
  }

  //alterar dados do seguro trabalho
  void updateWorkInsurance(int key, WorkInsurance insurance) {
    (_insurances[key] as WorkInsurance).companyName = insurance.companyName;
    (_insurances[key] as WorkInsurance).address = insurance.address;
    (_insurances[key] as WorkInsurance).workType = insurance.workType;
  }

  void renew(int key) {
    _insurances[key]!.endDate = DateTime(_insurances[key]!.endDate.year + 1,
        _insurances[key]!.endDate.month, _insurances[key]!.endDate.day);
  }

  void transfer(int key, Insurer seguradora) {
    _insurances[key]!.insurer = seguradora;
  }

  void remove(int key) {
    _insurances.removeWhere((k, v) => k == key);
  }

  int getMaxKey() {
    var thevalue = 0;

    _insurances.keys.forEach((k) {
      if (k > thevalue) {
        thevalue = k;
      }
    });

    return thevalue;
  }

  int age(DateTime data) {
    DateTime hoje = DateTime.now();
    if (hoje.month < data.month ||
        (hoje.month == data.month && hoje.day < data.day)) {
      return hoje.year - data.year - 1;
    } else {
      return hoje.year - data.year;
    }
  }
}
