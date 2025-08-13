package com.example.infinitinewskmp.domain.interactor

import com.example.infinitinewskmp.data.repository.NewsRepository

class NewsDetailUseCase constructor(private val repository: NewsRepository) {

    suspend operator fun invoke() =
        repository.getAllNews()
    }