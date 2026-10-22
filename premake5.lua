project "GoogleTest"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "googletest/src/gtest-all.cc",
        "googletest/src/gtest_main.cc",
        "googlemock/src/gmock-all.cc"
    }

    includedirs
    {
        "googletest/include",
        "googletest",
        "googlemock/include",
        "googlemock"
    }

    -- Consumers need these headers on their include path.
    externalincludedirs
    {
        "googletest/include",
        "googlemock/include"
    }

    filter "system:windows"
        systemversion "latest"
        defines { "_CRT_SECURE_NO_WARNINGS" }

    filter "system:linux"
        pic "On"
        links { "pthread" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
        symbols "off"