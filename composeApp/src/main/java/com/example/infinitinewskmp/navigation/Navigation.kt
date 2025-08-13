package com.example.infinitinewskmp.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.toRoute
import com.example.infinitinewskmp.data.model.Article
import com.example.infinitinewskmp.domain.viewmodels.MainViewModel
import com.example.infinitinewskmp.screens.DetailsScreen
import com.example.infinitinewskmp.screens.MainScreen
import kotlinx.serialization.Serializable

import kotlin.reflect.typeOf
// Define a home destination that doesn't take any arguments
@Serializable
object Main

// Define a profile destination that takes an ID
@Serializable
data class Detail(val article: Article)

@Composable
fun MainNavigation() {

    val navController = rememberNavController()


    NavHost(navController = navController, startDestination = Main ) {

        composable<Main> {
            MainScreen(onItemClick = { navController.navigate(Detail(it)) })
        }

        composable<Detail>(typeMap = mapOf(typeOf<Article>() to ArticleNavType)) { backStackEntry ->
            val parameters = backStackEntry.toRoute<Detail>()
            DetailsScreen(parameters.article, navigateToBack = { navController.navigateUp() })
        }

    }

}