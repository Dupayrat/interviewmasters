
const progress_checkbox = () => {
  const checkboxes = document.querySelectorAll(".form-check-input");
    checkboxes.forEach((checkbox) => {
      checkbox.addEventListener('click', (event) => {
        checkbox.setAttribute('checked', "");
      });
    });
};

export { progress_checkbox };
