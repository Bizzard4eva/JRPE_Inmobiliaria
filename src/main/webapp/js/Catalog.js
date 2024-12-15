// Cantidad Dormitorios
function actualizarValorDormitorios(valor) {
    document.getElementById("valorDormitorios").textContent = valor;
}
// Area Total
function actualizarValorAreaTotal(valor) {
    document.getElementById("valorAreaTotal").textContent = valor;
}
// Rango de Precios
const rangeInput = document.querySelectorAll(".range-input input"),
priceInput = document.querySelectorAll(".price-input input"),
progress = document.querySelector(".slider .progress");

let priceGap = 50000;

rangeInput.forEach(input => {
    input.addEventListener("input", e => {
        let minVal = parseInt(rangeInput[0].value),
            maxVal = parseInt(rangeInput[1].value),
            minRange = parseInt(rangeInput[0].min),
            maxRange = parseInt(rangeInput[0].max); 

        if (maxVal - minVal < priceGap) {
            if (e.target.className === "range-min") {
                rangeInput[0].value = maxVal - priceGap;
            } else {
                rangeInput[1].value = minVal + priceGap;
            }
        } else {
            priceInput[0].value = minVal;
            priceInput[1].value = maxVal;
            progress.style.left = ((minVal - minRange) / (maxRange - minRange)) * 100 + "%";
            progress.style.right = 100 - ((maxVal - minRange) / (maxRange - minRange)) * 100 + "%";
        }
    });
});

priceInput.forEach(input => {
    input.addEventListener("input", e => {
        let minPrice = parseInt(priceInput[0].value),
            maxPrice = parseInt(priceInput[1].value),
            minRange = parseInt(rangeInput[0].min),
            maxRange = parseInt(rangeInput[0].max);

        if (
            maxPrice - minPrice >= priceGap &&
            minPrice >= minRange &&
            maxPrice <= maxRange
        ) {
            rangeInput[0].value = minPrice;
            rangeInput[1].value = maxPrice;
            progress.style.left = ((minPrice - minRange) / (maxRange - minRange)) * 100 + "%";
            progress.style.right = 100 - ((maxPrice - minRange) / (maxRange - minRange)) * 100 + "%";
        }
    });
});