-- scaffold geniefile for abseil-cpp

abseil-cpp_script = path.getabsolute(path.getdirectory(_SCRIPT))
abseil-cpp_root = path.join(abseil-cpp_script, "abseil-cpp")

abseil-cpp_includedirs = {
	path.join(abseil-cpp_script, "config"),
	abseil-cpp_root,
}

abseil-cpp_libdirs = {}
abseil-cpp_links = {}
abseil-cpp_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { abseil-cpp_includedirs }
	end,

	_add_defines = function()
		defines { abseil-cpp_defines }
	end,

	_add_libdirs = function()
		libdirs { abseil-cpp_libdirs }
	end,

	_add_external_links = function()
		links { abseil-cpp_links }
	end,

	_add_self_links = function()
		links { "abseil-cpp" }
	end,

	_create_projects = function()

project "abseil-cpp"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		abseil-cpp_includedirs,
	}

	defines {}

	files {
		path.join(abseil-cpp_script, "config", "**.h"),
		path.join(abseil-cpp_root, "**.h"),
		path.join(abseil-cpp_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
