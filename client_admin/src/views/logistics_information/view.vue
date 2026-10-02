<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','order_number') || $check_field('add','order_number') || $check_field('set','order_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="订单编号" prop="order_number">
												<el-input id="order_number" v-model="form['order_number']" placeholder="请输入订单编号"
							  v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','order_number')) || (!form['logistics_information_id'] && $check_field('add','order_number'))" :disabled="disabledObj['order_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','order_number')">{{form['order_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','user_information') || $check_field('add','user_information') || $check_field('set','user_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户信息" prop="user_information">
													<el-select v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','user_information')) || (!form['logistics_information_id'] && $check_field('add','user_information'))" id="user_information" v-model="form['user_information']" :disabled="disabledObj['user_information_isDisabled']">
							<el-option v-for="o in list_user_user_information" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','user_information')" id="user_information" v-model="form['user_information']" :disabled="true">
							<el-option v-for="o in list_user_user_information" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户姓名" prop="user_name">
												<el-input id="user_name" v-model="form['user_name']" placeholder="请输入用户姓名"
							  v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','user_name')) || (!form['logistics_information_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','contact_number') || $check_field('add','contact_number') || $check_field('set','contact_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系电话" prop="contact_number">
												<el-input id="contact_number" v-model="form['contact_number']" placeholder="请输入联系电话"
							  v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','contact_number')) || (!form['logistics_information_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_number')">{{form['contact_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','sending_items') || $check_field('add','sending_items') || $check_field('set','sending_items')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="寄送物品" prop="sending_items">
												<el-input id="sending_items" v-model="form['sending_items']" placeholder="请输入寄送物品"
							  v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','sending_items')) || (!form['logistics_information_id'] && $check_field('add','sending_items'))" :disabled="disabledObj['sending_items_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','sending_items')">{{form['sending_items']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','number_of_items') || $check_field('add','number_of_items') || $check_field('set','number_of_items')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品数量" prop="number_of_items">
												<el-input id="number_of_items" v-model="form['number_of_items']" placeholder="请输入物品数量"
							  v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','number_of_items')) || (!form['logistics_information_id'] && $check_field('add','number_of_items'))" :disabled="disabledObj['number_of_items_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','number_of_items')">{{form['number_of_items']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','addressee') || $check_field('add','addressee') || $check_field('set','addressee')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="收件人" prop="addressee">
												<el-input id="addressee" v-model="form['addressee']" placeholder="请输入收件人"
							  v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','addressee')) || (!form['logistics_information_id'] && $check_field('add','addressee'))" :disabled="disabledObj['addressee_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','addressee')">{{form['addressee']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','receiving_phone_number') || $check_field('add','receiving_phone_number') || $check_field('set','receiving_phone_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="收件电话" prop="receiving_phone_number">
												<el-input id="receiving_phone_number" v-model="form['receiving_phone_number']" placeholder="请输入收件电话"
							  v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','receiving_phone_number')) || (!form['logistics_information_id'] && $check_field('add','receiving_phone_number'))" :disabled="disabledObj['receiving_phone_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','receiving_phone_number')">{{form['receiving_phone_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','shipping_address') || $check_field('add','shipping_address') || $check_field('set','shipping_address')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="收件地址" prop="shipping_address">
								<el-input type="textarea" id="shipping_address" v-model="form['shipping_address']" placeholder="请输入收件地址"
						v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','shipping_address')) || (!form['logistics_information_id'] && $check_field('add','shipping_address'))" :disabled="disabledObj['shipping_address_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','shipping_address')">{{form['shipping_address']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','vehicle_name') || $check_field('add','vehicle_name') || $check_field('set','vehicle_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆名称" prop="vehicle_name">
								<el-select id="vehicle_name" v-model="form['vehicle_name']"
						v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','vehicle_name')) || (!form['logistics_information_id'] && $check_field('add','vehicle_name'))">
						<el-option v-for="o in list_vehicle_name" :key="o['vehicle_name']" :label="o['vehicle_name']"
							:value="o['vehicle_name']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','vehicle_name')">{{form['vehicle_name']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','logistics_description') || $check_field('add','logistics_description') || $check_field('set','logistics_description')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物流描述" prop="logistics_description">
								<el-input type="textarea" id="logistics_description" v-model="form['logistics_description']" placeholder="请输入物流描述"
						v-if="user_group === '管理员' || (form['logistics_information_id'] && $check_field('set','logistics_description')) || (!form['logistics_information_id'] && $check_field('add','logistics_description'))" :disabled="disabledObj['logistics_description_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','logistics_description')">{{form['logistics_description']}}</div>
							</el-form-item>
			</el-col>
					
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "logistics_information_id",
				url_add: "~/api/logistics_information/add?",
				url_set: "~/api/logistics_information/set?",
				url_get_obj: "~/api/logistics_information/get_obj?",
				url_upload: "~/api/logistics_information/upload?",

				query: {
					"logistics_information_id": 0,
				},

				form: {
								"order_number":  '', // 订单编号
										"user_information": 0, // 用户信息
										"user_name":  '', // 用户姓名
										"contact_number":  '', // 联系电话
										"sending_items":  '', // 寄送物品
										"number_of_items":  '', // 物品数量
										"addressee":  '', // 收件人
										"receiving_phone_number":  '', // 收件电话
										"shipping_address":  '', // 收件地址
										"vehicle_name":  '', // 车辆名称
										"logistics_description":  '', // 物流描述
											"logistics_information_id": 0, // ID
						
				},
				disabledObj:{
								"order_number_isDisabled": false,
										"user_information_isDisabled": false,
										"user_name_isDisabled": false,
										"contact_number_isDisabled": false,
										"sending_items_isDisabled": false,
										"number_of_items_isDisabled": false,
										"addressee_isDisabled": false,
										"receiving_phone_number_isDisabled": false,
										"shipping_address_isDisabled": false,
										"vehicle_name_isDisabled": false,
										"logistics_description_isDisabled": false,
										},

	
		
					// 用户列表
				list_user_user_information: [],
				
		
		
		
		
		
		
						// 车辆名称选项列表
				list_vehicle_name: [""],
	
		
	
			}
		},
		methods: {


	
	
			
	
				/**
			 * 获取普通用户用户列表
			 */
			async get_list_user_user_information() {
                // if(this.user_group !== "管理员" && this.form["user_information"] === 0) {
                //     this.form["user_information"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=普通用户");
                if(json.result && json.result.list){
                    this.list_user_user_information = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_user_information(id){
				var obj = this.list_user_user_information.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
			
	
			
	
			
	
			
	
			
				/**
			 * 获取车辆名称列表
			 */
			async get_list_vehicle_name() {
				var json = await this.$get("~/api/vehicle_information/get_list?");
				if(json.result && json.result.list){
					this.list_vehicle_name = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
											// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
									
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
																										$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																																	


			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																																							return msg;
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/logistics_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/logistics_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/logistics_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/logistics_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/logistics_information/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
							this.get_list_user_user_information();
																					this.get_list_vehicle_name();
						},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
