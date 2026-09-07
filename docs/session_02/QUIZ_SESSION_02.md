# Session 02 — Quiz

**Course:** P1 — Mobile Development 1
**Topic:** UI, Lists, Reusable Widgets & Navigation
**Questions:** 10
**Time:** 7 minutes

Write short answers. One or two sentences each is enough.

---

## Questions

**1. The golden rule**
Complete the sentence: constraints go ______, sizes go ______, and the
______ decides the position.

**2. Constraints**
A `Container` asks for `width: 600` inside a phone screen that is 375 wide.
What width does it actually get, and why?

**3. The two axes**
In a `Column`, which property moves the children left and right —
`mainAxisAlignment` or `crossAxisAlignment`?

**4. Expanded**
What is the difference between `Expanded` and `Flexible`?

**5. Overflow**
This code shows the yellow and black overflow stripes. Fix it in one line:

```dart
Row(
  children: [
    const Icon(Icons.assignment),
    const SizedBox(width: 8),
    Text('A very long task title that does not fit in this row at all'),
  ],
)
```

**6. ListView**
Why should you not use a plain `ListView` for a list of 1,000 items, and what
do you use instead?

**7. ListView.builder**
Name the three parts of `ListView.builder` and say what each one does.

**8. Custom widgets**
What are the three parts of every custom widget you write, in order?

**9. Parameters**
Explain the difference between these three fields:

```dart
final Task task;              // required this.task
final Color accent;           // this.accent = Colors.indigo
final VoidCallback? onTap;    // this.onTap
```

**10. Navigation**
What do `Navigator.push` and `Navigator.pop` do, and how do you send a `Task`
to the screen you are pushing?

---
---

## Answers

**1.** Constraints go **down**, sizes go **up**, and the **parent** decides the
position.

**2.** It gets **375** (minus any padding). The parent's constraints always
win — `width:` is a request, not a command. The child may only choose a size
inside the range the parent allows.

**3.** `crossAxisAlignment`. In a `Column` the main axis is vertical, so
`mainAxisAlignment` moves the children up and down. This is the most common
mix-up in Flutter.

**4.** `Expanded` **always** takes all the free space and forces the child to
fill it. `Flexible` **may** take space but does not force the child — the
child keeps its natural size and only shrinks if it must. Both only work
inside a `Row`, a `Column` or a `Flex`.

**5.** Wrap the `Text` in `Expanded`:

```dart
Expanded(child: Text('A very long task title ...'))
```

(Adding `overflow: TextOverflow.ellipsis` to the `Text` is a good extra, but
`Expanded` is what removes the error.)

**6.** A plain `ListView` builds **every** child immediately, including the
ones off screen — 1,000 widgets for a screen that shows eight. Use
`ListView.builder`, which builds only what fits on screen and reuses those
widgets as the user scrolls.

**7.**

- `itemCount` — how many items exist in total.
- `itemBuilder` — a function Flutter calls to build **one** item.
- `index` — which item is being built right now: 0, 1, 2 …

**8.**

1. **Fields** — what the widget needs from outside. Always `final`.
2. **Constructor** — how callers pass those values in.
3. **`build()`** — what it looks like, using those values.

**9.**

- `required this.task` — the caller **must** pass it. Leaving it out is a
  compile error.
- `this.accent = Colors.indigo` — optional. When the caller omits it, the
  default is used.
- `this.onTap` — optional **and** nullable. It may simply be absent, and the
  widget must cope with `null`.

**10.** `push` puts a new screen on top of the stack; `pop` removes the top
screen and reveals the one underneath, unchanged. You send data by passing it
to the screen's constructor — a screen is just a widget:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => TaskDetailsScreen(task: task)),
);
```

---

## Marking

One mark per question. Question 5 needs the working line, not just the word
`Expanded`.

| Score | Reading |
|---|---|
| 9–10 | Ready for state in session 3 |
| 6–8 | Solid. Re-read files 07 and 09 |
| 3–5 | Redo the challenge before the next session |
| 0–2 | Book a catch-up before session 3 |
