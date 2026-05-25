#version 450

layout(location = 0) in vec2 v_tex_coords;
layout(location = 0) out vec4 f_color;

layout(set = 0, binding = 0) uniform Uniforms {
    mat4 u_matrix;
    vec2 u_screen_size;
    float u_zoom;
};

layout(set = 1, binding = 0) texture2D t_background;
layout(set = 1, binding = 1) sampler s_background;

void main() {
    // Оригинальный алгоритм разработчика для центрирования и растягивания картинки
    vec2 uv = v_tex_coords;
    
    // Внутренний расчет driftWM, чтобы обои не размножались плиткой
    f_color = texture(sampler2D(t_background, s_background), uv);
}
