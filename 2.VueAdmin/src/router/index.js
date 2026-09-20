	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import xinliyisheng from '@/views/xinliyisheng/list'
	import examquestion from '@/views/exam/examquestion/list'
	import exampaper from '@/views/exampaper/list'
	import storeup from '@/views/storeup/list'
	import anlixinxi from '@/views/anlixinxi/list'
	import forum from '@/views/forum/list'
	import quxiaoyuyue from '@/views/quxiaoyuyue/list'
	import yonghu from '@/views/yonghu/list'
	import binglixinxi from '@/views/binglixinxi/list'
	import yuyueyisheng from '@/views/yuyueyisheng/list'
	import yishengjiuzhen from '@/views/yishengjiuzhen/list'
	import anlileixing from '@/views/anlileixing/list'
	import zuozhenyisheng from '@/views/zuozhenyisheng/list'
	import config from '@/views/config/list'
	import exampaperlist from '@/views/exam/exampaperlist/list'
	import examination from '@/views/exam/exampaperlist/examination'
	import examrecord from '@/views/exam/examrecord/list'
	import examfailrecord from '@/views/exam/examfailrecord/list'
	import xinliyishengRegister from '@/views/xinliyisheng/register'
	import xinliyishengCenter from '@/views/xinliyisheng/center'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页Home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/xinliyishengCenter',
			name: '心理医生个人中心',
			component: xinliyishengCenter
		}
		,{
			path: '/xinliyisheng',
			name: '心理医生',
			component: xinliyisheng
		}
		,{
			path: '/examquestion',
			name: '试题管理',
			component: examquestion
		}
		,{
			path: '/exampaper',
			name: '试卷列表',
			component: exampaper
		}
		,{
			path: '/storeup',
			name: '我的收藏',
			component: storeup
		}
		,{
			path: '/anlixinxi',
			name: '案例信息',
			component: anlixinxi
		}
		,{
			path: '/forum',
			name: '我的发布',
			component: forum
		}
		,{
			path: '/quxiaoyuyue',
			name: '取消预约',
			component: quxiaoyuyue
		}
		,{
			path: '/yonghu',
			name: '用户',
			component: yonghu
		}
		,{
			path: '/binglixinxi',
			name: '病历信息',
			component: binglixinxi
		}
		,{
			path: '/yuyueyisheng',
			name: '预约医生',
			component: yuyueyisheng
		}
		,{
			path: '/yishengjiuzhen',
			name: '医生就诊',
			component: yishengjiuzhen
		}
		,{
			path: '/anlileixing',
			name: '案例类型',
			component: anlileixing
		}
		,{
			path: '/zuozhenyisheng',
			name: '坐诊医生',
			component: zuozhenyisheng
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		, {
			path: '/exampaperlist',
			name: '考试列表',
			component: exampaperlist
		}, {
			path: '/examrecord',
			name: '考试记录',
			component: examrecord
		}, {
			path: '/examfailrecord',
			name: '错题本',
			component: examfailrecord
		}
		]
	},
	{
		path: '/xinliyishengRegister',
		name: '心理医生注册',
		component: xinliyishengRegister
	},
	{
		path: '/examination',
		name: '考试',
		component: examination
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
