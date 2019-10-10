package com.poorva.mbmtalkies;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

/**
 * Created by HP on 02-02-2017.
 */
public class talkies_start extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.talkies_start);
        Thread timer = new Thread() {
            public void run() {
                try {
                    sleep(5000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    Intent newIntent = new Intent("com.poorva.mbmtalkies.login_activity");
                    startActivity(newIntent);
                }
            }

        };
        timer.start();
    }
}
