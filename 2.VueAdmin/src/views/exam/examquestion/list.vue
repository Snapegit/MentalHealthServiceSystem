<template>
	<div>
		<div class="app-contain">
			<div>
				<div class="list_search_view">
					<el-form :model="searchQuery" class="search_form">
						<div class="search_view">
							<div class="search_label">
								试卷：
							</div>
							<div class="search_box">
								<el-input class="search_inp" v-model="searchQuery.papername" placeholder="试卷名称"
									 clearable>
								</el-input>
							</div>
						</div>
						<div class="search_view">
							<div class="search_label">
								试题：
							</div>
							<div class="search_box">
								<el-input class="search_inp" v-model="searchQuery.questionname" placeholder="试题名称"
									 clearable>
								</el-input>
							</div>
						</div>
						<div class="search_btn_view">
							<el-button class="search_btn" type="primary" @click="searchClick()">搜索</el-button>
						</div>
					</el-form>
					<br>
					<div class="btn_view">
						<el-button type="success" @click="addClick"
							v-if="btnAuth('examquestion','新增')">新增</el-button>
						<el-button type="danger" :disabled="selRows.length?false:true"
							@click="delClick(null)" v-if="btnAuth('examquestion','删除')">删除</el-button>
						<el-button type="warning" @click="exportClick" v-if="btnAuth('examquestion','导出')">导出</el-button>
						<el-button type="primary" @click="printClick" v-if="btnAuth('examquestion','打印')">打印</el-button>
					</div>
				</div>
			</div>
			<br>
			<el-table v-loading="listLoading" border :stripe='false' @selection-change="handleSelectionChange" ref="table"
				v-if="btnAuth('exampaper','查看')" :data="list" @row-click="listChange">
				<el-table-column :resizable='true' align="left" header-align="left" type="selection" width="55" />
				<el-table-column label="序号" width="120" :resizable='true' :sortable='true' align="left" header-align="left">
					<template #default="scope">{{ scope.$index + 1}}</template>
				</el-table-column>
				<el-table-column label="试卷名称" :resizable='true' :sortable='true' align="left" header-align="left">
					<template #default="scope">
						{{scope.row.papername}}
					</template>
				</el-table-column>
				<el-table-column label="试题名称" :resizable='true' :sortable='true' align="left" header-align="left">
					<template #default="scope">
						{{scope.row.questionname}}
					</template>
				</el-table-column>
				<el-table-column label="选项" :resizable='true' :sortable='true' align="left" header-align="left">
					<template #default="scope">
						<div v-for="(item,index) in scope.row.optionList">
							<el-tag type="success" v-if="index==0" style="margin:0 0 4px">{{item.text}}</el-tag>
							<el-tag type="warning" v-if="index==1" style="margin:0 0 4px">{{item.text}}</el-tag>
							<el-tag type="danger" v-if="index==2" style="margin:0 0 4px">{{item.text}}</el-tag>
							<el-tag type="info" v-if="index==3" style="margin:0 0 4px">{{item.text}}</el-tag>
						</div>
					</template>
				</el-table-column>
				<el-table-column label="操作" :resizable='true' :sortable='true' align="left" header-align="left">
					<template #default="scope">
						<el-button :type="'primary'" @click="editClick(scope.row.id)" size="small"
							v-if="btnAuth('examquestion','修改')">修改</el-button>
						<el-button :type="'danger'" @click="delClick(scope.row.id)" size="small"
							v-if="btnAuth('examquestion','删除')">删除</el-button>
					</template>
				</el-table-column>
			</el-table>
			<el-pagination
				background
				:layout="layouts.join(',')"
				:total="total" 
				:page-size="listQuery.limit"
				prev-text="上一页"
				next-text="下一页"
				:hide-on-single-page="false"
				:style='{"padding":"0","margin":"20px auto","whiteSpace":"nowrap","color":"#333","textAlign":"center","width":"100%","fontWeight":"500"}'
				@size-change="sizeChange"
				@current-change="currentChange" 
				@prev-click="prevClick"
				@next-click="nextClick"  />
		</div>
		<formModel ref="formRef" @formModelChange="formModelChange"></formModel>
	</div>
</template>

<script setup>
	import {
		ref,
		nextTick,
		getCurrentInstance
	} from 'vue';
	import {
		useRoute,
		useRouter
	} from 'vue-router'
	import {
		ElMessageBox
	} from 'element-plus'
	import formModel from './formModel.vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	//基础信息
	const tableName = 'examquestion'
	const formName = '试题'
	const route = useRoute()
	//基础信息
	const listLoading = ref(false)
	const list = ref([])
	//分页
	const total = ref(0)
	const layouts = ref(["total","prev","pager","next","sizes"])
	const sizeChange = (size) => {
		listQuery.value.limit = size
		getList()
	}
	const currentChange = (page) => {
		listQuery.value.page = page
		getList()
	}
	const prevClick = () => {
		listQuery.value.page = listQuery.value.page - 1
		getList()
	}
	const nextClick = () => {
		listQuery.value.page = listQuery.value.page + 1
		getList()
	}
	//分页
	//权限验证
	const btnAuth = (e, a) => {
		return context?.$toolUtil.isAuth(e, a)
	}
	//搜索
	const searchClick = () => {
		listQuery.value.page = 1
		getList()
	}
	const table = ref(null)
	const listChange = (row) => {
		nextTick(() => {
			table.value.clearSelection()
			table.value.toggleRowSelection(row)
		})
	}
	const listQuery = ref({
		page: 1,
		limit: 20,
		sort: 'id',
		order: 'desc'
	})
	const searchQuery = ref({})
	const selRows = ref([])
	//多选
	const handleSelectionChange = (e) => {
		selRows.value = e
	}
	//列表
	const getList = () => {
		listLoading.value = true
		let params = JSON.parse(JSON.stringify(listQuery.value))
		params['sort'] = 'id'
		params['order'] = 'desc'
		if (searchQuery.value.papername && searchQuery.value.papername != '') {
			params['papername'] = '%' + searchQuery.value.papername + '%'
		}
		if (searchQuery.value.questionname && searchQuery.value.questionname != '') {
			params['questionname'] = '%' + searchQuery.value.questionname + '%'
		}
		context?.$http({
			url: `${tableName}/page`,
			method: 'get',
			params: params
		}).then(res => {
			for(let x in res.data.data.list) {
				if(res.data.data.list[x].options) {
					res.data.data.list[x].optionList = JSON.parse(res.data.data.list[x].options)
				}else{
					res.data.data.list[x].optionList = []
				}
			}
			listLoading.value = false
			list.value = res.data.data.list
			total.value = Number(res.data.data.total)
		})
	}
	const formRef = ref(null)
	const formModelChange=()=>{
		searchClick()
	}
	const addClick = ()=>{
		formRef.value.init('','新增')
	}
	const editClick = (id=null)=>{
		console.log(id)
		if(id){
			formRef.value.init(id,'修改')
		}
	}
	//导出数据
	const exportClick = () => {
		import('@/utils/Export2Excel').then(excel => {
			const tHeader = [
				"试卷名称",
				"试题名称",
				"试题类型",
				"选项",
				"分值",
				"正确答案",
				"解析",
			]
			const filterVal = [
				"papername",
				"questionname",
				"typeName",
				"options",
				"score",
				"answer",
				"analysis",
			]
			excel.export_json_to_excel2(tHeader, list.value, filterVal, '试题')
		})
	}
	//打印
	const printClick = () => {
		let data = []
		for (let x in list.value) {
			data.push({
				papername: list.value[x].papername,
				questionname: list.value[x].questionname,
				typeName: list.value[x].typeName,
				options: list.value[x].options,
				score: list.value[x].score,
				answer: list.value[x].answer,
				analysis: list.value[x].analysis,
			})
		}
		printJS({
			printable: data,
			properties: [{
					field: 'papername',
					displayName: '试卷名称',
					columnSize: 1
				},
				{
					field: 'questionname',
					displayName: '试题名称',
					columnSize: 1
				},
				{
					field: 'typeName',
					displayName: '试题类型',
					columnSize: 1
				},
				{
					field: 'options',
					displayName: '选项',
					columnSize: 1
				},
				{
					field: 'score',
					displayName: '分值',
					columnSize: 1
				},
				{
					field: 'answer',
					displayName: '正确答案',
					columnSize: 1
				},
				{
					field: 'analysis',
					displayName: '解析',
					columnSize: 1
				},
			],
			type: 'json',
			header: '试题',
			gridStyle: 'border: 1px solid #3971A5; text-align: center; padding: 6px 10px',
			gridHeaderStyle: 'color: #000; border: 1px solid #3971A5; padding: 6px 10px'
		})
	}
	//删
	const delClick = (id) => {
		let ids = ref([])
		if (id) {
			ids.value = [id]
		} else {
			if (selRows.value.length) {
				for (let x in selRows.value) {
					ids.value.push(selRows.value[x].id)
				}
			} else {
				return false
			}
		}
		ElMessageBox.confirm(`是否删除选中${formName}`, '提示', {
			confirmButtonText: '是',
			cancelButtonText: '否',
			type: 'warning',
		}).then(() => {
			context?.$http({
				url: `${tableName}/delete`,
				method: 'post',
				data: ids.value
			}).then(res => {
				context?.$toolUtil.message('删除成功', 'success',()=>{
					getList()
				})
			})
		})
	}
	const init = () => {
		getList()
	}
	init()
</script>

<style lang="scss" scoped>
	// 操作盒子
	.list_search_view {
		margin: 20px auto;
		display: flex;
		width: 100%;
		flex-wrap: wrap;
		// 搜索盒子
		.search_form {
			display: flex;
			align-items: center;
			order: 2;
			// 子盒子
			.search_view {
				margin: 0 10px 0 0;
				display: flex;
				align-items: center;
				// 搜索label
				.search_label {
					margin: 0 10px 0 0;
					color: #666;
					background: none;
					font-weight: 500;
					display: inline-block;
					width: auto;
					font-size: 14px;
					line-height: 40px;
					text-align: right;
					min-width: 100px;
					height: 40px;
				}
				// 搜索item
				.search_box {
					display: inline-block;
					width: auto;
					// 输入框
					:deep(.search_inp) {
						border: 1px solid #999;
						border-radius: 0px;
						padding: 0 10px;
						background: #fff;
						width: auto;
						line-height: 34px;
						box-sizing: border-box;
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
				}
			}
			// 搜索按钮盒子
			.search_btn_view {
				width: 20%;
				display: flex;
				padding: 0 20px;

				// 搜索按钮
				.search_btn {
					border: 0px solid #f69a28;
					cursor: pointer;
					border-radius: 0px;
					padding: 0 24px;
					color: #fff;
					background: linear-gradient(270deg, rgba(130,196,209,1) 0%, rgba(115,186,200,1) 24%, rgba(174,210,217,1) 100%);
					width: auto;
					font-size: 14px;
					height: 36px;
				}
				// 搜索按钮-悬浮
				.search_btn:hover {
					background: linear-gradient(30deg, rgba(130,196,209,1) 0%, rgba(115,186,200,1) 24%, rgba(174,210,217,1) 100%);
				}
			}
		}
		//头部按钮盒子
		.btn_view {
			margin: 0;
			display: flex;
			// 新增
			:deep(.el-button--success) {
				border: 1px solid #f69a28;
				cursor: pointer;
				border-radius: 0px;
				padding: 0 16px;
				margin: 0 10px 0 0;
				color: #fff;
				background: linear-gradient(270deg, rgba(246,154,40,1) 0%, rgba(255,186,101,1) 50%, rgba(246,154,40,1) 100%);
				width: auto;
				font-size: 14px;
				height: 36px;
			}
			// 新增-悬浮
			:deep(.el-button--success:hover) {
				background: linear-gradient(30deg, rgba(246,154,40,1) 0%, rgba(255,186,101,1) 50%, rgba(246,154,40,1) 100%);
			}
			// 打印
			:deep(.el-button--primary) {
				border: 1px solid #139666;
				cursor: pointer;
				border-radius: 0px;
				padding: 0 16px;
				margin: 0 10px 0 0;
				color: #fff;
				background: linear-gradient(270deg, rgba(25,169,123,1) 0%, rgba(58,214,164,1) 50%, rgba(25,169,123,1) 100%),#19a97b;
				width: auto;
				font-size: 14px;
				height: 36px;
			}
			// 打印-悬浮
			:deep(.el-button--primary:hover) {
				background: linear-gradient(30deg, rgba(25,169,123,1) 0%, rgba(58,214,164,1) 50%, rgba(25,169,123,1) 100%),#19a97b;
			}
			// 删除
			:deep(.el-button--danger) {
				border: 1px solid #f62828;
				cursor: pointer;
				border-radius: 0px;
				padding: 0 16px;
				margin: 0 10px 0 0;
				color: #fff;
				background: linear-gradient(270deg, rgba(246,40,40,1) 0%, rgba(255,107,107,1) 50%, rgba(246,40,40,1) 100%);
				width: auto;
				font-size: 14px;
				height: 36px;
			}
			// 删除-悬浮
			:deep(.el-button--danger:hover) {
				background: linear-gradient(30deg, rgba(246,40,40,1) 0%, rgba(255,107,107,1) 50%, rgba(246,40,40,1) 100%);
			}
			// 导出
			:deep(.el-button--warning) {
				border: 1px solid #00cdec;
				cursor: pointer;
				border-radius: 0px;
				padding: 0 12px;
				margin: 0 10px 0 0;
				color: #fff;
				background: linear-gradient(270deg, rgba(0,205,236,1) 0%, rgba(66,230,255,1) 50%, rgba(0,205,236,1) 100%);
				width: auto;
				font-size: 14px;
				height: 36px;
			}
			// 导出-悬浮
			:deep(.el-button--warning:hover) {
				background: linear-gradient(30deg, rgba(0,205,236,1) 0%, rgba(66,230,255,1) 50%, rgba(0,205,236,1) 100%);
			}
		}
	}
	// 表格样式
	.el-table {
		border-radius: 0px;
		padding: 0;
		margin: 0 auto;
		background: #fff;
		width: 100%;
		border-color: #c7d6e5;
		border-width: 1px 0 0 1px;
		border-style: solid;
		:deep(.el-table__header-wrapper) {
			thead {
				color: #999;
				font-weight: 500;
				width: 100%;
				tr {
					background: #f8f8f8;
					th {
						padding: 4px 0;
						background: linear-gradient(180deg, rgba(255,255,255,1) 0%, rgba(226,240,249,1) 100%);
						border-color: #c7d6e5;
						border-width: 0 0px 1px 0;
						border-style: solid;
						text-align: left;
						.cell {
							padding: 0 0 0 5px;
							word-wrap: normal;
							white-space: normal;
							font-weight: bold;
							display: flex;
							vertical-align: middle;
							font-size: 12px;
							line-height: 24px;
							text-overflow: ellipsis;
							word-break: break-all;
							width: 100%;
							align-items: center;
							position: relative;
						}
					}
				}
			}
		}
		:deep(.el-table__body-wrapper) {
			tbody {
				width: 100%;
				tr {
					background: #fff;
					td {
						padding: 6px 0;
						color: #555;
						background: #fff;
						border-color: #fff;
						border-width: 1px 0px 1px 0;
						border-style: solid;
						text-align: left;
						.cell {
							padding: 0 5px;
							overflow: hidden;
							word-break: break-all;
							white-space: normal;
							line-height: 24px;
							text-overflow: ellipsis;
							// 编辑
							.el-button--primary {
								border: 0;
								cursor: pointer;
								border-radius: 4px;
								padding: 0 5px;
								margin: 0 5px 5px 0;
								color: #01b70e;
								background: #01b70e10;
								width: auto;
								font-size: 14px;
								height: 24px;
							}
							// 编辑-悬浮
							.el-button--primary:hover {
							}
							// 详情
							.el-button--info {
								border: 0;
								cursor: pointer;
								border-radius: 4px;
								padding: 0 5px;
								margin: 0 5px 5px 0;
								color: #0172b7;
								background: #0172b710;
								width: auto;
								font-size: 14px;
								line-height: 24px;
								height: 24px;
							}
							// 详情-悬浮
							.el-button--info:hover {
							}
							// 删除
							.el-button--danger {
								border: 0;
								cursor: pointer;
								border-radius: 4px;
								padding: 0 5px;
								margin: 0 5px 5px 0;
								color: #f51403;
								background: #f5140310;
								width: auto;
								font-size: 14px;
								height: 24px;
							}
							// 删除-悬浮
							.el-button--danger:hover {
							}
						}
					}
				}
				tr:hover {
					td {
						padding: 6px 0;
						color: #555;
						background: #f5fbfe;
						border-color: #d0e1f1;
						border-width: 1px 0px 1px 0;
						border-style: solid;
						text-align: left;
					}
				}
			}
		}
	}
	// 分页器
	.el-pagination {
		// 总页码
		:deep(.el-pagination__total) {
			margin: 0 10px 0 0;
			color: #666;
			font-weight: 400;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 28px;
			height: 28px;
		}
		// 上一页
		:deep(.btn-prev) {
			border: none;
			border-radius: 0px;
			padding: 0 5px;
			margin: 0 5px;
			color: #fff;
			background: #19a97b90;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 26px;
			min-width: 35px;
			height: 26px;
		}
		// 下一页
		:deep(.btn-next) {
			border: none;
			border-radius: 0px;
			padding: 0 5px;
			margin: 0 5px;
			color: #fff;
			background: #19a97b90;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 26px;
			min-width: 35px;
			height: 26px;
		}
		// 上一页禁用
		:deep(.btn-prev:disabled) {
			border: none;
			cursor: not-allowed;
			border-radius: 0px;
			padding: 0 5px;
			margin: 0 5px;
			color: #fff;
			background: #19a97b90;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 26px;
			height: 26px;
		}
		// 下一页禁用
		:deep(.btn-next:disabled) {
			border: none;
			cursor: not-allowed;
			border-radius: 0px;
			padding: 0 5px;
			margin: 0 5px;
			color: #fff;
			background: #19a97b90;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 26px;
			height: 26px;
		}
		// 页码
		:deep(.el-pager) {
			padding: 0;
			margin: 0;
			display: inline-block;
			vertical-align: top;
			// 数字
			.number {
				cursor: pointer;
				padding: 0 4px;
				margin: 0 5px;
				color: #333;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 26px;
				border-radius: 0px;
				background: #eee;
				text-align: center;
				min-width: 30px;
				height: 26px;
			}
			// 数字悬浮
			.number:hover {
				cursor: pointer;
				padding: 0 4px;
				margin: 0 5px;
				color: #fff;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 26px;
				border-radius: 0px;
				background: #11a274;
				text-align: center;
				min-width: 30px;
				height: 26px;
			}
			// 选中
			.number.active {
				cursor: default;
				padding: 0 4px;
				margin: 0 5px;
				color: #fff;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 26px;
				border-radius: 0px;
				background: #11a274;
				text-align: center;
				min-width: 30px;
				height: 26px;
			}
		}
		// sizes
		:deep(.el-pagination__sizes) {
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 28px;
			height: 28px;
			.el-select {
				border: 0px solid #ddd;
				cursor: pointer;
				padding: 0;
				color: #606266;
				display: inline-block;
				font-size: 13px;
				line-height: 26px;
				border-radius: 3px;
				box-shadow: none;
				background: #fff;
				width: 100%;
				text-align: center;
				height: 26px;
			}
		}
		// 跳页
		:deep(.el-pagination__jump) {
			margin: 0 0 0 24px;
			color: #606266;
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 28px;
			height: 28px;
			// 输入框
			.el-input {
				border: 1px solid #DCDFE6;
				cursor: pointer;
				padding: 0 3px;
				color: #606266;
				display: inline-block;
				font-size: 14px;
				line-height: 28px;
				border-radius: 3px;
				outline: 0;
				background: #FFF;
				width: 100%;
				text-align: center;
				height: 28px;
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
		}
	}
</style>