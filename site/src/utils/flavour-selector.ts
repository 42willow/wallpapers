console.log("theme selector loaded");

const flavours = ["latte", "frappe", "macchiato", "mocha", "unthemed"];
let currentTheme = localStorage.getItem("theme") || "macchiato";

flavours.forEach((flavour) => {
  let btn = document.querySelector(
    `#flavour-selector > #${flavour}`,
  ) as HTMLButtonElement;
  if (!btn) {
    console.error(`Button with id ${flavour} not found`);
    return;
  }
  btn.onclick = () => {
    console.log("theme selector clicked", flavour);
    document.querySelectorAll("#flavour-selector > button").forEach((b) => {
      b.classList.remove("active");
    });
    btn.classList.toggle("active");
    document.body.className = flavour;
    localStorage.setItem("theme", flavour);
  };
});
