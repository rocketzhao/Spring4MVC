package com.javahash.spring.service;

/**
 * 注：接口只是辅助，spring注入的是实现类。故即使只定义一个service的class类也无任何影响。
 *
 */
public interface TestService extends BaseService {

	public void exception(Integer id) throws Exception;

}
