const flavours = ["latte", "frappe", "macchiato", "mocha", "unthemed"];

applyTheme("macchiato");

// flavour selector listeners
flavours.forEach((flavour) => {
  let btn = document.querySelectorAll(
    `#flavour-selector > #${flavour}`,
  ) as NodeListOf<HTMLButtonElement>;
  btn.forEach((btn) => {
    btn.addEventListener("click", () => {
      applyTheme(flavour);
    });
  });
});

function applyTheme(theme: string) {
  document.body.className = theme;
  // reset active class
  document.querySelectorAll("#flavour-selector > button").forEach((btn) => {
    btn.classList.remove("active");
  });
  // set active button
  document.querySelectorAll(`#flavour-selector > #${theme}`)?.forEach((btn) => {
    btn.classList.add("active");
  });
}
