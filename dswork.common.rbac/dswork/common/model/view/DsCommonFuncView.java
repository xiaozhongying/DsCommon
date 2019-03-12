package dswork.common.model.view;

import java.util.ArrayList;
import java.util.List;

import dswork.common.model.DsCommonFunc;

public class DsCommonFuncView extends DsCommonFunc
{
	private int index = 0;
	private String url = "";
	private List<DsCommonFuncView> items = new ArrayList<DsCommonFuncView>();
	
	public void add(DsCommonFuncView item)
	{
		this.items.add(item);
	}
	
	public int getIndex()
	{
		return index;
	}
	public void setIndex(int index)
	{
		this.index = index;
	}
	public String getUrl()
	{
		return url;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	public List<DsCommonFuncView> getItems()
	{
		return items;
	}
	public void setItems(List<DsCommonFuncView> items)
	{
		this.items = items;
	}
	
	@Override
	public String toString()
	{
		return toString(false, true);
	}
	public String toString(boolean haspoint, boolean hasnothing)
	{
		try
		{
			StringBuilder sb = new StringBuilder();
			sb
			.append(tabs.substring(30-index))
			.append(haspoint ? "," : (hasnothing ? "" : " "))
			.append("{\"id\":").append(getId())
			.append(",\"name\":\"").append(String.valueOf(getName()).replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\\\""))
			.append("\",\"img\":\"").append(getImg().replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\\\""))
			.append("\",\"imgOpen\":\"\",\"url\":\"").append(url.replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\\\""))
			.append("\",\"status\":").append(getStatus().intValue())
			.append(",\"items\":[");
			if(items.size() > 0)
			{
				sb.append("\n");
				DsCommonFuncView m = items.get(0);
				m.setIndex(index+1);
				sb.append(m.toString(false, false));
				for(int i = 1; i < this.items.size(); i++)
				{
					m = items.get(i);
					m.setIndex(index+1);
					sb.append(m.toString(true, false));
				}
				sb.append(tabs.substring(30-index));
			}
			return sb.append("]}\n").toString();
		}
		catch(Exception e)
		{
			return "";
		}
	}
	private static String tabs = "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t";
}
