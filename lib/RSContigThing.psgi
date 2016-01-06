use RSContigThing::RSContigThingImpl;

use RSContigThing::RSContigThingServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = RSContigThing::RSContigThingImpl->new;
    push(@dispatch, 'RSContigThing' => $obj);
}


my $server = RSContigThing::RSContigThingServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
