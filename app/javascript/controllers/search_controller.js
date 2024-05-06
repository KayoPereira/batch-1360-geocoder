import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["inputOrigin", "containerInputs", "banner"]

  connect() {
    console.log("Hello from our first Stimulus controller");
    this.searchOrigin()
    if (this.inputOriginTarget.value === "") {

    }
  }

  searchOrigin(event) {
    const inputOrigin = event.target;
    const searchValue = inputOrigin.value.trim(); // Obtém o valor do campo e remove espaços em branco desnecessários
    // Enviar solicitação apenas se houver algum valor no campo
    if (searchValue != "") {
      fetch(`/?origin=${searchValue}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content // Certifique-se de incluir o token CSRF se estiver usando proteção CSRF
        }
      })
        .then(response => {
          if (!response.ok) {
            throw new Error("Erro ao fazer a solicitação.");
          }
          // Trate a resposta da solicitação conforme necessário
          return response.json();
        })
        .then(data => {
          let html = '';
          // Faça algo com os dados da resposta, se necessário
          console.log("============ infos de data ============");
          data.forEach((flight) => {
            html += `
              <a href="/flights/${flight.id}" class="text-decoration-none col-4"">
                <div class="card-category bg-danger m-3 d-flex flex-column align-items-center justify-content-center card-trip" style="height: 300px; background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url(${flight.photo_link}); background-size: cover;">
                  <h3 class="arrival-info">${flight.departure}/${flight.arrival}</h3>
                  <h5 class="card-info">a partir de</h5>
                </div>
              </a>`;
              document.querySelector('.container-all-offers').innerHTML = html;
              this.bannerTarget.classList.add('d-none');
          })
        })
        .catch(error => {
          console.error("Erro:", error);
          // Lidar com erros, se necessário
          console.log("============ deu erro ============");
        });
    } else {
      this.inputClean()
    }
  }

  inputClean() {
    if (this.inputOriginTarget.value = "") {
      fetch(`/`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content // Certifique-se de incluir o token CSRF se estiver usando proteção CSRF
        }
      })
        .then(response => {
          if (!response.ok) {
            throw new Error("Erro ao fazer a solicitação.");
          }
          // Trate a resposta da solicitação conforme necessário
          return response.json();
        })
        .then(data => {
          let html = '';
          // Faça algo com os dados da resposta, se necessário
          console.log("============ infos de data ============");
          data.forEach((flight) => {
            html += `
              <a href="/flights/${flight.id}" class="w-100 text-decoration-none">
                <div class="card-category bg-danger m-3 d-flex flex-column align-items-center justify-content-center card-trip" style="height: 300px; background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url(${flight.photo_link}); background-size: cover;">
                  <h3 class="arrival-info">${flight.departure}/${flight.arrival}</h3>
                  <h5 class="card-info">a partir de</h5>
                </div>
              </a>`;
              document.querySelector('.container-all-offers').innerHTML = html;
          })
        })
        .catch(error => {
          console.error("Erro:", error);
          // Lidar com erros, se necessário
          console.log("============ deu erro ============");
        });
    };

    console.log("============ input vazio ============");
  }
}