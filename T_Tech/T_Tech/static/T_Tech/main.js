function pidColor(x) {
  switch (x) {
    case "YTM":
      bg = "green";
      break;
    case "YTP":
      bg = "magenta";
      break;
    case "YTC":
      bg = "rgb(255, 88, 0)";
      break;
    case "YTL":
      bg = "rgb(255, 255, 0)";
      break;
    case "T-T":
      bg = "gray";
      break;
    default:
      bg = "rgb(255, 255, 0, .1)";
      break;
  }
  return bg;
}

function alphabets(i) {
  a = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "AA",
    "AB",
    "AC",
    "AD"
  ];

  return a[i - 1]; //return number
}

function numToalphabets(i) {
  a = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "AA",
    "AB",
    "AC",
    "AD"
  ];
  b = a.indexOf(i) + 1;
  return b;
}
