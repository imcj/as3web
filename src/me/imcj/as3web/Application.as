package me.imcj.as3web
{
	public class Application
	{
		protected var _processors : Array;
		
		public function Application()
		{
			_processors = new Array ( );
		}
		
		public function add_processor ( processor : * ) : Application
		{
			_processors[_processors.length] = processor;
			return this;
		}
		
		public function handler ( ) : void
		{
			
		}
		
		public function handle_with_process ( ) : void
		{
			var process : Function = function ( processors : Array ) : void
			{
				try {
					if ( processors ) {
						return processors.slice ( 0, 1 )(
							//as3 no lambaa
							function ( processors : Array ) : void
							{
								return process ( processors );
							}
						)
					} else
						handler ( );
				}
			};
			
			process ( _processors );
		}
		
		public function wsgifunc ( ... middlewares ) : void
		{
			var wsgi : Function = function ( env : Object, start_response ) : void
			{
				
			};
			
			// TODO middleware can Class Function and String
			var middleware : Function;
			for each ( middleware in middlewares )
				wsgi ( middleware ( wsgi ) );
			
			return wsgi;
		}
	}
}