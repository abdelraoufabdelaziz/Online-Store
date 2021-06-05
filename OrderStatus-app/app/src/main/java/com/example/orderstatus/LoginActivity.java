package com.example.orderstatus;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class LoginActivity extends Activity {
    Button loginBtn;
    TextView userNameText;
    TextView passwordText;
     Context context ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
         loginBtn = findViewById(R.id.login_button);
        userNameText = findViewById(R.id.user_name);
         passwordText = findViewById(R.id.password);
        context=getApplicationContext();

    }

    @Override
    protected void onResume() {
        super.onResume();

    }

    public void verifyCredentials(View view) {
        String userName = userNameText.getText().toString();
        String password = passwordText.getText().toString();
        new WebServiceTask(context).execute(userName,password);
    }

    public void registerUser(View view) {
        Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.google.com"));
        startActivity(browserIntent);
    }
}