const days_counter_color = () => {
  const days_counters = document.querySelectorAll(".days-bold");

  days_counters.forEach((days_counter) => {
    const days_number = Number.parseInt(days_counter.innerHTML, 10);

    if (days_number >= 10) {
      days_counter.classList.add("days-green");
    } else if (days_number >= 5) {
      days_counter.classList.add("days-yellow");
    } else if (days_number < 5) {
      days_counter.classList.add("days-red");
    } else if (days_counter.innerHTML === "Today") {
      days_counter.classList.add("days-today");
    } else if (days_counter.innerHTML === "Finished") {
      days_counter.classList.add("days-finished");
    };
  });
};

export { days_counter_color };
