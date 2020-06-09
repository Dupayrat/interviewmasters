const active_btn_question = () => {
  const question_btn = document.querySelector(".btn-question");
  question_btn.addEventListener("click", (event) => {
    question_btn.innerText = "Saved!";
    question_btn.classList.remove("btn-question");
    question_btn.classList.add("active-btn");
  });
};

export { active_btn_question };



