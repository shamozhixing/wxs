/** 初始化 */
function initdict(id, dicts,def){
	var obj = document.getElementById(id);
	var opts = obj.options;
	opts.length = 0;
	opts.add(new Option('请选择',''));
	if(dicts&&dicts.length>0)
	for(var i=0;i<dicts.length;i++){
		var opt = new Option(dicts[i][1],dicts[i][0]);
		if(dicts[i][0]==def){
			opt.selected=true;
		}
		opts.add(opt);
		
	}
}
/** 初始化省份 
 * pid 省份 select ID
 * def 默认值
 * */
function initprovince(pid,def){
	initdict(pid,provinces,def);
}
/** 城市选择 */
function change_citys(cid,pid,def){
	var pcitys = citys[pid];
	initdict(cid, pcitys, def);
}
/** 初始化品牌 */
function initbrand(bid,def){
	initdict(bid,brands,def);
}
/** 品牌车型选择 */
function change_brands(mid,bid,def){
	var bmodels = brandmodels[bid];
	initdict(mid, bmodels, def);
}

/** 初始化车系 */
function initauto(aid,def){
	initdict(aid,autos,def);
}
/** 车型选择 */
function change_autos(mid,aid,def){
	var bmodels = autosmodel[aid];
	initdict(mid, bmodels, def);
}

/** 初始化经销商省 */
function initdealerprovince(dpid,def){
	initdict(dpid,dprovinces,def);
}
/** 经销商城市选择 */
function change_dealercitys(dcid,dpid,def){
	var pcitys = dcitys[dpid];
	initdict(dcid, pcitys, def);
}
/** 经销商选择 */
function change_dealers(did,dcid,def){
	var dealer = dealers[dcid];
	initdict(did, dealer, def);
}

/**根据省id获取省的value*/
function getDictPovince(pid){
	if(isEmpty(pid)){
		return "";
	}
	for(var i=0;i<provinces.length;i++){
		if(provinces[i][0]==pid){
			return provinces[i][1];
		}
	}
}

/**根据cityid,cid获取市的value*/
function getDictCity(pid,cid){
	if(isEmpty(pid) || isEmpty(cid) ){
		return "";
	}
	var pcitys= citys[pid];
	for(var i=0;i<pcitys.length;i++){
		if(pcitys[i][0]==cid){
			return pcitys[i][1];
		}
	}
}
/**经销商*/
function getDictDealer(cid,did){
	if(isEmpty(cid) || isEmpty(did) ){
		return "";
	}
	var derArr= dealers[cid];
	for(var i=0;i<derArr.length;i++){
		if(derArr[i][0]==did){
			return derArr[i][1];
		}
	}
}

/**根据获取车系*/
function getDictAuto(pid){
	if(isEmpty(pid)){
		return "";
	}
	for(var i=0;i<autos.length;i++){
		if(autos[i][0]==pid){
			return autos[i][1];
		}
	}
}
/**根据获取车系的车型*/
function getDictModel(pid,mid){
	if(isEmpty(pid) || isEmpty(mid) ){
		return "";
	}
	var pArrs= autosmodel[pid];
	for(var i=0;i<pArrs.length;i++){
		if(pArrs[i][0]==mid){
			return pArrs[i][1];
		}
	}
}

/**车辆品牌*/
function getDictBrand(bid){
	if(isEmpty(bid)){
		return "";
	}
	for(var i=0;i<brands.length;i++){
		if(brands[i][0]==bid){
			return brands[i][1];
		}
	}
}
/**车辆品牌下的车型*/
function getDictBrandModel(bid,mid){
	if(isEmpty(bid) || isEmpty(mid) ){
		return "";
	}
	var pArrs= brandmodels[bid];
	for(var i=0;i<pArrs.length;i++){
		if(pArrs[i][0]==mid){
			return pArrs[i][1];
		}
	}
}



