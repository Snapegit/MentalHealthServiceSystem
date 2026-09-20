<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="预约编号" prop="yuyuebianhao">
							<el-input class="list_inp" v-model="form.yuyuebianhao" placeholder="预约编号"
								 type="text" 								:readonly="!isAdd||disabledForm.yuyuebianhao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="医生账号" prop="yishengzhanghao">
							<el-input class="list_inp" v-model="form.yishengzhanghao" placeholder="医生账号"
								 type="text" 								:readonly="!isAdd||disabledForm.yishengzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="医生姓名" prop="yishengxingming">
							<el-input class="list_inp" v-model="form.yishengxingming" placeholder="医生姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.yishengxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="用户账号" prop="yonghuzhanghao">
							<el-input class="list_inp" v-model="form.yonghuzhanghao" placeholder="用户账号"
								 type="text" 								:readonly="!isAdd||disabledForm.yonghuzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="用户姓名" prop="yonghuxingming">
							<el-input class="list_inp" v-model="form.yonghuxingming" placeholder="用户姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.yonghuxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="手机号码" prop="shoujihaoma">
							<el-input class="list_inp" v-model="form.shoujihaoma" placeholder="手机号码"
								 type="text" 								:readonly="!isAdd||disabledForm.shoujihaoma?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="就诊时间" prop="jiuzhenshijian">
							<el-date-picker
								class="list_date"
								v-model="form.jiuzhenshijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.jiuzhenshijian?true:false"
								placeholder="请选择就诊时间" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="就诊状态" prop="jiuzhenzhuangtai">
							<el-input class="list_inp" v-model="form.jiuzhenzhuangtai" placeholder="就诊状态"
								 type="text" 								:readonly="!isAdd||disabledForm.jiuzhenzhuangtai?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="严重程度" prop="yanzhongchengdu">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.yanzhongchengdu?true:false"
								v-model="form.yanzhongchengdu" 
								placeholder="请选择严重程度"
								>
								<el-option v-for="(item,index) in yanzhongchengduLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="诊断问题" prop="zhenduanwenti">
							<el-input v-model="form.zhenduanwenti" placeholder="诊断问题" type="textarea"
							:readonly="!isAdd||disabledForm.zhenduanwenti?true:false"
							/>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="治疗方案" prop="zhiliaofangan">
							<el-input v-model="form.zhiliaofangan" placeholder="治疗方案" type="textarea"
							:readonly="!isAdd||disabledForm.zhiliaofangan?true:false"
							/>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="既往病史" prop="jiwangbingshi">
							<editor :value="form.jiwangbingshi" placeholder="请输入既往病史" :readonly="!isAdd||disabledForm.jiwangbingshi?true:false"
								class="list_editor" @change="(e)=>editorChange(e,'jiwangbingshi')"></editor>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="就诊详情" prop="jiuzhenxiangqing">
							<editor :value="form.jiuzhenxiangqing" placeholder="请输入就诊详情" :readonly="!isAdd||disabledForm.jiuzhenxiangqing?true:false"
								class="list_editor" @change="(e)=>editorChange(e,'jiuzhenxiangqing')"></editor>
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'yishengjiuzhen'
	const formName = '医生就诊'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		yuyuebianhao : false,
		yishengzhanghao : false,
		yishengxingming : false,
		yonghuzhanghao : false,
		yonghuxingming : false,
		shoujihaoma : false,
		jiwangbingshi : false,
		zhenduanwenti : false,
		zhiliaofangan : false,
		jiuzhenxiangqing : false,
		jiuzhenshijian : false,
		jiuzhenzhuangtai : false,
		yanzhongchengdu : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		yuyuebianhao: [
		],
		yishengzhanghao: [
		],
		yishengxingming: [
		],
		yonghuzhanghao: [
		],
		yonghuxingming: [
		],
		shoujihaoma: [
			{ validator: validateMobile, trigger: 'blur' },
		],
		jiwangbingshi: [
		],
		zhenduanwenti: [
		],
		zhiliaofangan: [
		],
		jiuzhenxiangqing: [
		],
		jiuzhenshijian: [
		],
		jiuzhenzhuangtai: [
		],
		yanzhongchengdu: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//严重程度列表
	const yanzhongchengduLists = ref([])
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			yuyuebianhao: '',
			yishengzhanghao: '',
			yishengxingming: '',
			yonghuzhanghao: '',
			yonghuxingming: '',
			shoujihaoma: '',
			jiwangbingshi: '',
			zhenduanwenti: '',
			zhiliaofangan: '',
			jiuzhenxiangqing: '',
			jiuzhenshijian: '',
			jiuzhenzhuangtai: '',
			yanzhongchengdu: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			res.data.data.jiwangbingshi = res.data.data.jiwangbingshi?(res.data.data.jiwangbingshi.replace(reg,'../../../cl52924225/file')):'';
			res.data.data.jiuzhenxiangqing = res.data.data.jiuzhenxiangqing?(res.data.data.jiuzhenxiangqing.replace(reg,'../../../cl52924225/file')):'';
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
			form.value.jiuzhenshijian = context?.$toolUtil.getCurDateTime()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='yuyuebianhao'){
					form.value.yuyuebianhao = row[x];
					disabledForm.value.yuyuebianhao = true;
					continue;
				}
				if(x=='yishengzhanghao'){
					form.value.yishengzhanghao = row[x];
					disabledForm.value.yishengzhanghao = true;
					continue;
				}
				if(x=='yishengxingming'){
					form.value.yishengxingming = row[x];
					disabledForm.value.yishengxingming = true;
					continue;
				}
				if(x=='yonghuzhanghao'){
					form.value.yonghuzhanghao = row[x];
					disabledForm.value.yonghuzhanghao = true;
					continue;
				}
				if(x=='yonghuxingming'){
					form.value.yonghuxingming = row[x];
					disabledForm.value.yonghuxingming = true;
					continue;
				}
				if(x=='shoujihaoma'){
					form.value.shoujihaoma = row[x];
					disabledForm.value.shoujihaoma = true;
					continue;
				}
				if(x=='jiwangbingshi'){
					form.value.jiwangbingshi = row[x];
					disabledForm.value.jiwangbingshi = true;
					continue;
				}
				if(x=='zhenduanwenti'){
					form.value.zhenduanwenti = row[x];
					disabledForm.value.zhenduanwenti = true;
					continue;
				}
				if(x=='zhiliaofangan'){
					form.value.zhiliaofangan = row[x];
					disabledForm.value.zhiliaofangan = true;
					continue;
				}
				if(x=='jiuzhenxiangqing'){
					form.value.jiuzhenxiangqing = row[x];
					disabledForm.value.jiuzhenxiangqing = true;
					continue;
				}
				if(x=='jiuzhenshijian'){
					form.value.jiuzhenshijian = row[x];
					disabledForm.value.jiuzhenshijian = true;
					continue;
				}
				if(x=='jiuzhenzhuangtai'){
					form.value.jiuzhenzhuangtai = row[x];
					disabledForm.value.jiuzhenzhuangtai = true;
					continue;
				}
				if(x=='yanzhongchengdu'){
					form.value.yanzhongchengdu = row[x];
					disabledForm.value.yanzhongchengdu = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('yonghuzhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.yonghuzhanghao = json.yonghuzhanghao
				disabledForm.value.yonghuzhanghao = true;
			}
			if(json.hasOwnProperty('yonghuxingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.yonghuxingming = json.yonghuxingming
				disabledForm.value.yonghuxingming = true;
			}
			if(json.hasOwnProperty('shoujihaoma')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.shoujihaoma = json.shoujihaoma
				disabledForm.value.shoujihaoma = true;
			}
		})
		yanzhongchengduLists.value = "轻微,中等,严重,相当严重".split(',')
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								emit('formModelChange')
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									formVisible.value = false
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						emit('formModelChange')
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							formVisible.value = false
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		border: 0px solid #ddd;
		border-radius: 4px;
		padding: 30px;
		margin: 0;
		background: #fff;
		// form item
		:deep(.el-form-item) {
			margin: 0 150px 20px 0;
			background: none;
			display: flex;
			//label
			.el-form-item__label {
			 background: none;
			 font-weight: 500;
			 display: block;
			 width: 150px;
			 min-width: 150px;
			 text-align: right;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 1px solid #ddd;
					border-radius: 0px;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					height: 36px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
						padding: 0;
					}
					.is-focus {
						box-shadow: none !important;
					}
				}
				//日期选择器
				.list_date {
					border: 1px solid #ddd;
					border-radius: 0px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
				}
				// 下拉框
				.list_sel {
					border: 1px solid #ddd;
					border-radius: 0px;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					//去掉默认样式
					.select-trigger{
						height: 100%;
						.el-input{
							height: 100%;
							.el-input__wrapper{
								border: none;
								box-shadow: none;
								background: none;
								border-radius: 0;
								height: 100%;
								padding: 0;
							}
							.is-focus {
								box-shadow: none !important;
							}
						}
					}
				}
				// 富文本
				.list_editor {
					background-color: #fff;
					border-radius: 0;
					padding: 0;
					margin: 0;
					width: auto;
					border-color: #ccc;
					border-width: 0;
					border-style: solid;
					min-width: 600px;
					height: auto;
				}
				// 长文本
				.el-textarea__inner {
					border: 1px solid #ddd;
					border-radius: 0;
					padding: 12px;
					color: #333;
					width: auto;
					font-size: 14px;
					min-height: 180px;
					min-width: 800px;
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: #999;
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
			border: 1px solid #f69a28;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: linear-gradient(270deg, rgba(246,154,40,1) 0%, rgba(255,186,101,1) 50%, rgba(246,154,40,1) 100%);
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_confirm:hover {
		}
	}
</style>