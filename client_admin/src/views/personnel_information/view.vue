<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','personnel_name') || $check_field('add','personnel_name') || $check_field('set','personnel_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="人员姓名" prop="personnel_name">
												<el-input id="personnel_name" v-model="form['personnel_name']" placeholder="请输入人员姓名"
							  v-if="user_group === '管理员' || (form['personnel_information_id'] && $check_field('set','personnel_name')) || (!form['personnel_information_id'] && $check_field('add','personnel_name'))" :disabled="disabledObj['personnel_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','personnel_name')">{{form['personnel_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','gender_of_personnel') || $check_field('add','gender_of_personnel') || $check_field('set','gender_of_personnel')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="人员性别" prop="gender_of_personnel">
								<el-select id="gender_of_personnel" v-model="form['gender_of_personnel']"
						v-if="user_group === '管理员' || (form['personnel_information_id'] && $check_field('set','gender_of_personnel')) || (!form['personnel_information_id'] && $check_field('add','gender_of_personnel'))">
						<el-option v-for="o in list_gender_of_personnel" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','gender_of_personnel')">{{form['gender_of_personnel']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','personnel_id') || $check_field('add','personnel_id') || $check_field('set','personnel_id')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="人员工号" prop="personnel_id">
												<el-input id="personnel_id" v-model="form['personnel_id']" placeholder="请输入人员工号"
							  v-if="user_group === '管理员' || (form['personnel_information_id'] && $check_field('set','personnel_id')) || (!form['personnel_information_id'] && $check_field('add','personnel_id'))" :disabled="disabledObj['personnel_id_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','personnel_id')">{{form['personnel_id']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','personnel_position') || $check_field('add','personnel_position') || $check_field('set','personnel_position')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="人员职务" prop="personnel_position">
												<el-input id="personnel_position" v-model="form['personnel_position']" placeholder="请输入人员职务"
							  v-if="user_group === '管理员' || (form['personnel_information_id'] && $check_field('set','personnel_position')) || (!form['personnel_information_id'] && $check_field('add','personnel_position'))" :disabled="disabledObj['personnel_position_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','personnel_position')">{{form['personnel_position']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','contact_number') || $check_field('add','contact_number') || $check_field('set','contact_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系电话" prop="contact_number">
												<el-input id="contact_number" v-model="form['contact_number']" placeholder="请输入联系电话"
							  v-if="user_group === '管理员' || (form['personnel_information_id'] && $check_field('set','contact_number')) || (!form['personnel_information_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_number')">{{form['contact_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','personnel_introduction') || $check_field('add','personnel_introduction') || $check_field('set','personnel_introduction')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="人员介绍" prop="personnel_introduction">
								<el-input type="textarea" id="personnel_introduction" v-model="form['personnel_introduction']" placeholder="请输入人员介绍"
						v-if="user_group === '管理员' || (form['personnel_information_id'] && $check_field('set','personnel_introduction')) || (!form['personnel_information_id'] && $check_field('add','personnel_introduction'))" :disabled="disabledObj['personnel_introduction_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','personnel_introduction')">{{form['personnel_introduction']}}</div>
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
				field: "personnel_information_id",
				url_add: "~/api/personnel_information/add?",
				url_set: "~/api/personnel_information/set?",
				url_get_obj: "~/api/personnel_information/get_obj?",
				url_upload: "~/api/personnel_information/upload?",

				query: {
					"personnel_information_id": 0,
				},

				form: {
								"personnel_name":  '', // 人员姓名
										"gender_of_personnel":  '', // 人员性别
										"personnel_id":  '', // 人员工号
										"personnel_position":  '', // 人员职务
										"contact_number":  '', // 联系电话
										"personnel_introduction":  '', // 人员介绍
											"personnel_information_id": 0, // ID
						
				},
				disabledObj:{
								"personnel_name_isDisabled": false,
										"gender_of_personnel_isDisabled": false,
										"personnel_id_isDisabled": false,
										"personnel_position_isDisabled": false,
										"contact_number_isDisabled": false,
										"personnel_introduction_isDisabled": false,
										},

	
						// 人员性别选项列表
				list_gender_of_personnel: ['男','女'],
	
		
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
			
	
		
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
					bl = this.$check_action('/personnel_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/personnel_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/personnel_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/personnel_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/personnel_information/view','get');
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
