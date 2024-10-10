package jp.xenia.emulator.core

object EmulatorCore {

    init {
        System.loadLibrary("xenia")
    }

    external fun initialize()
    external fun loadGame(romPath: String)
    external fun startEmulation()
}