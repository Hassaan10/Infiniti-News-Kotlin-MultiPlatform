package org.example.infinitinews.domain.repository

import kotlinx.coroutines.flow.Flow
import com.example.infinitinewskmp.data.network.ApiResponse
import com.example.infinitinewskmp.data.network.NetworkService
import kotlinx.coroutines.flow.flow
import org.example.infinitinews.data.LOCALE_US
import com.example.infinitinewskmp.data.repository.NewsRepository

class NewsRepositoryImpl constructor(private val apiService: NetworkService):
    NewsRepository {
    override suspend fun getHeadLines(): Flow<ApiResponse> {
        return flow {
            emit(ApiResponse.Loading)
            try {
                val result = apiService.getHeadLinesNews(LOCALE_US)
                emit(ApiResponse.Success(result.articles))
            }
            catch (e: Exception) {
                emit(ApiResponse.Error(e))
            }
        }
    }

    override suspend fun getAllNews(): Flow<ApiResponse> {
        return flow {
            emit(ApiResponse.Loading)
            try {
                val result = apiService.getAllNews()
                emit(ApiResponse.Success(result.articles))
            }
            catch (e: Exception) {
                emit(ApiResponse.Error(e))
            }
        }
    }
}