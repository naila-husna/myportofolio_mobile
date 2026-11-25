import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(project.description),
            const SizedBox(height: 12),
            Text('Tech Stack: ${project.techStack}'),
            const SizedBox(height: 12),
            SelectableText('Project URL: ${project.projectUrl}'),
            if (project.projectImageUrl.isNotEmpty) ...[
              const SizedBox(height: 16),
              Image.network(
                project.projectImageUrl,
                errorBuilder: (context, error, stackTrace) =>
                    const Text('Gambar tidak dapat dimuat.'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
