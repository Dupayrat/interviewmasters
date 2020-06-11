const progress_bar = () => {
  const progress_bars = document.querySelectorAll(".progress-bar")
  progress_bars.forEach((progress_bar) => {
    progression = progress_bar.innerText.replace("%", "")
    if (progression < 50) {
      progress_bar.setAttribute("style", "background-color: red;")
    } else if (progression >= 50) {
      progress_bar.setAttribute("style", "background-color: $orange;")
    } else if (progression = 100) {
      progress_bar.setAttribute("style", "background-color: #3ac162;")
    }
  });
};

export { progress_bar }
