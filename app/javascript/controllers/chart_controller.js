import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);
import "chartjs-adapter-moment";

// console.log(moment);
export default class extends Controller {
  static targets = ["co2", "hum", "tmp", "voct"];
  connect() {
    console.log("------>");
    this.fetchCo2Data();
    this.displayCo2Chart();
  }
}
