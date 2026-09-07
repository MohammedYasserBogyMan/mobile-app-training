# Session 01 — Quiz

**Course:** P1 — Mobile Development 1
**Topic:** Flutter & Dart Foundations
**Questions:** 10
**Time:** 7 minutes

Write short answers. One or two sentences each is enough.

---

## Questions

**1. Flutter**
What is Flutter, and which programming language do we use to write Flutter apps?

**2. Dart**
What is the difference between `final` and `const` in Dart?

**3. Widget**
What is a widget in Flutter? Give two examples from today's session.

**4. MaterialApp**
What is `MaterialApp` used for, and where does it sit in the widget tree?

**5. Scaffold**
What does `Scaffold` give us? Name two of its properties.

**6. Widget Tree**
Look at this code and draw its widget tree:

```dart
Scaffold(
  appBar: AppBar(title: const Text('TaskFlow')),
  body: const Center(child: Text('Hello Flutter')),
)
```

**7. Row**
In which direction does a `Row` arrange its children, and what is its main axis?

**8. Column**
You want three texts underneath each other, all aligned to the left side of the
screen. Which widget do you use, and which property makes them left aligned?

**9. Container**
Name three things you can change about a `Container` using `BoxDecoration`.

**10. Expanded**
What problem does `Expanded` solve, and inside which widgets can it be used?

---
---

## Answers

**1. Flutter**
Flutter is a UI toolkit from Google for building applications for several
platforms from one codebase. Flutter apps are written in **Dart**.

**2. Dart — `final` vs `const`**
`final` means the value is set once while the program is running and cannot be
changed afterwards. `const` means the value is already known before the program
runs (at compile time). Every `const` value is also final, but not every final
value can be `const`.

**3. Widget**
A widget is a description of a piece of the user interface. Everything visible
on screen is a widget. Examples from today: `Text`, `Icon`, `Container`, `Row`,
`Column`, `Scaffold`, `AppBar`, `ElevatedButton`, `SizedBox`.

**4. MaterialApp**
`MaterialApp` is the root widget of a Material Design application. It provides
the theme, the title, navigation and the default text styles. It sits at the
**top** of the widget tree, and it is normally the widget passed to `runApp()`.

**5. Scaffold**
`Scaffold` gives the basic visual structure of one screen. Properties covered
today: `appBar`, `body`, `floatingActionButton`.

**6. Widget Tree**

```
Scaffold
├── AppBar
│   └── Text("TaskFlow")
└── Center
    └── Text("Hello Flutter")
```

`AppBar` and `Center` are both children of `Scaffold`. Each `Text` is a child of
the widget above it.

**7. Row**
A `Row` arranges its children **horizontally**, from left to right. Its **main
axis is horizontal**, and its cross axis is vertical.

**8. Column**
Use a `Column`, and set `crossAxisAlignment: CrossAxisAlignment.start` to align
the children to the left.

**9. Container / BoxDecoration**
Any three of: background `color`, `borderRadius` (rounded corners), `border`,
`boxShadow`, `gradient`, `shape`.

**10. Expanded**
`Expanded` makes one child take all the remaining free space. It solves the
overflow problem that happens when the children of a `Row` or `Column` need
more space than the screen has. It can only be used **directly inside a `Row`,
a `Column` or a `Flex`**.

---

## Marking Guide

| Question | Marks |
|---|---|
| 1 – 5 | 1 mark each |
| 6 (widget tree) | 2 marks |
| 7 – 9 | 1 mark each |
| 10 | 2 marks |
| **Total** | **12** |

A student who scores 8 or more is ready for Session 2.
