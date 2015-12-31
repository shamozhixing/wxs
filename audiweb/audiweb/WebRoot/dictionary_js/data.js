//首页地图上的点
var map = 
[
	//城市0 公路1 山路2 雪地3
	//一级的所有点
	{
		"id":12,
		"leave":2,
		"enName":"shenyang",
		"cnName":"沈阳",
		"x":2624,
		"y":1509,
		"type":"013"
	},
	{
		"id":1,
		"leave":1,
		"enName":"beijing",
		"cnName":"北京",
		"x":2333,
		"y":1582,
		"type":"0123"
	},
	{
		"id":19,
		"leave":1,
		"enName":"xian",
		"cnName":"西安",
		"x":2004,
		"y":1900,
		"type":"01"
	},
	{
		"id":31,
		"leave":1,
		"enName":"chengdu",
		"cnName":"成都",
		"x":1750,
		"y":2082,
		"type":"012"
	},
	{
		"id":15,
		"leave":1,
		"enName":"wuhan",
		"cnName":"武汉",
		"x":2207,
		"y":2083,
		"type":"012"
	},
	{
		"id":3,
		"leave":1,
		"enName":"shanghai",
		"cnName":"上海",
		"x":2551,
		"y":2048,
		"type":"01"
	},
	{
		"id":23,
		"leave":1,
		"enName":"guangzhou",
		"cnName":"广州",
		"x":2206,
		"y":2431,
		"type":"012"
	},
	
	//二级的所有点
	{
		"id":10,
		"leave":2,
		"enName":"haerbin",
		"cnName":"哈尔滨",
		"x":2843,
		"y":1230,
		"type":"013"
	},
	{
		"id":4,
		"leave":2,
		"enName":"chongqing",
		"cnName":"重庆",
		"x":1920,
		"y":2132,
		"type":"012"
	},
	{
		"id":20,
		"leave":2,
		"enName":"nanjing",
		"cnName":"南京",
		"x":2447,
		"y":1995,
		"type":"012"
	},
	{
		"id":34,
		"leave":2,
		"enName":"taibei",
		"cnName":"台北",
		"x":2551,
		"y":2354,
		"type":"012"
	},
	
	//三级的所有的点
	{
		"id":11,
		"leave":1,
		"enName":"changchun",
		"cnName":"长春",
		"x":2749,
		"y":1379,
		"type":"013"
	},
	{
		"id":5,
		"leave":3,
		"enName":"huhehaote",
		"cnName":"呼和浩特",
		"x":2117,
		"y":1546,
		"type":"01"
	},
	{
		"id":2,
		"leave":3,
		"enName":"tianjin",
		"cnName":"天津",
		"x":2382,
		"y":1638,
		"type":"01"
	},
	{
		"id":8,
		"leave":3,
		"enName":"yinchuan",
		"cnName":"银川",
		"x":1904,
		"y":1685,
		"type":"012"
	},
	{
		"id":17,
		"leave":3,
		"enName":"taiyuan",
		"cnName":"太原",
		"x":2169,
		"y":1699,
		"type":"01"
	},
	{
		"id":13,
		"leave":3,
		"enName":"shijiazhuang",
		"cnName":"石家庄",
		"x":2274,
		"y":1686,
		"type":"01"
	},
	{
		"id":29,
		"leave":3,
		"enName":"xining",
		"cnName":"西宁",
		"x":1684,
		"y":1765,
		"type":"01"
	},
	{
		"id":28,
		"leave":3,
		"enName":"lanzhou",
		"cnName":"兰州",
		"x":1804,
		"y":1789,
		"type":"01"
	},
	{
		"id":18,
		"leave":3,
		"enName":"jinan",
		"cnName":"济南",
		"x":2353,
		"y":1789,
		"type":"01"
	},
	{
		"id":14,
		"leave":3,
		"enName":"zhengzhou",
		"cnName":"郑州",
		"x":2207,
		"y":1877,
		"type":"01"
	},
	{
		"id":24,
		"leave":3,
		"enName":"hefei",
		"cnName":"合肥",
		"x":2375,
		"y":2035,
		"type":"01"
	},
	{
		"id":21,
		"leave":3,
		"enName":"hangzhou",
		"cnName":"杭州",
		"x":2496,
		"y":2096,
		"type":"012"
	},
	{
		"id":25,
		"leave":3,
		"enName":"nanchang",
		"cnName":"南昌",
		"x":2318,
		"y":2174,
		"type":"01"
	},
	{
		"id":16,
		"leave":3,
		"enName":"changsha",
		"cnName":"长沙",
		"x":2174,
		"y":2207,
		"type":"012"
	},
	{
		"id":27,
		"leave":3,
		"enName":"guiyang",
		"cnName":"贵阳",
		"x":1904,
		"y":2279,
		"type":"012"
	},
	{
		"id":22,
		"leave":3,
		"enName":"fuzhou",
		"cnName":"福州",
		"x":2462,
		"y":2308,
		"type":"012"
	},
	{
		"id":26,
		"leave":3,
		"enName":"kunming",
		"cnName":"昆明",
		"x":1714,
		"y":2368,
		"type":"012"
	},
	{
		"id":9,
		"leave":3,
		"enName":"nanning",
		"cnName":"南宁",
		"x":2002,
		"y":2445,
		"type":"01"
	},
	{
		"id":33,
		"leave":3,
		"enName":"aomei",
		"cnName":"澳门",
		"x":2183,
		"y":2484,
		"type":"01"
	},
	{
		"id":32,
		"leave":3,
		"enName":"xianggang",
		"cnName":"香港",
		"x":2261,
		"y":2483,
		"type":"012"
	},
	{
		"id":30,
		"leave":3,
		"enName":"haikou",
		"cnName":"海口",
		"x":2068,
		"y":2588,
		"type":"012"
	}
	,
	{
		"id":6,
		"leave":3,
		"enName":"wulumuqi",
		"cnName":"乌鲁木齐",
		"x":993,
		"y":1639,
		"type":"012"
	}
];

var actionMap = [
	{
		"id":1,
		"enName":"xgll",
		"cnName":"香格里拉",
		"x":1627,
		"y":2210,
		"url":""
	},
	
	//活动的
	{
		"id":2,
		"enName":"tc",
		"cnName":"腾冲",
		"x":1580,
		"y":2337,
		"url":""
	}
];




//定义菜单的数据
var menuData = 
[
	{
		"class":"menu_item",
		"text":"quattro®全境地图",
		"url":"index.html",
		"target":"_self"
	},
	{
		"class":"menu_item",
		"text":"quattro®车型",
		"url":"car_q5.html?car=q5",
		"target":"_self"
	},
	{
		"class":"menu_item",
		"text":"quattro®技术和历史",
		"url":"technology.html",
		"target":"_self"
	},
	/*
	{
		"class":"menu_item",
		"text":"精彩瞬间",
		"url":"download.html",
		"target":"_self"
	},
	*/
	{
		"class":"menu_item",
		"text":"精彩活动",
		"url":"active.html",
		"target":"_self"
	},
	
	{
		"class":"menu_item",
		"text":"预约试驾",
		"url":"driver.html",
		"target":"_self"
	}
];

//车型页面的导航
var carNavData = 
[
	{
		"class":"a4",
		"text":"A4",
		"url":"car.html?car=a4"
	},
	{
		"class":"a5",
		"text":"A5",
		"url":"car.html?car=a5"
	},
	{
		"class":"a6",
		"text":"A6",
		"url":"car.html?car=a6"
	},
	{
		"class":"a7",
		"text":"A7",
		"url":"car.html?car=a7"
	},
	{
		"class":"a8",
		"text":"A8",
		"url":"car.html?car=a8"
	},
	{
		"class":"q3",
		"text":"Q3",
		"url":"car.html?car=q3"
	},
	{
		"class":"q5",
		"text":"Q5",
		"url":"car_q5.html?car=q5"
	},
	{
		"class":"q7",
		"text":"Q7",
		"url":"car.html?car=q7"
	},
	{
		"class":"tt",
		"text":"TT",
		"url":"car.html?car=tt"
	},
	{
		"class":"r8",
		"text":"R8",
		"url":"car.html?car=r8"
	}
];


//车型页面的数据 不包括q5
var carData = 
{
	"a4":
	{
		"pageTitle":"奥迪A4",
		"carModel":
		[
			{
				"name":"A4L",
				"intro":"发动机型式：V型6缸/4气门电控燃油直接喷射/机械增压/AVS系统<br />变速器：7速S tronic® 双离合变速器<br />综合油耗：9.1L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a4/a4l.html",
				"image":"images/iPhone/A4/2.png"
			},
			{
				"name":"A4 allroad quattro",
				"intro":"发动机型式：直列4缸/4气阀技术/燃油直接喷射式汽油机/废气涡轮增压/奥迪两级可变正时控制系统（AVS）<br />变速器：7档双离合变速器 S tronic®<br />综合油耗：7.3L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a4/a4_allroad.html",
				"image":"images/iPhone/A4/1.png"
			}
		]
	}
	,
	"a5":
	{
		"pageTitle":"奥迪A5",
		"carModel":
		[
			{
				"name":"A5 Sportback",
				"intro":"发动机型式：V型6缸/燃油直接喷射式汽油机/机械增压/奥迪两级可变正时控制系统（AVS）<br />变速器：7档双离合变速器 S tronic®<br />综合油耗：9.6L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a5/a5sb.html",
				"image":"images/iPhone/A5/AudiA5Sportback.png"
			},
			{
				"name":"A5 Coupé",
				"intro":"发动机型式：V型6缸/燃油直接喷射式汽油机/机械增压/奥迪两级可变正时控制系统（AVS）<br />变速器：7档双离合变速器 S tronic®<br />综合油耗：9.4L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a5/a5coupe.html",
				"image":"images/iPhone/A5/AudiA5Coupe.png"
			}
			,
			{
				"name":"A5 Cabriolet",
				"intro":"发动机型式：直列4缸/燃油直接喷射式汽油机/废气涡轮增压/奥迪两级可变正时控制系统（AVS）<br />变速器：7档双离合变速器 S tronic®<br />综合油耗：7.5L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a5/a5cabrio.html",
				"image":"images/iPhone/A5/AudiA5Cabriolet.png"
			}
			,
			{
				"name":"S5 Sportback",
				"intro":"发动机型式：V型6缸/燃油直接喷射式汽油机/机械增压<br />变速器：7档双离合变速器 S tronic®<br />综合油耗：9.8L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a5/s5sb.html",
				"image":"images/iPhone/A5/AudiS5Sportback.png"
			}
			,
			{
				"name":"S5 Coupé",
				"intro":"发动机型式：V型6缸/燃油直接喷射式汽油机/机械增压<br />变速器：7档双离合变速器 S tronic®<br />综合油耗：9.6L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a5/s5coupe.html",
				"image":"images/iPhone/A5/AudiS5Coupe.png"
			}
			,
			{
				"name":"S5 Cabriolet",
				"intro":"发动机型式：V型6缸/燃油直接喷射式汽油机/机械增压<br />变速器：7档双离合变速器 S tronic®<br />综合油耗： 9.9L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a5/s5cabrio.html",
				"image":"images/iPhone/A5/AudiS5Cabriolet.png"
			}
			,
			{
				"name":"RS5 Coupé",
				"intro":"发动机型式：V型8缸/燃油直接喷射式汽油机<br />变速器：7档双离合变速箱 Stronic®<br />综合油耗：11.1L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a5/rs5Coupe.html",
				"image":"images/iPhone/A5/AudiRS5Coupe.png"
			}
		]
	}
	,
	"a6":
	{
		"pageTitle":"奥迪A6",
		"carModel":
		[
			{
				"name":"A6L",
				"intro":"发动机型式：V型6缸/4气阀技术/燃油直接喷射式汽油机/机械增压<br />变速器：7速双离合变速器(S tronic)<br />综合油耗：9.2L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a6/a6l.html",
				"image":"images/iPhone/A6/AudiA6L.png"
			}
			,
			{
				"name":"S6",
				"intro":"发动机型式：V型8缸涡轮增压，汽油直接喷射<br />变速器：7速S tronic®自动变速箱<br />综合油耗：9.6L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a6/s6.html",
				"image":"images/iPhone/A6/AudiS6.png"
			}
		]
	}
	,
	"a7":
	{
		"pageTitle":"奥迪A7",
		"carModel":
		[
			{
				"name":"A7 Sportback",
				"intro":"发动机型式：V型6缸机械增压，汽油直接喷射<br />变速器：7速S-tronic®自动变速箱 <br />综合油耗：9.1L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a7/a7sb.html",
				"image":"images/iPhone/A7/AudiA7Sportback.png"
			}
			,
			{
				"name":"S7 Sportback",
				"intro":"发动机型式：V型8缸涡轮增压，汽油直喷<br />变速器：7速S tronic®自动变速箱 <br />综合油耗：9.7L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a7/s7_sportback.html",
				"image":"images/iPhone/A7/AudiS7Sportback.png"
			}
		]
	}
	,
	"a8":
	{
		"pageTitle":"奥迪A8",
		"carModel":
		[
			{
				"name":"A8L",
				"intro":"发动机型式：V-8 TFSI®<br />变速箱：8速Tiptronic®手/自一体式变速器，带动态换档程序DSP及运动程序 <br />综合油耗：10.6L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a8/a8l.html",
				"image":"images/iPhone/A8/AudiA8L.png"
			}
			,
			{
				"name":"A8L W12",
				"intro":"发动机型式：W-12 FSI® <br />变速箱：8速Tiptronic®手/自一体式变速器，带动态换挡程序DSP及运动程序<br />综合油耗：12.5L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a8/a8w12.html",
				"image":"images/iPhone/A8/AudiA8LW12.png"
			}
			,
			{
				"name":"S8",
				"intro":"发动机型式：V-8 TFSI® <br />变速箱：8速Tiptronic®手/自一体式变速器，带动态换挡程序DSP及运动程序<br />综合油耗：11.0L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/a8/s8.html",
				"image":"images/iPhone/A8/AudiS8.png"
			}
		]
	}
	,
	"q3":
	{
		"pageTitle":"奥迪Q3",
		"carModel":
		[
			{
				"name":"Q3",
				"intro":"发动机型式：四缸16气门2.0L155KW汽油直喷涡轮增压发动机<br />变速器：七档双离合变速器Stronic ®<br />综合油耗：7.7L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/q3/q3.html",
				"image":"images/iPhone/Q3/AudiQ3.png"
			}
		]
	}
	,
	"q7":
	{
		"pageTitle":"奥迪Q7",
		"carModel":
		[
			{
				"name":"Q7",
				"intro":"发动机型式：V型6缸涡轮增压柴油发动机，燃油共轨喷射系统<br />变速器：8速手动／自动一体式变速器 tiptronic®<br />综合油耗：7.4L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/q7/q7.html",
				"image":"images/iPhone/Q7/q7.png"
			}
		]
	}
	,
	"tt":
	{
		"pageTitle":"奥迪TT",
		"carModel":
		[
			{
				"name":"TT Coupé",
				"intro":"发动机型式：直列4缸/4气阀技术/燃油直接喷射/双顶置凸轮轴/可变进气相位/废气涡轮增压/AVS系统<br />变速器：6速双离合器直接换档S tronic®变速器<br />综合油耗：8.0L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/tt/ttcoupe.html",
				"image":"images/iPhone/TT/AudiTTCoupe.png"
			}
			,
			{
				"name":"TT Roadster",
				"intro":"发动机型式：直列4缸/4气阀技术/燃油直接喷射/双顶置凸轮轴/废气涡轮增压/AVS系统<br />变速器：6速双离合器直接换档S tronic®变速器<br />综合油耗：8.0L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/tt/ttroadster.html",
				"image":"images/iPhone/TT/AudiTTRoadster.png"
			}
			,
			{
				"name":"TTS Coupé",
				"intro":"发动机型式：直列4缸/4气阀技术/燃油直接喷射/双顶置凸轮轴/可变进气相位/废气涡轮增压<br />变速器：6速双离合器直接换档S tronic®变速箱<br />综合油耗：7.9L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/tt/ttscoupe.html",
				"image":"images/iPhone/TT/AudiTTSCoupe.png"
			}
			,
			{
				"name":"TTS Roadster",
				"intro":"发动机型式：直列4缸/4气阀技术/燃油直接喷射/双顶置凸轮轴/可变进气相位/废气涡轮增压 <br />变速器：6速双离合器直接换档S tronic®变速箱 <br />综合油耗：8.0L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/tt/tts_roadster.html",
				"image":"images/iPhone/TT/AudiTTSRoadster.png"
			}
		]
	},
	"r8":
	{
		"pageTitle":"奥迪R8",
		"carModel":
		[
			{
				"name":"R8 Coupé ",
				"intro":"发动机型式：中置，高速， V-10 5.2升燃油直接喷射<br />变速箱：R tronic®<br />综合油耗：14.9L/100km ",
				"url":"http://m.audi.cn/cn/mobile/zh/models/r8/r8.html",
				"image":"images/iPhone/R8/AudiR8Coupe.png"
			}
			,
			{
				"name":"R8 Spyder",
				"intro":"发动机型式：中置，高速， V-10 5.2升燃油直接喷射<br />变速箱：R tronic®<br />综合油耗：15.2L/100km",
				"url":"http://m.audi.cn/cn/mobile/zh/models/r8/r8spyder.html",
				"image":"images/iPhone/R8/AudiR8Spyder.png"
			}
		]
	}
}





//历史页面的数据
var historyData = 
[
	{
		"id":"1",
		"title":"1980-1982",
		"image":"images/history/1.jpg",
		"years":
		[
			{
				"title":"1980：quattro®的世界首发",
				"text":"奥迪在日内瓦车展上推出装备全时四驱系统的高性能跑车——奥迪quattro®，随即引起了一片轰动。当时只有少量“舶来”车型和某些沉重的越野车型才配备四驱系统。",
				"image":""
			}
			,
			{
				"title":"1981：率先冲过终点的赛车",
				"text":"在首次正式参加拉力赛前，奥迪quattro®就已展示了出色的性能。在欧洲拉力锦标赛上，芬兰车手汉努•米克拉（HannuMikkola）驾驶这款赛车以领先获胜者半小时的“非官方”成绩率先冲线。",
				"image":""
			}
			,
			{
				"title":"1982：奥迪quattro®进入量产时代",
				"text":"奥迪80 quattro®是装备全时四驱系统的首款量产车型。它的出现，标志着所有驾驶者均可从quattro®全时四驱系统中获益。该年度的最大亮点是奥迪在世界汽车拉力锦标赛（World Rally Championship）上夺得厂商冠军，米歇尔•穆顿（Michèle Mouton）也成为首位在世界汽车拉力锦标赛中夺冠的女性车手。当时她所驾驶的赛车便是奥迪quattro®。",
				"image":""
			}
		]
	}
	,
	{
		"id":"2",
		"title":"1983-1985",
		"image":"images/history/2.jpg",
		"years":
		[
			{
				"title":"1983：汉努•米克拉驾驶奥迪quattro®赛车获得冠军",
				"text":"凭借技压全场的表现，汉努•米克拉荣膺世界汽车拉力锦标赛车手冠军，而奥迪车队则获得厂商亚军。该年度的另一亮点是奥迪推出了Sport quattro®，时至今日它仍是广受收藏家们追捧的热门车型。",
				"image":""
			}
			,
			{
				"title":"1984：登上成功的巅峰",
				"text":"当年，奥迪赢得世界汽车拉力锦标赛厂商冠军，而斯蒂格•布隆奎斯特（StigBlomqvist）驾驶奥迪quattro®赛车夺得车手世界冠军。奥迪被授予“1984 年度赛车”称号，以表彰其在四轮驱动技术领域所做出的开创性贡献。",
				"image":""
			}
			,
			{
				"title":"1985：奥迪问鼎派克峰爬山赛桂冠",
				"text":"本年度米歇尔•穆顿驾驶奥迪Sport quattro®赛车，在美国科罗拉多州举行的著名派克峰（Pikes Peak，海拔 4302 米）爬山赛中勇夺桂冠。而车手老博比•乌瑟（Bobby Unser Sr.）和沃尔特•罗尔（Walter Röhrl） 则分别在1986和1987年延续不败战绩，为奥迪车队勇夺三连冠。",
				"image":""
			}
		]
	}
	,
	{
		"id":"3",
		"title":"1986-1988",
		"image":"images/history/3.jpg",
		"years":
		[
			{
				"title":"1986：托森中央差速器诞生",
				"text":"托森中央差速器可完全根据驾驶情况，在车辆前后轴之间无间断自动分配发动机功率。因此，路面所发生的任何变化都能获得车辆做出的动态响应。例如，在加速状态下，当后轴承受更多负荷时便可得到相应动力补偿，无需驾驶员进行任何干预。",
				"image":""
			}
			,
			{
				"title":"1987：应用于全系列车型",
				"text":"装备quattro®全时四驱系统的车型在奥迪不是个案。自推出至今，奥迪一直在推广该系统的广泛应用，每一车型系列至少推出一款quattro®车型。目前共推出20款quattro®车型供客户选择。",
				"image":""
			}
			,
			{
				"title":"1988：全时四驱系统装备全尺寸轿车",
				"text":"奥迪推出V8车型——世界上装备全时四驱系统的首款全尺寸轿车。由于采用了出色的quattro®动力传动系统，奥迪V8能够提供令人惊叹的驱动力、卓越的驾乘动力以及更高的安全保障。",
				"image":""
			}
		]
	}
	,
	{
		"id":"4",
		"title":"1989-1991",
		"image":"images/history/4.jpg",
		"years":
		[
			{
				"title":"1989：汉斯•乔西姆•斯塔克成为IMSA-GTO系列赛最成功车手",
				"text":"奥迪在上年的泛美锦标赛（TransAm Championship）中还证明了quattro®在高速沥青路面上的出色性能。1989年，汉斯•乔西姆•斯塔克驾驶自己的奥迪90 quattro®在IMSA- GT系列赛中取得骄人战绩。他在该赛季中九次获胜，成为最成功的车手。",
				"image":""
			}
			,
			{
				"title":"1990：quattro®诞生10周年",
				"text":"奥迪已在全球范围内生产超过20万辆配备quattro® 全时四驱系统的轿车，充分证明了这一革命性创意的成功之处。奥迪于同年10月推出奥迪Ur-quattro®后续车型S2。在1991年5月17日正式停产前，奥迪共生产了11452辆Ur-quattro®。生产的最后一批车均成为奥迪古董车收藏的一部分。",
				"image":""
			}
			,
			{
				"title":"1991：在 DTM房车锦标赛中再次夺冠",
				"text":"汉斯•乔西姆•斯塔克在前一年的DTM房车锦标赛中刚刚驾驶奥迪V8 quattro®赢得桂冠，弗兰克•比拉亚（Frank Biela）就在1991年又延续了这一荣誉。装备quattro® 全时四驱系统的奥迪V8赛车还配备了带分动箱的行星齿轮中央差速器、电子多片式差速锁以及托森后差速器。",
				"image":""
			}
		]
	}
	,
	{
		"id":"5",
		"title":"1992-1994",
		"image":"images/history/5.jpg",
		"years":
		[
			{
				"title":"1992：quattro®，一项发扬广大的技术",
				"text":"奥迪 quattro® 车型在赛车运动中取得的成功引发了大量关注，quattro® 全时四驱系统的优势留在越来越多的汽车驾驶员心中。到1992年，每12位用户中就有一位会选择奥迪的全时四驱系统车型。",
				"image":""
			}
			,
			{
				"title":"1993：法国厂商和驾驶员双料冠军",
				"text":"奥迪凭借奥迪 80 quattro® 赛车在法国房车锦标赛中10次获胜，勇夺厂商冠军。与此同时，奥迪车手弗兰克•比拉亚夺得法国房车锦标赛车手冠军。一年之后，奥迪在意大利再次夺得厂商和车手双料冠军。",
				"image":""
			}
			,
			{
				"title":"1994：带有电子差速锁的 quattro®",
				"text":"奥迪在前后轴上采用电子差速锁（EDL）。该系统使得单个旋转的车轮可以进行制动。与前后轴的可变扭矩分配功能结合使用时，电子差速锁可以提供非凡的驱动力。",
				"image":""
			}
		]
	}
	,
	{
		"id":"6",
		"title":"1995-1997",
		"image":"images/history/6.jpg",
		"years":
		[
			{
				"title":"1995：quattro®+涡轮增压直喷全球首发",
				"text":"奥迪A6 quattro® 装备的全时四驱系统被证明是理想的动力传动系统。奥迪随后在国际汽车联合会世界房车锦标赛中赢得厂商和车手双料冠军。",
				"image":""
			}
			,
			{
				"title":"1996：奥迪成为房车锦标赛七冠王",
				"text":"奥迪车队在1996赛季取得前所未有的成功：奥迪 quattro® 赛车征战在德国、意大利、英国、比利时、西班牙、澳大利亚和南非等地举行的房车锦标赛，赛季结束时，所有国家的获胜者只有一个：奥迪。",
				"image":""
			}
			,
			{
				"title":"1997：独一无二的组合",
				"text":"奥迪是世界上首家销售同时装备全时四驱系统和电子稳定程序（ESP）的车型的汽车制造商。quattro® 与 ESP 的组合意味着在提供相同的高操控及高性能外，还能提升驾乘的安全性。",
				"image":""
			}
		]
	}
	,
	{
		"id":"7",
		"title":"1998-2000",
		"image":"images/history/7.jpg",
		"years":
		[
			{
				"title":"1998：电控液压多片离合器首次亮相",
				"text":"电控液压多片离合器在奥迪 TT Coupe 跑车上首次亮相。它在配备横置发动机的车型上具备中央差速器的功能，而且能像在所有 quattro® 车型上一样，在前后轴之间不断灵活地分配发动机输出的功率。",
				"image":""
			}
			,
			{
				"title":"1999：奥迪 A3 quattro® 上市",
				"text":"奥迪推出奥迪A3 quattro®，完善了当前的quattro®车型系列。现在，奥迪的驾驶者可从所有车型类别上配备的全时四驱系统中获益。",
				"image":""
			}
			,
			{
				"title":"2000：quattro®诞生 20 周年",
				"text":"自奥迪推出quattro®全时四驱系统至今，已有超过82万名驾驶员选择奥迪全时四驱系统。这一巨大优势表明奥迪quattro®正日益受到青睐。目前装备quattro®全时四驱系统的车型占18%，而搭载动力更强劲引擎的车型中，这一比例则更高。",
				"image":""
			}
		]
	}
	,
	{
		"id":"8",
		"title":"2001-2003",
		"image":"images/history/8.jpg",
		"years":
		[
			{
				"title":"2001：100万辆quattro®轿车",
				"text":"奥迪庆祝其装备quattro®全时四轮驱动系统的第100万辆轿车下线。在同一年，奥迪推出奥迪A8的加长版车型奥迪A8 L。奥迪A8系列是奥迪同时期动力最强劲的量产车，自然也配备了quattro®全时四轮驱动系统，作为其标准配置。",
				"image":""
			}
			,
			{
				"title":"2002：全新维度的quattro®",
				"text":"奥迪A6 quattro®被汽车杂志《Auto Bildallesallrad》的读者和记者评选为2002年度四轮驱动车型。继装备八缸发动机的奥迪allroadquattro®车型在日内瓦完成全球首发后，采用quattro®全时四驱技术、铝合金底盘和自适应性空气悬架系统的全新奥迪A8代表了驱动系统设计的最新技术风向。",
				"image":""
			}
			,
			{
				"title":"2003：quattro®全时四驱系统的未来",
				"text":"奥迪在底特律、日内瓦和法兰克福车展上展出三项开创性研究。它们以采用了能够引领奥迪品牌走向未来的诸多技术而令观众为之敬佩。所有三项研究均提及以车型命名的某项具体技术，即Audi Pikes Peak quattro®、Audi Nuvolariquattro®以及Audi Le Mans quattro®概念车。",
				"image":""
			}
		]
	}
	,
	{
		"id":"9",
		"title":"2004-2006",
		"image":"images/history/9.jpg",
		"years":
		[
			{
				"title":"2004：重要的一年",
				"text":"到2004年末，奥迪共生产约200万辆配备quattro®全时四驱系统的轿车。与此同时，还推出了共10款全新车型，涵盖从奥迪A3 Sportback到12缸奥迪A8的相关车型。根据发动机型号的不同，quattro®全时四驱系统在这些车型上可作为标准配置或选件。",
				"image":""
			}
			,
			{
				"title":"2005：quattro®诞生25周年",
				"text":"为庆祝quattro®诞生25周年，奥迪在公司总部前的广场上搭建了滑雪台和冰场。由于采用了quattro®全时四驱系统，全新奥迪RS4在一场引人入胜的展示中轻松登顶。此外，装备quattro®全时四驱系统的奥迪高性能Q7 SUV车型也在法兰克福国际车展上首次亮相，尚未正式开始销售即获颁“金方向盘”大奖。",
				"image":""
			}
		]
	}
	,
	{
		"id":"10",
		"title":"2007-2008",
		"image":"images/history/10.jpg",
		"years":
		[
			{
				"title":"2007：奥迪R8与A5 Coupé",
				"text":"一款卓尔不凡的跑车以奥迪R8的名字登上舞台，专门作为一款quattro®车型推出。此外，quattro®全时四驱系统也是时尚优雅的奥迪A5 Coupé车型上令人艳羡的特征。",
				"image":""
			}
			,
			{
				"title":"2008：奥迪 Q5",
				"text":"又一款纯正的quattro®车型。自首次亮相以来，奥迪Q5一直是四轮驱动车型常规对比测试的获胜者，排在《汽车画刊》2009年评选的榜首，位于丰田、宝马和梅赛德斯-奔驰等品牌之前。",
				"image":""
			}
		]
	}
	,
	{
		"id":"11",
		"title":"2009至今",
		"image":"images/history/11.jpg",
		"years":
		[
			{
				"title":"两款全新quattro®全时四驱系统",
				"text":"奥迪配备运动差速器的全新quattro®全时四驱系统延续了以往的传统。该技术于2008年在奥迪S4和奥迪A4上推出，随后在2009年用于奥迪A5和奥迪S5。配备运动差速器的quattro®全时四驱系统是奥迪全新A8 V8 TDI车型的标准配置。该驱动系统的另一重大发展是采用冠齿中央差速器和扭矩矢量分配系统的全新quattro®全时四驱系统，其于2010年在奥迪RS 5车型上首次亮相。",
				"image":""
			}
		]
	}
];