package com.example.infinitinewskmp.data.model

import kotlinx.serialization.Serializable


@Serializable
data class NewsResponse(
    val articles: List<Article>?,
    val status: String?,
    val totalResults: Int?
)