## Scenario

You've inherited a Flutter screen from a teammate who was in a hurry. It works it shows a product catalog with search, and a form to add new products but it's all crammed into one file, one class, one build() method. Nothing is reusable, nothing is separated, and every small Ul tweak means hunting through a wall of nested widgets. Your job: refactor it into proper Atomic Design layers without changing what the user sees or how the app behaves.

## Starting Point

Clone the starter repository provided by your instructor. It contains a single-file Flutter app: a product catalog (search + product cards, hardcoded data) and an "Add New Product" form (name, price, category, description) all inline in one State class, with no separation into atoms, molecules, organisms, templates, or pages.

Before you touch any code: Run the app first (flutter pub get, then flutter run). Confirm search and the Add Product form both work. This is your behavioral baseline your refactored version must match it exactly.

## Task

1. Read through the starter file and mark, in your own notes, every distinct Ul responsibility you can find individual pieces of text, buttons, icons, input fields, the product card as a whole, the app bar, the form, the overall screen.


2. Assign each responsibility to an Atomic Design level (Atom, Molecule, Organism, Template, or Page) using the rules from the lecture and study guide.


3. Extract each one into its own file, in the correct folder:


* `lib/ui/atoms/`

* `lib/ui/molecules/`

* `lib/ui/organisms/`

* `lib/ui/templates/`

* `lib/ui/pages/`



4. Pay special attention to the form. Break the individual fields (name, price, category, description) into reusable atoms/molecules, and make sure the submit logic (validation + state update + confirmation feedback) doesn't stay dumped in the Page decide where each piece of that logic actually belongs.


5. Reassemble everything so the app builds, runs, and behaves identically to the starting version same search behavior, same validation rules, same confirmation message on submit.


6. Write a one-paragraph justification for each extracted widget: name the level you placed it at and the specific rule that puts it there (not just "it felt small").



## Rules of the Refactor

* Atoms hold no logic and no state beyond what's needed to render (StatelessWidget only).


* Molecules may hold local Ul state (e.g. obscure/show toggle) but never business logic or data-fetching.


* Organisms may contain local logic but should not directly own the app's core data.


* Templates accept layout slots as parameters and must never import a data model directly.


* Pages are the only place allowed to hold the actual product list and wire real data downward.


* No skipping levels a Page should not be built directly from raw atoms with nothing in between if a molecule/organism boundary clearly belongs there.# rafactored_messy_catalog_villanueva
