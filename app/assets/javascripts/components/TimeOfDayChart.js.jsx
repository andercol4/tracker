class TimeOfDayChart extends React.Component{
	constructor(props){
		super(props)
    this.refreshToDChart = this.refreshToDChart.bind(this);
		this.state = {TimeOfDayChartData: this.props.TimeOfDayChartData, period: 'Month'}
	}
	componentDidMount(){
    this.refreshToDChart()
		let labels =[];
		let data = [];
		data = {
    labels: ['12:00am', '1:00am', '2:00am', '3:00am',
            '4:00am', '5:00am', '6:00am', '7:00am',
            '8:00am', '9:00am', '10:00am', '11:00am',
            '12:00pm', '1:00pm', '2:00pm', '3:00pm',
            '4:00pm', '5:00pm', '6:00pm', '7:00pm',
            '8:00pm', '9:00pm', '10:00pm', '11:00pm', ],
    datasets: [
        {
          label: "My First dataset",
          fillColor: "rgba(255,82,82,0.5)",
          strokeColor: "rgba(220,220,220,0.8)",
          highlightFill: "rgba(255,82,82,0.75)",
          highlightStroke: "rgba(220,220,220,1)",
          data: this.state.TimeOfDayChartData
        }
      ]
    };

  let ctx = document.getElementById("ToD_chart").getContext("2d");
	var myBarChart = new Chart(ctx).Bar(data, {responsive:true});
	}
  refreshToDChart(time = 30, period = 'Month'){
    $.ajax({
      url: '/time_of_day',
      type: 'GET',
      data: {time}
    }).success(data => {
      this.setState({TimeOfDayChartData: data, period})
    })
  }
	componentWillUnmount(){
		if($("ToD_chart").length){
			this.chart.destroy();
		}
	}
	render(){
		return(<div>
            <span className='card-title'>
              {this.state.period}
            </span>
            <div>
              <canvas id='ToD_chart' />
            </div>
					 </div>
         )
	}
}
// <div className='card-action'>
//   <a onClick={() => this.refreshToDChart(365, 'Year')}>
//     Last Year
//   </a>
//   <a onClick={() => this.refreshToDChart(30, 'Month')}>
//     Last Month
//   </a>
//   <a onClick={() => this.refreshToDChart(7, 'Week')}>
//     Last Week
//   </a>
// </div>
