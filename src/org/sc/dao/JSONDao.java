package org.sc.dao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class JSONDao {
    public String JSONAndDataGrid(String jsonString){
        JSONArray jsonArray ;
        jsonArray = JSONArray.fromObject(jsonString);
        int count = jsonArray.size();
        StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("{\"");
        jsonBuilder.append("total\":");
        jsonBuilder.append(count);
        jsonBuilder.append(",");
        jsonBuilder.append("\"rows\"");
        jsonBuilder.append(":");
        jsonBuilder.append(jsonString);
        jsonBuilder.append("}");
        return jsonBuilder.toString();
    }
    public int JudgeSize(JSONArray jsonArray)//判断JSON数组中JSONObject最长是哪个
    {   int[] array = new int[jsonArray.size()];
        int i=0; JSONObject jsonobj = new JSONObject();
        for (;i<jsonArray.size();i++)
        {
            jsonobj=jsonArray.getJSONObject(i);
            array[i]=jsonobj.size();
        }
        double max = array[0];
        int index_max= 0;
        for (int j=0;j<array.length;j++)
        {
            if(array[j]>max)

            {

                max = array[j];

                index_max = j;

            }
        }
        return index_max;
    }
    private void iteratorJson(JSONObject jsonObject) {
        Iterator<String> keys = jsonObject.keys();
        for (;keys.hasNext();)
        {
            System.out.println("key");
            System.out.println(keys.next());
            System.out.println("value");
            System.out.println(jsonObject.getString(keys.next()));

        }
    }
    public Map<String, String> toMap(String jsonstr){
        Map<String,String> data = new HashMap<>();
        JSONObject jsonobj = JSONObject.fromObject(jsonstr);
        Iterator ite = jsonobj.keys();
        // 遍历jsonObject数据,添加到Map对象
        while (ite.hasNext()) {
            String key = ite.next().toString();
            String value = jsonobj.get(key).toString();
            data.put(key, value);
        }
        // 或者直接将 jsonObject赋值给Map
        // data = jsonObject;
        return data;
    }
    public static String JSONArrayToObject(String result)
    {
        JSONArray jsonarray = JSONArray.fromObject(result);
        JSONObject jsonobj = jsonarray.getJSONObject(0);
        return jsonobj.toString();
    }
}
