class Student {
  String name;
  String email;
  String alternativeEmail;
  String curp;
  String bornDate;
  bool gender;
  String tutor;
  String degree;
  String area;
  String level;

  Student({
    required this.name,
    required this.email,
    required this.alternativeEmail,
    required this.curp,
    required this.bornDate,
    required this.gender,
    required this.tutor,
    required this.degree,
    required this.area,
    required this.level,
  });

  Student.emptyStudent({
    this.name = "",
    this.email = "",
    this.alternativeEmail = "",
    this.curp = "",
    this.bornDate = "",
    this.gender = false,
    this.tutor = "",
    this.degree = "",
    this.area = "",
    this.level = "",
  });

  void setName(String name) {
    this.name = name;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setAlternativeEmail(String alternativeEmail) {
    this.alternativeEmail = alternativeEmail;
  }

  void setCurp(String curp) {
    this.curp = curp;
  }

  void setBornDate(String bornDate) {
    this.bornDate = bornDate;
  }

  void setGender(bool gender) {
    this.gender = gender;
  }

  void setTutor(String tutor) {
    this.tutor = tutor;
  }

  void setDegree(String degree) {
    this.degree = degree;
  }

  void setArea(String area) {
    this.area = area;
  }

  void setLevel(String level) {
    this.level = level;
  }

  String getName() => name;
  String getEmail() => email;
  String getAlternativeEmail() => alternativeEmail;
  String getCurp() => curp;
  String getBornDate() => bornDate;
  bool getGender() => gender;
  String getTutor() => tutor;
  String getDegree() => degree;
  String getArea() => area;
  String getLevel() => level;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        name: json["name"],
        email: json["email"],
        alternativeEmail: json["alternativeEmail"],
        curp: json["curp"],
        bornDate: json["bornDate"],
        gender: json["gender"],
        tutor: json["tutor"],
        degree: json["degree"],
        area: json["area"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "alternativeEmail": alternativeEmail,
        "curp": curp,
        "bornDate": bornDate,
        "gender": gender,
        "tutor": tutor,
        "degree": degree,
        "area": area,
        "level": level,
      };
}
