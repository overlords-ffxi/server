#include "sightmesh.h"

#include "navmesh.h"

#include "RaycastMesh.h"
#include "wavefront.h"

std::unique_ptr<RaycastMesh> mesh;

SightMesh::SightMesh(std::string const& filename)
{
    // Load OBJ
    WavefrontObj obj;
    obj.loadObj(filename.c_str(), false);

    // Generate RaycastMesh
    mesh = std::make_unique<RaycastMesh>(obj.mVertexCount, obj.mVertices, obj.mTriCount, (const unsigned int*)obj.mIndices);
}

bool SightMesh::raycast(const position_t& start, const position_t& end)
{
    // From FFXI space to regular space
    float startArr[3];
    float endArr[3];
    float hitLocation[3];
    float normal[3];
    float hitDistance;

    CNavMesh::ToDetourPos(&start, startArr);
    CNavMesh::ToDetourPos(&end, endArr);

    return mesh->raycast(startArr, endArr, hitLocation, normal, &hitDistance);
}
