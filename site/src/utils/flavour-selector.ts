const flavours = ["latte", "frappe", "macchiato", "mocha", "unthemed"];

applyTheme("macchiato");

// flavour selector listeners
flavours.forEach((flavour) => {
  let btn = document.querySelector(
    `#flavour-selector > #${flavour}`,
  ) as HTMLButtonElement;
  btn.onclick = () => {
    applyTheme(flavour);
  };
});

function applyTheme(theme: string) {
  document.body.className = theme;
  // reset active class
  document.querySelectorAll("#flavour-selector > button").forEach((btn) => {
    btn.classList.remove("active");
  });
  // set active button
  document
    .querySelector(`#flavour-selector > #${theme}`)
    ?.classList.add("active");
}
