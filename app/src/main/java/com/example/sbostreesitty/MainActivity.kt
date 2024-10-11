package com.example.sbostreesitty

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.Surface
import android.view.SurfaceView
import androidx.compose.ui.layout.layout
import kotlinx.coroutines.*

class MainActivity : AppCompatActivity() {

    companion object {
        init {
            try {
                System.loadLibrary("xenia")
            } catch (e: UnsatisfiedLinkError) {
                Log.e("MainActivity", "Error loading native library: ${e.message}")
            }
        }

        private const val TAG = "MainActivity"
    }

    private lateinit var surfaceView: SurfaceView
    private var emulatorJob: Job? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        surfaceView = findViewById(R.id.surfaceView) // Assuming you have a SurfaceView in your layout

        // Start emulation in a coroutine (optional)
        emulatorJob = CoroutineScope(Dispatchers.IO).launch {
            try {
                startEmulation(surfaceView.holder.surface)
            } catch (e: Exception) {
                Log.e(TAG, "Error during emulation: ${e.message}")
            }
        }
    }

    override fun onPause() {
        super.onPause()
        // Pause emulation or handle state changes here
        emulatorJob?.cancel()
    }

    override fun onResume() {
        super.onResume()
        // Resume emulation or restore state here
        if (emulatorJob?.isCancelled == true) {
            emulatorJob = CoroutineScope(Dispatchers.IO).launch {
                startEmulation(surfaceView.holder.surface)
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        // Stop emulation and release resources here
        emulatorJob?.cancel()
    }

    private external fun startEmulation(surface: Surface)
}