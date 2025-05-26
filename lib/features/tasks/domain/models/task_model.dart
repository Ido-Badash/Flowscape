/*

TASK OBJECT

this is what a task object is at its core

-------------------------------------------

Properties:
- id
- text
- isComplete

--------------------------------------------

Methods:
- toggleCompleteState

*/

class Task {
  final int id;
  final String text;
  final bool isComplete;

  Task({required this.id, required this.text, this.isComplete = false});

  Task copyWith({int? id, String? text, bool? isComplete}) {
    return Task(
      id: id ?? this.id,
      text: text ?? this.text,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  Task toggleCompleteState() {
    return copyWith(isComplete: !isComplete);
  }
}
