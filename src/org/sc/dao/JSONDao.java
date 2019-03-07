package org.sc.dao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
}
