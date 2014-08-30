package module;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Modules;

@At("/module")
@Modules(scanPackage = true)
public class MainModule {
	
}