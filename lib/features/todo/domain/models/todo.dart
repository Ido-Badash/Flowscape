/*

TO DO MODEL
Pure dart code
This is what a todo object is.

--------------------------------------------------------------------------------

properties:

- id
- text
- isCompleted

--------------------------------------------------------------------------------

Methods:

- toggle completion on & off

*/

class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.text,
    this.isCompleted = false, // initially, todo is incomplete
  });

  Todo toggleCompletion() {
    return copyWith(
      isCompleted: !isCompleted,
    );
  }

  Todo copyWith({
    int? id,
    String? text,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
