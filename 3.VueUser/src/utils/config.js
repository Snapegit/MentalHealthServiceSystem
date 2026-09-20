const config = {
    get() {
        return {
            url : process.env.VUE_APP_BASE_API_URL + process.env.VUE_APP_BASE_API + '/',
            name: process.env.VUE_APP_BASE_API,
			menuList:[
				{
					name: '论坛交流',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'论坛交流',
							url:'/index/forumList'
						},
					]
				},
				{
					name: '坐诊医生管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'坐诊医生',
							url:'/index/zuozhenyishengList'
						},
					]
				},
				{
					name: '案例信息管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'案例信息',
							url:'/index/anlixinxiList'
						},
					]
				},
				{
					name: '心理测试',
					icon: 'icon-common15',
					child:[
						{
							name:'试卷列表',
							url:'/index/exampaperList'
						},
					]
				},
			]
        }
    },
    getProjectName(){
        return {
            projectName: "基于spring boot心理健康服务系统"
        } 
    }
}
export default config
