import { createRouter, createWebHashHistory } from 'vue-router'
import index from '../views'
import home from '../views/pages/home.vue'
import login from '../views/pages/login.vue'
import yonghuList from '@/views/pages/yonghu/list'
import yonghuDetail from '@/views/pages/yonghu/formModel'
import yonghuAdd from '@/views/pages/yonghu/formAdd'
import yonghuRegister from '@/views/pages/yonghu/register'
import yonghuCenter from '@/views/pages/yonghu/center'
import xinliyishengList from '@/views/pages/xinliyisheng/list'
import xinliyishengDetail from '@/views/pages/xinliyisheng/formModel'
import xinliyishengAdd from '@/views/pages/xinliyisheng/formAdd'
import yuyueyishengList from '@/views/pages/yuyueyisheng/list'
import yuyueyishengDetail from '@/views/pages/yuyueyisheng/formModel'
import yuyueyishengAdd from '@/views/pages/yuyueyisheng/formAdd'
import storeupList from '@/views/pages/storeup/list'
import zuozhenyishengList from '@/views/pages/zuozhenyisheng/list'
import zuozhenyishengDetail from '@/views/pages/zuozhenyisheng/formModel'
import zuozhenyishengAdd from '@/views/pages/zuozhenyisheng/formAdd'
import quxiaoyuyueList from '@/views/pages/quxiaoyuyue/list'
import quxiaoyuyueDetail from '@/views/pages/quxiaoyuyue/formModel'
import quxiaoyuyueAdd from '@/views/pages/quxiaoyuyue/formAdd'
import forumList from '@/views/pages/forum/list'
import yishengjiuzhenList from '@/views/pages/yishengjiuzhen/list'
import yishengjiuzhenDetail from '@/views/pages/yishengjiuzhen/formModel'
import yishengjiuzhenAdd from '@/views/pages/yishengjiuzhen/formAdd'
import binglixinxiList from '@/views/pages/binglixinxi/list'
import binglixinxiDetail from '@/views/pages/binglixinxi/formModel'
import binglixinxiAdd from '@/views/pages/binglixinxi/formAdd'
import anlixinxiList from '@/views/pages/anlixinxi/list'
import anlixinxiDetail from '@/views/pages/anlixinxi/formModel'
import anlixinxiAdd from '@/views/pages/anlixinxi/formAdd'
import anlileixingList from '@/views/pages/anlileixing/list'
import anlileixingDetail from '@/views/pages/anlileixing/formModel'
import anlileixingAdd from '@/views/pages/anlileixing/formAdd'
import exampaperList from '@/views/pages/exam/exampaperList'
import examination from '@/views/pages/exam/examination'
import examrecordList from '@/views/pages/exam/examrecordList'
import examfailrecord from '@/views/pages/exam/examfailrecord'

const routes = [{
		path: '/',
		redirect: '/index/home'
	},
	{
		path: '/index',
		component: index,
		children: [{
			path: 'home',
			component: home
		}
		, {
			path: 'yonghuList',
			component: yonghuList
		}, {
			path: 'yonghuDetail',
			component: yonghuDetail
		}, {
			path: 'yonghuAdd',
			component: yonghuAdd
		}
		, {
			path: 'yonghuCenter',
			component: yonghuCenter
		}
		, {
			path: 'xinliyishengList',
			component: xinliyishengList
		}, {
			path: 'xinliyishengDetail',
			component: xinliyishengDetail
		}, {
			path: 'xinliyishengAdd',
			component: xinliyishengAdd
		}
		, {
			path: 'yuyueyishengList',
			component: yuyueyishengList
		}, {
			path: 'yuyueyishengDetail',
			component: yuyueyishengDetail
		}, {
			path: 'yuyueyishengAdd',
			component: yuyueyishengAdd
		}
		, {
			path: 'storeupList',
			component: storeupList
		}
		, {
			path: 'zuozhenyishengList',
			component: zuozhenyishengList
		}, {
			path: 'zuozhenyishengDetail',
			component: zuozhenyishengDetail
		}, {
			path: 'zuozhenyishengAdd',
			component: zuozhenyishengAdd
		}
		, {
			path: 'quxiaoyuyueList',
			component: quxiaoyuyueList
		}, {
			path: 'quxiaoyuyueDetail',
			component: quxiaoyuyueDetail
		}, {
			path: 'quxiaoyuyueAdd',
			component: quxiaoyuyueAdd
		}
		, {
			path: 'forumList',
			component: forumList
		}
		, {
			path: 'yishengjiuzhenList',
			component: yishengjiuzhenList
		}, {
			path: 'yishengjiuzhenDetail',
			component: yishengjiuzhenDetail
		}, {
			path: 'yishengjiuzhenAdd',
			component: yishengjiuzhenAdd
		}
		, {
			path: 'binglixinxiList',
			component: binglixinxiList
		}, {
			path: 'binglixinxiDetail',
			component: binglixinxiDetail
		}, {
			path: 'binglixinxiAdd',
			component: binglixinxiAdd
		}
		, {
			path: 'anlixinxiList',
			component: anlixinxiList
		}, {
			path: 'anlixinxiDetail',
			component: anlixinxiDetail
		}, {
			path: 'anlixinxiAdd',
			component: anlixinxiAdd
		}
		, {
			path: 'anlileixingList',
			component: anlileixingList
		}, {
			path: 'anlileixingDetail',
			component: anlileixingDetail
		}, {
			path: 'anlileixingAdd',
			component: anlileixingAdd
		}
		, {
			path: 'exampaperList',
			component: exampaperList
		}, {
			path: 'examrecordList',
			component: examrecordList
		}, {
			path: 'examfailrecord',
			component: examfailrecord
		}
		]
	},
	{
		path: '/login',
		component: login
	}
	,{
		path: '/yonghuRegister',
		component: yonghuRegister
	}
	, {
		path: '/examination',
		component: examination
	}
]

const router = createRouter({
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

export default router
