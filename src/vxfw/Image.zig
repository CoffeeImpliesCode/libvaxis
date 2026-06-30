const std = @import("std");
const vaxis = @import("../main.zig");
const vxfw = vaxis.vxfw;

const Allocator = std.mem.Allocator;

const Image = @This();

image: vaxis.Image,
options: vaxis.Image.DrawOptions = .{},

pub fn widget(self: *Image) vxfw.Widget {
    return .{
        .userdata = self,
        .eventHandler = null,
        .drawFn = typeErasedDrawFn,
    };
}

fn typeErasedDrawFn(ptr: *anyopaque, ctx: vxfw.DrawContext) Allocator.Error!vxfw.Surface {
    const self: *Image = @ptrCast(@alignCast(ptr));
    const max_size = ctx.max.size();
    const min_size = ctx.min;
    _ = min_size;

    return vxfw.Surface{
        .size = max_size,
        .background = self.image,
        .background_options = self.options,
    };
    // return self.draw(ctx);
}
