<template>
  <div>
    <h1>This is Hello World</h1>
    <Bar v-if="dataset.labels.length" :data="dataset" />
    <p v-else>Loading chart data...</p>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';
ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);

const dataset = ref({
  labels: [],
  datasets: [
    {
      label: "",
      backgroundColor: "",
      data: [],
    }
  ]
});


onMounted(async () => {
  try {
    const response = await axios.get('http://localhost:4000/hello');
    dataset.value = createDataSet(response.data);
  } catch (error) {
    console.error('Error fetching data:', error);
  }
});

function createDataSet(data) {
  return {
    labels: data.labels,
    datasets: [
      {
        label: data.datasets[0].label,
        backgroundColor: data.datasets[0].backgroundColor,
        data: data.datasets[0].data
      }
    ]
  };
}
</script>
