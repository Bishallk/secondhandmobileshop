<script>
    const  months= ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

    const SalesData = {
        labels: months,
        datasets: [{
            label: 'Sales',
            data: [65, 59, 80, 81, 56, 55, 40,100,34],
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1
        }]
    };
    const SalesConfig = {
        type: 'line',
        data: SalesData,
    };
    const SalesCtx = document.getElementById('myLineChart').getContext('2d');
    const myLineChart = new Chart(SalesCtx, SalesConfig);
</script>