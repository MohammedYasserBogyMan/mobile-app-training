# Session 02 — Instructor Guide

**Course:** P1 — Mobile Development 1
**Topic:** UI, Lists, Reusable Widgets & Navigation
**Project:** TaskFlow — Simple Task Management Application
**Duration:** 180 minutes
**Tagline:** *Turning a screen into an application.*

---

## 1. Before the Session

```bash
flutter pub get
```

```bash
flutter run
```

Checklist:

- [ ] Emulator or device warm, `flutter run` shows the task list (screen 02).
- [ ] Hot reload works.
- [ ] `lib/main.dart` open in one tab, `lib/examples/session_02/` files in others.
- [ ] The session 1 home screen (`08_taskflow_home.dart`) open too — you will
      point at its three copy-pasted cards in the first five minutes.
- [ ] Editor font size increased for the projector.

**Teaching rule for this session:** still no state. No `setState`, no
packages, no architecture. If a student asks why the checkbox does nothing —
that is the last slide, and it is the door into session 3.

---

## 2. Where We Left Off

Open `lib/examples/session_01/08_taskflow_home.dart` and name the four problems out
loud. Every block of today removes exactly one of them.

| What we left broken | Fixed by | Files |
|---|---|---|
| The same card, copy-pasted three times | Reusable widgets | 09, 10 |
| A fixed number of tasks, hard-coded | `ListView.builder` | 05, 06, 07 |
| Only one screen — nowhere to go | Navigation | 13, 14, 15 |
| Change one style → edit every copy | One widget, one file | 09 |

---

## 3. Session Timeline (180 minutes)

| Time | Min | Block | Material |
|---|---|---|---|
| 0:00 – 0:10 | 10 | Recap of session 1, the four problems | slides + file 08 of session 1 |
| 0:10 – 0:20 | 10 | Constraints down, sizes up | file **01** |
| 0:20 – 0:35 | 15 | Main axis and cross axis | files **02**, **03** |
| 0:35 – 0:50 | 15 | Expanded, Flexible, Spacer | file **04** |
| 0:50 – 1:00 | 10 | Separating data from display | file **05** |
| 1:00 – 1:15 | 15 | **Break** | — |
| 1:15 – 1:25 | 10 | `ListView` | file **06** |
| 1:25 – 1:40 | 15 | `ListView.builder` | file **07** |
| 1:40 – 1:45 | 5 | `GridView.builder` (awareness only) | file **08** |
| 1:45 – 2:05 | 20 | **Extracting a reusable widget** | files **09**, **10** |
| 2:05 – 2:15 | 10 | Assets, images, MediaQuery | files **11**, **12** |
| 2:15 – 2:35 | 20 | Navigation: push, pop, data both ways | files **13**, **14**, **15** |
| 2:35 – 2:50 | 15 | Student challenge | `CHALLENGE_SESSION_02.md` |
| 2:50 – 2:57 | 7 | Quiz | `QUIZ_SESSION_02.md` |
| 2:57 – 3:00 | 3 | Wrap-up and homework | — |

If you fall behind, cut **file 08 (GridView)** entirely — it is awareness
only — and cut file 02 to three of its six values. Protect **files 07, 09 and
14**: they are the session.

---

## 4. Block Notes

Every file below is a `home:` line in `lib/main.dart`. Uncomment one, comment
the rest, hot reload.

---

### 4.1 File 01 — Constraints (10 min)

**Concept.** Constraints go down, sizes go up, the parent positions.

**Run it.** Three cards. The first asks for a width of 600 and does not get
it. The second shrinks to its text. The third is forced wide by its parent.
Each one prints the constraints it received.

**Say this.** "A widget never knows where it is. It only knows how big it is
allowed to be."

**Ask.** *Why did the 600 not work?*
Answer: the parent said "no wider than 335", and the parent always wins.

**Common mistake.** Students assume `width:` is a command. It is a request.

---

### 4.2 Files 02 and 03 — The two axes (15 min)

**Concept.** `Row` runs horizontally, `Column` runs vertically.
`mainAxisAlignment` moves children **along** the arrow, `crossAxisAlignment`
moves them **across** it.

**Run file 02.** Six boxes, one per value. Point at `spaceBetween` vs
`spaceEvenly` — the difference is the space at the two ends.

**Run file 03.** Four columns. `stretch` is the one to dwell on: the children
are *forced* to fill the cross axis.

**Say this.** "In a `Column`, left and right are `crossAxisAlignment`. Not
`mainAxisAlignment`. This is the single most common mix-up in Flutter."

**Ask.** *A Column, and I want its children pushed to the right. Which
property?*

**Common mistake.** `mainAxisAlignment` appears to do nothing — because the
Row has no spare room to distribute.

---

### 4.3 File 04 — Expanded, Flexible, Spacer (15 min)

**Concept.** Three ways to deal with free space.

| Widget | Behaviour |
|---|---|
| `Expanded` | Takes all the free space, always. Forces the child to fill |
| `Flexible` | May take space, is not forced to. Keeps its natural size |
| `Spacer` | An invisible flexible gap that pushes siblings apart |

**Run it.** Six demos. Demo 3 shows `flex: 1` next to `flex: 2`. Demo 6 is the
one that matters: a long title inside a Row, saved by `Expanded`.

**Say this.** "`Expanded` is the fix for most overflow errors you will ever
see."

**Live experiment.** Delete the `Expanded` in demo 6 and hot reload. The yellow
and black overflow stripes appear. Put it back.

**Common mistake.** Using `Expanded` outside a Row or Column. It only works
inside a flex.

---

### 4.4 File 05 — The Task model (10 min)

**Concept.** Separate the data from the display.

**Run it.** A deliberately ugly screen. That is the point: the data exists on
its own, before any card is designed.

**Say this.** "The screen no longer contains text. It contains a list of Task
objects — and that list can come from anywhere: a file, a database, a server."

**Ask.** *What would change on this screen if the tasks arrived from the
internet instead?*
Answer: nothing. Only where the list comes from.

---

### 4.5 File 06 — ListView (10 min)

**Concept.** A `Column` that scrolls.

**Run it.** Five children, written by hand.

**Say this.** "It never overflows — it scrolls. But it builds every child
immediately, even the ones off screen. Fine for a settings page. Wrong for a
thousand tasks."

**Ask.** *We want a sixth task. How many lines do we edit?*
Answer: two — the data and the UI. That is one too many. Which leads to…

---

### 4.6 File 07 — ListView.builder (15 min) ★

**Concept.** Describe one item, let Flutter repeat it.

```dart
ListView.builder(
  itemCount: tasks.length,
  itemBuilder: (context, index) => TaskCard(task: tasks[index]),
)
```

| Part | Meaning |
|---|---|
| `itemCount` | How many items exist in total |
| `itemBuilder` | A function Flutter calls to build ONE item |
| `index` | Which item is being built right now — 0, 1, 2 … |

**Live experiment.** Add a sixth `Task` to the list in file 05 and hot reload
file 07. **Zero** UI changes. Do this in front of them — it is the moment the
idea lands.

**Say this.** "You describe one item. Flutter builds only what fits on screen,
and reuses those widgets as you scroll."

**Common mistake.** Forgetting `itemCount`, or using `tasks.length - 1`.

---

### 4.7 File 08 — GridView.builder (5 min)

Awareness only. `itemCount` and `itemBuilder` are identical; the only new
thing is `gridDelegate`, which describes the shape of the grid. TaskFlow does
not use one. Move on.

---

### 4.8 Files 09 and 10 — Reusable widgets (20 min) ★★

**This is the heart of the session. Do not rush it.**

**File 09.** Every custom widget has three parts, in this order:

1. **Fields** — what the widget needs from outside. Always `final`.
2. **Constructor** — how callers pass those values in.
3. **`build()`** — what it looks like, using those values.

Show the "before" from session 1 (thirty lines per card) next to the "after"
(`TaskCard(task: tasks[index])`).

**Say this.** "One place to change the design. One place to fix a bug. One
line to use it."

**File 10.** The three kinds of parameter:

```dart
required this.task            // caller must pass it — compile error if missing
this.accent = Colors.indigo   // optional, falls back to the default
this.onTap                    // optional and nullable — may simply be absent
```

**Ask, for every widget from here on.** *What does this widget need from
outside?* That is your parameter.

**Live experiment.** Change the border radius in `TaskCard` once. All five
cards change. Compare with session 1, where you would have edited three copies.

**Common mistake.** Making the fields non-`final`, or forgetting `required`
and then wondering why `task` is null.

---

### 4.9 Files 11 and 12 — Assets and screen size (10 min)

**File 11 — assets, three steps:**

1. Create `assets/images/`.
2. Declare it in `pubspec.yaml` — **indentation matters, YAML is strict**:

   ```yaml
   flutter:
     assets:
       - assets/images/
   ```

3. Use it: `Image.asset('assets/images/empty_tasks.png')`.

`Image.asset` ships inside the app and works offline. `Image.network` is
downloaded at runtime and keeps the app small. Both take `width`, `height` and
`fit`; `BoxFit.cover` is the one they will use most.

> After editing `pubspec.yaml`, **hot restart** — hot reload does not pick up a
> new asset declaration. This trips up every class.

**File 12 — MediaQuery:**

```dart
final size = MediaQuery.of(context).size;
Container(width: size.width * 0.9)
```

Rules: prefer relative sizes, reach for `Expanded` first, use `MediaQuery`
sparingly.

**Say this.** "A hard-coded width of 350 looks fine on your phone and broken on
someone else's."

---

### 4.10 Files 13, 14, 15 — Navigation (20 min) ★

**The mental model.** Screens are a stack of cards. The user sees the top one;
everything underneath is still alive, just covered. Two operations: `push` and
`pop`.

**File 13.** `Navigator.push` with a `MaterialPageRoute`. Point out that
nobody wrote the back arrow — the Navigator knows there is a card underneath.
The Android back button and the iOS swipe both call `pop` for you.

**File 14.** Passing data forward. There is no special mechanism:

```dart
MaterialPageRoute(builder: (_) => TaskDetailsScreen(task: tasks[index]))
```

**Say this.** "A screen is just a widget. Passing data to it is just passing a
parameter."

**File 15.** Getting a value back:

```dart
final result = await Navigator.push(...);   // pause until it closes
Navigator.pop(context, newTask);            // hand something back
```

`await` is new and that is fine — it means "pause here until the other screen
closes". Asynchronous programming is all of session 4. Today, accept the shape
of it. Note the two habits: mark the callback `async`, and check
`context.mounted` after the `await`.

**Common mistake.** Pushing a screen and expecting the first one to be
destroyed. It is not — it is underneath, unchanged.

---

## 5. The Finished App — Screens 02 and 03

`lib/` is the current TaskFlow app, built completely. This is what you code
in front of the class if you have time, or walk through if you do not.

```
app/
├── models/
│   └── task.dart                plain data. Does not even import Flutter
├── widgets/
│   ├── task_card.dart           one row of the list
│   ├── priority_badge.dart      the coloured pill
│   ├── filter_tabs.dart         static filter chips
│   └── detail_row.dart          one line of the details card
└── screens/
    ├── tasks_list_screen.dart   SCREEN 02
    └── task_details_screen.dart SCREEN 03
```

**Arabic only.** The TaskFlow app does not include language switching. Keep RTL
at the application root and keep the practical lesson focused on lists,
widgets and navigation.

**Two things deliberately do nothing yet.**

| Control | Why |
|---|---|
| The filter pills | Remembering which one is selected is state — session 3 |
| The task's tick | Same reason. This is the homework question |

The filter pills, Edit Task and Complete Task are visual only at this point.
Filtering, editing and changing completion status arrive in session 3.

---

## 6. Health Check

```bash
flutter analyze
```

```bash
flutter test
```

Expected: `No issues found!` and `+29: All tests passed!`

The tests render **every session 1 and session 2 example at phone size
(375 x 812)** and fail on any overflow — the fastest way to know the
repository is safe to teach from.

> If `flutter test` fails on this machine with
> `ProcessException: An Application Control policy has blocked this file`
> pointing at `impellerc.exe`, Windows is blocking Flutter's shader compiler.
> Run `flutter test --no-test-assets` instead, or allow
> `C:\src\flutter\bin\cache\artifacts\engine\windows-x64\impellerc.exe` in
> the security policy.

---

## 7. Wrap-up — Three Things to Remember

1. **Describe one, repeat many.** `ListView.builder` builds a single item and
   reuses it. You never write the same card twice.
2. **A widget is a function of its inputs.** Fields, constructor, `build`.
3. **A screen is just a widget.** `push` adds it to the stack, `pop` removes
   it, and data travels through the constructor.

TaskFlow is now an application: it has data, reusable parts, and more than one
screen.

**Homework** (also on the last slide):

1. Extract a second widget — pull a header section into its own widget.
2. Grow the list to ten tasks. Confirm you changed no UI code to do it.
3. Think about this: tap the tick on a card. Why does nothing happen — and
   what is missing?

**Next:** Session 3 — State, Interaction & Forms.
