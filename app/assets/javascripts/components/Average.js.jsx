class Average extends React.Component {
  constructor(props){
    super(props);
    this.refreshAverage = this.refreshAverage.bind(this);
    this.state = {averageTime: '', timePeriod: ''}
  }
  componentDidMount(){
    this.refreshAverage()
  }
  refreshAverage(time = 30, period = 'month'){
    $.ajax({
      url: '/average',
      type: 'GET',
      data: {time}
    }).success(data => {
      this.setState({averageTime: data.average, timePeriod: period})
    })
  }
  render(){
    return(
      <div>
        <span className='card-title'>
          Average Length in last {this.state.timePeriod}
        </span>
        <div className='card-content'>
          <h3 className='buffer'>
            {this.state.averageTime}
          </h3>
        </div>
        <div className='card-action'>
          <a onClick={() => this.refreshAverage(365, 'year')}>
            Last Year
          </a>
          <a onClick={() => this.refreshAverage(30, 'month')}>
            Last Month
          </a>
          <a onClick={() => this.refreshAverage(7, 'week')}>
            Last Week
          </a>
        </div>
      </div>
    )
  }
}
