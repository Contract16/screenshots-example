/// Breakpoints class that provides a mapping of Breakpoint enum values to their corresponding pixel values as strings.
/// We're using the values from Tailwind CSS as a reference. [reference](https://tailwindcss.com/docs/responsive-design)
enum Breakpoint {
  sm,
  md,
  lg,
  xl,
  xxl;

  String get name => switch (this) {
        Breakpoint.sm => 'small',
        Breakpoint.md => 'medium',
        Breakpoint.lg => 'large',
        Breakpoint.xl => 'extraLarge',
        Breakpoint.xxl => 'extraExtraLarge',
      };

  double get size => switch (this) {
        Breakpoint.sm => 640,
        Breakpoint.md => 768,
        Breakpoint.lg => 1024,
        Breakpoint.xl => 1280,
        Breakpoint.xxl => 1536,
      };
}
