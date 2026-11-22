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

  String _title = "";
  String _position = "";
  String _description = "";
  String _experienceType = "Full-Time";
  DateTime? _endDate;

  final List<String> _experienceTypes = [
    'Internship',
    'Research',
    'Volunteer',
    'Part-Time',
    'Full-Time',
    'Freelance',
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
                    labelText: "Position / Role (Optional)",
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
                    if (value != null && value.length > 255) {
                      return "Position cannot exceed 255 characters!";
                    }
                    return null;
                  },
                ),
              ),

              // === Experience Title ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Internship at Google",
                    labelText: "Experience Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _title = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Experience title cannot be empty!";
                    }
                    if (value.length > 255) {
                      return "Title cannot exceed 255 characters!";
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

              // === End Date ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    _endDate == null
                        ? "End Date (Optional)"
                        : "End Date: ${_endDate!.day}/${_endDate!.month}/${_endDate!.year}",
                  ),
                  subtitle: Text(_endDate == null ? "Present / Ongoing" : ""),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _endDate ?? DateTime.now(),
                      firstDate: DateTime(1950),
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
              if (_endDate != null)
                TextButton(
                  onPressed: () {
                    setState(() {
                      _endDate = null;
                    });
                  },
                  child: const Text("Clear End Date"),
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
                                    Text('Title: $_title'),
                                    Text('Experience Type: $_experienceType'),
                                    Text('Description: $_description'),
                                    Text(
                                      _endDate == null
                                          ? 'End Date: Present'
                                          : 'End Date: ${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
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
