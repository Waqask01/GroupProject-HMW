import 'dart:io';

void main() {
  List<String> tasks = [];

  while (true) {
    print("Press 1 to add a task.");
    print("Press 2 to view tasks.");
    print("Press 3 to update a task.");
    print("Press 4 to delete a task.");
    print("Press 5 to exit.");

    String? input = stdin.readLineSync();
    switch (input) {
      case '1':
        addTask(tasks);
        break;
      case '2':
        viewTasks(tasks);
        break;
      case '3':
        updateTask(tasks);
        break;
      case '4':
        deleteTask(tasks);
        break;
      case '5':
        print("Exiting your To-Do List.");
        return;
      default:
        print("Invalid option. Please try again.");
    }
  }
}

void addTask(List<String> tasks) {
  print("Enter the task:");
  String? task = stdin.readLineSync();
  tasks.add("$task");
  print("Task added successfully!");
}

void viewTasks(List<String> tasks) {
  if (tasks.isEmpty) {
    print("No tasks in the list.");
  } else {
    print("Tasks:");
    for (var i = 0; i < tasks.length; i++) {
      print("${i + 1}. ${tasks[i]}");
    }
  }
}

void updateTask(List<String> tasks) {
  viewTasks(tasks);

  print("Enter the task number you want to update:");
  int? taskNumber = getTaskNumber(tasks.length);

  if (taskNumber == null || taskNumber == -1) {
    print("Invalid task number.");
    return;
  }

  print("Enter the updated task:");
  String updatedTask = stdin.readLineSync()!;
  tasks[taskNumber - 1] = updatedTask;
  print("Task updated successfully!");
}

void deleteTask(List<String> tasks) {
  viewTasks(tasks);

  print("Enter the task number you want to delete:");
  int? taskNumber = getTaskNumber(tasks.length);

  if (taskNumber == null || taskNumber == -1) {
    print("Invalid task number.");
    return;
  }

  tasks.removeAt(taskNumber - 1);
  print("Task deleted successfully!");
}

int? getTaskNumber(int taskCount) {
  String? input = stdin.readLineSync();
  if (input == null || input.isEmpty) return -1;
  int? taskNumber;
  try {
    taskNumber = int.parse(input);
  } catch (e) {
    taskNumber = -1;
  }
  if (taskNumber < 1 || taskNumber > taskCount) return -1;
  return taskNumber;
}
