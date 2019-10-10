package com.poorva.mbmtalkies;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;

import android.widget.DatePicker;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Calendar;


/**
 * Created by HP on 17-03-2017.
 */
public class sign_up extends Activity {
    private DatePicker datePicker;
    private Calendar calendar;
    private int year, month, day;
    private int index;

    private TextView tjob,tfno;
    private EditText efname,elname,edob,emob,ejob,efno,email,epass,ecpas;
    private Spinner ebranch;
    private Button signingup;

    private String fname,lname,branch,dob,job,mob,fno,mail,pass,cpas ,gender;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sign_up);
        initialvars();

        calendar = Calendar.getInstance();
        year = calendar.get(Calendar.YEAR);

        month = calendar.get(Calendar.MONTH);
        day = calendar.get(Calendar.DAY_OF_MONTH);
        showDate(year, month + 1, day);

        signingup.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                getValues();
                if (fname!=null&& lname!=null&& branch!=null&& dob!=null&& mail!=null&& pass!=null&& cpas!=null && gender!=null) {
                    if((index==1 && fno==null)&&(index==2 && job==null))
                    {
                        Toast.makeText(getApplicationContext(), "Fill up all details",
                                Toast.LENGTH_SHORT)
                                .show();
                    }
                    //database flag=0 if cannot b signed up

                    Toast.makeText(getApplicationContext(), "Signed up Successfully",
                            Toast.LENGTH_SHORT)
                            .show();
                    Intent newIntent = new Intent("com.poorva.mbmtalkies.login_activity");
                    startActivity(newIntent);
                }
                else
                {
                    Toast.makeText(getApplicationContext(), "Fill all the details",
                            Toast.LENGTH_SHORT)
                            .show();
                }
            }
        });

    }
    public void profselect(View v)
    {
        visibility();
        index=0;
        tfno.setVisibility(View.GONE);
        efno.setVisibility(View.GONE);
        tjob.setVisibility(View.GONE);
        ejob.setVisibility(View.GONE);
    }
    public void studselect(View v)
    {
        visibility();
        index=1;
        tjob.setVisibility(View.GONE);
        ejob.setVisibility(View.GONE);
    }
    public void alumselect(View v)
    {
        visibility();
        index=2;
        tfno.setVisibility(View.GONE);
        efno.setVisibility(View.GONE);
    }

    protected void initialvars()
    {
        tfno = (TextView) findViewById(R.id.textfno);
        tjob = (TextView) findViewById(R.id.textjob);

        edob = (EditText) findViewById(R.id.dob);
        efno = (EditText) findViewById(R.id.faculty_no);
        ejob = (EditText) findViewById(R.id.job_details);
        efname=(EditText) findViewById(R.id.personFname);
        elname=(EditText) findViewById(R.id.personLname);
        email=(EditText) findViewById(R.id.email);
        epass=(EditText) findViewById(R.id.sign_pass);
        ecpas=(EditText) findViewById(R.id.confirm_sign_pass);
        emob=(EditText) findViewById(R.id.mobile_no);

        ebranch=(Spinner)findViewById(R.id.spinner);
        signingup=(Button)findViewById(R.id.signingup);
    }
    protected void visibility()
    {
        tfno.setVisibility(View.VISIBLE);
        efno.setVisibility(View.VISIBLE);
        tjob.setVisibility(View.VISIBLE);
        ejob.setVisibility(View.VISIBLE);
    }

    public void setDate(View view) {
        showDialog(999);
        Toast.makeText(getApplicationContext(), "Choose date of birth",
                Toast.LENGTH_SHORT)
                .show();
    }

    @Override
    protected Dialog onCreateDialog(int id) {
        // TODO Auto-generated method stub
        if (id == 999) {
            return new DatePickerDialog(this,R.style.DatePickerTheme, myDateListener, year, month, day);
        }
        return null;
    }

    private DatePickerDialog.OnDateSetListener myDateListener = new DatePickerDialog.OnDateSetListener() {
                public void onDateSet(DatePicker arg0,
                                      int arg1, int arg2, int arg3) {
                    // TODO Auto-generated method stub
                    // arg1 = year
                    // arg2 = month
                    // arg3 = day
                    showDate(arg1, arg2+1, arg3);
                }
            };

    private void showDate(int year, int month, int day) {
        edob.setText(new StringBuilder().append(day).append("/")
                .append(month).append("/").append(year));
    }

    protected void getValues()
    {
        fname=efname.getText().toString();
        lname=elname.getText().toString();
        dob=edob.getText().toString();
        branch=ebranch.getSelectedItem().toString();
        job=ejob.getText().toString();
        fno=efno.getText().toString();
        mail=email.getText().toString();
        pass=epass.getText().toString();
        cpas=ecpas.getText().toString();
        mob=emob.getText().toString();

    }

    public void maleselected(View v)
    {
        gender="M";
    }
    public void femaleselected(View v)
    {
        gender="F";
    }
}
