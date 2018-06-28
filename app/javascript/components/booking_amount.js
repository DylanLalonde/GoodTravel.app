function setAmount() {
    const peopleField = document.querySelector("#booking_number_traveller");
    if (peopleField) {
        peopleField.addEventListener('change', () => {
            const people = peopleField.value;
            const Amount = document.getElementById('amount-experience').innerText;
            console.log(Amount);
            const totalCost = `${Amount * people}`;
            const donationAmount = totalCost * 0.05;
            console.log(totalCost)
            const amountDonationField = document.getElementById('donation-amount');
            amountDonationField.innerHTML = donationAmount;
            const amountField = document.querySelector('#booking_amount_cents');
            amountField.value = totalCost;
        });
    }
}

export {
    setAmount
};
