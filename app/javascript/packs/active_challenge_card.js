const challenge_card_color = () => {
  const challenges_cards = document.querySelectorAll(".challenge-card");

  challenges_cards.forEach((challenge_card) => {
    challenge_card.addEventListener('click', (event) => {
      const actives_challenges_cards = document.querySelectorAll(".active-challenge-card");
      actives_challenges_cards.forEach((active_challenge_card) => {
        active_challenge_card.classList.remove("active-challenge-card");
      });

      challenge_card.classList.toggle("active-challenge-card");
    });
  });
};

export { challenge_card_color };
