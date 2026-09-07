# Session 02 — Student Challenge

**Project:** TaskFlow
**Time:** about 15 minutes
**Rule:** use only what we covered today. No `setState`, no packages.

Work in the numbered teaching files, not in the main app files — that
folder is the finished design and it already contains most of the answers.

---

## Where to Work

| File | What is in it |
|---|---|
| `lib/examples/session_02/05_task_model.dart` | the `Task` class and the list of tasks |
| `lib/examples/session_02/09_reusable_widget.dart` | the `TaskCard` widget |

In `lib/main.dart`, make this the active line so you can see your work:

```dart
home: const ReusableWidgetExample(),
```

---

## Required — everyone does these

### 1. Add three more tasks

Open file **05** and add three more `Task` objects to the `tasks` list.

```dart
Task(title: 'Your task', time: 'Wednesday - 4:00 PM'),
```

Hot reload.

**The point of the exercise:** you must not touch file 09 at all. If you had
to edit the UI to show a new task, `ListView.builder` is not doing its job.

### 2. Give a Task a priority, and show it

In file **05**, add a fourth field to the `Task` class:

```dart
final String priority;
```

Give it a default of `'Low'` so the tasks you already wrote keep working, then
set `'High'` or `'Medium'` on a few of them.

In file **09**, show that priority somewhere on the card — a `Text` is enough
to start with.

---

## Intermediate — if you finish early

### 3. An optional accent colour

Give `TaskCard` a colour parameter with a sensible default, and use it for the
small square at the start of the card:

```dart
final Color accent;

const TaskCard({
  super.key,
  required this.task,
  this.accent = const Color(0xFF2474D6),
});
```

Now pass a different colour to one card and leave the others alone. They
should keep the default.

> File **10** does exactly this. Try it yourself first, then compare.

### 4. A different icon when the task is done

The last task in the list has `isDone: true`. Show a tick for it and something
else for the others.

```dart
Icon(task.isDone ? Icons.check : Icons.assignment_outlined)
```

---

## Advanced — for the fast ones

### 5. An empty state

Make the screen show a message instead of the list when there are no tasks:

```dart
tasks.isEmpty ? const Text('No tasks yet') : ListView.builder(...)
```

Test it by commenting out every task in the list. Put them back afterwards.

Bonus: use the image at `assets/images/empty_tasks.png` — see file **11**.

### 6. A second screen

Make the card tappable and open a screen that shows the task's title, using
`InkWell` and `Navigator.push`. The new screen takes the `Task` through its
constructor.

> File **14** does exactly this. Try it yourself first.

---

## Expected Result

- Eight tasks on screen, and file 09 untouched for step 1.
- A priority visible on every card.
- Only one place in the whole project describes what a card looks like.

---

## If You Get Stuck

Ask yourself the question from the slide:

> **What does this widget need from outside?**

That is your parameter.

Two other things to check first:

- Red screen mentioning **overflow**? Wrap the text in `Expanded`.
- New task not appearing? Check `itemCount` — is it still `tasks.length`?
