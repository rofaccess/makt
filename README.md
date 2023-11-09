# README

## Estructura del Proyecto
### Arquitectura CSS
Para organizar los estilos se consideran las siguientes cuestiones:
1. Nomenclatura de clases CSS: nomenclatura BEM y prefijos.
2. Estructura de carpetas y archivos de estilos según ITCSS: settings, generic, elements, objects, components, utilities, external.
3. Estructura del layout: elements, objects, components.

Los puntos 1 y 2 se combinan en la metodología BEMIT (BEM + ITCSS). El punto 3 está basado en Atomic Design y define como abstraer conceptos para ayudar a estructurar la implementación de interfaces.
From:
- https://apiumhub.com/es/tech-blog-barcelona/bemit-itcss-bem/
- https://csswizardry.com/2015/03/more-transparent-ui-code-with-namespaces/


#### 1. Nomenclatura de clases CSS

BEM es una forma de nombrar las clases CSS.
Las siglas de BEM significan lo siguiente:
- B de bloque.
- E de elemento.
- M de modificador.

BEM tiene la siguiente estructura básica:
- **block:** navbar, main-navbar
- **block__element:** navbar__header, navbar__main-header
- **block__element-modifier:** navbar--red, navbar--big, navbar__header--small

**Obs.:** No sé si hay desventajas de usar nesting de css para organizar los elementos dentro del bloque.

**Prefijos**

Los prefijos de clases son una ayuda extra para determinar que hacen o que abarcan las clases, además ayudan a determinar donde están definidas esas clases con solo mirar sus prefijos. No forma parte de la nomenclatura de BEM pero el usarlos provee de las ventajas mencionadas anteriormente. Es un agregado usado en BEMIT.
- e- Element. Son elementos concretos que se combinan para formar Objects. Utilizan bloques BEM, que no suelen tener la E de BEM.
- o- Object. Clases reutilizables en otras partes del proyecto, en general, dentro de Components. Siempre es un bloque BEM tal y como los Components. Formato: .o-object-name[element|modifier] {}
- c- Component. Siempre es un bloque BEM. Se encuentran dentro de la carpeta components. Formato: .c-component-name[element|modifier] {}
- u- Utility, su implementación debería estar dentro de la carpeta utilities. Son clases reutilizables que no siguen el formato BEM. Son utilidades especificas que estilizan pero no son piezas concretas de UI. Formato: .u-utility-name {}
- t- Theme. Relacionado a temas. Ej. e-btn.t-dark. Formato: .t-theme-name {}
- s- Scope. Clases que modifican los estilos de librerias externas.
- is-, -has. Prefijos de estado. Indican estados temporales de piezas de UI. Pueden cambiar de un momento a otro según las acciones del usuario. Ej.: is-active, is-open, has-error. Formato: .[is|has]-state {}
- js-, Indica que la clase tiene un comportamiento javascript vinculado, es especifico para javascript, por lo que no se definen estilos para estas clases. Esto se usar para evitar romper código javascript al realizar refactorizaciones en las clases usadas en el HTML. Formato: .js-component-name {}
- qa-, Usado en pruebas automatizadas de Selenium. Del mismo modo que el anterior, es para evitar romper tests cuando se hacen refactorizaciones de las clases usadas en el html. Formato: .qa-node-name {}

#### 2. Estructura de carpetas y archivos de estilos según ITCSS
ITCSS es un sistema para organizar los archivos y carpetas de los estilos css. Los estilos se dividen en capas de lo más general a lo más especifico, por ejemplo, en la capa settings están las variables que son utilizadas por todas las capas, y en las últimas están los utilities que tienen estilos muy especificos. Las capas superiores afectan a las inferiores pero nunca al contrario. Tener en cuenta que el uso de ITCSS que se realiza aquí es una adaptación, así que en algunos casos no se respetan los conceptos tal cual, como ser los conceptos de la capa objects y utilites, además que al utilizar BEMIT se agrega otra variante.

**Para organizar los estilos se tienen las siguientes carpetas:**
- **00_settings:** Se definen las propiedades de css que se utilizan en otras capas, como ser colores, tamaños, etc. También incluye las variables usadas por preprocesadores.
- **01_generic:** Código generico para resetear o estandarizar los estilos base de los navegadores. También puede incluir algunos estilos del layout.
- **02_elements:** Corresponde a los estilos de los elementos más pequeños, como ser: label, button, input. Exagerando, hasta podrían tener correspondencia exacta con los tags de html pero sin estilizar los tags html directamente, sino a través de clases como .btn, .btn-primary, btn-cancel, .icon, .label, etc.
- **03_objects:** Son estilos de grupos de elements que se utilizan en todo el proyecto: icono + tipografia (menu item), campo de texto + tipografia (form item, form input o input group). Para que algo pueda considerarse un object debe cumplir con dos criterios: 1. Son la suma de más de un element . Ej. menu-item (icon + label). También puede ser la suma de otros objects y elements 2. Sólo tienen sentido o razón de ser dentro un component. Ej. El menu-item solo tiene sentido dentro de los components menu-bar o sidebar pero no se pueden usar directamente en el layout. Los criterios mencionados son para agrupar cosas que parecen components por ser un poco complejos pero no lo son. **Obs.:** En los view component, al menu-item se los considera como components, ya que en ese nivel corresponden a components reutilizables dentro de otros components aunque por si mismos no tengan razón de ser, pero en HTML y CSS los tratamos como objects deacuerdo a los dos criterios indicados antes. Según [este tutorial](https://apiumhub.com/es/tech-blog-barcelona/arquitectura-de-triangulo-invertido-para-css-itcss/) los containers también son objects, pero prefiero poner los containers en generic o en utilities. Tal vez esto tenga que ver con que se está usando BEMIT y no ITCSS, y es como que no cuadra por completo con ITCSS. Los objects son como subcomponentes.
- **04_components:** Corresponde a los estilos de los componentes que son la suma de varios elementos y/o objetos, como ser: menu-bar, sidebar, form, etc. Los componentes conforman el layout de la aplicación (El layout podría considerarse como la suma de varios componentes).
- **05_utilities:** Una clase de utilidad es una clase independiente, es decir, que no son ni bloque, ni elemento, ni modificador. Se usan en varias partes de la aplicación como los objects, pero no tienen necesariamente un significado o no corresponden a bloques.
- **06_scopes:** Abarca los estilos que se usan para modificar estilos de terceros, por ejemplo cuando se usa algún framework.

#### 3. Estructura del layout
Elements, Objects y Components son implementaciones concretas de una pieza específica de UI.

## Testing
Si entrar en mucho detalle sobre conceptos y basado en mi experiencia, podría decir que los objetivos de las pruebas, o al menos, mis objetivos son:
- Escribir código de calidad, esto significa que sea simple y fácil de mantener. Usualmente un código fácil de probar, es un código más simple y fácil de mantener. Esto sucede porque al escribir las pruebas, a veces se requieren hacer refactorizaciones al código para que sean más fáciles de probar.
- Asegurar que los cambios no rompan otras partes de la aplicación, o detectar estos fallos si es que ocurren. Para el primer punto, al realizar pruebas se realizan también mejoras continuas que hacen el código sea menos acoplado y se reduce el riesgo de romper una parte de la aplicación al realizar cambios en otras partes, pero, si estos fallos o roturas llegan a ocurrir podremos repararlos antes de que lleguen al usuario final ya que nos adelantamos a saber de su existencia a través de las pruebas.

Aún así, las pruebas tienen la gran desventaja del tiempo. Lleva tiempo implementar pruebas, y a veces es tedioso mantenerlas, dependendiendo de que tan bien fueron escritas. Sólo el tiempo y luego la experiencias nos hace ver como ir mejorando las pruebas y aprender sobre que es lo que realmente deberiamos probar, y por supuesto, la práctica hace al maestro.

### Pruebas de vista
La vista es un detalle de implementación, y, siempre que el usuario pueda realizar su tarea, estamos bien, no importa si el texto es azul o verde, o si es más pequeño o más grande, o si la barra de desplazamiento está a la izquierda o a la derecha, esos son detalles de la presentación que suelen cambiar mucho pero no deberían hacer que una prueba falle.
Si se cambia el texto de un botón de "Comprar" a "Agregar al carrito", no conviene que hayan pruebas unitaras que fallen, ya que sólo hubo un cambio de presentación, a veces un cambio estético, pero el comportamiento no cambia y el usuario podrá seguir realizando su trabajo, sin importar si el texto dice una cosa u otra o si el botón es azul o verde. Por este motivo, realizar pruebas unitarias de las vistas podría no ser tan útil si se rompen por este tipo de cambios. Entonces, en este punto se puede considerar si usarlo o no o al menos hacerlo bien dependiendo de lo que se quiere lograr considerando los aspectos mencionados antes para escribir mejores pruebas. Por ejemplo, si estamos probando un view component, en vez de comprobar que se renderize un texto en específico se debe comprobar que se renderize algún texto o el contenedor del texto.
Algo que también puede pasar es que terminemos probando lo mismo en diferentes capas o tipos de pruebas, por ejemplo, en las pruebas de integración se podría probar los mismo que en una prueba de view component, para evitar esto creo que se debe definir bien el alcance de cada capa o tipo de prueba.

### Ejecucion de pruebas
Ejecutar todas las pruebas
> bundle exec rspec

Ejecutar una prueba en específico
> bundle exec rspec spec/components/sidebar/submenu_component_spec.rb:44
