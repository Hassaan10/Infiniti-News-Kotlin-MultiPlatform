package com.example.infinitinewskmp.data.repository

import com.example.infinitinewskmp.data.network.ApiResponse
import kotlinx.coroutines.flow.Flow

interface NewsRepository {

    suspend fun getHeadLines(): Flow<ApiResponse>
    suspend fun getAllNews(): Flow<ApiResponse>

}