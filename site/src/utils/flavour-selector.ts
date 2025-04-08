console.log("theme selector loaded");

const flavours = ["latte", "frappe", "macchiato", "mocha", "unthemed"];

flavours.forEach((flavour) => {
  let btn = document.querySelector(
    `.flavour-selector > .${flavour}`,
  ) as HTMLButtonElement;
  btn.onclick = () => {
    document.body.className = flavour;
    localStorage.setItem("theme", flavour);
  };
});
