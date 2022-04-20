HTMLWidgets.widget({

  name: 'widget',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        var chart = echarts.init(el);

        var option = {
          title: {
            text: 'Eu que fiz!'
          },
          tooltip: {},
          legend: {
            data: ['sales']
          },
          xAxis: {
            data: x.x
          },
          yAxis: {},
          series: [
            {
              name: 'sales',
              type: 'bar',
              data: x.y
            }
          ]
        };

        chart.setOption(option);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
