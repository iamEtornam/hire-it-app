import 'package:hire_it/job_model.dart';
import 'package:hire_it/resources/resources.dart';

class DataSource {
  DataSource._privateConstructor();

  static final DataSource _instance = DataSource._privateConstructor();

  factory DataSource() {
    return _instance;
  }

  static final List<Job> data = [
    Job(
        comapnyLogo: Images.icons8Google480,
        currency: '\$',
        deadline: DateTime.now().add(Duration(days: 15)),
        id: 1,
        isActive: true,
        jobDescription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        jobType: 'Full Time',
        location: 'West Beach California',
        positionAd: 'Graphics Designer',
        salaryRange: '\$3000 - \$4000 per month',
        skillsRequired: ['Adobe Suite', 'Figma'],
        yearsOfExperienceRange: '2-6 years'),
    Job(
        comapnyLogo: Images.icons8Amazon480,
        currency: '\$',
        deadline: DateTime.now().add(Duration(days: 15)),
        id: 2,
        isActive: true,
        jobDescription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        jobType: 'Full Time',
        location: 'West Beach California',
        positionAd: 'Cloud Engineer',
        salaryRange: '\$6000 - \$10,000 per month',
        skillsRequired: ['Docker', 'Load Balancing'],
        yearsOfExperienceRange: '3-4 years'),
    Job(
        comapnyLogo: Images.icons8AppleLogo512,
        currency: '\$',
        deadline: DateTime.now().add(Duration(days: 15)),
        id: 3,
        isActive: true,
        jobDescription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        jobType: 'Full Time',
        location: 'West Beach California',
        positionAd: 'UI/UX Designer',
        salaryRange: '\$3500 - \$5000 per month',
        skillsRequired: ['Sketch', 'Figma', 'Origami'],
        yearsOfExperienceRange: '1-3 years'),
    Job(
        comapnyLogo: Images.icons8Microsoft480,
        currency: '\$',
        deadline: DateTime.now().add(Duration(days: 15)),
        id: 4,
        isActive: true,
        jobDescription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        jobType: 'Full Time',
        location: 'West Beach California',
        positionAd: 'Developer Relations',
        salaryRange: '\$5000 - \$7000 per month',
        skillsRequired: ['MS Office', 'MS Teams'],
        yearsOfExperienceRange: '3-4 years')
  ];
}
