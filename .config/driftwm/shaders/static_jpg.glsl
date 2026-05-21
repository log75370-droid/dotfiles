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
    // Вместо координат холста берем чистые пиксели экрана
    vec2 uv = gl_FragCoord.xy / u_screen_size;
    
    // Переворачиваем по вертикали, чтобы картинка не была вверх ногами
    uv.y = 1.0 - uv.y; 
    
    // Отрисовываем твой JPG статично на весь 2K экран
    f_color = texture(sampler2D(t_background, s_background), uv);
}
