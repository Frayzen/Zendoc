---
title: TP1 - Shadders
Matière:
  - "[[Programmation OpenGL]]"
Type: TP/TD
Date du cours: 2025-04-17
Supports:
  - "[[tp_1.pdf]]"
---
# La couleur
  
## Question 1
Complete the shaders in order to display the object in yellow.
### Vertex shadder
```GLSL
\#version 450
in vec3 position;
in vec3 normalFlat;
in vec3 normalSmooth;
in vec3 color;
in vec2 uv;
out vec3 vertex_color;
vec3 light_color = vec3(1.0, 1.0, 1.0);
vec3 light_position = vec3(1.0, 1.0, 5.0);
mat4 model_view_matrix = mat4(
			      0.57735, -0.33333, 0.57735, 0.00000,
			      0.00000, 0.66667, 0.57735, 0.00000,
			      -0.57735, -0.33333, 0.57735, 0.00000,
			      0.00000, 0.00000, -17, 1.00000);
mat4 projection_matrix = mat4(
			      5.00000, 0.00000, 0.00000, 0.00000,
			      0.00000, 5.00000, 0.00000, 0.00000,
			      0.00000, 0.00000, -1.00020, -1.00000,
			      0.00000, 0.00000, -10.00100, 0.00000);
vec3 gl_position;
void main() {
	gl_Position = projection_matrix * model_view_matrix * vec4(position, 1.0);
	vertex_color = vec3(1.0, 1.0, 0.0);
}
```
### Fragment Shadder
```GLSL
\#version 450
in vec3 vertex_color;
uniform sampler2D texture_sampler;
uniform sampler2D lighting_sampler;
uniform sampler2D normalmap_sampler;
layout(location=0) out vec4 output_color;
void main() {
    output_color = vec4(vertex_color,1.0);
}
```
![[image 98.png|image 98.png]]
  
## Question 2
Modify the shaders in order to display the object using the color provided in the VBO  
color.
### Vertex Shadder
```GLSL
void main() {
	gl_Position = projection_matrix * model_view_matrix * vec4(position, 1.0);
	vertex_color = color; // Changed
}
```
![[image 1 30.png|image 1 30.png]]
  
## Question 3
Modify the shaders in order to disable color interpolation between vertex shader and  
fragment shader. You should then see the triangles of the mesh.
### Vertex Shadder
```GLSL
flat out vec3 vertex_color;
```
### Fragment Shadder
```GLSL
flat in vec3 vertex_color;
```
![[image 2 30.png|image 2 30.png]]
  
---
# Les normales
  
## Question 1
Affichez maintenant l’objet en bleu mais en tenant compte de la lumi`ere. Chaque face  
doit avoir une couleur unis.
### Vertex Shadder
```GLSL
\#version 450
in vec3 position;
in vec3 normalFlat;
in vec3 normalSmooth;
in vec3 color;
in vec2 uv;
flat out vec3 vertex_color;
out vec3 frag_normal;
out vec3 frag_light_dir;
uniform vec3 light_color = vec3(1.0, 1.0, 1.0);
uniform vec3 light_position = vec3(1.0, 1.0, 5.0);
uniform vec3 material_color = vec3(0.0, 0.0, 1.0);
mat4 model_view_matrix = mat4(
    0.57735, -0.33333, 0.57735, 0.00000,
    0.00000, 0.66667, 0.57735, 0.00000,
    -0.57735, -0.33333, 0.57735, 0.00000,
    0.00000, 0.00000, -17, 1.00000);
mat4 projection_matrix = mat4(
    5.00000, 0.00000, 0.00000, 0.00000,
    0.00000, 5.00000, 0.00000, 0.00000,
    0.00000, 0.00000, -1.00020, -1.00000,
    0.00000, 0.00000, -10.00100, 0.00000);
void main() {
  vec3 transformed_normal = normalize(normalFlat);
  vec3 light_dir = normalize(light_position - position);
  frag_normal = transformed_normal;
  frag_light_dir = light_dir;
  vertex_color = material_color;
  gl_Position = projection_matrix * model_view_matrix * vec4(position, 1.0);
}
```
### Fragment Shadder
```GLSL
\#version 450
flat in vec3 vertex_color;
in vec3 frag_normal;
in vec3 frag_light_dir;
uniform sampler2D texture_sampler;
uniform sampler2D lighting_sampler;
uniform sampler2D normalmap_sampler;
layout(location=0) out vec4 output_color;
void main() {
  float diffuse_intensity = max(dot(frag_normal, frag_light_dir), 0.0);
  vec3 final_color = vertex_color * diffuse_intensity;
  output_color = vec4(final_color, 1.0);
}
```
![[image 3 26.png|image 3 26.png]]
## Question 2
Lissez maintenant l’objet (toujours en bleu).
### Vertex Shadder
```GLSL
  vec3 transformed_normal = normalize(normalSmooth);
```
![[image 4 25.png|image 4 25.png]]
  
---
# Les textures
Affichez comme couleur : sur le canal rouge le u et sur le canal vert le v.
## Question 1
### Vertex Shadder
```GLSL
\#version 450
flat in vec3 vertex_color;
in vec2 frag_uv;
uniform sampler2D texture_sampler;
uniform sampler2D lighting_sampler;
uniform sampler2D normalmap_sampler;
layout(location=0) out vec4 output_color;
void main() {
  float u = frag_uv.x;
  float v = frag_uv.y;
  output_color = vec4(u, v, 0.0, 1.0);
}
```
### Fragment Shadder
```GLSL
\#version 450
flat in vec3 vertex_color;
in vec2 frag_uv;
uniform sampler2D texture_sampler;
uniform sampler2D lighting_sampler;
uniform sampler2D normalmap_sampler;
layout(location=0) out vec4 output_color;
void main() {
  float u = frag_uv.x;
  float v = frag_uv.y;
  output_color = vec4(u, v, 0.0, 1.0);
}
```
![[image 5 24.png|image 5 24.png]]
## Question 2
### Vertex Shadder
```GLSL
\#version 450
in vec2 uv_coords;
uniform sampler2D texture_sampler;
uniform sampler2D lighting_sampler;
uniform sampler2D normalmap_sampler;
layout(location=0) out vec4 output_color;
void main() {
  output_color = texture(texture_sampler, uv_coords);
}
```
### Fragment Shadder
```GLSL
\#version 450
in vec2 uv_coords;
uniform sampler2D texture_sampler;
uniform sampler2D lighting_sampler;
uniform sampler2D normalmap_sampler;
layout(location=0) out vec4 output_color;
void main() {
  output_color = texture(texture_sampler, uv_coords);
}
```
![[image 6 22.png|image 6 22.png]]