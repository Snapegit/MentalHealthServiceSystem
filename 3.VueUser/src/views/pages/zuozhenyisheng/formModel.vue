<template>
	<div class="app-contain" :style='{"padding":"20px 20px","margin":"20px auto 40px","alignItems":"flex-start","flexWrap":"wrap","background":"none","display":"flex","width":"1200px","position":"relative","justifyContent":"space-between"}'>
		<div class="back_view">
			<el-button class="back_btn" @click="backClick" type="primary">返回</el-button>
		</div>
		<div class="bread_view">
			<el-breadcrumb separator=">" class="breadcrumb">
				<el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">首页</el-breadcrumb-item>
				<el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
			</el-breadcrumb>
		</div>
		<div class="detail_view">
			<div class="swiper_view">
				<mySwiper :data="bannerList" :type="3"
				:loop="false"
				:navigation="false"
				:pagination="true"
				:paginationType="1"
				:scrollbar="false"
				:slidesPerView="1"
				:spaceBetween="20"
				:autoHeight="false"
				:centeredSlides="false"
				:freeMode="false"
				:effectType="1"
				:direction="horizontal"
				:autoplay="true"
				:slidesPerColumn="1">
				<template #default="scope">
					<img :style='{"objectFit":"contain","width":"100%","height":"480px"}' :src="scope.row?$config.url + scope.row:''">
				</template>
			</mySwiper>
			</div>
			
			<div class="info_view">
				<div class="title_view">
					<div class="detail_title">
						{{detail.yishengxingming}}
					</div>
					<div class="follow" v-if="!collectType" @click="collectClick(1)">
						<i class="iconfont icon-likeline1"></i>
						<span>收藏</span>
					</div>
					<div class="follow" v-if="collectType" @click="collectClick(-1)">
						<i class="iconfont iconfontActive icon-likefill1"></i>
						<span class="textActive">取消收藏</span>
					</div>
				</div>
				<div class="info_item">
					<div class="info_label">医生账号</div>
					<div  class="info_text" >{{detail.yishengzhanghao}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">联系电话</div>
					<div  class="info_text" >{{detail.lianxidianhua}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">可约人数</div>
					<div  class="info_text" >{{detail.keyuerenshu}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">咨询费用</div>
					<div  class="info_text" >{{detail.zixunfeiyong}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">可约时间</div>
					<div  class="info_text" >{{detail.keyueshijian}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">专业资质</div>
					<div  class="info_text" >{{detail.zhuanyezizhi}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">专业领域</div>
					<div  class="info_text" >{{detail.zhuanyelingyu}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">收藏数量</div>
					<div  class="info_text" >{{detail.storeupnum}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">就诊地点</div>
					<div  class="info_text" >{{detail.jiuzhendidian}}</div>
				</div>
				<div class="btn_view">
					<el-button class="cross_btn" v-if="btnFrontAuth(tableName,'预约')" @click="yuyueyishengonAcross('预约','yuyueyisheng','','','')" type="warning">预约</el-button>
					<el-button v-if="centerType&&(detail.ispay=='未支付'||!detail.ispay)&&btnFrontAuth('zuozhenyisheng','支付')" class="approval_btn" @click="payClick">支付</el-button>
					<el-button class="edit_btn" v-if="centerType&&btnAuth('zuozhenyisheng','修改')" type="primary" @click="editClick">修改</el-button>
					<el-button class="del_btn" v-if="centerType&&btnAuth('zuozhenyisheng','删除')" type="danger" @click="delClick">删除</el-button>
				</div>
			</div>
		</div>
		<el-tabs type="border-card" v-model="activeName" class="tabs_view">
			<el-tab-pane label="个人简介" name="first">
				<div v-html="detail.gerenjianjie"></div>
			</el-tab-pane>
		</el-tabs>
	</div>
</template>
<script setup>
	import axios from 'axios'
	import {
		ref,
		getCurrentInstance,
		watch,
		onUnmounted,
		onMounted,
		nextTick,
		computed
	} from 'vue';
	import {
		ElMessageBox
	} from 'element-plus'
	import {
		useRoute,
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'zuozhenyisheng'
	const formName = '坐诊医生'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	//权限验证
	const btnAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isAuth(e,a)
		}
	}
	//查看权限验证
	const btnFrontAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isFrontAuth(e,a)
		}
	}
	// 返回
	const backClick = () =>{
		history.back()
	}
	// 轮播图
	const bannerList = ref([])
	// 详情
	const title = ref('')
	const detail = ref({})
    const activeName = ref('first')
	const getDetail = () => {
		context?.$http({
			url: `${tableName}/detail/${route.query.id}`,
			method: 'get'
		}).then(res => {
			title.value = res.data.data.yishengxingming
			bannerList.value = res.data.data.zhaopian?res.data.data.zhaopian.split(','):[]
			detail.value = res.data.data
		})
	}
	// 下载文件
	const downClick = (file) => {
		if(!file){
			context?.$toolUtil.message('文件不存在','error')
		}
		let arr = file.replace(new RegExp('file/', "g"), "")
		axios.get((location.href.split(context?.$config.name).length>1 ? location.href.split(context?.$config.name)[0] :'') + context?.$config.name + '/file/download?fileName=' + arr, {
			headers: {
				token: context?.$toolUtil.storageGet('frontToken')
			},
			responseType: "blob"
		}).then(({
			data
		}) => {
			const binaryData = [];
			binaryData.push(data);
			const objectUrl = window.URL.createObjectURL(new Blob(binaryData, {
				type: 'application/pdf;chartset=UTF-8'
			}))
			const a = document.createElement('a')
			a.href = objectUrl
			a.download = arr
			// a.click()
			// 下面这个写法兼容火狐
			a.dispatchEvent(new MouseEvent('click', {
				bubbles: true,
				cancelable: true,
				view: window
			}))
			window.URL.revokeObjectURL(data)
		})
	}
	// 判断是否从个人中心跳转
	const centerType = ref(false)
	const init = () => {
		if(route.query.centerType){
			centerType.value = true
		}
		getDetail()
		// 收藏
		getCollect()
	}
	// 收藏
	const collectType = ref(false)
	const collectInfo = ref({})
	const getCollect = () => {
		if (context?.$toolUtil.storageGet('frontToken')) {
			context?.$http({
				url: 'storeup/list',
				method: 'get',
				params: {
					page: 1,
					limit: 1,
					type: 1,
					refid: route.query.id,
					tablename: tableName,
					userid: context?.$toolUtil.storageGet('userid')
				}
			}).then(res => {
				if (res.data.data.list.length) {
					collectType.value = true
					collectInfo.value = res.data.data.list[0]
				}else{
					collectType.value = false
					collectInfo.value = {}
				}
			})
		}
	}
	// 收藏按钮
	const collectClick = (type) => {
		if (type == 1 && !collectType.value) {
			let params = {
				name: title.value,
				picture: bannerList.value[0],
				refid: detail.value.id,
				type: type,
				tablename: tableName,
				userid: context?.$toolUtil.storageGet('userid')
			}
			context?.$http({
				url: 'storeup/add',
				method: 'post',
				data: params
			}).then(res => {
				detail.value.storeupnum += 1
				context?.$http({
					url: `${tableName}/update`,
					method: 'post',
					data: detail.value
				})
				collectType.value = true
				getCollect()
				context?.$toolUtil.message('收藏成功', 'success')
			})
		}
		else if (type == -1 && collectType.value) {
			let ids = []
			ids.push(collectInfo.value.id)
			context?.$http({
				url: 'storeup/delete',
				method: 'post',
				data: ids
			}).then(res => {
				detail.value.storeupnum -= 1
				context?.$http({
					url: `${tableName}/update`,
					method: 'post',
					data: detail.value
				})
				collectInfo.value = {}
				collectType.value = false
				context?.$toolUtil.message('取消成功', 'success')
			})
		}
	}
	//修改
	const editClick = () => {
		router.push(`/index/${tableName}Add?id=${detail.value.id}&&type=edit`)
	}
	//删除
	const delClick = () => {
		ElMessageBox.confirm(`是否删除此${formName}？`, '提示', {
			confirmButtonText: '是',
			cancelButtonText: '否',
			type: 'warning',
		}).then(()=>{
			context?.$http({
				url: `${tableName}/delete`,
				method: 'post',
				data: [detail.value.id]
			}).then(res=>{
				context?.$toolUtil.message('删除成功','success',()=>{
					history.back()
				})
			})
			
		})
	}
	const yuyueyishengonAcross = (btnType,table,crossOptAudit,statusColumnName,tips,statusColumnValue) => {
		if(!context?.$toolUtil.storageGet('frontToken')){
			context?.$toolUtil.message('请登录后再操作！','error')
			return false
		}
		if(!btnAuth(tableName,btnType)){
			context?.$toolUtil.message('暂无权限操作！','error')
			return false
		}
		context?.$toolUtil.storageSet('crossObj',JSON.stringify(detail.value))
		context?.$toolUtil.storageSet('crossTable',tableName)
		context?.$toolUtil.storageSet('crossStatusColumnName',statusColumnName)
		context?.$toolUtil.storageSet('crossTips',tips)
		context?.$toolUtil.storageSet('crossStatusColumnValue',statusColumnValue)
		if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
			var obj = detail.value
			for (var o in obj){
				if(o==statusColumnName && obj[o]==statusColumnValue){
					context?.$toolUtil.message(tips,'error')
					return;
				}
			}
		}
		nextTick(()=>{
			router.push(`/index/${table}Add?type=cross&&id=${detail.value.id}`)
		})
	}
	onMounted(()=>{
		init()
	})
</script>
<style lang="scss" scoped>
	// 返回盒子
	.back_view {
		border-radius: 0px;
		padding: 0 20px;
		margin: 0;
		background: none;
		display: inline-block;
		width: 100%;
		text-align: right;
		// 返回按钮
		.back_btn {
			border: 1px solid #eee;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 20px;
			color: #666;
			background: #fff;
			width: auto;
			font-size: 14px;
			height: 24px;
		}
		// 返回按钮-悬浮
		.back_btn:hover {
		}
	}
	// 面包屑盒子
	.bread_view {
		border-radius: 0px;
		padding: 0px 20px 10px;
		margin: 0px auto;
		background: none;
		width: calc(100% - 0px);
		border-color: #66666650;
		border-width: 0 0 1px;
		position: relative;
		border-style: solid;
		:deep(.breadcrumb) {
			font-size: 14px;
			line-height: 1;
			.el-breadcrumb__separator {
				margin: 0 9px;
				color: #333;
				font-weight: 500;
			}
			.first_breadcrumb {
				.el-breadcrumb__inner {
					color: #333;
					display: inline-block;
				}
			}
			.second_breadcrumb {
				.el-breadcrumb__inner {
					color: #333;
					display: inline-block;
				}
			}
		}
	}
	
	.detail_view{
		border-radius: 0;
		padding: 20px 0;
		background: none;
		display: flex;
		width: 100%;
		border-color: #27bacc30;
		border-width: 0px;
		justify-content: space-between;
		position: relative;
		border-style: solid;
		flex-wrap: wrap;
		// 轮播图
		.swiper_view {
			padding: 0;
			margin: 0;
			background: none;
			width: 480px;
			float: left;
			height: 480px;
		}
		
		// 文字区
		.info_view {
			border: 0px solid #eee;
			padding: 0 20px;
			margin: 20px 0 20px;
			background: none;
			width: calc(100% - 500px);
			box-sizing: border-box;
			order: 2;
		
			.title_view {
				padding: 0 0 0 16px;
				margin: 0 0 12px;
				background: none;
				display: flex;
				width: 100%;
				border-color: #66666650;
				border-width: 0 0 1px;
				line-height: 40px;
				align-items: center;
				border-style: solid;
		
				.detail_title {
					color: #333;
					font-weight: 600;
					font-size: 18px;
				}
				// 收藏盒子
				.follow {
					border: 0px solid #ffffff50;
					cursor: pointer;
					padding: 4px 10px;
					color: #333;
					display: flex;
					line-height: 1;
					right: 30px;
					border-radius: 4px;
					background: none;
					width: auto;
					justify-content: center;
					align-items: center;
					position: absolute;
					.iconfont {
						margin: 0 4px 0 0;
						color: #f60;
						font-size: 24px;
					}
					.iconfontActive {
						margin: 0 4px 0 0;
						color: #f60;
						font-size: 24px;
					}
					span {
						color: #f60;
						font-size: 15px;
					}
					.textActive {
						color: #f60;
						font-size: 16px;
					}
				}
				.follow:hover {
				}
				.follow:active {
					transform: scale(0.9);
				}
			}
		
			.info_item {
					border-radius: 0px;
					padding: 0px;
					margin: 0 2% 10px 0;
					background: none;
					display: inline-block;
					width: 30%;
					border-color: #eee;
					border-width: 0px;
					align-items: center;
					border-style: solid;
		
				.info_label {
					margin: 0 12px 10px 0;
					color: #666;
					font-weight: 600;
					width: auto;
				}
				.info_text {
				}
			}
			.btn_view {
				padding: 0;
				margin: 20px 0;
				display: flex;
				flex-wrap: wrap;
				// 跨表-按钮
				.cross_btn {
					border: 0px solid rgba(170, 0, 0, 1.0);
					padding: 0 10px;
					margin: 0 10px 10px 0;
					color: #fff;
					background: #f68b8b;
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.cross_btn:hover {
				}
				// 修改-按钮
				.edit_btn {
					border: none;
					padding: 0 10px;
					margin: 0 10px 10px 0;
					color: #fff;
					background: #1fc273;
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.edit_btn:hover {
				}
				// 删除-按钮
				.del_btn {
					border: none;
					padding: 0 10px;
					margin: 0 10px 10px 0;
					color: #fff;
					background: #c21f30;
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.del_btn:hover {
				}
			}
		}
	}
	

	//底部盒子
	.tabs_view {
		border: 0px solid #ddd;
		border-radius: 0px;
		padding: 0 0px;
		box-shadow: none;
		margin: 20px auto;
		background: none;
		width: 100%;
		:deep(.el-tabs__header) {
			background: transparent;
			border: none;
		}
		// 头部
		:deep(.el-tabs__nav-scroll) {
			padding: 0px 0px;
			margin: 0;
			background: #fff;
			border-color: #ddd;
			border-width: 1px;
			border-style: solid;
			height: 46px;
			.el-tabs__nav {
				.el-tabs__item {
					border: 0;
					padding: 0 30px;
					margin: 0 10px;
					color: #333;
					font-weight: 500;
					display: inline-block;
					font-size: 14px;
					line-height: 46px;
					transition: all 0s;
					background: none;
					position: relative;
					list-style: none;
					text-align: center;
					min-width: 60px;
					height: 46px;
				}
				.el-tabs__item:hover {
					border: 0;
					border-radius: 0;
					color: #fff;
					background: #ff9900;
					line-height: 46px;
					height: 46px;
				}
				.is-active {
					border: 0;
					border-radius: 0;
					padding: 0 30px;
					color: #fff;
					background: #ff9900;
					line-height: 46px;
					text-align: center;
					min-width: 60px;
					height: 46px;
				}
			}
		}
		// 内容区
		:deep(.el-tabs__content) {
			border-radius: 0px;
			padding: 20px;
			color: #666;
			background: none;
			font-size: 14px;
			border-color: #eee;
			border-width: 0;
			border-style: solid;
		}
	}
	


</style>