// To parse this JSON data, do
//
//     final jobModel = jobModelFromMap(jsonString);

import 'dart:convert';

JobModel jobModelFromMap(String str) => JobModel.fromMap(json.decode(str));

String jobModelToMap(JobModel data) => json.encode(data.toMap());

class JobModel {
    JobModel({
        required this.job,
    });

    List<Job> job;

    factory JobModel.fromMap(Map<String, dynamic> json) => JobModel(
        job: List<Job>.from(json["job"].map((x) => Job.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "job": List<dynamic>.from(job.map((x) => x.toMap())),
    };
}

class Job {
    Job({
        required this.id,
        required this.positionAd,
        required this.comapnyLogo,
        required this.salaryRange,
        required this.currency,
        required this.location,
        required this.yearsOfExperienceRange,
        required this.jobType,
        required this.jobDescription,
        required this.skillsRequired,
        required this.deadline,
        required this.isActive,
    });

    int id;
    String positionAd;
    String comapnyLogo;
    String salaryRange;
    String currency;
    String location;
    String yearsOfExperienceRange;
    String jobType;
    String jobDescription;
    List<String> skillsRequired;
    DateTime deadline;
    bool isActive;

    factory Job.fromMap(Map<String, dynamic> json) => Job(
        id: json["id"],
        positionAd: json["position_ad"],
        comapnyLogo: json["comapny_logo"],
        salaryRange: json["salary_range"],
        currency: json["currency"],
        location: json["location"],
        yearsOfExperienceRange: json["years_of_experience_range"],
        jobType: json["job_type"],
        jobDescription: json["job_description"],
        skillsRequired: List<String>.from(json["skills_required"].map((x) => x)),
        deadline: DateTime.parse(json["deadline"]),
        isActive: json["is_active"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "position_ad": positionAd,
        "comapny_logo": comapnyLogo,
        "salary_range": salaryRange,
        "currency": currency,
        "location": location,
        "years_of_experience_range": yearsOfExperienceRange,
        "job_type": jobType,
        "job_description": jobDescription,
        "skills_required": List<dynamic>.from(skillsRequired.map((x) => x)),
        "deadline": deadline.toIso8601String(),
        "is_active": isActive,
    };
}
