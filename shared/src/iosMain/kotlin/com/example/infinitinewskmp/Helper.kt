package com.example.infinitinewskmp

import com.example.infinitinewskmp.data.di.appModules
import org.koin.core.context.startKoin

fun initKoin(){
        startKoin {
            modules(appModules)
        }
    }