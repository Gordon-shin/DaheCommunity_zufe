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
}
