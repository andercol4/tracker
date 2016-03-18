class RecentSeizureChart extends React.Component{
	constructor(props){
		super(props)
		this.state = {seizureActivity: this.props.seizureActivity}
	}
	componentDidMount(){
		let labels = Object.keys(this.state.seizureActivity).reverse();
		let data = [];
		labels.forEach( label => {
			data.push(this.state.seizureActivity[label]);
		});
		data = {
    labels: labels,
    datasets: [
        {
          label: "My First dataset",
          fillColor: "rgba(255,82,82,0.25)",
          strokeColor: "rgba(220,220,220,0.8)",
          highlightFill: "rgba(255,82,82,0.5)",
          highlightStroke: "rgba(220,220,220,1)",
          data: data
        }
      ]
    };

  let ctx = document.getElementById("seizure_activity").getContext("2d");
	var myLineChart = new Chart(ctx).Line(data, {responsive:true});

	}
	componentWillUnmount(){
		if($("seizure_activity").length){
			this.chart.destroy();
		}
	}
	render(){
		return(
      <div>
        <span className='card-title'>
          Recent Seizures
        </span>
        <div>
          <canvas id='seizure_activity' />
        </div>
       </div>
    )
	}
}
