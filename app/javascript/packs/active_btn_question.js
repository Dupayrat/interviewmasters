const active_btn_question = () => {
  const questions_btn = document.querySelectorAll(".btn-question");

  questions_btn.forEach((question_btn) => {
    question_btn.addEventListener("click", (event) => {
      question_btn.innerHTML = "Saved!";
      question_btn.classList.remove("btn-question");
      question_btn.classList.add("btn-active");
    });
  });
};

export { active_btn_question };



