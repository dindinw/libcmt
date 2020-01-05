/*
 * Copyright (c), Recep Aslantas.
 * MIT License (MIT), http://opensource.org/licenses/MIT
 */

#import "common.h"

MT_EXPORT
MtRenderCommandEncoder*
mtRenderCommandEncoder(MtCommandBuffer *cmdb, MtRenderPassDesc *pass) {
  return [(id<MTLCommandBuffer>)cmdb renderCommandEncoderWithDescriptor: pass];
}

MT_EXPORT
void
mtFrontFace(MtRenderCommandEncoder *rce, MtWinding winding) {
  [(id<MTLRenderCommandEncoder>)rce setFrontFacingWinding:(MTLWinding)winding];
}

MT_EXPORT
void
mtCullMode(MtRenderCommandEncoder *rce, MtCullMode mode) {
  [(id<MTLRenderCommandEncoder>)rce setCullMode:(MTLCullMode)mode];
}

MT_EXPORT
void
mtViewport(MtRenderCommandEncoder *rce, MtViewport *viewport) {
  [(id<MTLRenderCommandEncoder>)rce setViewport: *(MTLViewport *)viewport];
}

MT_EXPORT
void
mtSetRenderState(MtRenderCommandEncoder *rce, MtRenderPipeline *pipline) {
  [(id<MTLRenderCommandEncoder>)rce setRenderPipelineState: pipline];
}

MT_EXPORT
void
mtSetDepthStencil(MtRenderCommandEncoder *rce, MtDepthStencil *ds) {
  [(id<MTLRenderCommandEncoder>)rce setDepthStencilState: ds];
}

MT_EXPORT
void
mtVertexBytes(MtRenderCommandEncoder *enc,
              void                   *bytes,
              size_t                  legth,
              uint32_t                atIndex) {
  [(id<MTLRenderCommandEncoder>)enc setVertexBytes: bytes
                                            length: legth
                                           atIndex: atIndex];
}

MT_EXPORT
void
mtVertexBuffer(MtRenderCommandEncoder *rce,
               MtBuffer               *buf,
               size_t                  off,
               uint32_t                index) {
  [(id<MTLRenderCommandEncoder>)rce setVertexBuffer: buf
                                             offset: off
                                            atIndex: index];
}

MT_EXPORT
void
mtFragmentBuffer(MtRenderCommandEncoder *rce,
                 MtBuffer               *buf,
                 size_t                  off,
                 uint32_t                index) {
  [(id<MTLRenderCommandEncoder>)rce setFragmentBuffer: buf
                                               offset: off
                                              atIndex: index];
}

MT_EXPORT
void
mtDrawPrims(MtRenderCommandEncoder *rce,
            MtPrimitiveType         type,
            size_t                  start,
            size_t                  count) {
  [(id<MTLRenderCommandEncoder>)rce drawPrimitives: (MTLPrimitiveType)type
                                       vertexStart: start
                                       vertexCount: count];
}

MT_EXPORT
void
mtEndEncoding(MtRenderCommandEncoder *rce) {
  [(id<MTLRenderCommandEncoder>)rce endEncoding];
}
