# Physics I (Mechanics) — Homeworks templates

✨ Clear and beautiful ✨ templates of the assignments at the course Physics I (Mechanics).

## Install
```
git clone --recurse-submodules https://github.com/constabIe/physics-hws
```

## Build
Choose one of the following options to compile the paper:
- [Online editor](https://typst.app) (open the folder in editor with **initialized** git submodules)
- [VSCode extension](https://github.com/Myriad-Dreamin/tinymist)
- [Neovim plugin](https://github.com/chomosuke/typst-preview.nvim)

## Paper layout process
- Fork the repository.

- For each assignment create and switch to the `hwXX` branch for the `XX` homework. 
  ```
  git checkout -b hwXX
  ```
  Edit files on the `hwXX` folder as you want.

- If the new template occurred switch to the default branch
  ```
  git switch main
  ```
  pull the template
  ```
  git pull origin main
  ```
  and checkout
  ```
  git checkout -b hw(XX + 1)
  ```
  
## Typst docs
For more about `typst` markup language syntax and features: https://typst.app/docs
