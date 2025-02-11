# nixdots

My home-manager configuration.

the user.nix should contain something similar to this:

```nix
{
  name="tw1nk";
  hostname="pink-tiger";
  homeDir="/Users/tw1nk";
}
```

Install nix first.

I use determinate nis install:

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

Initial home-manager activation:

```shell
nix run github:nix-community/home-manager -- switch --flake ${user.homeDir}/repos/github.com/tw1nk/nixdots --show-trace
```

After this you can use the alias `homeswitch` which will run the above command.