#!/usr/bin/env kscript

import java.io.File
import java.io.IOException
import java.util.concurrent.TimeUnit
import kotlin.math.absoluteValue

val RESOLUTION_REGEX = Regex("(\\d+)x(\\d+)")

File("/home/bruno/.display_config.log").apply {
    createNewFile()
    appendText(args.joinToString(" "))
    println(this)
}


data class Resolution(
    val width: Int,
    val height: Int,
    val current: Boolean = false
) {

    fun diff(other: Resolution): Int =
        (width - other.width + height - other.height).absoluteValue

    override fun toString(): String = "${width}x${height}"
}

fun findDisplays(): Map<String, List<Resolution>> {
    var name: String = ""
    var resolutions = mutableListOf<Resolution>()
    val result = mutableMapOf<String, List<Resolution>>()

    val xrandrResult = "xrandr".runCommand()?.split("\n") ?: emptyList()

    for (line in xrandrResult) {
        if (line.contains("connected")) {
            if (!name.isNullOrBlank())
                result.put(name, resolutions)
            resolutions = mutableListOf<Resolution>()
            name = line.split(" ").first()
        } else {
            RESOLUTION_REGEX.find(line)?.groups?.let { group ->
                val width = group[1]?.value?.toInt() ?: 0
                val height = group[2]?.value?.toInt() ?: 0
                if (width > 0 && height > 0)
                    resolutions.add(Resolution(width, height, line.contains('*')))
            }
        }
    }
    if (!result.containsKey(name))
        result.put(name, resolutions)
    return result
}

fun String.runCommand(): String? {
    try {
        val parts = this.split("\\s".toRegex())
        val proc = ProcessBuilder(*parts.toTypedArray())
            .redirectOutput(ProcessBuilder.Redirect.PIPE)
            .redirectError(ProcessBuilder.Redirect.PIPE)
            .start()

        proc.waitFor(60, TimeUnit.MINUTES)
        return proc.inputStream.bufferedReader().readText()
    } catch (e: IOException) {
        e.printStackTrace(System.err)
        return null
    }
}

val primaryDisplay = args[0]
val mirrorDisplay = args[1]

val displays = findDisplays()
val primaryResolutions = displays[primaryDisplay]!!
val mirrorResolutions = displays[mirrorDisplay]!!

var mainResolution: Resolution? = null
var mirrorResolution: Resolution? = null

var bestMatchValue = Int.MAX_VALUE
var bestMatchPrimary: Resolution? = null
var bestMatchMirror: Resolution? = null

val primaryRes = primaryResolutions.find { it.current }!!

for (mirrorRes in mirrorResolutions) {
    val diff = primaryRes.diff(mirrorRes)

    if (diff < bestMatchValue) {
        bestMatchPrimary = primaryRes
        bestMatchMirror = mirrorRes
        bestMatchValue = diff
    }
    if (diff == 0)
        break
}

println()
println("P $bestMatchPrimary + M $bestMatchMirror = $bestMatchValue")
val command = "xrandr" +
    " --output $primaryDisplay --mode $bestMatchPrimary" +
    " --output $mirrorDisplay --mode $bestMatchMirror --same-as $primaryDisplay"
println(command)
command.runCommand()
