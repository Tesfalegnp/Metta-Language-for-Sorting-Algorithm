
# 🔢 Sorting Algorithms in MeTTa (Full & Partial)

This repository provides implementations of classic sorting algorithms — **Selection Sort**, **Insertion Sort**, and **Quick Sort** — using the [MeTTa language](https://github.com/opencog/MeTTa), a pattern-matching-based language designed for symbolic reasoning in AGI systems like OpenCog Hyperon.

🧪 Each algorithm supports:
- ✅ **Full sorting**: Sorts the entire list.
- ✅ **Partial sorting**: Sorts only the first `N` elements and leaves the rest unchanged.

---

## 📂 Project Structure

```

├── selection sort/      # Selection Sort (full + partial)
├── insertion sort/      # Insertion Sort (full + partial)
├── quick sort/          # Quick Sort (full + partial)
├── README.md                  # Documentation

```

---

## 🧠 About MeTTa

MeTTa (Meta-Type Talk) is a symbolic language for general intelligence. It allows programmable pattern matching and declarative logic, useful for building cognition and learning in AGI systems.

---

## 🔁 Sorting Algorithms Implemented

### 1. 📌 Selection Sort

* **Strategy**: Find minimum repeatedly, place in order.
* **Full**: Sorts the entire list.
* **Partial**: Sorts the first `N` elements, rest untouched.

### 2. 📌 Insertion Sort

* **Strategy**: Insert each element into a growing sorted list.
* **Full**: Stable and adaptive for small datasets.
* **Partial**: Sorts first `N` elements only.

### 3. 📌 Quick Sort

* **Strategy**: Recursive divide & conquer using pivot.
* **Full**: High performance for large datasets.
* **Partial**: Sorts only first `N` items using modified recursion.

---

## ⚙️ Usage & Execution

Make sure you have MeTTa installed.

### ▶️ Run a MeTTa file:

```bash
metta Full_Selection_sort.metta
```

### 🧪 Example Test: Partial Sort

```clojure
! (partial-selection-sort 3 (:: 12 (:: 34 (:: 1 (:: 13 (:: 5 (:: 7 (:: 3 (:: 0 (:: 8 (:: 6 ())))))))))))
```

**Expected Output:**

```clojure
(:: 1 (:: 12 (:: 34 (:: 13 (:: 5 (:: 7 (:: 3 (:: 0 (:: 8 (:: 6 ()))))))))))
```

---

## ⏱️ Time Complexity Testing

Use large lists and `time` measurement tools in MeTTa to compare:

| Algorithm      | Full Sort Time | Partial Sort Time (N=5) |
| -------------- | -------------- | ----------------------- |
| Selection Sort | O(n²)          | O(n·N)                  |
| Insertion Sort | O(n²)          | O(n·N)                  |
| Quick Sort     | O(n log n)     | \~O(N log N)            |

You can benchmark by adding timers (e.g., using `println!` to trace steps or custom timing wrappers if supported).

---

## 🔬 Example: Sorting 10 Elements

```clojure
! (full-insertion-sort (:: 8 (:: 3 (:: 5 (:: 1 (:: 9 (:: 4 (:: 7 (:: 2 (:: 0 (:: 6 ()))))))))))
```

```clojure
! (partial-insertion-sort 5 (:: 8 (:: 3 (:: 5 (:: 1 (:: 9 (:: 4 (:: 7 (:: 2 (:: 0 (:: 6 ()))))))))))
```

---

## 🛠️ Contributing

Pull requests are welcome! If you’d like to add:

* New sorting algorithms (e.g., Merge Sort)
* Better benchmarking support
* Tests using symbolic or structured types (e.g., pairs or instances)

Feel free to fork and improve.

---

## 📜 License

This project is licensed under the MIT License.

---

## 🤖 AGI Motivation

This project is part of a larger exploration of MeTTa for **artificial general intelligence**, where algorithmic thinking, list manipulation, and reasoning are key primitives for cognitive development.
