/**
 * 用户Service
 */
package dswork.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dswork.common.dao.DsCommonUserDao;
import dswork.common.dao.DsCommonUsertypeDao;
import dswork.common.model.DsCommonUser;
import dswork.common.model.DsCommonUsertype;
import dswork.core.db.BaseService;
import dswork.core.db.EntityDao;
import dswork.core.util.EncryptUtil;

@Service
@SuppressWarnings("all")
public class DsCommonUserService extends BaseService<DsCommonUser, java.lang.Long>
{
	@Autowired
	private DsCommonUserDao userDao;
	@Autowired
	private DsCommonUsertypeDao userTypeDao;

	@Override
	protected EntityDao getEntityDao()
	{
		return userDao;
	}

	/**
	 * 修改CA证书
	 * @param id 用户对象ID
	 * @param cakey ca证书
	 */
	public void updateCAKey(long id, String cakey)
	{
		userDao.updateCAKey(id, cakey);
	}

	/**
	 * 修改用户组织机构
	 * @param id 用户对象ID
	 * @param orgpid 单位ID
	 * @param orgid 单位部门ID
	 */
	public void updateOrg(long id, Long orgpid, Long orgid)
	{
		userDao.updateOrg(id, orgpid, orgid);
	}

	/**
	 * 修改密码
	 * @param id 用户对象ID
	 * @param password 加密后的密码
	 */
	public void updatePassword(long id, String password)
	{
		password = EncryptUtil.encryptMd5(password);
		userDao.updatePassword(id, password);
	}

	/**
	 * 修改状态
	 * @param id 用户对象ID
	 * @param status 状态
	 */
	public void updateStatus(long id, int status)
	{
		userDao.updateStatus(id, status);
	}

	/**
	 * 判断账号是否存在
	 * @param account 账号
	 * @return boolean 存在true，不存在false
	 */
	public boolean isExistsByAccount(String account)
	{
		return userDao.isExistsByAccount(account);
	}

	/**
	 * 根据账号获取用户对象
	 * @param account 账号
	 * @return DsCommonUser
	 */
	public DsCommonUser getByAccount(String account)
	{
		return userDao.getByAccount(account);
	}

	/**
	 * 取得所有配置的用户类型
	 * @param alias 类型
	 * @return List&lt;DsCommonUsertype&gt;
	 */
	public List<DsCommonUsertype> queryListForUsertype(String alias)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		if(alias != null)
		{
			map.put("xalias", alias);
		}
		return userTypeDao.queryList(map);
	}
}
