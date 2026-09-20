<template>
	<div class="home_view">
		<div class="projectTitle">欢迎使用 {{projectName}}</div>
		<div class="count_list">
			<el-collapse-transition v-if="btnAuth('yonghu','首页总数')">
				<el-card v-show="countTypeList.closeyonghuCountType" class="card_view">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								用户
							</div>
							<div class="card_head_right">
								<el-icon @click="countTypeClick('hiddenyonghuCountType')" class="showIcons"
									:class="countTypeList.hiddenyonghuCountType?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="countTypeClick('closeyonghuCountType')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
							
						</div>
					</template>
					<el-collapse-transition>
						<div class="count_item" v-show="countTypeList.hiddenyonghuCountType">
							<div class="count_title">用户总数</div>
							<div class="count_num">{{yonghuCount}}</div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('yuyueyisheng','首页总数')">
				<el-card v-show="countTypeList.closeyuyueyishengCountType" class="card_view">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								预约医生
							</div>
							<div class="card_head_right">
								<el-icon @click="countTypeClick('hiddenyuyueyishengCountType')" class="showIcons"
									:class="countTypeList.hiddenyuyueyishengCountType?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="countTypeClick('closeyuyueyishengCountType')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
							
						</div>
					</template>
					<el-collapse-transition>
						<div class="count_item" v-show="countTypeList.hiddenyuyueyishengCountType">
							<div class="count_title">预约医生总数</div>
							<div class="count_num">{{yuyueyishengCount}}</div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('quxiaoyuyue','首页总数')">
				<el-card v-show="countTypeList.closequxiaoyuyueCountType" class="card_view">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								取消预约
							</div>
							<div class="card_head_right">
								<el-icon @click="countTypeClick('hiddenquxiaoyuyueCountType')" class="showIcons"
									:class="countTypeList.hiddenquxiaoyuyueCountType?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="countTypeClick('closequxiaoyuyueCountType')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
							
						</div>
					</template>
					<el-collapse-transition>
						<div class="count_item" v-show="countTypeList.hiddenquxiaoyuyueCountType">
							<div class="count_title">取消预约总数</div>
							<div class="count_num">{{quxiaoyuyueCount}}</div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
		</div>
		<div class="card_list">
			<el-collapse-transition v-if="btnAuth('yonghu','首页统计')">
				<el-card v-show="cardTypeList.closeyonghuChartType1" class="card_view">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								用户
							</div>
							<div class="card_head_right">
								<el-icon @click="cardTypeClick('hiddenyonghuChartType1')" class="showIcons"
									:class="cardTypeList.hiddenyonghuChartType1?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="cardTypeClick('closeyonghuChartType1')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="card_item" v-show="cardTypeList.hiddenyonghuChartType1">
							<div id="yonghunianlingEchart1" style="width: 100%;height: 400px;"></div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('yonghu','首页统计')">
				<el-card v-show="cardTypeList.closeyonghuChartType2" class="card_view">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								用户
							</div>
							<div class="card_head_right">
								<el-icon @click="cardTypeClick('hiddenyonghuChartType2')" class="showIcons"
									:class="cardTypeList.hiddenyonghuChartType2?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="cardTypeClick('closeyonghuChartType2')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="card_item" v-show="cardTypeList.hiddenyonghuChartType2">
							<div id="yonghuxingbieEchart2" style="width: 100%;height: 400px;"></div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('yuyueyisheng','首页统计')">
				<el-card v-show="cardTypeList.closeyuyueyishengChartType1" class="card_view">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								预约医生
							</div>
							<div class="card_head_right">
								<el-icon @click="cardTypeClick('hiddenyuyueyishengChartType1')" class="showIcons"
									:class="cardTypeList.hiddenyuyueyishengChartType1?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="cardTypeClick('closeyuyueyishengChartType1')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="card_item" v-show="cardTypeList.hiddenyuyueyishengChartType1">
							<div id="yuyueyishengkeyuerenshuEchart1" style="width: 100%;height: 400px;"></div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('quxiaoyuyue','首页统计')">
				<el-card v-show="cardTypeList.closequxiaoyuyueChartType1" class="card_view">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								取消预约
							</div>
							<div class="card_head_right">
								<el-icon @click="cardTypeClick('hiddenquxiaoyuyueChartType1')" class="showIcons"
									:class="cardTypeList.hiddenquxiaoyuyueChartType1?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="cardTypeClick('closequxiaoyuyueChartType1')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="card_item" v-show="cardTypeList.hiddenquxiaoyuyueChartType1">
							<div id="quxiaoyuyuekeyuerenshuEchart1" style="width: 100%;height: 400px;"></div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
		</div>
	</div>
</template>

<script setup>
	import {
		inject,
		nextTick,
		ref,
		getCurrentInstance
	} from 'vue';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const projectName = context.$project.projectName
	const countTypeList = ref({
	})
	const getCountList=()=>{
		countTypeList.value.closeyonghuCountType = true
		countTypeList.value.hiddenyonghuCountType = true
		if(btnAuth('yonghu','首页总数')){
			getyonghuCount()
		}
		countTypeList.value.closeyuyueyishengCountType = true
		countTypeList.value.hiddenyuyueyishengCountType = true
		if(btnAuth('yuyueyisheng','首页总数')){
			getyuyueyishengCount()
		}
		countTypeList.value.closequxiaoyuyueCountType = true
		countTypeList.value.hiddenquxiaoyuyueCountType = true
		if(btnAuth('quxiaoyuyue','首页总数')){
			getquxiaoyuyueCount()
		}
	}
	const yonghuCount = ref(0)
	const getyonghuCount = () => {
		context?.$http({
			url:'yonghu/count',
			method: 'get'
		}).then(res=>{
			yonghuCount.value = res.data.data
		})
	}
	const yuyueyishengCount = ref(0)
	const getyuyueyishengCount = () => {
		context?.$http({
			url:'yuyueyisheng/count',
			method: 'get'
		}).then(res=>{
			yuyueyishengCount.value = res.data.data
		})
	}
	const quxiaoyuyueCount = ref(0)
	const getquxiaoyuyueCount = () => {
		context?.$http({
			url:'quxiaoyuyue/count',
			method: 'get'
		}).then(res=>{
			quxiaoyuyueCount.value = res.data.data
		})
	}
	const countTypeClick = (e) => {
		countTypeList.value[e] = !countTypeList.value[e]
	}
	const init=()=>{
		getCountList()
		getCardList()
	}
	//权限验证
	const btnAuth = (e,a)=>{
		return context?.$toolUtil.isAuth(e,a)
	}
	let echarts = inject("echarts")
	const cardTypeClick = (e) =>{
		cardTypeList.value[e] = !cardTypeList.value[e]
		setTimeout(()=>{
			getCardList()
		},1000)
	}
	const cardTypeList = ref({
		closeyonghuChartType1: true,
		hiddenyonghuChartType1: true,
		closeyonghuChartType2: true,
		hiddenyonghuChartType2: true,
		closeyuyueyishengChartType1: true,
		hiddenyuyueyishengChartType1: true,
		closequxiaoyuyueChartType1: true,
		hiddenquxiaoyuyueChartType1: true,
	})
	const getCardList = () => {
		if(btnAuth('yonghu','首页统计')){
			getyonghuChart1()
		}
		if(btnAuth('yonghu','首页统计')){
			getyonghuChart2()
		}
		if(btnAuth('yuyueyisheng','首页统计')){
			getyuyueyishengChart1()
		}
		if(btnAuth('quxiaoyuyue','首页统计')){
			getquxiaoyuyueChart1()
		}
	}
	const getyonghuChart1 = () => {
		nextTick(()=>{
			var nianlingEchart1 = echarts.init(document.getElementById("yonghunianlingEchart1"),'macarons');
			context?.$http({
				url: "yonghu/group/nianling",
				method: "get",
			}).then(obj=>{
				let res = obj.data.data
				let xAxis = [];
				let yAxis = [];
				let pArray = []
				for(let i=0;i<res.length;i++){
				    xAxis.push(res[i].nianling);
				    yAxis.push(parseFloat((res[i].total)));
				    pArray.push({
				        value: parseFloat((res[i].total)),
				        name: res[i].nianling
				    })
				}
				var option = {};
                option = {
                    title: {
                        text: '年龄统计',
                        left: 'center'
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left'
                    },
                    tooltip: {
						trigger: 'item',
						formatter: '{b} : {c} ({d}%)'
                    },
                    series: [
                        {
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            data: pArray,
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
									shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
				nianlingEchart1.clear()
				// 使用刚指定的配置项和数据显示图表。
				nianlingEchart1.setOption(option);
				//根据窗口的大小变动图表
				nianlingEchart1.resize();
			})
		})
	}
	const getyonghuChart2 = () => {
		nextTick(()=>{
			var xingbieEchart2 = echarts.init(document.getElementById("yonghuxingbieEchart2"),'macarons');
			context?.$http({
				url: "yonghu/group/xingbie",
				method: "get",
			}).then(obj=>{
				let res = obj.data.data
				let xAxis = [];
				let yAxis = [];
				let pArray = []
				for(let i=0;i<res.length;i++){
				    xAxis.push(res[i].xingbie);
				    yAxis.push(parseFloat((res[i].total)));
				    pArray.push({
				        value: parseFloat((res[i].total)),
				        name: res[i].xingbie
				    })
				}
				var option = {};
                option = {
                    title: {
                        text: '性别统计',
                        left: 'center'
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left'
                    },
                    tooltip: {
						trigger: 'item',
						formatter: '{b} : {c} ({d}%)'
                    },
                    series: [
                        {
                            type: 'pie',
                            radius: ['25%', '55%'],
                            center: ['50%', '60%'],
                            data: pArray,
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
									shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
				// 使用刚指定的配置项和数据显示图表。
				xingbieEchart2.clear()
				xingbieEchart2.setOption(option);
				//根据窗口的大小变动图表
				xingbieEchart2.resize();
			})
		})
	}
	const getyuyueyishengChart1 = () => {
		nextTick(()=>{
			var keyuerenshuEchart1 = echarts.init(document.getElementById("yuyueyishengkeyuerenshuEchart1"),'macarons');
			context?.$http({
				url: `yuyueyisheng/value/yonghuzhanghao/keyuerenshu`,
				method: "get",
			}).then(obj=>{
				let res = obj.data.data
				let xAxis = [];
				let yAxis = [];
				let pArray = []
				for(let i=0;i<res.length;i++){
				    xAxis.push(res[i].yonghuzhanghao);
				    yAxis.push(parseFloat((res[i].total)));
				    pArray.push({
				        value: parseFloat((res[i].total)),
				        name: res[i].yonghuzhanghao
				    })
				}
				var option = {};
                option = {
                    title: {
                        text: '预约次数',
                        left: 'center'
                    },
                    tooltip: {
                      trigger: 'item',
                      formatter: '{b} : {c}'
                    },
                    xAxis: {
                        type: 'category',
                        data: xAxis,
                        axisLabel: {
                            rotate: 40
                        }
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: yAxis,
                        type: 'bar'
                    }]
                };
				keyuerenshuEchart1.clear()
				// 使用刚指定的配置项和数据显示图表。
				keyuerenshuEchart1.setOption(option);
				//根据窗口的大小变动图表
				keyuerenshuEchart1.resize();
			})
		})
	}
	const getquxiaoyuyueChart1 = () => {
		nextTick(()=>{
			var keyuerenshuEchart1 = echarts.init(document.getElementById("quxiaoyuyuekeyuerenshuEchart1"),'macarons');
			context?.$http({
				url: `quxiaoyuyue/value/yonghuzhanghao/keyuerenshu`,
				method: "get",
			}).then(obj=>{
				let res = obj.data.data
				let xAxis = [];
				let yAxis = [];
				let pArray = []
				for(let i=0;i<res.length;i++){
				    xAxis.push(res[i].yonghuzhanghao);
				    yAxis.push(parseFloat((res[i].total)));
				    pArray.push({
				        value: parseFloat((res[i].total)),
				        name: res[i].yonghuzhanghao
				    })
				}
				var option = {};
                option = {
                    title: {
                        text: '取消次数',
                        left: 'center'
                    },
                    tooltip: {
                      trigger: 'item',
                      formatter: '{b} : {c}'
                    },
                    xAxis: {
                        type: 'category',
                        data: xAxis,
                        axisLabel: {
                            rotate: 40
                        }
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: yAxis,
                        type: 'bar'
                    }]
                };
				keyuerenshuEchart1.clear()
				// 使用刚指定的配置项和数据显示图表。
				keyuerenshuEchart1.setOption(option);
				//根据窗口的大小变动图表
				keyuerenshuEchart1.resize();
			})
		})
	}
	init()
</script>
<style lang="scss">
	.projectTitle{
		padding: 20px 0;
		margin: 20px 0 20px;
		font-weight: bold;
		display: flex;
		width: 100%;
		font-size: 24px;
		justify-content: center;
		align-items: center;
		height: auto;
	}

	.showIcons {
		transition: transform 0.3s;
		margin-right: 10px;
	}

	.showIcons1 {
		transform: rotate(-180deg);
	}
	
	// 总数盒子
	.count_list{
		padding: 0 0 20px;
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: flex-start;
		flex-wrap: wrap;
		// 总数card
		.card_view {
			border: 1px solid #19a97b30;
			border-radius: 0;
			box-shadow: 0px 0px 0px rgba(0,0,0,.12);
			margin: 0 1% 20px;
			width: 23%;
			box-sizing: border-box;
			height: auto;
			// card头部
			.el-card__header {
				border: 0px solid #19a97b30;
				background: #19a97b10;
				width: 100%;
				border-width: 0 0 1px;
				// 头部盒子
				.index_card_head {
					display: flex;
					width: 100%;
					justify-content: space-between;
					align-items: center;
					height: 10px;
					// 标题
					.card_head_title {
						color: #666;
						font-size: 14px;
					}
					// 按钮盒子
					.card_head_right {
						display: flex;
						align-items: center;
						// 按钮
						.el-icon {
							cursor: pointer;
							color: #aaa;
							font-size: 20px;
						}
					}
				}
			}
			// body
			.el-card__body {
				padding: 0;
				// body盒子
				.count_item{
					padding: 30px;
					text-align: center;
					// 总数标题
					.count_title{
						color: #333;
						font-size: 16px;
						line-height: 2;
					}
					// 总数数字
					.count_num{
						color: #c00;
						font-size: 30px;
						line-height: 2;
					}
				}
			}
		}
	}
	// 首页盒子
	.home_view {
		border: 1px solid #196eab;
		padding: 0px 20px;
		margin: 0 auto 40px;
		overflow: hidden;
		background: url(http://clfile.zggen.cn/20240203/09a98f4852104a599055d47953ef0a23.png) no-repeat center top / 100% 100% !important;
		width: calc(100% - 40px) !important;
		min-height: 100vh;
		height: auto;
	}
	// 统计图盒子
	.card_list {
		padding: 0 0 20px;
		display: flex;
		width: 100%;
		justify-content: space-between;
		align-items: flex-start;
		flex-wrap: wrap;
		// 统计图card
		.card_view {
			border: 1px solid #19a97b30;
			border-radius: 0;
			box-shadow: 0px 0px 0px rgba(0,0,0,.12);
			margin: 0 1% 30px;
			width: 48%;
			box-sizing: border-box;
			height: auto;
			// 头部
			.el-card__header {
				border: 0px solid #19a97b30;
				background: #19a97b10;
				width: 100%;
				border-width: 0 0 1px;
				// 头部盒子
				.index_card_head {
					display: flex;
					width: 100%;
					justify-content: space-between;
					align-items: center;
					height: 10px;
					// 标题
					.card_head_title {
						color: #f00;
						font-size: 14px;
					}
					// 按钮盒子
					.card_head_right {
						display: flex;
						align-items: center;
						// 按钮
						.el-icon{
							cursor: pointer;
							color: #aaa;
							font-size: 20px;
						}
					}
				}
			}
			// body
			.el-card__body {
				padding: 0;
				// body盒子
				.card_item{
					padding: 30px;
					text-align: center;
				}
			}
		}
	}
</style>
