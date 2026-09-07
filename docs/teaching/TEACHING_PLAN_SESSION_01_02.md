# Teaching Plan: Sessions 1-2 Catch-Up Recording

This recording builds one evolving Arabic TaskFlow application from a clean Flutter project to the end-of-Session-2 implementation.

Important structure:

- `lib/examples/session_01/` and `lib/examples/session_02/` are isolated concept examples for students to inspect.
- `lib/` is the real evolving TaskFlow application.
- Do not create a separate full app for every session.
- Do not live-code every styling detail. Use the final app as the visual reference and copy styling when needed.

Final app reference files:

- `lib/screens/tasks_screen.dart`
- `lib/screens/task_details_screen.dart`
- `lib/widgets/task_card.dart`
- `lib/models/task.dart`

Recommended example files to show briefly:

- `lib/examples/session_01/01_first_app.dart` for `main`, `runApp`, `MaterialApp`, `Scaffold`.
- `lib/examples/session_01/04_column_example.dart` for vertical layout.
- `lib/examples/session_01/06_expanded_example.dart` for fixing row overflow.
- `lib/examples/session_01/08_taskflow_home.dart` for the static UI foundation.
- `lib/examples/session_02/05_task_model.dart` for data separated from UI.
- `lib/examples/session_02/07_list_view_builder.dart` for `ListView.builder`.
- `lib/examples/session_02/09_reusable_widget.dart` for extracting `TaskCard`.
- `lib/examples/session_02/14_passing_data.dart` for constructor data passing.

## Step 1. `flutter create taskflow`

**Goal:** Start from a normal Flutter project.

**What I say to students:** "We begin like any Flutter app. The generated folders are platform support; most of our work will happen in `lib/`."

**Exact file being edited:** None yet.

**Exact concept being taught:** Flutter project creation and project structure.

**Minimal code I type live:**

```bash
flutter create taskflow
cd taskflow
flutter run
```

**Styling/code I should NOT type live:** None.

**Expected result:** The default Flutter counter app runs.

**Common mistake:** Editing generated Android or web files instead of `lib/main.dart`.

**Transition sentence to next step:** "Now that Flutter gave us a working app, we will remove the demo and write our own root."

## Step 2. Clean `main.dart`

**Goal:** Remove the counter app noise.

**What I say to students:** "`main.dart` is the front door of the app. We want it small enough that we can understand the whole startup path."

**Exact file being edited:** `lib/main.dart`

**Exact concept being taught:** Entry point, root widget, deleting generated sample code.

**Minimal code I type live:**

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TaskFlowApp());
}

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

**Styling/code I should NOT type live:** Theme details and RTL builder.

**Expected result:** The app compiles but only shows a placeholder.

**Common mistake:** Forgetting `runApp` or returning something that is not a widget.

**Transition sentence to next step:** "The placeholder proves our root works; now we replace it with a Material app."

## Step 3. `MaterialApp`

**Goal:** Add the Flutter Material application shell.

**What I say to students:** "`MaterialApp` gives us Material defaults: navigation, colors, fonts, and screen structure support."

**Exact file being edited:** `lib/main.dart`

**Exact concept being taught:** `MaterialApp`, app title, home screen.

**Minimal code I type live:**

```dart
return const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Placeholder(),
);
```

**Styling/code I should NOT type live:** Full `ThemeData`, `ColorScheme.fromSeed`, `splashFactory`, and root `Directionality`. Copy those from the final reference after students understand the root.

**Expected result:** A Material app with no debug banner.

**Common mistake:** Putting screen UI directly in `main()` instead of inside a widget.

**Transition sentence to next step:** "Instead of leaving the home as a placeholder, we will give the app its first real screen."

## Step 4. Create `TasksScreen`

**Goal:** Separate app startup from the home screen UI.

**What I say to students:** "`main.dart` starts the app. `TasksScreen` describes the first screen. Keeping them separate makes the project easier to read."

**Exact file being edited:** `lib/screens/tasks_screen.dart`, then `lib/main.dart`

**Exact concept being taught:** Creating a screen widget and importing it.

**Minimal code I type live:**

```dart
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

```dart
home: const TasksScreen(),
```

**Styling/code I should NOT type live:** Folder creation can be prepared. Final screen padding and colors can come later.

**Expected result:** The app still shows a placeholder, but now through `TasksScreen`.

**Common mistake:** Forgetting the import in `main.dart`.

**Transition sentence to next step:** "A screen normally starts with `Scaffold`, so let us add the screen structure."

## Step 5. `Scaffold`

**Goal:** Create the page structure.

**What I say to students:** "`Scaffold` is the standard Material screen container. It gives us a place for the body and later buttons or bars."

**Exact file being edited:** `lib/screens/tasks_screen.dart`

**Exact concept being taught:** `Scaffold` and `body`.

**Minimal code I type live:**

```dart
return const Scaffold(
  body: Center(
    child: Text('TaskFlow'),
  ),
);
```

**Styling/code I should NOT type live:** Background color and complete visual layout.

**Expected result:** `TaskFlow` appears on screen.

**Common mistake:** Expecting `Scaffold` to add spacing automatically.

**Transition sentence to next step:** "On phones, the system status bar can cover content, so we protect the body with `SafeArea`."

## Step 6. `SafeArea`

**Goal:** Keep content away from system UI.

**What I say to students:** "`SafeArea` keeps our screen content inside the visible safe part of the phone."

**Exact file being edited:** `lib/screens/tasks_screen.dart`

**Exact concept being taught:** Wrapping widgets.

**Minimal code I type live:**

```dart
return const Scaffold(
  body: SafeArea(
    child: Text('TaskFlow'),
  ),
);
```

**Styling/code I should NOT type live:** None beyond final spacing.

**Expected result:** Text appears below the status bar.

**Common mistake:** Placing `SafeArea` outside `MaterialApp` instead of inside the screen.

**Transition sentence to next step:** "SafeArea protects the screen edge; `Padding` gives us our own design spacing."

## Step 7. `Padding`

**Goal:** Add screen spacing.

**What I say to students:** "`Padding` creates empty space around its child. We use it so the UI does not touch the screen edges."

**Exact file being edited:** `lib/screens/tasks_screen.dart`

**Exact concept being taught:** Outer spacing.

**Minimal code I type live:**

```dart
body: const SafeArea(
  child: Padding(
    padding: EdgeInsets.all(20),
    child: Text('TaskFlow'),
  ),
),
```

**Styling/code I should NOT type live:** Exact final `fromLTRB` values can be copied from the reference.

**Expected result:** Text has visible space around it.

**Common mistake:** Confusing margin with padding. In Flutter, `Padding` is its own widget.

**Transition sentence to next step:** "Now we need more than one widget vertically, so we use a `Column`."

## Step 8. `Column`

**Goal:** Stack the home screen content vertically.

**What I say to students:** "`Column` puts widgets under each other. This is the main layout for our home screen."

**Exact file being edited:** `lib/screens/tasks_screen.dart`

**Exact concept being taught:** Vertical layout and `children`.

**Minimal code I type live:**

```dart
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    Text('TaskFlow'),
    SizedBox(height: 12),
    Text('مهامك'),
  ],
),
```

**Styling/code I should NOT type live:** Full typography.

**Expected result:** Brand and title appear as two vertical text lines.

**Common mistake:** Forgetting `children: []`.

**Transition sentence to next step:** "These texts are the first part of the approved TaskFlow design, so we will make them look like the final app."

## Step 9. Add TaskFlow Brand/Title

**Goal:** Add the visible Arabic home header.

**What I say to students:** "The UI is still simple widgets; styling just changes how the same widgets look."

**Exact file being edited:** `lib/screens/tasks_screen.dart`

**Exact concept being taught:** `Text`, `TextStyle`, `SizedBox`.

**Minimal code I type live:**

```dart
const Text('TaskFlow'),
const SizedBox(height: 12),
const Text('مهامك'),
```

**Styling/code I should NOT type live:** Copy final `TextStyle` values from the reference instead of typing every font size and color slowly.

**Expected result:** The top of the app resembles the final Arabic TaskFlow screen.

**Common mistake:** Spending too much time tweaking numbers during a concept lesson.

**Transition sentence to next step:** "A task is just a visual card, so let us build one by hand first."

## Step 10. Build ONE Simple Static Task Card

**Goal:** Create one visible task card before introducing data models.

**What I say to students:** "Before we make the app smart, we make one piece of UI clear. One card is enough to understand the layout."

**Exact file being edited:** `lib/screens/tasks_screen.dart`

**Exact concept being taught:** `Container`, `Row`, `Expanded`, `Text`, `Icon`, `SizedBox`.

**Minimal code I type live:**

```dart
Container(
  padding: const EdgeInsets.all(12),
  color: Colors.white,
  child: const Row(
    children: [
      Icon(Icons.check),
      SizedBox(width: 12),
      Expanded(
        child: Text('واجب فلاتر'),
      ),
      Text('عالية'),
    ],
  ),
)
```

**Styling/code I should NOT type live:** Rounded corners, borders, shadows, exact badge colors, exact status square styling.

**Expected result:** One rough card appears.

**Common mistake:** Leaving out `Expanded` and causing long Arabic text to overflow.

**Transition sentence to next step:** "One card works. Now let us add more tasks the naive way and see the problem."

## Step 11. Duplicate It To Show The Repetition Problem

**Goal:** Make repetition visible before solving it.

**What I say to students:** "Copy-paste works for three cards, but it is a bad habit. If the design changes, we edit the same layout many times."

**Exact file being edited:** `lib/screens/tasks_screen.dart`

**Exact concept being taught:** Recognizing duplicated UI.

**Minimal code I type live:**

```dart
// Duplicate the same card two more times,
// changing only the title, date, and priority.
```

**Styling/code I should NOT type live:** Do not polish all three copies.

**Expected result:** Three static cards appear, but the file becomes repetitive.

**Common mistake:** Students think copy-paste is the final solution because the screen looks correct.

**Transition sentence to next step:** "The values change, but the shape stays the same. That means we need data."

## Step 12. Create Task Model

**Goal:** Move task values into a simple Dart class.

**What I say to students:** "A class describes one task. The UI should read from a task instead of hiding text inside widgets."

**Exact file being edited:** `lib/models/task.dart`

**Exact concept being taught:** Class, constructor, final fields, `String`, `bool`.

**Minimal code I type live:**

```dart
class Task {
  const Task({
    required this.title,
    required this.description,
    required this.date,
    required this.priority,
    required this.status,
    this.isCompleted = false,
  });

  final String title;
  final String description;
  final String date;
  final String priority;
  final String status;
  final bool isCompleted;
}
```

**Styling/code I should NOT type live:** None.

**Expected result:** No visual change yet; the data type exists.

**Common mistake:** Expecting a model file to display something by itself.

**Transition sentence to next step:** "A class describes one task; now we create a list of actual tasks."

## Step 13. Create Hard-Coded `List<Task>`

**Goal:** Create the fixed Session 2 data source.

**What I say to students:** "For now the list is written in code. Later, data may come from storage or the internet, but the screen can still read it the same way."

**Exact file being edited:** `lib/models/task.dart`

**Exact concept being taught:** `List`, objects, named parameters.

**Minimal code I type live:**

```dart
const List<Task> tasks = [
  Task(
    title: 'واجب فلاتر',
    description: 'ابن أول شاشة في TaskFlow.',
    date: 'اليوم - ٨:٠٠ م',
    priority: 'عالية',
    status: 'نشطة',
  ),
];
```

**Styling/code I should NOT type live:** Full six-task list can be pasted from the final reference.

**Expected result:** Still no visual change until the screen reads the list.

**Common mistake:** Missing commas between objects.

**Transition sentence to next step:** "Now that tasks are in a list, Flutter can build cards from the list."

## Step 14. Replace Static Cards Using `ListView.builder`

**Goal:** Generate task cards from data instead of copy-paste.

**What I say to students:** "`ListView.builder` repeats one design for every item in a list."

**Exact file being edited:** `lib/screens/tasks_screen.dart`

**Exact concept being taught:** `ListView.builder`, `itemCount`, `itemBuilder`, `index`.

**Minimal code I type live:**

```dart
Expanded(
  child: ListView.builder(
    itemCount: tasks.length,
    itemBuilder: (context, index) {
      final Task task = tasks[index];

      return Text(task.title);
    },
  ),
)
```

**Styling/code I should NOT type live:** Final `TaskCard` styling.

**Expected result:** All task titles appear from the list.

**Common mistake:** Forgetting `Expanded` when placing `ListView.builder` inside a `Column`.

**Transition sentence to next step:** "Text proves the list works. Now we move the card design into one reusable widget."

## Step 15. Extract Reusable `TaskCard`

**Goal:** Create one widget that knows how to display one task.

**What I say to students:** "A reusable widget has inputs and a `build` method. `TaskCard` receives one `Task` and draws it."

**Exact file being edited:** `lib/widgets/task_card.dart`, then `lib/screens/tasks_screen.dart`

**Exact concept being taught:** Custom widget, constructor parameter, reuse.

**Minimal code I type live:**

```dart
class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Text(task.title);
  }
}
```

```dart
return TaskCard(task: task);
```

**Styling/code I should NOT type live:** Full card layout, `_StatusBox`, priority badge colors, shadows, exact spacing.

**Expected result:** The screen still shows all tasks, now through `TaskCard`.

**Common mistake:** Trying to pass a list into `TaskCard`; each card receives one `Task`.

**Transition sentence to next step:** "Now that every card is a widget, we can make the whole card respond to a tap."

## Step 16. Add Card Tap

**Goal:** Make task cards clickable.

**What I say to students:** "`onTap` is a function that runs when the user taps the card."

**Exact file being edited:** `lib/widgets/task_card.dart`, `lib/screens/tasks_screen.dart`

**Exact concept being taught:** Callback parameter, `InkWell`, function passed from parent.

**Minimal code I type live:**

```dart
const TaskCard({
  super.key,
  required this.task,
  required this.onTap,
});

final Task task;
final VoidCallback onTap;
```

```dart
InkWell(
  onTap: onTap,
  child: /* card UI */,
)
```

**Styling/code I should NOT type live:** `Material` wrapper and ripple polish can be copied from the final reference.

**Expected result:** Card accepts an `onTap`, even before navigation is added.

**Common mistake:** Writing `onTap: onTap()` instead of `onTap: onTap`.

**Transition sentence to next step:** "A tap needs somewhere to go, so we create the details screen."

## Step 17. Create `TaskDetailsScreen`

**Goal:** Add the second screen.

**What I say to students:** "A screen is just another widget. Nothing magical changes because it fills the page."

**Exact file being edited:** `lib/screens/task_details_screen.dart`

**Exact concept being taught:** Creating another `StatelessWidget` screen.

**Minimal code I type live:**

```dart
class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('تفاصيل المهمة')),
    );
  }
}
```

**Styling/code I should NOT type live:** Final details layout and buttons.

**Expected result:** The screen file exists, but is not opened yet.

**Common mistake:** Creating the file but never importing or navigating to it.

**Transition sentence to next step:** "Now we connect the card tap to this new screen."

## Step 18. Add `Navigator.push`

**Goal:** Open details screen from a task card.

**What I say to students:** "`Navigator.push` puts a new screen on top of the current screen."

**Exact file being edited:** `lib/screens/tasks_screen.dart`

**Exact concept being taught:** Simple navigation stack.

**Minimal code I type live:**

```dart
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const TaskDetailsScreen(),
    ),
  );
},
```

**Styling/code I should NOT type live:** Custom back button styling.

**Expected result:** Tapping any card opens the same details placeholder.

**Common mistake:** Forgetting `MaterialPageRoute`.

**Transition sentence to next step:** "Every card opens the same screen now. The next step is sending the selected task."

## Step 19. Pass Selected Task Through Constructor

**Goal:** Send the tapped task to the details screen.

**What I say to students:** "Passing data to a screen is the same as passing data to any widget: use the constructor."

**Exact file being edited:** `lib/screens/task_details_screen.dart`, `lib/screens/tasks_screen.dart`

**Exact concept being taught:** Constructor data passing.

**Minimal code I type live:**

```dart
class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.task});

  final Task task;
}
```

```dart
builder: (context) => TaskDetailsScreen(task: task),
```

**Styling/code I should NOT type live:** Details card styling.

**Expected result:** Details screen now has access to the selected task.

**Common mistake:** Passing `tasks[0]` instead of the current `task` from `tasks[index]`.

**Transition sentence to next step:** "Now we use the task fields instead of fixed text."

## Step 20. Display Selected Task Data

**Goal:** Show task fields on the details screen.

**What I say to students:** "The details screen is reusable because it displays whatever `Task` it receives."

**Exact file being edited:** `lib/screens/task_details_screen.dart`

**Exact concept being taught:** Reading object fields in UI.

**Minimal code I type live:**

```dart
Text(task.title),
Text(task.description),
Text(task.priority),
Text(task.date),
Text(task.status),
```

**Styling/code I should NOT type live:** The final information card layout, badge styling, and button styles.

**Expected result:** Tapping different cards shows different details.

**Common mistake:** Using hard-coded text on the details screen, which hides whether data passing works.

**Transition sentence to next step:** "The logic is finished. Now we apply the approved visual design without turning styling into the main lesson."

## Step 21. Apply The Existing Final UI Styling

**Goal:** Preserve the approved Arabic TaskFlow design.

**What I say to students:** "At this point, the important behavior is already built. The remaining code makes it match the design."

**Exact file being edited:** `lib/screens/tasks_screen.dart`, `lib/widgets/task_card.dart`, `lib/screens/task_details_screen.dart`, `lib/main.dart`

**Exact concept being taught:** Styling as polish, not new architecture.

**Minimal code I type live:**

```dart
color: const Color(0xFF2474D6)
```

```dart
backgroundColor: const Color(0xFFF3F6FA)
```

**Styling/code I should NOT type live:** Most of this step should be copied from the reference: `TextStyle`, `BoxDecoration`, shadows, filter chips, status box, priority badge, details information card, outlined edit button, blue complete button, root RTL builder.

**Expected result:** The app visually matches the current Arabic TaskFlow reference.

**Common mistake:** Letting styling edits distract from the Session 2 concepts.

**Transition sentence to next step:** "Now we review what we built and name the concepts that belong to the next session."

## Step 22. Final Review

**Goal:** Summarize the Session 1 and Session 2 endpoint.

**What I say to students:** "Session 1 gave us static UI. Session 2 gave us data, repeated lists, reusable cards, navigation, and passing data between screens."

**Exact file being edited:** None.

**Exact concept being taught:** Connecting the learning path.

**Minimal code I type live:** None.

**Styling/code I should NOT type live:** None.

**Expected result:** Students understand the app flow: list of tasks -> tap one task -> details screen receives that task.

**Common mistake:** Students ask why filter/edit/complete do nothing. Answer: these need state, and state is Session 3.

**Transition sentence to next step:** "In Session 3, we will make these static controls actually change the screen."
