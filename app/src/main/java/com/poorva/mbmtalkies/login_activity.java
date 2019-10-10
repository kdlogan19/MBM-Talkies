package com.poorva.mbmtalkies;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Created by HP on 29-01-2017.
 */
public class login_activity extends Activity{

    private TextView signup;
    private EditText userid, password;
    private Button login;
    private String uid,pas;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login_activity);
        initialvars();

        signup.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent newIntent = new Intent("com.poorva.mbmtalkies.sign_up");
                startActivity(newIntent);
            }
        });

        login.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v) {
                int flag=0;
                getValues();

                //Database Code flag=0 if login failed send uid and pas

                if(flag==0) {
                    Toast.makeText(getApplicationContext(), "Unsuccessful Sign in, Try again",
                            Toast.LENGTH_SHORT)
                            .show();
                    userid.setText("");
                    password.setText("");
                }
                else
                {
                    Toast.makeText(getApplicationContext(), "Signed in Successfully",
                            Toast.LENGTH_SHORT)
                            .show();
                    //next activity  is home activity
                    //Intent newIntent = new Intent("com.poorva.mbmtalkies.home_activity");
                    //startActivity(newIntent);
                }
            }
        });
    }

    protected void initialvars()
    {

        signup= (TextView)findViewById(R.id.signup);
        userid=(EditText) findViewById(R.id.userid);
        password=(EditText) findViewById(R.id.password);
        login=(Button)findViewById(R.id.login);
    }

    protected void getValues()
    {
        uid=userid.getText().toString();
        pas=password.getText().toString();
    }




}
