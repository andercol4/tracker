class Average extends React.Component {
  constructor(props){
    super(props);
    this.refreshAverage = this.refreshAverage.bind(this);
    this.state = {averageTime: ''}
  }
  componentDidMount(){
    this.refreshAverage()
  }
  refreshAverage(time = 30){
    $.ajax({
      url: '/average',
      type: 'GET',
      data: {time}
    }).success(data => {
      this.setState({averageTime: data.average})
    })
  }
  render(){
    return(
      <div>
        <span className='card-title'>
          Average Length
        </span>
        <div className='card-content'>
          <h3>
            {this.state.averageTime}
          </h3>
        </div>
      </div>
    )
  }
}
