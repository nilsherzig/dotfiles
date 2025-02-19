self: super: {
  zed-editor = super.zed-editor.overrideAttrs (oldAttrs: {
    # Replace the attributes with your custom package definition
    inherit (import ./zed-editor-package.nix self) pname version src patches;
  });
}

