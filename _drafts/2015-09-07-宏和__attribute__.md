在include/linux/moduleparam.h中，

#define __param_check(name, p, type) \
	static inline type __always_unused *__check_##name(void) { return(p); }

#define param_check_byte(name, p) __param_check(name, p, unsigned char)
#define param_check_short(name, p) __param_check(name, p, short)
#define param_check_ushort(name, p) __param_check(name, p, unsigned short)
#define param_check_uint(name, p) __param_check(name, p, unsigned int)
#define param_check_long(name, p) __param_check(name, p, long)
#define param_check_ulong(name, p) __param_check(name, p, unsigned long)
#define param_check_ullong(name, p) __param_check(name, p, unsigned long long)
#define param_check_charp(name, p) __param_check(name, p, char *)
#define param_check_bool(name, p) __param_check(name, p, bool)
#define param_check_invbool(name, p) __param_check(name, p, bool)

#define module_param_cb(name, ops, arg, perm)				      \
__module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0)

/* This is the fundamental function for registering boot/module
   parameters. */
#define __module_param_call(prefix, name, ops, arg, perm, level, flags)	\
/* Default value instead of permissions? */			\
	static const char __param_str_##name[] = prefix #name; \
	static struct kernel_param __moduleparam_const __param_##name	\
	__used								\
    __attribute__ ((unused,__section__ ("__param"),aligned(sizeof(void *)))) \
	= { __param_str_##name, ops, VERIFY_OCTAL_PERMISSIONS(perm),	\
	level, flags, { arg } }

#define __MODULE_PARM_TYPE(name, _type)					  \
  __MODULE_INFO(parmtype, name##type, #name ":" _type)
#define __MODULE_INFO(tag, name, info)					  \
static const char __UNIQUE_ID(name)[]					  \
  __used __attribute__((section(".modinfo"), unused, aligned(1)))	  \
  = __stringify(tag) "=" info

#define module_param_named(name, value, type, perm)			   \
	param_check_##type(name, &(value));				   \
	module_param_cb(name, &param_ops_##type, &value, perm);		   \
	__MODULE_PARM_TYPE(name, #type)
