<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','vehicle_number') || $check_field('add','vehicle_number') || $check_field('set','vehicle_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆编号" prop="vehicle_number">
												<el-input id="vehicle_number" v-model="form['vehicle_number']" placeholder="请输入车辆编号"
							  v-if="user_group === '管理员' || (form['vehicle_information_id'] && $check_field('set','vehicle_number')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_number'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','vehicle_number')">{{form['vehicle_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','vehicle_name') || $check_field('add','vehicle_name') || $check_field('set','vehicle_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆名称" prop="vehicle_name">
												<el-input id="vehicle_name" v-model="form['vehicle_name']" placeholder="请输入车辆名称"
							  v-if="user_group === '管理员' || (form['vehicle_information_id'] && $check_field('set','vehicle_name')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_name'))" :disabled="disabledObj['vehicle_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_name')">{{form['vehicle_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','vehicle_status') || $check_field('add','vehicle_status') || $check_field('set','vehicle_status')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆状态" prop="vehicle_status">
								<el-select id="vehicle_status" v-model="form['vehicle_status']"
						v-if="user_group === '管理员' || (form['vehicle_information_id'] && $check_field('set','vehicle_status')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_status'))">
						<el-option v-for="o in list_vehicle_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','vehicle_status')">{{form['vehicle_status']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','vehicle_image') || $check_field('add','vehicle_image') || $check_field('set','vehicle_image')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆图片" prop="vehicle_image">
								<el-upload :disabled="disabledObj['vehicle_image_isDisabled']" id="vehicle_image" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_vehicle_image"
						:show-file-list="false" v-if="user_group === '管理员' || (form['vehicle_information_id'] && $check_field('set','vehicle_image')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_image'))">
						<img v-if="form['vehicle_image']" :src="$fullUrl(form['vehicle_image'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','vehicle_image')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['vehicle_image'])" :preview-src-list="[$fullUrl(form['vehicle_image'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','vehicle_description') || $check_field('add','vehicle_description') || $check_field('set','vehicle_description')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆描述" prop="vehicle_description">
								<el-input type="textarea" id="vehicle_description" v-model="form['vehicle_description']" placeholder="请输入车辆描述"
						v-if="user_group === '管理员' || (form['vehicle_information_id'] && $check_field('set','vehicle_description')) || (!form['vehicle_information_id'] && $check_field('add','vehicle_description'))" :disabled="disabledObj['vehicle_description_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_description')">{{form['vehicle_description']}}</div>
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
				field: "vehicle_information_id",
				url_add: "~/api/vehicle_information/add?",
				url_set: "~/api/vehicle_information/set?",
				url_get_obj: "~/api/vehicle_information/get_obj?",
				url_upload: "~/api/vehicle_information/upload?",

				query: {
					"vehicle_information_id": 0,
				},

				form: {
								"vehicle_number": this.$get_stamp(), // 车辆编号
										"vehicle_name":  '', // 车辆名称
										"vehicle_status":  '', // 车辆状态
										"vehicle_image":  '', // 车辆图片
										"vehicle_description":  '', // 车辆描述
											"vehicle_information_id": 0, // ID
						
				},
				disabledObj:{
								"vehicle_number_isDisabled": false,
										"vehicle_name_isDisabled": false,
										"vehicle_status_isDisabled": false,
										"vehicle_image_isDisabled": false,
										"vehicle_description_isDisabled": false,
										},

	
		
						// 车辆状态选项列表
				list_vehicle_status: ['保养中','待出车','已出车'],
	
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
						/**
			 * 上传车辆图片
			 * @param {Object} param 图片参数
			 */
			upload_vehicle_image(param){
						this.uploadFile(param.file, "vehicle_image");
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
					bl = this.$check_action('/vehicle_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/vehicle_information/view','get');
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
