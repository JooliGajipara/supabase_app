import 'package:flutter/material.dart';

import '../model/EmployeeModel.dart';

class CommonListTile extends StatelessWidget {
  final EmployeeModel? employeeModel;
  final VoidCallback onPressedDelete;
  final VoidCallback onPressedEdit;

  const CommonListTile(
      {Key? key,
      required this.employeeModel,
      required this.onPressedDelete,
      required this.onPressedEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ExpansionTile(
          expandedAlignment: Alignment.centerLeft,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: const EdgeInsets.symmetric(horizontal: 15),
          title: Text(
            employeeModel?.employee?.empName ?? '',
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            commonRichText(
                titleKey: 'Employee Email',
                title: employeeModel?.employee?.empEmail),
            commonRichText(
                titleKey: 'Employee Phone',
                title: employeeModel?.employee?.empMobile),
            commonRichText(
                titleKey: 'Employee Address',
                title: employeeModel?.employee?.empAddress),
            commonRichText(
                titleKey: 'Employee Salary',
                title: '${employeeModel?.employee?.empSalary}/-'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    padding: const EdgeInsets.all(4),
                    onPressed: onPressedEdit,
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    padding: const EdgeInsets.all(4),
                    onPressed: onPressedDelete,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget commonRichText({String? titleKey, String? title}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: titleKey,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(
              text: ': ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: title),
          ],
        ),
      ),
    );
  }
}
