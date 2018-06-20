function setAmount () {
  const peopleField = document.querySelector("#search_number_traveller");
    if (peopleField) {
      peopleField.addEventListener('change', () => {
        const people = peopleField.value;
        const Amount = document.getElementById('amount-experience').innerText;
        const totalCost = Amount * people;
        const amountField = document.querySelector('#search_amount');
        amountField.value = totalCost;
      });
    }
}

export { setAmount };
