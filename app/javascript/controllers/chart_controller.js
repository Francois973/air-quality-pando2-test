import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);
import "chartjs-adapter-moment";

export default class extends Controller {
  static values = {
    data: Object,
  };
  connect() {
    console.log("------>");
    Object.entries(this.dataValue).forEach(([measureType, values]) => {
      this.draw(measureType, values);
    });
  }

  options(title) {
    return {
      plugins: {
        title: {
          display: true,
          text: title,
        },
      },
      scales: {
        x: {
          type: "time",
          time: {
            unit: "hour",
            stepSize: 3,
            tooltipFormat: "HH:mm",
          },
          ticks: {
            major: {
              enabled: true,
              fontStyle: "bold",
              fontSize: 14,
            },
          },
        },
      },
    };
  }

  draw(measureType, values) {
    const box = document.createElement("div");
    box.style.width = "500px";
    box.style.height = "250px";
    box.style.margin = "0 auto";
    box.style.marginBottom = "40px";

    const canvas = document.createElement("canvas");
    canvas.id = `canvas-${measureType}`;

    box.appendChild(canvas);
    this.element.appendChild(box);

    const labels = values.labels;
    delete values.labels;

    const datasets = Object.entries(values).map(([room, values]) => ({
      label: room,
      spanGaps: true,
      data: values,
      borderWidth: 1,
      pointRadius: 0,
      tension: 0.1,
    }));

    new Chart(canvas, {
      type: "line",
      title: measureType,
      data: {
        labels: labels,
        datasets: datasets,
      },
      options: this.options(measureType),
    });
  }
}
