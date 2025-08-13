package com.example.infinitinewskmp.domain.viewmodels

import com.example.infinitinewskmp.data.network.ApiResponse
import com.example.infinitinewskmp.domain.interactor.AllNewsUseCase
import com.example.infinitinewskmp.domain.interactor.HeadlinesUseCase
import com.rickclephas.kmp.nativecoroutines.NativeCoroutines
import org.example.infinitinews.ui.events.UIEvent
import org.koin.core.component.KoinComponent
import com.rickclephas.kmp.observableviewmodel.ViewModel
import com.rickclephas.kmp.observableviewmodel.launch
import com.rickclephas.kmp.observableviewmodel.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.onEach
import org.koin.core.component.inject


open class MainViewModel: ViewModel(), KoinComponent {

    private val allNewsUseCase: AllNewsUseCase by inject()
    private val headlineUseCase: HeadlinesUseCase by inject()

    private val _allNewsState = MutableStateFlow<ApiResponse>(viewModelScope = viewModelScope,ApiResponse.Loading)

    @NativeCoroutines
    val allNewsState: StateFlow<ApiResponse> = _allNewsState.asStateFlow()

    private val _headlinesState = MutableStateFlow<ApiResponse>(viewModelScope = viewModelScope,ApiResponse.Loading)

    @NativeCoroutines
    val headlinesState: StateFlow<ApiResponse> = _headlinesState.asStateFlow()

    init {
        fetchHeadLines()
        fetchAllNews()
    }

    private fun fetchAllNews() {
        viewModelScope.launch {
            allNewsUseCase.invoke().collect {
                _allNewsState.value = it
            }
        }
    }

    private fun fetchHeadLines() {
        viewModelScope.launch {
            headlineUseCase.invoke().collect {
                _headlinesState.value = it
            }
        }
    }

    fun sendUIEvents(uiEvent: UIEvent) {
        when(uiEvent) {
            UIEvent.FetchAllNews -> fetchAllNews()
            UIEvent.FetchEverything -> {
                fetchHeadLines()
                fetchAllNews()
            }
            UIEvent.FetchHeadlines -> fetchHeadLines()
        }
    }
}
