package com.example.infinitinewskmp.data.network

import com.example.infinitinewskmp.data.model.Article

sealed class ApiResponse {
    object Loading: ApiResponse()
    data class Success(val data: List<Article>?) : ApiResponse()
    data class Error(val error: Exception) : ApiResponse()
}