class Average extends React.Component {
  constructor(props){
    super(props);
    this.state = {averageTime: ''}
  }
  componentDidMount(){
    refreshAverage(30)
  }
  refreshAverage(length = 30){
    $.ajax({
      url: '/average',
      type: 'GET',
      data: {length}
    }).success(data => {
      this.setState({averageTime: data})
    })
  }
  render(){
    return(
      <div>
        <span className='card-title'>
          Average Length
        </span>
        <div className='card-content'>
          <h4>
            {this.state.average}
          </h4>
        </div>
      </div>
    )
  }
}
