<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>系统管理平台</title>
		<link href="${basePath}/resource/js/jqui/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
		<script src="${basePath}/resource/js/jqui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
		<script src="${basePath}/resource/js/jqui/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
		<script src="${basePath}/resource/js/jqui/indexdata.js" type="text/javascript"></script>
		<script type="text/javascript" src="${basePath}/resource/js/common.js"></script>
		<script type="text/javascript" src="${basePath}/resource/js/jqui/ligerUI/js/plugins/ligerDialog.js"></script>
		<script type="text/javascript" src="${basePath}/resource/js/jqui/ligerUI/js/plugins/ligerDrag.js"></script>
		<script type="text/javascript">
            var tab = null;
            var accordion = null;
            var tree = null;
            $(function ()
            {
                //布局
                $("#layout1").ligerLayout({ leftWidth: 190, height: '100%',heightDiff:-34,space:4, onHeightChanged: f_heightChanged });

                var height = $(".l-layout-center").height();

                //Tab
                $("#framecenter").ligerTab({ height: height });

                //面板
                $("#accordion1").ligerAccordion({ height: height - 24, speed: null });

                $(".l-link").hover(function ()
                {
                    $(this).addClass("l-link-over");
                }, function ()
                {
                    $(this).removeClass("l-link-over");
                });
                //树
                $("#tree1").ligerTree({
                    data : indexdata,
                    checkbox: false,
                    slide: false,
                    nodeWidth: 120,
                    attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid)
                        } 
                        f_addTab(tabid, node.data.text, node.data.url);
                    }
                });

                tab = $("#framecenter").ligerGetTabManager();
                accordion = $("#accordion1").ligerGetAccordionManager();
                tree = $("#tree1").ligerGetTreeManager();
                $("#pageloading").hide();

            });
            function f_heightChanged(options)
            {
                if (tab)
                    tab.addHeight(options.diff);
                if (accordion && options.middleHeight - 24 > 0)
                    accordion.setHeight(options.middleHeight - 24);
            }
            function f_addTab(tabid,text, url)
            { 
                tab.addTabItem({ tabid : tabid,text: text, url: url });
            } 
            
            function addWindow(){
            	$.ligerDialog.open({ url: 'pages/sysManage/updatePass.jsp',
            	 height:220,width: 420, isResize: false,title:'管理员密码修改'});    
        	}
        	
        
        	
        	  function updateLevevlPass()
        {
            $.ligerDialog.open({ url: 'pages/sysManage/updateLevelPass.jsp',
            					 height:220,width: 420, isResize: false,title:'修改授权密码'});    
        }
     </script>
		<style type="text/css">
body,html {
	height: 100%;
}

body {
	padding: 0px;
	margin: 0;
	overflow: hidden;
}

.l-link {
	display: block;
	height: 26px;
	line-height: 26px;
	padding-left: 10px;
	text-decoration: underline;
	color: #333;
}

.l-link2 {
	text-decoration: underline;
	color: white;
	margin-left: 2px;
	margin-right: 2px;
}

.l-layout-top {
	background: #102A49;
	color: White;
}

.l-layout-bottom {
	background: #E5EDEF;
	text-align: center;
}

#pageloading {
	position: absolute;
	left: 0px;
	top: 0px;
	background: white url('loading.gif') no-repeat center;
	width: 100%;
	height: 100%;
	z-index: 99999;
}

.l-link {
	display: block;
	line-height: 22px;
	height: 22px;
	padding-left: 16px;
	border: 1px solid white;
	margin: 4px;
}

.l-link-over {
	background: #FFEEAC;
	border: 1px solid #DB9F00;
}

.l-winbar {
	background: #2B5A76;
	height: 30px;
	position: absolute;
	left: 0px;
	bottom: 0px;
	width: 100%;
	z-index: 99999;
}

.space {
	color: #E7E7E7;
}

/* 顶部 */
.l-topmenu {
	margin: 0;
	padding: 0;
	height: 31px;
	line-height: 31px;
	background: url('${basePath}/resource/js/jqui/images/top.jpg') repeat-x bottom;
	position: relative;
	border-top: 1px solid #1D438B;
}

.l-topmenu-logo {
	color: #E7E7E7;
	padding-left: 35px;
	line-height: 26px;
	background: url('js/jqui/images/topicon.gif') no-repeat 10px 5px;
}

.l-topmenu-welcome {
	position: absolute;
	height: 24px;
	line-height: 24px;
	right: 30px;
	top: 2px;
	color: #070A0C;
}

.l-topmenu-welcome a {
	color: #E7E7E7;
	text-decoration: underline;
	
}
.aa{
	text-decoration:none;
	color:blue;
}
</style>
	</head>
	<body style="padding: 0px;">
		<div id="topmenu" class="l-topmenu">
			<div class="l-topmenu-welcome">
				<ul>
					<li>
						<a style="text-decoration: none" >当前登录管理员:${sessionScope.username}</a>
						<a style="text-decoration: none" href="javascript:void(0)" onclick="addWindow()">修改密码</a>
						<a style="text-decoration: none" href="/exit!exit.ac">退出</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="layout1"
			style="width: 99.2%; margin: 0 auto; margin-top: 4px;">
			<div position="left" title="主要菜单" id="accordion1">
				<c:if test="${purview['100'] == '100'}">
					<div title="商户管理">	
					<!-- <a href="merchantInfo!aaa.ac">aaa</a>  -->
						<div style="height: 7px;"></div>
						<%-- <c:if test="${purview['101'] == '101'}">
							<a class="l-link" href="javascript:f_addTab('addPlatMer','添加平台商户','<s:url value="merchantInfo!doAddPlatMer.ac"/>')">添加平台商户</a>
						</c:if> --%>
						<c:if test="${purview['102'] == '102'}">
							<a class="l-link" href="javascript:f_addTab('addMerchant','添加机构商户','${basePath}/user/list')">添加机构商户</a>
						</c:if>
						<%-- <c:if test="${purview['103'] == '103'}">
							<a class="l-link" href="javascript:f_addTab('PlatMerAll','平台商户查询','statistics!getCardTypeStatistics.ac')">平台商户查询</a>
						</c:if> --%>
						<c:if test="${purview['104'] == '104'}">
							<a class="l-link" href="javascript:f_addTab('merchantAll','机构商户查询','statistics!getCardTypeStatistics.ac')">机构商户查询</a>
						</c:if>
						<c:if test="${purview['105'] == '105'}">
							<a class="l-link" href="javascript:f_addTab('subMerchantAll', '子商户查询','statistics!getCardTypeStatistics.ac')">子商户查询</a>
						</c:if>
						<c:if test="${purview['106'] == '106'}">
							<a class="l-link" href="javascript:f_addTab('agencyList','代理商查询','statistics!getCardTypeStatistics.ac')">代理商查询</a>
						</c:if>
						<c:if test="${purview['107'] == '107'}">
							<a class="l-link" href="javascript:f_addTab('changeApplication','变更申请','statistics!getCardTypeStatistics.ac')">变更申请</a>
						</c:if>
					</div>
				</c:if>
				<c:if test="${purview['200'] == '200'}">
					<div title="交易管理">
	                    <div style=" height:7px;"></div>
	                    <c:if test="${purview['201'] == '201'}">
	                   		<a class="l-link" href="javascript:f_addTab('currentlistpage','当天交易查询','statistics!getCardTypeStatistics.ac')">当天交易查询</a> 
	                   	</c:if>
	                   	<c:if test="${purview['202'] == '202'}">
	                   		<a class="l-link" href="javascript:f_addTab('listpage','历史交易查询','statistics!getCardTypeStatistics.ac')">历史交易查询</a>
	                   	</c:if>
	                   	<c:if test="${purview['206'] == '206'}">
	                   		<a class="l-link" href="javascript:f_addTab('selectOrderFrozen','冻结记录查询','statistics!getCardTypeStatistics.ac')">冻结记录查询</a>
	                  	</c:if>
	                  <!--  	<c:if test="${purview['203'] == '203'}">
	                   		<a class="l-link" href="javascript:f_addTab('TeansferListpage','转账交易查询','statistics!getCardTypeStatistics.ac')">转账交易查询</a>
	                   	</c:if>
	                   	<c:if test="${purview['204'] == '204'}">
	                   		<a class="l-link" href="javascript:f_addTab('applyListpage','应用交易查询','statistics!getCardTypeStatistics.ac')">应用交易查询</a>
	                   	</c:if>
	                   	<c:if test="${purview['205'] == '205'}">
	                   		<a class="l-link" href="javascript:f_addTab('abnormalListpage','异常交易查询','statistics!getCardTypeStatistics.ac')">异常交易查询</a>
	                   	</c:if> -->
	                </div> 
                </c:if>
                <c:if test="${purview['300'] == '300'}">
					<div title="统计管理">	
					<div style="height: 7px;"></div>
						<c:if test="${purview['301'] == '301'}">
							<a class="l-link" href="javascript:f_addTab('cardTypeStatistics','借贷记比例统计','statistics!getCardTypeStatistics.ac')">借贷记比例统计</a>
						</c:if>
						<c:if test="${purview['302'] == '302'}">
							<a class="l-link" href="javascript:f_addTab('errRespCodeStatistics','错误码比例统计','statistics!getCardTypeStatistics.ac')">错误码比例统计</a>
						</c:if>
						<c:if test="${purview['303'] == '303'}">
							<a class="l-link" href="javascript:f_addTab('dayAmtProfit','日交易金额、分润统计','statistics!getCardTypeStatistics.ac')">日交易金额、分润统计</a>
						</c:if>
						<c:if test="${purview['304'] == '304'}">
							<a class="l-link" href="javascript:f_addTab('dayAmtFee','日交易金额、手续费统计','statistics!getCardTypeStatistics.ac')">日交易金额、手续费统计</a>
						</c:if>
						<!-- 
						<c:if test="${purview['305'] == '305'}">
							<a class="l-link" href="javascript:f_addTab('agentProfitInfo','代理商交易利润日统计','statistics!getCardTypeStatistics.ac')">代理商交易利润日统计</a>
						</c:if>
						<c:if test="${purview['306'] == '306'}">
							<a class="l-link" href="javascript:f_addTab('merDayProfitStatistics','商户日分润统计','statistics!getCardTypeStatistics.ac')">商户日分润统计</a>
						</c:if>
						 -->
						<c:if test="${purview['307'] == '307'}">
							<a class="l-link" href="javascript:f_addTab('bypayProfitStatistics','系统日分润统计','statistics!getCardTypeStatistics.ac')">系统日分润统计</a>
						</c:if>
					</div>
				</c:if>
				<c:if test="${purview['400'] == '400'}">
					<div title="清算管理">	
					<div style="height: 7px;"></div>
						<c:if test="${purview['401'] == '401'}">
							<a class="l-link" href="javascript:f_addTab('statistics','清分统计','statistics!getCardTypeStatistics.ac')">清分统计</a>
						</c:if>
						<c:if test="${purview['402'] == '402'}">
							<a class="l-link" href="javascript:f_addTab('statisticsFailure','清分失败查询','statistics!getCardTypeStatistics.ac')">清分失败查询</a>
						</c:if>
						<c:if test="${purview['403'] == '403'}">
							<a class="l-link" href="javascript:f_addTab('accountManager','清分款上账','statistics!getCardTypeStatistics.ac')">清分款上账</a>
						</c:if>
						<c:if test="${purview['404'] == '404'}">
							<a class="l-link" href="javascript:f_addTab('todayStatistics','T+0结算','statistics!getCardTypeStatistics.ac')">T+0结算</a>
						</c:if>
						<c:if test="${purview['405'] == '405'}">
						<a class="l-link" href="javascript:f_addTab('subMerCashout','结算状态查询','statistics!getCardTypeStatistics.ac')">结算状态查询</a>
						</c:if>
						<c:if test="${purview['406'] == '406'}">
						<a class="l-link" href="javascript:f_addTab('report','财务报表导出','statistics!getCardTypeStatistics.ac')">财务报表导出</a>
						</c:if>
						<c:if test="${purview['408'] == '408'}">
						 <a class="l-link" href="javascript:f_addTab('T1SendFile','T1代发文件下载','<s:url value="/MerSettleStatictis!getdownloadDf.ac"/>?ret=T1SendFile')">T1代发文件下载</a>
						</c:if>
						<c:if test="${purview['407'] == '407'}">
						<a class="l-link" href="javascript:f_addTab('D1SendFile','D1代发文件下载','<s:url value="/MerSettleStatictis!getdownloadDf.ac"/>?ret=D1SendFile')">D1代发文件下载</a>
						</c:if>
						<c:if test="${purview['409'] == '409'}">
						<a class="l-link" href="javascript:f_addTab('AdjustAccounts','调账','<s:url value="/pages/theReport/AdjustAccounts.jsp"/>')">调账</a>
						</c:if>
						<c:if test="${purview['410'] == '410'}">
						<a class="l-link" href="javascript:f_addTab('statictisProfit','停止清算查询','<s:url value="/StopSettleStatictis!stopSettleStatictisList.ac"/>?settleDate2=1')">停止清算查询</a>
						</c:if>
						<c:if test="${purview['411'] == '411'}">
						<a class="l-link" href="javascript:f_addTab('freezeList','冻结明细查询','<s:url value="/StopSettleStatictis!freezeList.ac"/>?settleDate2=1')">冻结明细查询</a>
						</c:if>
						<c:if test="${purview['412'] == '412'}">
						<a class="l-link" href="javascript:f_addTab('reconciliation','对账','<s:url value="/pages/theReport/reconciliation.jsp"/>')">对账</a>
						</c:if>
					</div>
				</c:if>
				<c:if test="${purview['500'] == '500'}">
					<div title="通道管理">	
						<div style="height: 7px;"></div>
						<c:if test="${purview['501'] == '501'}">
							<a class="l-link" href="javascript:f_addTab('addTractInfo','配置通道','<s:url value="tractInfo!goAddTract.ac"/>')">配置通道</a>
						</c:if>
						<c:if test="${purview['502'] == '502'}">
							<a class="l-link" href="javascript:f_addTab('tractInfoList','通道列表','<s:url value="/pages/tract/selectTractInfo.jsp"/>')">通道列表</a>
						</c:if>
						<c:if test="${purview['503'] == '503'}">
							<a class="l-link" href="javascript:f_addTab('addAppTractInfo','配置应用通道','<s:url value="appTractInfo!goAddAppTract.ac"/>')">配置应用通道</a>
						</c:if>
						<c:if test="${purview['504'] == '504'}">
							<a class="l-link" href="javascript:f_addTab('appTractInfoList','应用通道列表','<s:url value="/pages/appTractInfo/selectAppTractInfo.jsp"/>')">应用通道列表</a>
						</c:if>
						<c:if test="${purview['505'] == '505'}">
							<a class="l-link" href="javascript:f_addTab('tractStatictisList','通道统计','<s:url value="/tractStatictis!getSettDate.ac"/>')">通道统计查询</a>
						</c:if>
						<c:if test="${purview['506'] == '506'}">
							<a class="l-link" href="javascript:f_addTab('RulesAll','路由规则列表','<s:url value="/pages/tract/rulesAllList.jsp"/>')">路由规则列表</a>
						</c:if>
					</div>
				</c:if>
				<c:if test="${purview['600'] == '600'}">
					<div title="终端管理">	
					<div style="height: 7px;"></div>
						<c:if test="${purview['601'] == '601'}">
							<a class="l-link" href="javascript:f_addTab('SubMerTerminalList','终端列表','<s:url value="/pages/subMerTerminal/selectSubMerTerminal.jsp"/>?op=init')">终端列表</a>
						</c:if>
						<c:if test="${purview['602'] == '602'}">
							<a class="l-link" href="javascript:f_addTab('addMerTerminalList','配置机构终端','<s:url value="merTerminalInfo!goAddMerTerminalInfo.ac"/>')">配置机构终端</a>
						</c:if>
						<c:if test="${purview['603'] == '603'}">
							<a class="l-link" href="javascript:f_addTab('MerTerminalList','机构终端列表','<s:url value="/pages/merTerminalInfo/selectMerTerminalInfo.jsp"/>')">机构终端列表</a>
						</c:if>
						<c:if test="${purview['604'] == '604'}">
							<a class="l-link" href="javascript:f_addTab('addTerminalBatchConfig','终端生成批次统计','<s:url value="BatchConfig!addTerminalBatchConfigTopSelectMerSysId.ac"/>')">终端生成批次统计</a>
						</c:if>
						<c:if test="${purview['605'] == '605'}">
							<a class="l-link" href="javascript:f_addTab('TerminalBatchConfigList','终端生成批次统计信息列表','<s:url value="/pages/merTerminalInfo/TerminalBatchConfigList.jsp"/>')">终端生成批次统计信息列表</a>
						</c:if>
						<c:if test="${purview['606'] == '606'}">
							<a class="l-link" href="javascript:f_addTab('resetMerSysId','重置机构商','<s:url value="subMerTerminal!selectMerSysId.ac"/>')">重置机构商</a>
						</c:if>
						<a class="l-link" href="javascript:f_addTab('addUpdateTsnLog','添加S/N修改记录','<s:url value="/pages/merTerminalInfo/addUpdateTsnLog.jsp"/>')">添加S/N修改记录</a>
						<a class="l-link" href="javascript:f_addTab('selectUpdateTsnLog','查询S/N记录','<s:url value="/pages/merTerminalInfo/selectUpdateTsnLog.jsp"/>')">查询S/N修改记录</a>
					</div>
				</c:if>
				<c:if test="${purview['700'] == '700'}">
					<div title="风控管理">	
					<div style="height: 7px;"></div>
						<c:if test="${purview['701'] == '701'}">
							<a class="l-link" href="javascript:f_addTab('selectBlackInfo','黑名单','<s:url value="/pages/BlackInfo/selectBlackInfoList.jsp"/>?op=init')">黑名单</a>
						</c:if>
						<c:if test="${purview['702'] == '702'}">
							<a class="l-link" href="javascript:f_addTab('insertBlackInfo','添加黑名单','<s:url value="/pages/BlackInfo/insertBlackInfoList.jsp"/>?op=init')">添加黑名单</a>
						</c:if>
						<c:if test="${purview['703'] == '703'}">
						<a class="l-link" href="javascript:f_addTab('selectFactoryRisk','厂商风控限额','<s:url value="/pages/BlackInfo/factoryRiskList.jsp"/>')">厂商风控限额</a>
						</c:if>
					</div>
				</c:if>
				<c:if test="${purview['800'] == '800'}">
					<div title="码表管理">	
					<div style="height: 7px;"></div>
						<c:if test="${purview['801'] == '801'}">
							<a class="l-link" href="javascript:f_addTab('addCssConfig','CSS样式列表','<s:url value="/pages/codePage/configList.jsp"/>')">CSS样式列表</a>
						</c:if>
						<c:if test="${purview['802'] == '802'}">
							<a class="l-link" href="javascript:f_addTab('addMccCode','行业列表','<s:url value="/pages/codePage/mccCodeList.jsp"/>')">行业列表</a>
						</c:if>
						<c:if test="${purview['803'] == '803'}">
							<a class="l-link" href="javascript:f_addTab('addterminalType','产品列表','<s:url value="/pages/codePage/terminalList.jsp"/>')">产品列表</a>
						</c:if>
						<c:if test="${purview['804'] == '804'}">
							<a class="l-link" href="javascript:f_addTab('addRegionCode','地区列表','<s:url value="/pages/codePage/regionCodeList.jsp"/>')">地区列表</a>
						</c:if>
						<c:if test="${purview['805'] == '805'}">
							<a class="l-link" href="javascript:f_addTab('addSysModel','系统权限列表','<s:url value="/pages/codePage/sysModelList.jsp"/>')">系统权限列表</a>
						</c:if>
						<c:if test="${purview['806'] == '806'}">
							<a class="l-link" href="javascript:f_addTab('addMerModelList','机构权限列表','<s:url value="/pages/codePage/merModelList.jsp"/>')">机构权限列表</a>
						</c:if>
						<c:if test="${purview['807'] == '807'}">
							<a class="l-link" href="javascript:f_addTab('addBusType','业务列表','<s:url value="/pages/codePage/busTypeList.jsp"/>')">业务列表</a>
						</c:if>
						<%-- <c:if test="${purview['808'] == '808'}">
							<a class="l-link" href="javascript:f_addTab('addAgenctModelList','代理商权限列表','<s:url value="/pages/codePage/agenctModelListList.jsp"/>')">代理商权限列表</a>
						</c:if>
						<c:if test="${purview['809'] == '809'}">
						<a class="l-link" href="javascript:f_addTab('addPlatModelList','平台权限列表','<s:url value="/pages/codePage/platModelList.jsp"/>')">平台权限列表</a>
						</c:if> --%>
						<c:if test="${purview['810'] == '810'}">
							<a class="l-link" href="javascript:f_addTab('addFactoryCodeList','厂商码表','<s:url value="/pages/codePage/factoryCodeList.jsp"/>')">厂商列表</a>
						</c:if>
						<c:if test="${purview['811'] == '811'}">
							<a class="l-link" href="javascript:f_addTab('addPayBankCodeList','代发通道表','<s:url value="/pages/codePage/payBankCodeList.jsp"/>')">代发通道表</a>
						</c:if>
						<c:if test="${purview['812'] == '812'}">
						<a class="l-link" href="javascript:f_addTab('addCdateConfig','节假日导入','<s:url value="/pages/codePage/cdateConfig.jsp"/>')">节假日导入</a>
						</c:if>
					</div>
				</c:if>
				<c:if test="${purview['900'] == '900'}">
					<div title="系统管理">	
					<div style="height: 7px;"></div>
						<c:if test="${purview['901'] == '901'}">
							<a class="l-link" href="javascript:f_addTab('addManager','添加管理员','<s:url value="sysManage!toAddManager.ac"/>')">添加管理员</a>
						</c:if>
						<c:if test="${purview['902'] == '902'}">
							<a class="l-link" href="javascript:f_addTab('selectManager','管理员查询','<s:url value="/pages/sysManage/selectSysManagerList.jsp"/>')">管理员查询</a>
						</c:if>
						<c:if test="${purview['903'] == '903'}">
							<a class="l-link" href="javascript:f_addTab('selectSysOpLog','日志查询','<s:url value="/pages/sysManage/selectSysOpLog.jsp"/>?op=init')">日志查询</a>
						</c:if>
					</div>
				</c:if>
			</div>
			<div position="center" id="framecenter">
				<c:if test="${purview['1000'] == '1000'}">
					<div tabid="home" title="未上线子商户" style="height: 300px">
						<iframe frameborder="0" name="home" id="home" src="<s:url value="/pages/subMerchant/selectSubMerchantInfoNoOnline.jsp"/>"></iframe>
					</div>
				</c:if>
			</div>
		</div>
		<div style="height: 32px; line-height: 32px; text-align: center;">
			Copyright © 2011-2013 <a href="http://www.baidu.com" target="_blank" class="aa">www.baidu.com</a>
		</div>
		<div style="display: none"></div>
	</body>
</html>
