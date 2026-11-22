import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

// TODO: Impor drawer yang sudah dibuat sebelumnya
class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});
  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _company = "";
  String _position = "";
  String _description = "";
  String _experienceType = "Organization";
  DateTime? _startDate;
  DateTime? _endDate;

  final List<String> _experienceTypes = [
    'Organization',
    'Internship',
    'Work',
    'Volunteer',
    'Committee',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Experience')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Position ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Software Engineer Intern",
                    labelText: "Position / Role",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _position = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Position cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // === Company / Organization ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: COMPFEST",
                    labelText: "Company / Organization",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _company = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Company / Organization cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // === Experience Type ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Experience Type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _experienceType,
                  items: _experienceTypes
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _experienceType = newValue;
                      });
                    }
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Describe your responsibilities and achievements",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // === Start Date ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    _startDate == null
                        ? "Select Start Date"
                        : "Start Date: ${_startDate!.day}/${_startDate!.month}/${_startDate!.year}",
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _startDate ?? DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );

                    if (picked != null && mounted) {
                      setState(() {
                        _startDate = picked;

                        if (_endDate != null && _endDate!.isBefore(picked)) {
                          _endDate = null;
                        }
                      });
                    }
                  },
                ),
              ),

              // === end date ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    _endDate == null
                        ? "Select End Date"
                        : "End Date: ${_endDate!.day}/${_endDate!.month}/${_endDate!.year}",
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final DateTime firstAllowedDate =
                        _startDate ?? DateTime(1950);

                    final DateTime initialDate =
                        _endDate != null &&
                            !_endDate!.isBefore(firstAllowedDate)
                        ? _endDate!
                        : firstAllowedDate;

                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: firstAllowedDate,
                      lastDate: DateTime.now(),
                    );

                    if (picked != null && mounted) {
                      setState(() {
                        _endDate = picked;
                      });
                    }
                  },
                ),
              ),
              // === Save Button ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_startDate == null || _endDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select both dates!"),
                            ),
                          );
                          return;
                        }

                        if (_endDate!.isBefore(_startDate!)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "End Date cannot be earlier than Start Date!",
                              ),
                            ),
                          );
                          return;
                        }

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Experience Added!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Position: $_position'),
                                    Text('Company: $_company'),
                                    Text('Experience Type: $_experienceType'),
                                    Text('Description: $_description'),
                                    Text(
                                      'Start Date: ${_startDate!.day}/${_startDate!.month}/${_startDate!.year}',
                                    ),
                                    Text(
                                      'End Date: ${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
