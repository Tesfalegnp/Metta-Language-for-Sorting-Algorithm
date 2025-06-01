# MeTTa Sorting Algorithms: Selection Sort vs. Quick Sort

This repository contains implementations of two classic sorting algorithms — **Selection Sort** and **Quick Sort** — written in the **MeTTa programming language**, a minimal symbolic language used in the [Hyperon](https://github.com/trueagi-io/hyperon-experimental) framework.

These implementations are designed to be clear, idiomatic, and educational for those learning MeTTa or functional-style metaprogramming.

---

## 📁 Contents

- `selection-sort.metta` – Implementation of Selection Sort.
- `quick-sort.metta` – Implementation of Quick Sort.
- `README.md` – This file.

---

## 🔍 Overview

### 1. **Selection Sort**

- **Time Complexity**: O(n²)
- **Space Complexity**: O(n) due to recursive list operations
- **Approach**:
  - Find the minimum element in the list.
  - Remove it and recursively sort the rest.
  - Cons the minimum onto the sorted remainder.

#### ✅ Strengths:
- Simple and easy to understand.
- Predictable behavior with small datasets.

#### ❌ Weaknesses:
- Inefficient for large lists due to repeated scans.

---

### 2. **Quick Sort**

- **Time Complexity**: 
  - Best/Average Case: O(n log n)
  - Worst Case: O(n²) (with poor pivot choice)
- **Space Complexity**: O(n)
- **Approach**:
  - Choose a pivot (first element in this implementation).
  - Partition the list into elements less than or equal to the pivot and greater than the pivot.
  - Recursively sort both partitions and combine them.

#### ✅ Strengths:
- Fast on average.
- Good for medium-to-large datasets.

#### ❌ Weaknesses:
- Recursive depth can grow quickly.
- Pivot choice significantly affects performance.

---

## 🧠 Key Concepts Demonstrated

- Functional list manipulation (`::`, `append`, `filter`)
- Recursion
- Pattern matching
- Deterministic evaluation using `!`
- Metta-specific evaluation quirks (e.g., multiple equivalent results)

---

## 🧪 Example Input

Both programs sort the following list:

```metta
(:: 12 (:: 34 (:: 1 (:: 13 (:: 1 (:: 99 (:: 0 ())))))))
```

Expected Output:

```metta
(:: 0 (:: 1 (:: 1 (:: 12 (:: 13 (:: 34 (:: 99 ())))))))
```

---

## ⚖️ Comparison Summary

| Feature             | Selection Sort                     | Quick Sort                         |
|---------------------|------------------------------------|------------------------------------|
| Time Complexity     | O(n²)                              | O(n log n) average, O(n²) worst    |
| Stability           | Not stable                         | Not stable                         |
| Recursion Used      | Yes                                | Yes                                |
| Simplicity          | Very simple                        | Slightly more complex              |
| Performance         | Slower on large lists              | Faster on average                  |

---

## 🧰 Tips for Running

To run these files:

1. Install [MeTTa interpreter](https://github.com/trueagi-io/hyperon-experimental)
2. Save each algorithm to its own file, e.g., `selection-sort.metta`
3. Run via CLI:

```bash
metta -e "(load-file path\"selection-sort.metta")"
metta -e "(load-file path\"quick-sort.metta\")"
```

Or paste directly into a Jupyter notebook running Hyperon kernel.

---

## 📬 Feedback & Contributions

If you'd like to improve this repo by:
- Adding benchmarks
- Visualizing intermediate steps
- Generalizing to other types (e.g., strings)
- Optimizing recursion

Please feel free to open an issue or submit a PR!

---

## 🎓 Learn More

- [MeTTa Tutorial](https://github.com/trueagi-io/hyperon-experimental/blob/master/docs/MettaTutorial.md)
- [Hyperon GitHub Repo](https://github.com/trueagi-io/hyperon-experimental)

---

Happy coding in MeTTa! 🧠
