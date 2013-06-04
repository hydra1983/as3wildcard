package as3.lang {
import as3.lang.errors.*;

	public class IllegalArgumentError extends RuntimeError {
		public function IllegalArgumentError(message:String = "") {
			super(message);
		}
	}
}
