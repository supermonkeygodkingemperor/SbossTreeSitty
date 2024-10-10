package jp.xenia.emulator.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import jp.xenia.emulator.core.EmulatorCore

class MainActivity : AppCompatActivity() {

    companion object {
        private const val TAG = "MainActivity"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Initialize emulator core
        try {
            EmulatorCore.initialize()
            // Load a game (replace with actual game loading logic)
            EmulatorCore.loadGame("/path/to/game.xex") // Update with your game path
            // Start emulation loop
            EmulatorCore.startEmulation()
        } catch (e: Exception) {
            Log.e(TAG, "Error during emulator initialization or game loading", e)
            // Handle error, e.g., display an error message to the user
        }
    }
}