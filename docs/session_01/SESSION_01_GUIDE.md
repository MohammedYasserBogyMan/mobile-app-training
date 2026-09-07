# Session 01 — Instructor Guide

**Course:** P1 — Mobile Development 1
**Topic:** Flutter & Dart Foundations — Building Your First UI
**Project:** TaskFlow — Simple Task Management Application
**Duration:** 180 minutes

---

## 1. Before the Session

Run these once, before the students arrive:

```bash
flutter pub get
```

```bash
flutter run
```

Checklist:

- [ ] Emulator or physical device is already running and warm.
- [ ] `flutter run` shows the TaskFlow home screen (file 08).
- [ ] Hot reload works (press `r` in the terminal, or save in the IDE).
- [ ] Editor font size increased for projector visibility.
- [ ] `lib/main.dart` open in one tab, `lib/examples/session_01/` files in others.
- [ ] Terminal / debug console visible (file 02 prints to it).

**Teaching rule for this session:** no state, no packages, no architecture.
Only the widgets listed below. If a student asks about `setState`, Provider or
Firebase — answer in one sentence and say "next session".

---

## 2. Session Timeline (180 minutes)

| Time | Min | Block | Material |
|---|---|---|---|
| 0:00 – 0:10 | 10 | Welcome and course overview | slides |
| 0:10 – 0:20 | 10 | Mobile development introduction | slides |
| 0:20 – 0:35 | 15 | Flutter introduction | slides |
| 0:35 – 1:00 | 25 | Dart review | Instructor-led Dart review |
| 1:00 – 1:15 | 15 | **Break** | — |
| 1:15 – 1:25 | 10 | Flutter project structure | the repository itself |
| 1:25 – 1:35 | 10 | Widgets and the Widget Tree | whiteboard + file 01 |
| 1:35 – 1:47 | 12 | Core widgets | files **01**, **02** |
| 1:47 – 2:10 | 23 | Layouts | files **03**, **04**, **05** |
| 2:10 – 2:20 | 10 | Expanded | file **06** |
| 2:20 – 2:40 | 20 | Live coding | files **07**, **08** |
| 2:40 – 2:50 | 10 | Student challenge | `CHALLENGE_SESSION_01.md` |
| 2:50 – 2:57 | 7 | Quiz | `QUIZ_SESSION_01.md` |
| 2:57 – 3:00 | 3 | Wrap-up and next session | — |

If you fall behind, cut **file 04 (Column)** to 3 minutes — students already
understand it from file 02 — and protect the full time for **file 06
(Expanded)**, which is the hardest concept of the session.

---

## 3. Block Notes — Before the Code

### 3.1 Mobile development introduction (10 min)

- Native (Kotlin / Swift) vs cross-platform.
- One codebase, two platforms.
- Where Flutter fits.

### 3.2 Flutter introduction (15 min)

- Flutter is a **UI toolkit**, Dart is the **language**.
- Flutter draws every pixel itself — that is why it looks the same everywhere.
- Hot reload: change code, save, see the result in under a second.
- **Everything is a widget.**

### 3.3 Dart review (25 min)

Run it in the terminal, not in the emulator:

```bash
Use the instructor-led Dart review notes for this section.
```

Walk the eight sections in order. Each one is an independent function.

| # | Section | Point to make |
|---|---|---|
| 1 | Variables | `String`, `int`, `double`, `bool`, `var` |
| 2 | `final` / `const` | `final` = set once while running, `const` = known before running |
| 3 | `List` | ordered, counting starts at **0** |
| 4 | `Map` | key / value pairs |
| 5 | Functions | return type in front, parameters in brackets |
| 6 | Named parameters | **this is the Flutter style** — spend extra time here |
| 7 | Classes / objects | class = blueprint, object = one real item |
| 8 | Null safety | `?`, `??`, `?.` |

> Sections 6 and 7 are what make `TaskCard(title: ..., date: ...)` in file 07
> feel natural later. Do not rush them.

### 3.4 Flutter project structure (10 min)

Open the repository and show:

- `pubspec.yaml` — the project's identity card and dependency list.
- `lib/` — all of our Dart code.
- `lib/main.dart` — the entry point, and the **example switch** for today.
- `lib/examples/session_01/` — the examples, numbered in teaching order.
- `android/`, `ios/` — generated platform folders, not touched today.

### 3.5 Widgets and the Widget Tree (10 min)

Draw this on the board **before** showing file 01:

```
MaterialApp
└── Scaffold
    ├── AppBar
    │   └── Text("TaskFlow")
    └── Center
        └── Text("Hello Flutter")
```

Then open `01_first_app.dart` next to it and point at each line as it maps to a
branch of the tree. This drawing is the mental model for the whole session —
refer back to it at every example.

Say it once, clearly:

> A widget is a description of a piece of UI. Widgets are nested inside each
> other, and that nesting is the widget tree.

---

## 4. Example Files — Teaching Flow

Switch examples by editing **one line** in `lib/main.dart`:

```dart
home: const TaskFlowHome(),
```

---

### Example 01 — First Flutter App

|  |  |
|---|---|
| **Concept** | `main()`, `runApp()`, `MaterialApp`, `Scaffold`, `AppBar`, `Center`, `Text` |
| **File** | `lib/examples/session_01/01_first_app.dart` |
| **Time** | 5 minutes |

**Explain**

- `main()` is where every Dart program starts.
- `runApp()` takes one widget and makes it the root of the widget tree.
- `MaterialApp` provides the theme and Material Design defaults.
- `Scaffold` provides the standard screen layout: app bar, body, buttons.
- `AppBar` is the bar at the top, `Center` centres one child, `Text` shows a string.

**Code to type live**

```dart
void main() {
  runApp(const FirstApp());
}
```

```dart
Scaffold(
  appBar: AppBar(title: const Text('TaskFlow')),
  body: const Center(child: Text('Hello Flutter')),
)
```

**Expected output**

Blue app bar titled `TaskFlow`, and `Hello Flutter` centred in the body.

**Question to ask students**

> If I delete `Center`, where does the text go, and why?

Answer: to the top-left corner — `Scaffold` does not centre anything by itself.

**Common mistake**

Forgetting `runApp()`, or passing it something that is not a widget. The app
builds but the screen stays black.

**Estimated time:** 5 minutes

---

### Example 02 — Basic Widgets

|  |  |
|---|---|
| **Concept** | `Text`, `Icon`, `ElevatedButton`, `SizedBox` |
| **File** | `lib/examples/session_01/02_basic_widgets.dart` |
| **Time** | 7 minutes |

**Explain**

- `Text` displays a string, `style:` changes how it looks.
- `Icon` draws a built-in Material icon — show the `Icons.` autocomplete live.
- `ElevatedButton` needs `onPressed:` — a **function**, not a value.
- `SizedBox` is the simplest way to create empty space.

**Code to type live**

```dart
ElevatedButton(
  onPressed: () {
    debugPrint('Button clicked');
  },
  child: const Text('Add Task'),
)
```

**Expected output**

Title, icon and button stacked vertically and centred. Tapping the button
prints `Button clicked` in the debug console — **show the console**, this is the
students' first "my code actually ran" moment.

**Question to ask students**

> The button prints a message but the screen never changes. Why not?

Answer: nothing on screen depends on a changing value yet — that is state,
next session.

**Common mistake**

Writing `onPressed: debugPrint('Button clicked')` instead of
`onPressed: () { debugPrint('Button clicked'); }`. The first version runs once
while the screen is being built, and the button then does nothing.

**Estimated time:** 7 minutes

---

### Example 03 — Row

|  |  |
|---|---|
| **Concept** | `Row`, `mainAxisAlignment`, `crossAxisAlignment` |
| **File** | `lib/examples/session_01/03_row_example.dart` |
| **Time** | 8 minutes |

**Explain**

- `Row` arranges its children **horizontally**, left to right.
- For a `Row`, the **main axis is horizontal** and the **cross axis is vertical**.
- `mainAxisAlignment` moves children left / centre / right.
- `crossAxisAlignment` moves them top / centre / bottom.
- `SizedBox(width: 8)` creates the gap between the icon and the text.

**Code to type live**

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: const [
    Icon(Icons.calendar_today, size: 20, color: Colors.blue),
    SizedBox(width: 8),
    Text('Today - 8:00 PM'),
  ],
)
```

Then change `MainAxisAlignment.center` to `.start`, `.end` and `.spaceBetween`,
hot reloading after each one.

**Expected output**

A calendar icon followed by `Today - 8:00 PM`, centred on the screen.

**Question to ask students**

> If I want three widgets underneath each other, should I use `Row` or `Column`?

**Common mistake**

Putting too many children inside a `Row`, so the content becomes wider than the
screen and Flutter shows the yellow and black overflow stripes. Mention it here,
solve it in example 06.

**Estimated time:** 8 minutes

---

### Example 04 — Column

|  |  |
|---|---|
| **Concept** | `Column`, vertical arrangement, `CrossAxisAlignment.start` |
| **File** | `lib/examples/session_01/04_column_example.dart` |
| **Time** | 5 minutes |

**Explain**

- `Column` arranges its children **vertically**, top to bottom.
- The axes are the opposite of `Row`: main axis vertical, cross axis horizontal.
- `crossAxisAlignment: CrossAxisAlignment.start` pushes everything to the left.

**Code to type live**

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    Text('Good Morning 👋'),
    SizedBox(height: 16),
    Text('Your Tasks'),
    SizedBox(height: 8),
    Text('Flutter Assignment'),
  ],
)
```

**Expected output**

Three lines of text, left aligned, with visible spacing between them.

**Question to ask students**

> I removed `crossAxisAlignment` and my text jumped to the middle. Which value
> is Flutter using by default?

Answer: `CrossAxisAlignment.center`.

**Common mistake**

Confusing `mainAxisAlignment` and `crossAxisAlignment`, because they swap
meaning between `Row` and `Column`. Repeat the rule: **the main axis always
follows the direction the widget lays out in**.

**Estimated time:** 5 minutes

---

### Example 05 — Container and Padding

|  |  |
|---|---|
| **Concept** | `Container`, `Padding`, `BoxDecoration`, `BorderRadius`, `Color` |
| **File** | `lib/examples/session_01/05_container_padding.dart` |
| **Time** | 10 minutes |

**Explain**

- `Container` is the box you decorate: colour, border, rounded corners.
- `BoxDecoration` holds the styling. **A `Container` cannot have both `color:`
  and `decoration:`** — the colour moves inside `BoxDecoration`.
- `Padding` creates space. The outer `Padding` is space around the card, the
  inner `Padding` is space around the content inside the card.
- `BorderRadius.circular(12)` rounds the corners.

**Code to type live**

Build the card from the outside in, hot reloading at every step:

```dart
Container(
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey.shade300),
  ),
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Flutter Assignment'),
        SizedBox(height: 8),
        Text('Today - 8:00 PM'),
      ],
    ),
  ),
)
```

**Expected output**

One white rounded card on the light grey background, containing the title, the
date, and a red `High Priority` badge.

**Question to ask students**

> What is the difference between the `Padding` outside the `Container` and the
> `Padding` inside it?

Answer: outside is space between the card and the screen edge, inside is space
between the card border and its content.

**Common mistake**

Setting `color:` and `decoration:` on the same `Container`. This throws an
assertion error at runtime. **Do this on purpose once** — it is a very common
error and students should learn to recognise the message.

**Estimated time:** 10 minutes

---

### Example 06 — Expanded

|  |  |
|---|---|
| **Concept** | `Expanded`, overflow inside a `Row` |
| **File** | `lib/examples/session_01/06_expanded_example.dart` |
| **Time** | 10 minutes |

**Explain**

- A `Row` gives each child exactly the width that child asks for.
- A long text asks for more width than the screen has, so it overflows.
- `Expanded` tells one child: *take all the space that is still free*.
- The text then wraps to a second line instead of overflowing.

**Code to type live — the most important demo of the session**

1. Run the file as it is — the card looks correct.
2. Delete the `Expanded(` wrapper and its closing `)`.
3. Hot reload — the yellow and black stripes appear. **Leave them on screen.**
4. Read the overflow message in the console out loud.
5. Put `Expanded` back — the title wraps to two lines.

```dart
Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text('Complete Flutter Mobile Development Assignment'),
      SizedBox(height: 4),
      Text('Today - 8:00 PM'),
    ],
  ),
)
```

**Expected output**

A card with an icon, a two-line wrapped title, and a red `High` badge keeping
its natural width on the right.

**Question to ask students**

> Why do we wrap the **text** in `Expanded` and not the badge?

Answer: the badge should stay exactly as wide as its content, and only the text
should absorb the leftover space.

**Common mistake**

Using `Expanded` outside a `Row` or `Column`. It only works inside a flex
widget — anywhere else it throws an "Incorrect use of ParentDataWidget" error.

**Estimated time:** 10 minutes

---

### Example 07 — Task Card (reusable widget)

|  |  |
|---|---|
| **Concept** | custom `StatelessWidget`, constructor parameters, widget reuse |
| **File** | `lib/examples/session_01/07_task_card.dart` |
| **Time** | 8 minutes |

**Explain**

- The card from file 05 is written **once** and used **three times**.
- The constructor parameters (`title`, `date`, `priority`, `icon`) are exactly
  the values that change from card to card.
- `required` means the value must always be given.
- The fields are `final` because a `StatelessWidget` never changes.
- Link straight back to Dart review sections 6 and 7 — this is a class with
  named parameters, nothing more.

**Code to type live**

```dart
class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.priority,
    required this.icon,
  });

  final String title;
  final String date;
  final String priority;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(/* the card from file 05 */);
  }
}
```

Then use it:

```dart
const TaskCard(
  title: 'Flutter Assignment',
  date: 'Today - 8:00 PM',
  priority: 'High',
  icon: Icons.assignment,
)
```

**Expected output**

Three cards with red, orange and green badges.

**Question to ask students**

> I want a fourth card. How many lines do I write now, compared to copying the
> whole `Container` from file 05?

**Common mistake**

Forgetting the parameter names. `TaskCard('Flutter Assignment')` does not
compile — named parameters must always be named.

> **Note:** reusable widgets are formally taught in a later session. Here it is
> a preview that keeps file 08 short. Say that out loud.

**Estimated time:** 8 minutes

---

### Example 08 — TaskFlow Home

|  |  |
|---|---|
| **Concept** | everything from 01 – 07 combined, `FloatingActionButton`, `BuildContext` |
| **File** | `lib/examples/session_01/08_taskflow_home.dart` |
| **Time** | 12 minutes |

**Explain**

- This is the screen the students will hand in.
- Walk the tree top-down: `Scaffold` → `AppBar` + `body` + `floatingActionButton`.
- `body` → `Padding` → `Column` → greeting `Row`, section title, three `TaskCard`s.
- `FloatingActionButton` is the round `+` button in the bottom right corner.
- `ScaffoldMessenger.of(context)` is the first real use of `BuildContext`:
  *context tells Flutter where we are in the tree, so the message can be shown
  on this screen.* Do not go deeper than that today.

**Code to type live**

```dart
Scaffold(
  appBar: AppBar(title: const Text('TaskFlow')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add a new task')),
      );
    },
    child: const Icon(Icons.add),
  ),
  body: /* Padding -> Column -> TaskCards */,
)
```

**Expected output**

- App bar: `TaskFlow`
- `Good Morning 👋` next to a sun icon
- `Your Tasks`, and under it `3 Tasks Today`
- Three cards: Flutter Assignment (High / red), Database Project (Medium /
  orange), UI Design Practice (Low / green)
- A blue round `+` button that shows a snackbar when tapped

**Question to ask students**

> Point at the screen: which widget is the parent of the three cards?

Answer: the `Column`.

**Common mistake**

Adding a fourth, fifth and sixth card until the `Column` runs off the bottom of
the screen — a **vertical** overflow. This file already uses
`SingleChildScrollView` to prevent it. Remove it once and show what happens.

**Estimated time:** 12 minutes

---

## 5. Wrap-Up (3 min)

Ask the class to answer in one sentence each:

1. What is a widget?
2. What is the difference between `Row` and `Column`?
3. What does `Expanded` do?

Then hand out the challenge (`CHALLENGE_SESSION_01.md`) and preview the next
session: **making the UI react — `StatefulWidget` and `setState`**.

---

## 6. Troubleshooting During Live Coding

| Symptom | Cause | Fix |
|---|---|---|
| Black screen | `runApp()` missing or `home:` empty | check `lib/main.dart` |
| Yellow / black stripes | a `Row` or `Column` is bigger than the screen | `Expanded`, or `SingleChildScrollView` |
| `Cannot provide both a color and a decoration` | `color:` and `decoration:` on one `Container` | move the colour inside `BoxDecoration` |
| `Incorrect use of ParentDataWidget` | `Expanded` not directly inside a `Row` / `Column` | remove it, or add the flex parent |
| Hot reload changes nothing | edited something outside `build()` | press `R` for a hot restart |
| Red error screen | a build error in one widget | read the **first** line of the error only |
