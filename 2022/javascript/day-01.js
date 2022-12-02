fs = require("fs")
exampleInput = fs.readFileSync("../input/01-example", "utf-8")
myInput = fs.readFileSync("../input/01", "utf-8")

solve = (input) =>
  input
    .trim()
    .split("\n")
    .reduce(
      ([curr, ...rest], line) =>
        line ? [curr + parseInt(line), ...rest] : [0, curr, ...rest],
      [0]
    )
    .sort((a, b) => b - a)

res = solve(myInput)

console.log("part 1", res[0])
console.log("part 2", res[0] + res[1] + res[2])
