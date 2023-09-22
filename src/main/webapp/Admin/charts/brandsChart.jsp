<script>
    const data = {
        labels: ['Apple', 'Xiaomi', 'Oppo','Huawei','Samsung','Vivo'],
        datasets: [{
            label: 'No of mobiles',
            data: [20,35,10,10,12,15],
            backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)',
                'rgb(75, 192, 192)',
                'rgb(153, 102, 255)',
                'rgb(255, 159, 64)',
                'rgb(102, 204, 0)',
            ],
            hoverOffset: 4
        }]
    };

    const config = {
        type: 'doughnut',
        data: data,
        maintainAspectRatio: true,
        responsive: true
    };

    const brandCtx = document.getElementById('myDoughnutChart').getContext('2d');
    const myDoughnutChart = new Chart(brandCtx, config);
</script>
