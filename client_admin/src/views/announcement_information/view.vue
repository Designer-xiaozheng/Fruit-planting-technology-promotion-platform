<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','announcement_number') || $check_field('add','announcement_number') || $check_field('set','announcement_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="公告编号" prop="announcement_number">
												<el-input id="announcement_number" v-model="form['announcement_number']" placeholder="请输入公告编号"
							  v-if="user_group === '管理员' || (form['announcement_information_id'] && $check_field('set','announcement_number')) || (!form['announcement_information_id'] && $check_field('add','announcement_number'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','announcement_number')">{{form['announcement_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','announcement_title') || $check_field('add','announcement_title') || $check_field('set','announcement_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="公告标题" prop="announcement_title">
												<el-input id="announcement_title" v-model="form['announcement_title']" placeholder="请输入公告标题"
							  v-if="user_group === '管理员' || (form['announcement_information_id'] && $check_field('set','announcement_title')) || (!form['announcement_information_id'] && $check_field('add','announcement_title'))" :disabled="disabledObj['announcement_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','announcement_title')">{{form['announcement_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','release_date') || $check_field('add','release_date') || $check_field('set','release_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布日期" prop="release_date">
								<el-date-picker :disabled="disabledObj['release_date_isDisabled']" v-if="user_group === '管理员' || (form['announcement_information_id'] && $check_field('set','release_date')) || (!form['announcement_information_id'] && $check_field('add','release_date'))" id="release_date"
						v-model="form['release_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','release_date')">{{form['release_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','announcement_attachment') || $check_field('add','announcement_attachment') || $check_field('set','announcement_attachment')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="公告附件" prop="announcement_attachment">
												<div v-if="disabledObj['announcement_attachment_isDisabled']">
						<div v-if="$check_field('get','announcement_attachment')">
							<el-button type="primary" @click="$download($fullUrl(form['announcement_attachment']),form['announcement_attachment'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
					<div v-else>
						<el-upload v-if="user_group === '管理员' || (form['announcement_information_id'] && $check_field('set','announcement_attachment')) || (!form['announcement_information_id'] && $check_field('add','announcement_attachment'))" class="upload-demo" drag
								   action="" style="max-width: 300px;width: 100%;" :http-request="upload_announcement_attachment" :limit="1" accept="">
							<i class="el-icon-upload"></i>
							<div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
						</el-upload>
						<div v-else-if="$check_field('get','announcement_attachment')">
							<el-button type="primary" @click="$download($fullUrl(form['announcement_attachment']),form['announcement_attachment'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','announcement_content') || $check_field('add','announcement_content') || $check_field('set','announcement_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="公告内容" prop="announcement_content">
								<el-input type="textarea" id="announcement_content" v-model="form['announcement_content']" placeholder="请输入公告内容"
						v-if="user_group === '管理员' || (form['announcement_information_id'] && $check_field('set','announcement_content')) || (!form['announcement_information_id'] && $check_field('add','announcement_content'))" :disabled="disabledObj['announcement_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','announcement_content')">{{form['announcement_content']}}</div>
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
				field: "announcement_information_id",
				url_add: "~/api/announcement_information/add?",
				url_set: "~/api/announcement_information/set?",
				url_get_obj: "~/api/announcement_information/get_obj?",
				url_upload: "~/api/announcement_information/upload?",

				query: {
					"announcement_information_id": 0,
				},

				form: {
								"announcement_number": this.$get_stamp(), // 公告编号
										"announcement_title":  '', // 公告标题
										"release_date":  '', // 发布日期
										"announcement_attachment":  '', // 公告附件
										"announcement_content":  '', // 公告内容
											"announcement_information_id": 0, // ID
						
				},
				disabledObj:{
								"announcement_number_isDisabled": false,
										"announcement_title_isDisabled": false,
										"release_date_isDisabled": false,
										"announcement_attachment_isDisabled": false,
										"announcement_content_isDisabled": false,
										},

	
		
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
						/**
			 * 上传公告附件
			 * @param {Object} param 文件参数
			 */
			upload_announcement_attachment(param){
						this.uploadFile(param.file, "announcement_attachment");
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
					bl = this.$check_action('/announcement_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/announcement_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/announcement_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/announcement_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/announcement_information/view','get');
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
