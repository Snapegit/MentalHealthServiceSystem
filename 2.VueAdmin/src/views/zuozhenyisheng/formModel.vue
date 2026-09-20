<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
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
						<el-form-item label="联系电话" prop="lianxidianhua">
							<el-input class="list_inp" v-model="form.lianxidianhua" placeholder="联系电话"
								 type="text" 								:readonly="!isAdd||disabledForm.lianxidianhua?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item prop="zhaopian"
									  label="照片"
						>
							<uploads
								:disabled="!isAdd||disabledForm.zhaopian?true:false"
								action="file/upload"

								tip="请上传照片"
								:limit="3"
								style="width: 100%;text-align: left;"
								:fileUrls="form.zhaopian?form.zhaopian:''" 
								@change="zhaopianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="可约人数" prop="keyuerenshu">
							<el-input class="list_inp" v-model.number="form.keyuerenshu" placeholder="可约人数"
								 type="text" 								:readonly="!isAdd||disabledForm.keyuerenshu?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="咨询费用" prop="zixunfeiyong">
							<el-input class="list_inp" v-model.number="form.zixunfeiyong" placeholder="咨询费用"
								 type="number" 								:readonly="!isAdd||disabledForm.zixunfeiyong?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="可约时间" prop="keyueshijian">
							<el-input class="list_inp" v-model="form.keyueshijian" placeholder="可约时间"
								 type="text" 								:readonly="!isAdd||disabledForm.keyueshijian?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="就诊地点" prop="jiuzhendidian">
							<el-input class="list_inp" v-model="form.jiuzhendidian" placeholder="就诊地点"
								 type="text" 								:readonly="!isAdd||disabledForm.jiuzhendidian?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="专业资质" prop="zhuanyezizhi">
							<el-input v-model="form.zhuanyezizhi" placeholder="专业资质" type="textarea"
							:readonly="!isAdd||disabledForm.zhuanyezizhi?true:false"
							/>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="专业领域" prop="zhuanyelingyu">
							<el-input v-model="form.zhuanyelingyu" placeholder="专业领域" type="textarea"
							:readonly="!isAdd||disabledForm.zhuanyelingyu?true:false"
							/>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="个人简介" prop="gerenjianjie">
							<editor :value="form.gerenjianjie" placeholder="请输入个人简介" :readonly="!isAdd||disabledForm.gerenjianjie?true:false"
								class="list_editor" @change="(e)=>editorChange(e,'gerenjianjie')"></editor>
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
	const tableName = 'zuozhenyisheng'
	const formName = '坐诊医生'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		yishengzhanghao : false,
		yishengxingming : false,
		lianxidianhua : false,
		zhaopian : false,
		keyuerenshu : false,
		zixunfeiyong : false,
		keyueshijian : false,
		zhuanyezizhi : false,
		zhuanyelingyu : false,
		gerenjianjie : false,
		storeupnum : false,
		jiuzhendidian : false,
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
		yishengzhanghao: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		yishengxingming: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		lianxidianhua: [
			{ validator: validateMobile, trigger: 'blur' },
		],
		zhaopian: [
		],
		keyuerenshu: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		zixunfeiyong: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		keyueshijian: [
		],
		zhuanyezizhi: [
		],
		zhuanyelingyu: [
		],
		gerenjianjie: [
		],
		storeupnum: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		jiuzhendidian: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//照片上传回调
	const zhaopianUploadSuccess=(e)=>{
		form.value.zhaopian = e
	}
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			yishengzhanghao: '',
			yishengxingming: '',
			lianxidianhua: '',
			zhaopian: '',
			keyuerenshu: '',
			zixunfeiyong: '',
			keyueshijian: '',
			zhuanyezizhi: '',
			zhuanyelingyu: '',
			gerenjianjie: '',
			storeupnum: '0',
			jiuzhendidian: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			res.data.data.gerenjianjie = res.data.data.gerenjianjie?(res.data.data.gerenjianjie.replace(reg,'../../../cl52924225/file')):'';
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
				if(x=='lianxidianhua'){
					form.value.lianxidianhua = row[x];
					disabledForm.value.lianxidianhua = true;
					continue;
				}
				if(x=='zhaopian'){
					form.value.zhaopian = row[x];
					disabledForm.value.zhaopian = true;
					continue;
				}
				if(x=='keyuerenshu'){
					form.value.keyuerenshu = row[x];
					disabledForm.value.keyuerenshu = true;
					continue;
				}
				if(x=='zixunfeiyong'){
					form.value.zixunfeiyong = row[x];
					disabledForm.value.zixunfeiyong = true;
					continue;
				}
				if(x=='keyueshijian'){
					form.value.keyueshijian = row[x];
					disabledForm.value.keyueshijian = true;
					continue;
				}
				if(x=='zhuanyezizhi'){
					form.value.zhuanyezizhi = row[x];
					disabledForm.value.zhuanyezizhi = true;
					continue;
				}
				if(x=='zhuanyelingyu'){
					form.value.zhuanyelingyu = row[x];
					disabledForm.value.zhuanyelingyu = true;
					continue;
				}
				if(x=='gerenjianjie'){
					form.value.gerenjianjie = row[x];
					disabledForm.value.gerenjianjie = true;
					continue;
				}
				if(x=='storeupnum'){
					form.value.storeupnum = row[x];
					disabledForm.value.storeupnum = true;
					continue;
				}
				if(x=='jiuzhendidian'){
					form.value.jiuzhendidian = row[x];
					disabledForm.value.jiuzhendidian = true;
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
			form.value.storeupnum='0'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('yishengzhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.yishengzhanghao = json.yishengzhanghao
				disabledForm.value.yishengzhanghao = true;
			}
			if(json.hasOwnProperty('yishengxingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.yishengxingming = json.yishengxingming
				disabledForm.value.yishengxingming = true;
			}
			if(json.hasOwnProperty('lianxidianhua')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.lianxidianhua = json.lianxidianhua
				disabledForm.value.lianxidianhua = true;
			}
		})
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
		if(form.value.zhaopian!=null) {
			form.value.zhaopian = form.value.zhaopian.replace(new RegExp(context?.$config.url,"g"),"");
		}
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
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
						margin: 7px 0 0;
						color: #999;
						display: flex;
						font-size: 14px;
						justify-content: flex-start;
						align-items: center;
					}
					//外部盒子
					.el-upload--picture-card {
						border: 1px solid #ddd;
						cursor: pointer;
						background-color: #fff;
						border-radius: 0px;
						width: 120px;
						line-height: 70px;
						text-align: center;
						height: 60px;
						//图标
						.el-icon{
							color: #999;
							font-size: 32px;
						}
					}
					.el-upload-list__item {
						border: 1px solid #ddd;
						cursor: pointer;
						background-color: #fff;
						border-radius: 0px;
						width: 120px;
						line-height: 70px;
						text-align: center;
						height: 60px;
					}
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