import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);
import "chartjs-adapter-moment";

// console.log(moment);
export default class extends Controller {
  static targets = ["room8a", "room8f", "roomb2"];
  connect() {
    console.log("------>");
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
    return new Chart(room8aCtx, {
      type: "line",
      data: {
        labels: this.timestamps,
        datasets: {
          data: this.timestamps,
          xAxisID: "xAxis",
        },
        datasets: [
          {
            label: "CO2",
            data: this.co2,
            borderColor: "#3e95cd",
            fill: false,
            yAxisID: "co2",
          },
          {
            label: "HUM",
            data: this.hum,
            borderColor: "#8e5ea2",
            fill: false,
            yAxisID: "hum",
          },
          {
            label: "TMP",
            data: this.tmp,
            borderColor: "#3cba9f",
            fill: false,
            yAxisID: "tmp",
          },
          {
            label: "VOCT",
            data: this.voct,
            borderColor: "#e8c3b9",
            fill: false,
            yAxisID: "voct",
          },
        ],
      },
      options: {
        scales: {
          co2: {
            title: {
              display: true,
              text: "Co2",
              color: "#3e95cd",
              position: "top",
            },
            type: "linear",
            position: "left",
            min: 200,
            max: 460,
          },
          hum: {
            type: "linear",
            position: "left",
            min: 0,
            max: 100,
            title: {
              display: true,
              text: "Hum",
              color: "#8e5ea2",
              position: "top",
            },
          },
          tmp: {
            type: "linear",
            position: "right",
            min: 0,
            max: 20,
            title: {
              display: true,
              text: "Tmp",
              color: "#3cba9f",
              position: "top",
            },
          },
          voct: {
            type: "linear",
            position: "right",
            min: 0,
            max: 300,
            title: {
              display: true,
              text: "Voct",
              color: "#e8c3b9",
              position: "top",
            },
          },
          xAxis: {
            type: "time",
            time: {
              unit: "minute",
              stepSize: 10,
              tooltipFormat: "HH:mm",
            },
            display: false,
            distribution: "linear",
            position: "bottom",
            gridLines: {
              display: false,
            },
          },
        },
      },
    });
  }
}
