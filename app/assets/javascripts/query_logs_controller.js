class QueryLogController {
  static index() {
    const timeInterval = 10000
    this._refreshPageOverInterval(timeInterval)
  }

  // private

  static _refreshPageOverInterval(timeInterval) {
    setInterval(function() {
      $.ajax({
        url:      Routes.query_logs_path(),
        type:     'get',
        dataType: 'script'
      })
    }, timeInterval);
  }
}
