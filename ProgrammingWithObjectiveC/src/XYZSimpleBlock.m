// best practice to define custom type when specific block signaure is reused
// - also makes code more readable when used in method defs where
// blocks return other blocks, etc

// NOTE: blocks are 1st class citizens and can be passed around & returned
typedef void (^XYZSimpleBlock)(void);

