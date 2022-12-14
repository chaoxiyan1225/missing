package happylife.util.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import happylife.model.servicemodel.CacheProduct;
import happylife.model.servicemodel.TbMuweihao;
import happylife.util.cache.MchStaffProductCacheManager;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

public class WechatUserUtil {
	
	
	// 看目标墓位号是否在源墓位号中已存在
	public static  int queryMuweihao(JSONArray srcMuweihaos, TbMuweihao muweihao) {

		int index = -1;
		for (int i = 0; i < srcMuweihaos.size(); i++) {

			JSON json = (JSON)srcMuweihaos.get(i);
			
			if (muweihao.getMuweihao().equals(
					(JSON.toJavaObject( json,
							TbMuweihao.class)).getMuweihao())) {

				return i;
			}
		}
		return index;
	}
	
	
	// 看目标墓位号是否在源墓位号中已存在
	public static  int queryMuweihaoBylUuid(JSONArray srcMuweihaos, String uuid) {
		
		int index = -1;
		for (int i = 0; i < srcMuweihaos.size(); i++) {
			
			JSON json = (JSON)srcMuweihaos.get(i);
			
			if (uuid.equals(
					(JSON.toJavaObject( json,
							TbMuweihao.class)).getUuid())) {
				
				return i;
			}
		}
		return index;
	}
	
	

	public static  ArrayList<CacheProduct> genCacheProductsForGouwuche(
			JSONArray productIds) {
		HashMap<Integer, CacheProduct> cacheProductsMap = new HashMap();
		for (int i = 0; i < productIds.size(); i++) {

			Integer productId = productIds.getInteger(i);

			CacheProduct cacheProduct = cacheProductsMap.get(productId);
			if (null != cacheProduct) {
				cacheProduct.setBuyCnt(cacheProduct.getBuyCnt() + 1);
				cacheProductsMap.put(productId, cacheProduct);
			} else {
				cacheProduct = MchStaffProductCacheManager.getInstance()
						.getProductById(productId);
				if (null != cacheProduct) {
					cacheProduct.setBuyCnt(1);
					cacheProductsMap.put(productId, cacheProduct);
				}

			}
		}

		Collection<CacheProduct> valueCollection = cacheProductsMap.values();
		ArrayList<CacheProduct> valueList = new ArrayList<CacheProduct>(
				valueCollection);

		return valueList;

	}


}
