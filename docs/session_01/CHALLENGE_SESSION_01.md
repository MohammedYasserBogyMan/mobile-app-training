# Session 01 — Student Challenge

**Project:** TaskFlow
**Time:** about 10 minutes
**Rule:** use only what we covered today. No state, no packages.

---

## The Challenge

The TaskFlow home screen currently shows **three** task cards.

Add a **fourth** task card with these values:

| Field | Value |
|---|---|
| Title | `Mobile Development Quiz` |
| Date | `Sunday - 12:00 PM` |
| Priority | `High` |

Your fourth card must look exactly like the three cards that are already there:
same white background, same rounded corners, same spacing, and a red badge
because the priority is `High`.

---

## Where to Work

Open:

```
lib/examples/session_01/08_taskflow_home.dart
```

Find the three existing cards inside the `Column` and add yours after the last
one.

---

## Steps

1. Run the app and make sure you see the three cards first.
2. Look carefully at how the third card (`UI Design Practice`) is written.
3. Write your fourth card underneath it, using the same structure.
4. Save the file and hot reload.
5. Check that the new card appears with a **red** badge.

---

## Expected Result

```
TaskFlow
─────────────────────────────
☀  Good Morning 👋

Your Tasks
3 Tasks Today

┌───────────────────────────┐
│ Flutter Assignment   High │
│ Today - 8:00 PM           │
└───────────────────────────┘
┌───────────────────────────┐
│ Database Project   Medium │
│ Tomorrow - 10:00 AM       │
└───────────────────────────┘
┌───────────────────────────┐
│ UI Design Practice    Low │
│ Friday - 9:00 AM          │
└───────────────────────────┘
┌───────────────────────────┐
│ Mobile Development        │
│ Quiz                 High │
│ Sunday - 12:00 PM         │
└───────────────────────────┘
```

---

## Bonus

Only after the main challenge works:

1. **Change the icon.** Give your new card a different icon than the others.
   Type `Icons.` in the editor and pick one from the autocomplete list, for
   example `Icons.quiz`, `Icons.school` or `Icons.timer`.

2. **Change the spacing.** Find the `SizedBox` widgets in the screen and change
   their `height` values. Try `8`, then `32`. Hot reload after each change and
   describe out loud what moved.

3. **Fix the counter.** The screen still says `3 Tasks Today`. Update that text
   so it matches the number of cards on the screen.

---

## Hints

<details>
<summary>Hint 1 — I do not know where to start</summary>

Every card on the screen is written the same way. Copy the block that starts
with `const TaskCard(` and ends with `),`, paste it under the last card, then
change the values inside.

</details>

<details>
<summary>Hint 2 — My card is not red</summary>

The colour is chosen automatically from the `priority` value. Check that you
wrote exactly `'High'` — with a capital `H`, and inside quotes.

</details>

<details>
<summary>Hint 3 — Red error screen after I saved</summary>

Read the first line of the error. It is almost always one of these:

- a missing comma after `)` at the end of your card,
- a missing quote around a text value,
- a missing parameter — all four (`title`, `date`, `priority`, `icon`) are
  `required`.

</details>

---

## Checklist Before You Submit

- [ ] The app runs with no red error screen.
- [ ] Four cards are visible.
- [ ] The fourth card shows `Mobile Development Quiz`.
- [ ] The date shows `Sunday - 12:00 PM`.
- [ ] The badge shows `High` and is red.
- [ ] The card layout matches the other three.
