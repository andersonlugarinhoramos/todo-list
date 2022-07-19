import 'package:todo_list/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list/app/services/task/task_service.dart';

class TaskController extends DefaultChangeNotifier {
  final TaskService _service;
  DateTime? _selectedDate;

  TaskController({
    required TaskService service,
  }) : _service = service;

  set selectedDate(DateTime? selectedDate) {
    resetState();
    _selectedDate = selectedDate;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  void save(String description) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      if (_selectedDate != null) {
        await _service.save(_selectedDate!, description);
        success();
      } else {
        setError('Data da task não selecionada');
      }
    } catch (e) {
      setError('Erro ao cadastrar task');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
