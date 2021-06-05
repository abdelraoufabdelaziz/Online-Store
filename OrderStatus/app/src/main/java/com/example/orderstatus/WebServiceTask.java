package com.example.orderstatus;

import android.content.Context;
import android.os.AsyncTask;
import android.os.Build;
import android.widget.Toast;

import androidx.annotation.RequiresApi;

import com.google.gson.Gson;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class WebServiceTask extends AsyncTask<String,Void,String> {
    private String baseURL = "http://10.0.2.2:8080/OrderStatusAPI/webapi/OrderStatus";
    private static Context context;
    private static int responseCode;
    public WebServiceTask(Context cont){
        this.context=cont;
    }
    @RequiresApi(api = Build.VERSION_CODES.O)
    @Override
    protected String doInBackground(String... strings) {
        String result = "";
        String line="";
        String resourceURL = baseURL+"/"+strings[0];
        String encodedString;

        try{
            URL url =new URL(resourceURL);
            byte[] stringInBytes = (strings[0]+":"+strings[1]).getBytes(StandardCharsets.UTF_8);
            String base64String = Base64.getEncoder().encodeToString(stringInBytes);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestProperty("Authorization", "Basic "+base64String);
            con.setRequestMethod("GET");
            con.setConnectTimeout(5000);
            System.out.println(responseCode);
//            if(con.getResponseCode()!=200){
//                responseCode=con.getResponseCode();
//                System.out.println(responseCode);
//                throw new IOException(con.getResponseMessage());
//            }
//            else if(con.getResponseCode()==401){
//                responseCode=con.getResponseCode();
//                throw new IOException(con.getResponseMessage());
//            }
            responseCode=con.getResponseCode();
            if (responseCode==200) {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(con.getInputStream()));
                StringBuffer stringBuffer = new StringBuffer();
                while ((line = bufferedReader.readLine()) != null) {
                    stringBuffer.append(line);
                }
                result = stringBuffer.toString();
                bufferedReader.close();

            }
            con.disconnect();
        }

        catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;

    }

    @Override
    protected void onPostExecute(String s) {
        super.onPostExecute(s);
        if(responseCode==200) {
            if (s != null) {
                System.out.println(s);
                Gson gson = new Gson();
                Order order = gson.fromJson(s, Order.class);
                Toast.makeText(this.context,
                        "User Data: \nOrderName: " + order.getOrderName() +
                                "\nOrderStatus: " + order.getOrderStatus(),
                        Toast.LENGTH_LONG).show();
            }
        }
        else{
            Toast.makeText(this.context,"Unable to login with error code: "+responseCode,Toast.LENGTH_LONG).show();
        }


    }
}
