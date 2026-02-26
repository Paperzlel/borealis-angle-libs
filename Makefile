# Find the OS that's being ran
PLATFORM := 

ifeq ($(OS), Windows_NT)
	PLATFORM := win32
else
	PLATFORM := $(shell sh -c 'uname 2>/dev/null || echo unknown')
endif

ifeq ($(PLATFORM), Linux)
	PLATFORM := linux
endif

CXX := clang++
# Requires optimisation\ C++17 and SSE 4.2
CXXFLAGS := -O3 -std=c++17 -msse4.2
INCLUDES := -Iborealis-angle

ANGLEFILES := angle/src/common/CompiledShaderState.cpp\
	angle/src/common/Float16ToFloat32.cpp\
    angle/src/common/MemoryBuffer.cpp\
    angle/src/common/PackedEGLEnums_autogen.cpp\
    angle/src/common/PackedEnums.cpp\
    angle/src/common/PackedGLEnums_autogen.cpp\
    angle/src/common/PoolAlloc.cpp\
    angle/src/common/SimpleMutex.cpp\
    angle/src/common/WorkerThread.cpp\
    angle/src/common/aligned_memory.cpp\
    angle/src/common/android_util.cpp\
    angle/src/common/angle_version_info.cpp\
    angle/src/common/angleutils.cpp\
    angle/src/common/debug.cpp\
    angle/src/common/entry_points_enum_autogen.cpp\
    angle/src/common/event_tracer.cpp\
    angle/src/common/gl_enum_utils.cpp\
    angle/src/common/gl_enum_utils_autogen.cpp\
    angle/src/common/mathutil.cpp\
    angle/src/common/matrix_utils.cpp\
    angle/src/common/platform_helpers.cpp\
    angle/src/common/string_utils.cpp\
    angle/src/common/system_utils.cpp\
    angle/src/common/tls.cpp\
    angle/src/common/uniform_type_info_autogen.cpp\
    angle/src/common/utilities.cpp\
    angle/src/common/base/anglebase/sha1.cc\
    angle/src/compiler/preprocessor/DiagnosticsBase.cpp\
    angle/src/compiler/preprocessor/DirectiveHandlerBase.cpp\
    angle/src/compiler/preprocessor/DirectiveParser.cpp\
    angle/src/compiler/preprocessor/Input.cpp\
    angle/src/compiler/preprocessor/Lexer.cpp\
    angle/src/compiler/preprocessor/Macro.cpp\
    angle/src/compiler/preprocessor/MacroExpander.cpp\
    angle/src/compiler/preprocessor/Preprocessor.cpp\
    angle/src/compiler/preprocessor/Token.cpp\
    angle/src/compiler/preprocessor/preprocessor_lex_autogen.cpp\
    angle/src/compiler/preprocessor/preprocessor_tab_autogen.cpp\
    angle/src/compiler/translator/BaseTypes.cpp\
    angle/src/compiler/translator/BuiltInFunctionEmulator.cpp\
    angle/src/compiler/translator/CallDAG.cpp\
    angle/src/compiler/translator/CodeGen.cpp\
    angle/src/compiler/translator/CollectVariables.cpp\
    angle/src/compiler/translator/Compiler.cpp\
    angle/src/compiler/translator/ConstantUnion.cpp\
    angle/src/compiler/translator/Declarator.cpp\
    angle/src/compiler/translator/Diagnostics.cpp\
    angle/src/compiler/translator/DirectiveHandler.cpp\
    angle/src/compiler/translator/ExtensionBehavior.cpp\
    angle/src/compiler/translator/FlagStd140Structs.cpp\
    angle/src/compiler/translator/FunctionLookup.cpp\
    angle/src/compiler/translator/HashNames.cpp\
    angle/src/compiler/translator/ImmutableStringBuilder.cpp\
    angle/src/compiler/translator/ImmutableString_autogen.cpp\
    angle/src/compiler/translator/InfoSink.cpp\
    angle/src/compiler/translator/Initialize.cpp\
    angle/src/compiler/translator/IntermNode.cpp\
    angle/src/compiler/translator/IntermRebuild.cpp\
    angle/src/compiler/translator/IsASTDepthBelowLimit.cpp\
    angle/src/compiler/translator/Name.cpp\
    angle/src/compiler/translator/Operator.cpp\
    angle/src/compiler/translator/OutputTree.cpp\
    angle/src/compiler/translator/ParseContext.cpp\
    angle/src/compiler/translator/PoolAlloc.cpp\
    angle/src/compiler/translator/QualifierTypes.cpp\
    angle/src/compiler/translator/ShaderLang.cpp\
    angle/src/compiler/translator/ShaderVars.cpp\
    angle/src/compiler/translator/SizeClipCullDistance.cpp\
    angle/src/compiler/translator/Symbol.cpp\
    angle/src/compiler/translator/SymbolTable.cpp\
    angle/src/compiler/translator/SymbolTable_autogen.cpp\
    angle/src/compiler/translator/SymbolUniqueId.cpp\
    angle/src/compiler/translator/Types.cpp\
    angle/src/compiler/translator/ValidateAST.cpp\
    angle/src/compiler/translator/ValidateGlobalInitializer.cpp\
    angle/src/compiler/translator/ValidateVaryingLocations.cpp\
    angle/src/compiler/translator/VariablePacker.cpp\
    angle/src/compiler/translator/blocklayout.cpp\
    angle/src/compiler/translator/glslang_lex_autogen.cpp\
    angle/src/compiler/translator/glslang_tab_autogen.cpp\
    angle/src/compiler/translator/util.cpp\
    angle/src/compiler/translator/glsl/BuiltInFunctionEmulatorGLSL.cpp\
    angle/src/compiler/translator/glsl/ExtensionGLSL.cpp\
    angle/src/compiler/translator/glsl/OutputESSL.cpp\
    angle/src/compiler/translator/glsl/OutputGLSL.cpp\
    angle/src/compiler/translator/glsl/OutputGLSLBase.cpp\
    angle/src/compiler/translator/glsl/TranslatorESSL.cpp\
    angle/src/compiler/translator/glsl/TranslatorGLSL.cpp\
    angle/src/compiler/translator/glsl/VersionGLSL.cpp\
    angle/src/compiler/translator/tree_ops/ClampFragDepth.cpp\
    angle/src/compiler/translator/tree_ops/ClampIndirectIndices.cpp\
    angle/src/compiler/translator/tree_ops/ClampPointSize.cpp\
    angle/src/compiler/translator/tree_ops/DeclareAndInitBuiltinsForInstancedMultiview.cpp\
    angle/src/compiler/translator/tree_ops/DeclarePerVertexBlocks.cpp\
    angle/src/compiler/translator/tree_ops/DeferGlobalInitializers.cpp\
    angle/src/compiler/translator/tree_ops/EmulateGLFragColorBroadcast.cpp\
    angle/src/compiler/translator/tree_ops/EmulateMultiDrawShaderBuiltins.cpp\
    angle/src/compiler/translator/tree_ops/FoldExpressions.cpp\
    angle/src/compiler/translator/tree_ops/GatherDefaultUniforms.cpp\
	angle/src/compiler/translator/tree_ops/InitializeVariables.cpp\
    angle/src/compiler/translator/tree_ops/MonomorphizeUnsupportedFunctions.cpp\
    angle/src/compiler/translator/tree_ops/PreTransformTextureCubeGradDerivatives.cpp\
    angle/src/compiler/translator/tree_ops/PruneEmptyCases.cpp\
    angle/src/compiler/translator/tree_ops/PruneNoOps.cpp\
    angle/src/compiler/translator/tree_ops/RecordConstantPrecision.cpp\
    angle/src/compiler/translator/tree_ops/ReduceInterfaceBlocks.cpp\
    angle/src/compiler/translator/tree_ops/RemoveArrayLengthMethod.cpp\
    angle/src/compiler/translator/tree_ops/RemoveAtomicCounterBuiltins.cpp\
    angle/src/compiler/translator/tree_ops/RemoveDynamicIndexing.cpp\
    angle/src/compiler/translator/tree_ops/RemoveInactiveInterfaceVariables.cpp\
    angle/src/compiler/translator/tree_ops/RemoveInvariantDeclaration.cpp\
    angle/src/compiler/translator/tree_ops/RemoveUnreferencedVariables.cpp\
    angle/src/compiler/translator/tree_ops/RemoveUnusedFramebufferFetch.cpp\
    angle/src/compiler/translator/tree_ops/RewriteArrayOfArrayOfOpaqueUniforms.cpp\
    angle/src/compiler/translator/tree_ops/RewriteAtomicCounters.cpp\
    angle/src/compiler/translator/tree_ops/RewriteDfdy.cpp\
    angle/src/compiler/translator/tree_ops/RewritePixelLocalStorage.cpp\
    angle/src/compiler/translator/tree_ops/RewriteStructSamplers.cpp\
    angle/src/compiler/translator/tree_ops/RewriteTexelFetchOffset.cpp\
    angle/src/compiler/translator/tree_ops/ScalarizeVecAndMatConstructorArgs.cpp\
    angle/src/compiler/translator/tree_ops/SeparateDeclarations.cpp\
    angle/src/compiler/translator/tree_ops/SeparateStructFromUniformDeclarations.cpp\
    angle/src/compiler/translator/tree_ops/SimplifyLoopConditions.cpp\
    angle/src/compiler/translator/tree_ops/SplitSequenceOperator.cpp\
    angle/src/compiler/translator/tree_ops/glsl/RegenerateStructNames.cpp\
    angle/src/compiler/translator/tree_ops/glsl/RewriteRepeatedAssignToSwizzled.cpp\
    angle/src/compiler/translator/tree_ops/glsl/UseInterfaceBlockFields.cpp\
    angle/src/compiler/translator/tree_ops/msl/RescopeGlobalVariables.cpp\
    angle/src/compiler/translator/tree_util/DriverUniform.cpp\
    angle/src/compiler/translator/tree_util/FindFunction.cpp\
    angle/src/compiler/translator/tree_util/FindMain.cpp\
    angle/src/compiler/translator/tree_util/FindPreciseNodes.cpp\
    angle/src/compiler/translator/tree_util/FindSymbolNode.cpp\
    angle/src/compiler/translator/tree_util/IntermNodePatternMatcher.cpp\
    angle/src/compiler/translator/tree_util/IntermNode_util.cpp\
    angle/src/compiler/translator/tree_util/IntermTraverse.cpp\
    angle/src/compiler/translator/tree_util/ReplaceArrayOfMatrixVarying.cpp\
    angle/src/compiler/translator/tree_util/ReplaceClipCullDistanceVariable.cpp\
    angle/src/compiler/translator/tree_util/ReplaceShadowingVariables.cpp\
    angle/src/compiler/translator/tree_util/ReplaceVariable.cpp\
    angle/src/compiler/translator/tree_util/RewriteSampleMaskVariable.cpp\
    angle/src/compiler/translator/tree_util/RunAtTheBeginningOfShader.cpp\
    angle/src/compiler/translator/tree_util/RunAtTheEndOfShader.cpp\
    angle/src/compiler/translator/tree_util/SpecializationConstant.cpp\
    angle/src/gpu_info_util/SystemInfo.cpp\
    angle/src/libANGLE/AttributeMap.cpp\
    angle/src/libANGLE/BlobCache.cpp\
    angle/src/libANGLE/Buffer.cpp\
    angle/src/libANGLE/Caps.cpp\
    angle/src/libANGLE/Compiler.cpp\
    angle/src/libANGLE/Config.cpp\
    angle/src/libANGLE/Context.cpp\
    angle/src/libANGLE/ContextMutex.cpp\
    angle/src/libANGLE/Context_gles_1_0.cpp\
    angle/src/libANGLE/Debug.cpp\
    angle/src/libANGLE/Device.cpp\
    angle/src/libANGLE/Display.cpp\
    angle/src/libANGLE/EGLSync.cpp\
    angle/src/libANGLE/Error.cpp\
    angle/src/libANGLE/Fence.cpp\
    angle/src/libANGLE/Framebuffer.cpp\
    angle/src/libANGLE/FramebufferAttachment.cpp\
    angle/src/libANGLE/GLES1Renderer.cpp\
    angle/src/libANGLE/GLES1State.cpp\
    angle/src/libANGLE/GlobalMutex.cpp\
    angle/src/libANGLE/HandleAllocator.cpp\
    angle/src/libANGLE/Image.cpp\
    angle/src/libANGLE/ImageIndex.cpp\
    angle/src/libANGLE/IndexRangeCache.cpp\
    angle/src/libANGLE/LoggingAnnotator.cpp\
    angle/src/libANGLE/MemoryObject.cpp\
    angle/src/libANGLE/MemoryProgramCache.cpp\
    angle/src/libANGLE/MemoryShaderCache.cpp\
    angle/src/libANGLE/Observer.cpp\
    angle/src/libANGLE/Overlay.cpp\
    angle/src/libANGLE/OverlayWidgets.cpp\
    angle/src/libANGLE/Overlay_autogen.cpp\
    angle/src/libANGLE/Overlay_font_autogen.cpp\
    angle/src/libANGLE/PixelLocalStorage.cpp\
    angle/src/libANGLE/Platform.cpp\
    angle/src/libANGLE/Program.cpp\
    angle/src/libANGLE/ProgramExecutable.cpp\
    angle/src/libANGLE/ProgramLinkedResources.cpp\
    angle/src/libANGLE/ProgramPipeline.cpp\
    angle/src/libANGLE/Query.cpp\
    angle/src/libANGLE/Renderbuffer.cpp\
    angle/src/libANGLE/ResourceManager.cpp\
    angle/src/libANGLE/Sampler.cpp\
    angle/src/libANGLE/Semaphore.cpp\
	angle/src/libANGLE/Shader.cpp\
    angle/src/libANGLE/ShareGroup.cpp\
    angle/src/libANGLE/State.cpp\
    angle/src/libANGLE/Stream.cpp\
    angle/src/libANGLE/Surface.cpp\
    angle/src/libANGLE/Texture.cpp\
    angle/src/libANGLE/Thread.cpp\
    angle/src/libANGLE/TransformFeedback.cpp\
    angle/src/libANGLE/Uniform.cpp\
    angle/src/libANGLE/VaryingPacking.cpp\
    angle/src/libANGLE/VertexArray.cpp\
    angle/src/libANGLE/VertexAttribute.cpp\
    angle/src/libANGLE/angletypes.cpp\
    angle/src/libANGLE/es3_copy_conversion_table_autogen.cpp\
    angle/src/libANGLE/format_map_autogen.cpp\
    angle/src/libANGLE/formatutils.cpp\
    angle/src/libANGLE/gles_extensions_autogen.cpp\
    angle/src/libANGLE/queryconversions.cpp\
    angle/src/libANGLE/queryutils.cpp\
    angle/src/libANGLE/validationEGL.cpp\
    angle/src/libANGLE/validationES.cpp\
    angle/src/libANGLE/validationES1.cpp\
    angle/src/libANGLE/validationES2.cpp\
    angle/src/libANGLE/validationES3.cpp\
    angle/src/libANGLE/validationES31.cpp\
    angle/src/libANGLE/validationES32.cpp\
    angle/src/libANGLE/validationESEXT.cpp\
    angle/src/libANGLE/capture/FrameCapture_mock.cpp\
    angle/src/libANGLE/capture/serialize_mock.cpp\
    angle/src/libANGLE/renderer/BufferImpl.cpp\
    angle/src/libANGLE/renderer/ContextImpl.cpp\
    angle/src/libANGLE/renderer/DeviceImpl.cpp\
    angle/src/libANGLE/renderer/DisplayImpl.cpp\
    angle/src/libANGLE/renderer/EGLReusableSync.cpp\
    angle/src/libANGLE/renderer/EGLSyncImpl.cpp\
    angle/src/libANGLE/renderer/Format_table_autogen.cpp\
    angle/src/libANGLE/renderer/FramebufferImpl.cpp\
    angle/src/libANGLE/renderer/ImageImpl.cpp\
    angle/src/libANGLE/renderer/ProgramImpl.cpp\
    angle/src/libANGLE/renderer/ProgramPipelineImpl.cpp\
    angle/src/libANGLE/renderer/QueryImpl.cpp\
    angle/src/libANGLE/renderer/RenderbufferImpl.cpp\
    angle/src/libANGLE/renderer/ShaderImpl.cpp\
    angle/src/libANGLE/renderer/SurfaceImpl.cpp\
    angle/src/libANGLE/renderer/TextureImpl.cpp\
    angle/src/libANGLE/renderer/TransformFeedbackImpl.cpp\
    angle/src/libANGLE/renderer/VertexArrayImpl.cpp\
    angle/src/libANGLE/renderer/driver_utils.cpp\
    angle/src/libANGLE/renderer/load_functions_table_autogen.cpp\
	angle/src/libANGLE/renderer/renderer_utils.cpp\
    angle/src/image_util/AstcDecompressor.cpp\
    angle/src/image_util/copyimage.cpp\
    angle/src/image_util/imageformats.cpp\
    angle/src/image_util/loadimage_astc.cpp\
    angle/src/image_util/loadimage_etc.cpp\
    angle/src/image_util/loadimage_paletted.cpp\
    angle/src/image_util/loadimage.cpp\
    angle/src/image_util/storeimage_paletted.cpp\
    angle/src/common/third_party/xxhash/xxhash.c\
    third_party/zlib/adler32.c\
    third_party/zlib/compress.c\
    third_party/zlib/crc32.c\
    third_party/zlib/deflate.c\
    third_party/zlib/gzclose.c\
    third_party/zlib/gzlib.c\
    third_party/zlib/gzread.c\
    third_party/zlib/gzwrite.c\
	third_party/zlib/infback.c\
    third_party/zlib/inffast.c\
    third_party/zlib/inflate.c\
    third_party/zlib/inftrees.c\
	third_party/zlib/trees.c\
    third_party/zlib/uncompr.c\
    third_party/zlib/zutil.c

ifeq ($(PLATFORM), win32)
ANGLEFILES += angle/src/common/system_utils_win.cpp\
	angle/src/common/system_utils_win32.cpp\
	angle/src/compiler/translator/hlsl/ASTMetadataHLSL.cpp\
	angle/src/compiler/translator/hlsl/BuiltInFunctionEmulatorHLSL.cpp\
	angle/src/compiler/translator/hlsl/ImageFunctionHLSL.cpp\
	angle/src/compiler/translator/hlsl/OutputHLSL.cpp\
	angle/src/compiler/translator/hlsl/ResourcesHLSL.cpp\
	angle/src/compiler/translator/hlsl/StructureHLSL.cpp\
	angle/src/compiler/translator/hlsl/TextureFunctionHLSL.cpp\
	angle/src/compiler/translator/hlsl/TranslatorHLSL.cpp\
	angle/src/compiler/translator/hlsl/UtilsHLSL.cpp\
	angle/src/compiler/translator/hlsl/blocklayoutHLSL.cpp\
	angle/src/compiler/translator/hlsl/emulated_builtin_functions_hlsl_autogen.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/AddDefaultReturnStatements.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/ArrayReturnValueToOutParameter.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/BreakVariableAliasingInInnerLoops.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/ExpandIntegerPowExpressions.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/RecordUniformBlocksWithLargeArrayMember.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/RemoveSwitchFallThrough.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/RewriteElseBlocks.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/RewriteUnaryMinusOperatorInt.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/SeparateArrayConstructorStatements.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/SeparateArrayInitialization.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/SeparateExpressionsReturningArrays.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/UnfoldShortCircuitToIf.cpp\
	angle/src/compiler/translator/tree_ops/hlsl/WrapSwitchStatementsInBlocks.cpp\
	angle/src/gpu_info_util/SystemInfo_win.cpp\
	angle/src/libANGLE/renderer/d3d_format.cpp\
	angle/src/libANGLE/renderer/dxgi_format_map_autogen.cpp\
	angle/src/libANGLE/renderer/dxgi_support_table_autogen.cpp\
	angle/src/libANGLE/renderer/d3d/BufferD3D.cpp\
	angle/src/libANGLE/renderer/d3d/CompilerD3D.cpp\
	angle/src/libANGLE/renderer/d3d/DisplayD3D.cpp\
	angle/src/libANGLE/renderer/d3d/DynamicHLSL.cpp\
	angle/src/libANGLE/renderer/d3d/DynamicImage2DHLSL.cpp\
	angle/src/libANGLE/renderer/d3d/EGLImageD3D.cpp\
	angle/src/libANGLE/renderer/d3d/FramebufferD3D.cpp\
	angle/src/libANGLE/renderer/d3d/HLSLCompiler.cpp\
	angle/src/libANGLE/renderer/d3d/ImageD3D.cpp\
	angle/src/libANGLE/renderer/d3d/IndexBuffer.cpp\
	angle/src/libANGLE/renderer/d3d/IndexDataManager.cpp\
	angle/src/libANGLE/renderer/d3d/NativeWindowD3D.cpp\
	angle/src/libANGLE/renderer/d3d/ProgramD3D.cpp\
	angle/src/libANGLE/renderer/d3d/ProgramExecutableD3D.cpp\
	angle/src/libANGLE/renderer/d3d/RenderTargetD3D.cpp\
	angle/src/libANGLE/renderer/d3d/RenderbufferD3D.cpp\
	angle/src/libANGLE/renderer/d3d/RendererD3D.cpp\
	angle/src/libANGLE/renderer/d3d/ShaderD3D.cpp\
	angle/src/libANGLE/renderer/d3d/ShaderExecutableD3D.cpp\
	angle/src/libANGLE/renderer/d3d/SurfaceD3D.cpp\
	angle/src/libANGLE/renderer/d3d/SwapChainD3D.cpp\
	angle/src/libANGLE/renderer/d3d/TextureD3D.cpp\
	angle/src/libANGLE/renderer/d3d/VertexBuffer.cpp\
	angle/src/libANGLE/renderer/d3d/VertexDataManager.cpp\
	angle/src/libANGLE/renderer/d3d/driver_utils_d3d.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Blit11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Buffer11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Clear11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Context11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/DebugAnnotator11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Device11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/ExternalImageSiblingImpl11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Fence11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Framebuffer11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Image11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/IndexBuffer11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/InputLayoutCache.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/MappedSubresourceVerifier11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/PixelTransfer11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Program11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/ProgramPipeline11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Query11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/RenderStateCache.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/RenderTarget11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Renderer11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/ResourceManager11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/ShaderExecutable11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/StateManager11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/StreamProducerD3DTexture.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/SwapChain11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/TextureStorage11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/TransformFeedback11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/Trim11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/VertexArray11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/VertexBuffer11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/formatutils11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/renderer11_utils.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/texture_format_table.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/texture_format_table_autogen.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/converged/CompositorNativeWindow11.cpp\
	angle/src/libANGLE/renderer/d3d/d3d11/win32/NativeWindow11Win32.cpp
endif

EGLFILES := angle/src/libEGL/egl_loader_autogen.cpp\
    angle/src/libEGL/libEGL_autogen.cpp

GLESFILES := angle/src/libGLESv2/egl_ext_stubs.cpp\
    angle/src/libGLESv2/egl_stubs.cpp\
    angle/src/libGLESv2/egl_stubs_getprocaddress_autogen.cpp\
    angle/src/libGLESv2/entry_points_egl_autogen.cpp\
    angle/src/libGLESv2/entry_points_egl_ext_autogen.cpp\
    angle/src/libGLESv2/entry_points_gles_1_0_autogen.cpp\
    angle/src/libGLESv2/entry_points_gles_2_0_autogen.cpp\
	angle/src/libGLESv2/entry_points_gles_3_0_autogen.cpp\
    angle/src/libGLESv2/entry_points_gles_3_1_autogen.cpp\
    angle/src/libGLESv2/entry_points_gles_3_2_autogen.cpp\
    angle/src/libGLESv2/entry_points_gles_ext_autogen.cpp\
    angle/src/libGLESv2/global_state.cpp\
    angle/src/libGLESv2/libGLESv2_autogen.cpp

DEFINES := -DANGLE_CAPTURE_ENABLED=0 -DANGLE_ENABLE_ESSL=1 -DANGLE_ENABLE_GLSL=1 -DANGLE_EXPORT="" -DANGLE_IS_64_BIT_CPU=1

ifeq ($(PLATFORM), win32)
	DEFINES += -DANGLE_IS_WIN=1 -DANGLE_WINDOWS_NO_FUTEX=1 -DANGLE_PLATFORM_EXPORT=""\
	-DANGLE_PRELOADED_D3DCOMPILER_MODULE_NAMES="\"d3dcompiler_47.dll\", \"d3dcompiler_46.dll\", \"d3dcompiler_43.dll\""\
	-DANGLE_ENABLED_D3D11=1 -DANGLE_ENABLE_D3D11_COMPOSITOR_NATIVE_WINDOW=1 -DANGLE_ENABLE_HLSL=1 -DNOMINMAX=1\
	-DX86_WINDOWS=1
endif

DEFINES += -DANGLE_STANDALONE_BUILD=1 -DANGLE_STATIC=1 -DANGLE_UTIL_EXPORT="" -DEGLAPI="" -DGL_API="" -DGL_APICALL=""\
	-DGL_SILENCE_DEPRECATION=1 -DUSE_AURA=1 -D_HAS_EXCEPTIONS="0" -DNDEBUG=1 -DNVALGRIND=1 -DDYNAMIC_ANNOTATIONS_ENABLED=0\
	-DANGLE_VMA_VERSION=3000000 -DANGLE_ENABLE_SHARE_CONTEXT_LOCK=1 -DANGLE_ENABLE_CONTEXT_MUTEX=1 -DANGLE_OUTSIDE_WEBKIT=1

INCLUDES += -Iangle/src -Iangle/include -Iangle/include/KHR -Iangle/src/common/third_party/base -Iangle/src/common/base\
	-Iangle/src/common/third_party/xxhash -Iangle/src/third_party/khronos -Ithird_party/astc-encoder/Source -Ithird_party/zlib\
	-Ithird_party/zlib/google

EGLDEFS := $(DEFINES) -DEGL_EGLEXT_PROTOTYPES=1 -DEGL_EGL_PROTOTYPES=1 -DGL_GLES_PROTOTYPES=1 -DGL_GLEXT_PROTOTYPES=1
GLES2DEFS := $(DEFINES) -DLIBGLESV2_IMPLEMENTATION=1 -DEGL_EGL_PROTOTYPES=0 -DGL_GLES_PROTOTYPES=0

SUFFIX :=
ifeq ($(PLATFORM), win32)
	SUFFIX := .dll
else
	SUFFIX := .so
endif

.PHONY: all 

all: scaffold bin/libANGLE$(SUFFIX) bin/libEGL$(SUFFIX) bin/libGLESv2$(SUFFIX)


scaffold:
ifeq ($(PLATFORM), win32)
	@mkdir bin 2>NUL || cd .
	@mkdir borealis-angle 2>NUL || cd .
endif
ifeq ($(PLATFORM), linux)
	@mkdir -p bin
	@mkdir -p borealis-angle
	@python3 angle/src/program_serialize_data_version.py borealis-angle/ANGLEShaderProgramVersion.h file_list
	@python3 angle/src/commit_id.py gen borealis-angle/angle_commit.h
endif


bin/libANGLE$(SUFFIX):
	-@$(CXX) $(ANGLEFILES) -o $@ $(DEFINES) $(INCLUDES)

bin/libEGL$(SUFFIX):
	-@$(CXX) $(EGLFILES) -o $@ $(DEFINES) $(INCLUDES)

bin/libGLESv2$(SUFFIX):
	-@$(CXX) $(GLESFILES) -o $@ $(DEFINES) $(INCLUDES)