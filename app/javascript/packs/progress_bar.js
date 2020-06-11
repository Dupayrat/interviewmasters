const progress_bar = () => {
  const progress_bars = document.querySelectorAll(".progress-bar")
  progress_bars.forEach((progress_bar) => {
    const progression = Number.parseInt(progress_bar.innerText.replace(/%/, ''), 10);
    if (progression < 50) {
      progress_bar.classList.add("progress-bar-red")
    } else if (progression === 100) {
      progress_bar.classList.add("progress-bar-green")
    } else if (progression >= 50) {
      progress_bar.classList.add("progress-bar-yellow")
    }
  });
};

export { progress_bar }
