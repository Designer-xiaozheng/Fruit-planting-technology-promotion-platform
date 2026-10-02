<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','information_number') || $check_field('add','information_number') || $check_field('set','information_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="资讯编号" prop="information_number">
												<el-input id="information_number" v-model="form['information_number']" placeholder="请输入资讯编号"
							  v-if="user_group === '管理员' || (form['information_id'] && $check_field('set','information_number')) || (!form['information_id'] && $check_field('add','information_number'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','information_number')">{{form['information_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','information_title') || $check_field('add','information_title') || $check_field('set','information_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="资讯标题" prop="information_title">
												<el-input id="information_title" v-model="form['information_title']" placeholder="请输入资讯标题"
							  v-if="user_group === '管理员' || (form['information_id'] && $check_field('set','information_title')) || (!form['information_id'] && $check_field('add','information_title'))" :disabled="disabledObj['information_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','information_title')">{{form['information_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','release_date') || $check_field('add','release_date') || $check_field('set','release_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布日期" prop="release_date">
								<el-date-picker :disabled="disabledObj['release_date_isDisabled']" v-if="user_group === '管理员' || (form['information_id'] && $check_field('set','release_date')) || (!form['information_id'] && $check_field('add','release_date'))" id="release_date"
						v-model="form['release_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','release_date')">{{form['release_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','information_pictures') || $check_field('add','information_pictures') || $check_field('set','information_pictures')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="资讯图片" prop="information_pictures">
								<el-upload :disabled="disabledObj['information_pictures_isDisabled']" id="information_pictures" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_information_pictures"
						:show-file-list="false" v-if="user_group === '管理员' || (form['information_id'] && $check_field('set','information_pictures')) || (!form['information_id'] && $check_field('add','information_pictures'))">
						<img v-if="form['information_pictures']" :src="$fullUrl(form['information_pictures'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','information_pictures')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['information_pictures'])" :preview-src-list="[$fullUrl(form['information_pictures'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','information_content') || $check_field('add','information_content') || $check_field('set','information_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="资讯内容" prop="information_content">
								<el-input type="textarea" id="information_content" v-model="form['information_content']" placeholder="请输入资讯内容"
						v-if="user_group === '管理员' || (form['information_id'] && $check_field('set','information_content')) || (!form['information_id'] && $check_field('add','information_content'))" :disabled="disabledObj['information_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','information_content')">{{form['information_content']}}</div>
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
				field: "information_id",
				url_add: "~/api/information/add?",
				url_set: "~/api/information/set?",
				url_get_obj: "~/api/information/get_obj?",
				url_upload: "~/api/information/upload?",

				query: {
					"information_id": 0,
				},

				form: {
								"information_number": this.$get_stamp(), // 资讯编号
										"information_title":  '', // 资讯标题
										"release_date":  '', // 发布日期
										"information_pictures":  '', // 资讯图片
										"information_content":  '', // 资讯内容
											"information_id": 0, // ID
						
				},
				disabledObj:{
								"information_number_isDisabled": false,
										"information_title_isDisabled": false,
										"release_date_isDisabled": false,
										"information_pictures_isDisabled": false,
										"information_content_isDisabled": false,
										},

	
		
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
						/**
			 * 上传资讯图片
			 * @param {Object} param 图片参数
			 */
			upload_information_pictures(param){
						this.uploadFile(param.file, "information_pictures");
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
						        if (this.form["release_date"].indexOf("-")===-1){
          this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]),"yyyy-MM-dd")
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


								        if(this.form["release_date"]=="0000-00-00"){
          this.form["release_date"] = null;
        }
				if(parseInt(this.form["release_date"]) > 9999){
					this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]),"yyyy-MM-dd")
				}
								


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
					bl = this.$check_action('/information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/information/view','get');
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
