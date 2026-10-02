<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','serial_number') || $check_field('add','serial_number') || $check_field('set','serial_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品编号" prop="serial_number">
												<el-input id="serial_number" v-model="form['serial_number']" placeholder="请输入物品编号"
							  v-if="user_group === '管理员' || (form['item_information_id'] && $check_field('set','serial_number')) || (!form['item_information_id'] && $check_field('add','serial_number'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','serial_number')">{{form['serial_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','item_name') || $check_field('add','item_name') || $check_field('set','item_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品名称" prop="item_name">
												<el-input id="item_name" v-model="form['item_name']" placeholder="请输入物品名称"
							  v-if="user_group === '管理员' || (form['item_information_id'] && $check_field('set','item_name')) || (!form['item_information_id'] && $check_field('add','item_name'))" :disabled="disabledObj['item_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','item_name')">{{form['item_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','storage_warehouse') || $check_field('add','storage_warehouse') || $check_field('set','storage_warehouse')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="储存仓库" prop="storage_warehouse">
												<el-input id="storage_warehouse" v-model="form['storage_warehouse']" placeholder="请输入储存仓库"
							  v-if="user_group === '管理员' || (form['item_information_id'] && $check_field('set','storage_warehouse')) || (!form['item_information_id'] && $check_field('add','storage_warehouse'))" :disabled="disabledObj['storage_warehouse_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','storage_warehouse')">{{form['storage_warehouse']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','item_storage_location') || $check_field('add','item_storage_location') || $check_field('set','item_storage_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品库位" prop="item_storage_location">
												<el-input id="item_storage_location" v-model="form['item_storage_location']" placeholder="请输入物品库位"
							  v-if="user_group === '管理员' || (form['item_information_id'] && $check_field('set','item_storage_location')) || (!form['item_information_id'] && $check_field('add','item_storage_location'))" :disabled="disabledObj['item_storage_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','item_storage_location')">{{form['item_storage_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','number_of_items') || $check_field('add','number_of_items') || $check_field('set','number_of_items')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品数量" prop="number_of_items">
								<el-input-number id="number_of_items" v-model.number="form['number_of_items']"
						v-if="user_group === '管理员' || (form['item_information_id'] && $check_field('set','number_of_items')) || (!form['item_information_id'] && $check_field('add','number_of_items'))" :disabled="disabledObj['number_of_items_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','number_of_items')">{{form['number_of_items']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','item_image') || $check_field('add','item_image') || $check_field('set','item_image')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品图片" prop="item_image">
								<el-upload :disabled="disabledObj['item_image_isDisabled']" id="item_image" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_item_image"
						:show-file-list="false" v-if="user_group === '管理员' || (form['item_information_id'] && $check_field('set','item_image')) || (!form['item_information_id'] && $check_field('add','item_image'))">
						<img v-if="form['item_image']" :src="$fullUrl(form['item_image'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','item_image')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['item_image'])" :preview-src-list="[$fullUrl(form['item_image'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','item_description') || $check_field('add','item_description') || $check_field('set','item_description')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品描述" prop="item_description">
								<el-input type="textarea" id="item_description" v-model="form['item_description']" placeholder="请输入物品描述"
						v-if="user_group === '管理员' || (form['item_information_id'] && $check_field('set','item_description')) || (!form['item_information_id'] && $check_field('add','item_description'))" :disabled="disabledObj['item_description_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','item_description')">{{form['item_description']}}</div>
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
				field: "item_information_id",
				url_add: "~/api/item_information/add?",
				url_set: "~/api/item_information/set?",
				url_get_obj: "~/api/item_information/get_obj?",
				url_upload: "~/api/item_information/upload?",

				query: {
					"item_information_id": 0,
				},

				form: {
								"serial_number": this.$get_stamp(), // 物品编号
										"item_name":  '', // 物品名称
										"storage_warehouse":  '', // 储存仓库
										"item_storage_location":  '', // 物品库位
										"number_of_items":  0, // 物品数量
										"item_image":  '', // 物品图片
										"item_description":  '', // 物品描述
											"item_information_id": 0, // ID
						
				},
				disabledObj:{
								"serial_number_isDisabled": false,
										"item_name_isDisabled": false,
										"storage_warehouse_isDisabled": false,
										"item_storage_location_isDisabled": false,
					          			"number_of_items_isDisabled": false,
										"item_image_isDisabled": false,
										"item_description_isDisabled": false,
										},

	
		
		
		
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
						/**
			 * 上传物品图片
			 * @param {Object} param 图片参数
			 */
			upload_item_image(param){
						this.uploadFile(param.file, "item_image");
					},
	
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
											
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
					bl = this.$check_action('/item_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/item_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/item_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/item_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/item_information/view','get');
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
