import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  static targets = ["room8a", "room8f", "roomb2"];

  connect() {
    console.log("--->");

    // const room8aCtx = this.room8aTarget.getContext("2d");

    // const room8aTimestamps = this.fetchDataTimestamps(this.room8aTarget);

    // const room8aCo2 = this.fetchDataCo2(this.room8aTarget);
    // const room8aHum = this.fetchDataHum(this.room8aTarget);
    // const room8aTmp = this.fetchDataTmp(this.room8aTarget);
    // const room8aVoct = this.fetchDataVoct(this.room8aTarget);

    this.fetchData();
    this.displayChart();
  }

  fetchData() {
    const room = this.room8aTarget;
    const datas = JSON.parse(room.getAttribute("data-chart-value"));

    this.timestamps = datas.map((measure) => measure.timestamp);
    this.co2 = datas.map((measure) => measure.co2);
    this.hum = datas.map((measure) => measure.hum);
    this.tmp = datas.map((measure) => measure.tmp);
    this.voct = datas.map((measure) => measure.voct);
  }

  displayChart() {
    const room8aCtx = this.room8aTarget.getContext("2d");
    const room8aChart = new Chart(room8aCtx, {
      type: "line",
      data: {
        labels: this.timestamps,
        datasets: [
          {
            label: "CO2",
            data: this.co2,
            borderColor: "#3e95cd",
            fill: false,
          },
          {
            label: "HUM",
            data: this.hum,
            borderColor: "#8e5ea2",
            fill: false,
          },
          {
            label: "TMP",
            data: this.tmp,
            borderColor: "#3cba9f",
            fill: false,
          },
          {
            label: "VOC",
            data: this.voct,
            borderColor: "#e8c3b9",
            fill: false,
          },
        ],
      },
    });
  }

  // fetchDataTimestamps(target) {
  //   const datas = JSON.parse(target.getAttribute("data-chart-value"));
  //   console.log(datas);
  //   return (this._timestamp =
  //     this._timestamp || datas.map((measure) => measure.timestamp));
  // }

  // fetchDataCo2(target) {
  //   const datas = JSON.parse(target.getAttribute("data-chart-value"));
  //   return (this._co2 = this._co2 || datas.map((measure) => measure.co2));
  // }

  // fetchDataHum(target) {
  //   const datas = JSON.parse(target.getAttribute("data-chart-value"));
  //   return (this._hum = this._hum || datas.map((measure) => measure.hum));
  // }

  // fetchDataTmp(target) {
  //   const datas = JSON.parse(target.getAttribute("data-chart-value"));
  //   return (this._tump = this._tmp || datas.map((measure) => measure.tmp));
  // }

  // fetchDataVoct(target) {
  //   const datas = JSON.parse(target.getAttribute("data-chart-value"));
  //   return (this._voct = this._voct || datas.map((measure) => measure.voct));
  // }
}
