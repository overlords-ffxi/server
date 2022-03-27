#pragma once

#include <memory>

#include "../common/mmo.h"

class SightMesh
{
public:
    SightMesh(std::string const& filename);
    bool raycast(const position_t& start, const position_t& end);
};
