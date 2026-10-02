import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
import register from '../views/register.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},

	// 注册
	{
		path: '/register',
		name: 'register',
		component: register,
		meta: {
			index: 0,
			title: '注册'
		}
	},

	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},








	// 普通用户路由
	{
		path: '/ordinary_users/table',
		name: 'ordinary_users_table',
		component: () => import('../views/ordinary_users/table.vue'),
		meta: {
			index: 0,
			title: '普通用户列表'
		}
	},
	{
		path: '/ordinary_users/view',
		name: 'ordinary_users_view',
		component: () => import('../views/ordinary_users/view.vue'),
		meta: {
			index: 0,
			title: '普通用户详情'
		}
	},
	// 物品信息路由
	{
		path: '/item_information/table',
		name: 'item_information_table',
		component: () => import('../views/item_information/table.vue'),
		meta: {
			index: 0,
			title: '物品信息列表'
		}
	},
	{
		path: '/item_information/view',
		name: 'item_information_view',
		component: () => import('../views/item_information/view.vue'),
		meta: {
			index: 0,
			title: '物品信息详情'
		}
	},
	// 人员信息路由
	{
		path: '/personnel_information/table',
		name: 'personnel_information_table',
		component: () => import('../views/personnel_information/table.vue'),
		meta: {
			index: 0,
			title: '人员信息列表'
		}
	},
	{
		path: '/personnel_information/view',
		name: 'personnel_information_view',
		component: () => import('../views/personnel_information/view.vue'),
		meta: {
			index: 0,
			title: '人员信息详情'
		}
	},
	// 车辆信息路由
	{
		path: '/vehicle_information/table',
		name: 'vehicle_information_table',
		component: () => import('../views/vehicle_information/table.vue'),
		meta: {
			index: 0,
			title: '车辆信息列表'
		}
	},
	{
		path: '/vehicle_information/view',
		name: 'vehicle_information_view',
		component: () => import('../views/vehicle_information/view.vue'),
		meta: {
			index: 0,
			title: '车辆信息详情'
		}
	},
	// 订单信息路由
	{
		path: '/order_information/table',
		name: 'order_information_table',
		component: () => import('../views/order_information/table.vue'),
		meta: {
			index: 0,
			title: '订单信息列表'
		}
	},
	{
		path: '/order_information/view',
		name: 'order_information_view',
		component: () => import('../views/order_information/view.vue'),
		meta: {
			index: 0,
			title: '订单信息详情'
		}
	},
	// 物流信息路由
	{
		path: '/logistics_information/table',
		name: 'logistics_information_table',
		component: () => import('../views/logistics_information/table.vue'),
		meta: {
			index: 0,
			title: '物流信息列表'
		}
	},
	{
		path: '/logistics_information/view',
		name: 'logistics_information_view',
		component: () => import('../views/logistics_information/view.vue'),
		meta: {
			index: 0,
			title: '物流信息详情'
		}
	},
	// 公告信息路由
	{
		path: '/announcement_information/table',
		name: 'announcement_information_table',
		component: () => import('../views/announcement_information/table.vue'),
		meta: {
			index: 0,
			title: '公告信息列表'
		}
	},
	{
		path: '/announcement_information/view',
		name: 'announcement_information_view',
		component: () => import('../views/announcement_information/view.vue'),
		meta: {
			index: 0,
			title: '公告信息详情'
		}
	},
	// 资讯信息路由
	{
		path: '/information/table',
		name: 'information_table',
		component: () => import('../views/information/table.vue'),
		meta: {
			index: 0,
			title: '资讯信息列表'
		}
	},
	{
		path: '/information/view',
		name: 'information_view',
		component: () => import('../views/information/view.vue'),
		meta: {
			index: 0,
			title: '资讯信息详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "物流配送中心信息化管理系统-admin";
	document.title = title;
})

export default router
