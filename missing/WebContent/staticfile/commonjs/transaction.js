	$(function() {

			// jQuery Knobs
			$(".knob").knob();

			// jQuery UI Sliders
			$(".slider-sample1").slider({
				value : 100,
				min : 1,
				max : 500
			});
			$(".slider-sample2").slider({
				range : "min",
				value : 130,
				min : 1,
				max : 500
			});
			$(".slider-sample3").slider({
				range : true,
				min : 0,
				max : 500,
				values : [ 40, 170 ],
			});

			// jQuery Flot Chart
			var visitors = [ [ 1, ${reports[6].value} ], [ 2, ${reports[5].value} ], [ 3, ${reports[4].value} ], [ 4, ${reports[3].value} ],
					[ 5, ${reports[2].value} ], [ 6, ${reports[1].value} ], [ 7, ${reports[0].value} ] ];

			var plot = $.plot($("#statsChart"), [ {
				data : visitors,
				label : "流水"
			} ],
					{
						series : {
							lines : {
								show : true,
								lineWidth : 1,
								fill : true,
								fillColor : {
									colors : [ {
										opacity : 0.1
									}, {
										opacity : 0.13
									} ]
								}
							},
							points : {
								show : true,
								lineWidth : 2,
								radius : 3
							},
							shadowSize : 0,
							stack : true
						},
						grid : {
							hoverable : true,
							clickable : true,
							tickColor : "#f9f9f9",
							borderWidth : 0
						},
						legend : {
							// show: false
							labelBoxBorderColor : "#fff"
						},
						colors : ["#30a0eb" ],
						xaxis : {
							ticks : [ [ 1, '${reports[6].date}' ], [ 2, '${reports[5].date}' ], [ 3, '${reports[4].date}' ],
									[ 4, '${reports[3].date}' ], [ 5, '${reports[2].date}'], [ 6, '${reports[1].date}'],
									[ 7, '${reports[0].date}'] ],
							font : {
								size : 12,
								family : "Open Sans, Arial",
								variant : "small-caps",
								color : "#697695"
							}
						},
						yaxis : {
							ticks : 3,
							tickDecimals : 0,
							font : {
								size : 12,
								color : "#9da3a9"
							}
						}
					});

			function showTooltip(x, y, contents) {
				$('<div id="tooltip">' + contents + '</div>').css({
					position : 'absolute',
					display : 'none',
					top : y - 30,
					left : x - 50,
					color : "#fff",
					padding : '2px 5px',
					'border-radius' : '6px',
					'background-color' : '#000',
					opacity : 0.80
				}).appendTo("body").fadeIn(200);
			}

			var previousPoint = null;
			$("#statsChart")
					.bind(
							"plothover",
							function(event, pos, item) {
								if (item) {
									if (previousPoint != item.dataIndex) {
										previousPoint = item.dataIndex;

										$("#tooltip").remove();
										var x = item.datapoint[0].toFixed(0), y = item.datapoint[1]
												.toFixed(0);

										var month = item.series.xaxis.ticks[item.dataIndex].label;

										showTooltip(item.pageX, item.pageY,
												month + item.series.label
														+ ": " + y + "元");
									}
								} else {
									$("#tooltip").remove();
									previousPoint = null;
								}
							});
		});