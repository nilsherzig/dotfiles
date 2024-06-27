{ pkgs, ... }:
{
  # environment.systemPackages = with pkgs;
  #   [
  #     (st.overrideAttrs (oldAttrs: rec {
  #       patches = [
  #         # You can specify local patches
  #         # ./path/to/local.diff
  #         # Fetch them directly from `st.suckless.org`
  #         (fetchpatch {
  #           url =
  #             "https://st.suckless.org/patches/autocomplete/st-0.8.5-autocomplete-20220327-230120.diff";
  #           sha256 = "sha256-tXilaOVz196YoFHd1kChbPYy0d5rh/h/6lQGvIDEH38=";
  #         })
  #         # Or from any other source
  #         # (fetchpatch {
  #         #   url =
  #         #     "https://raw.githubusercontent.com/fooUser/barRepo/1111111/somepatch.diff";
  #         #   sha256 = "222222222222222222222222222222222222222222";
  #         # })
  #       ];
  #     }))
  #   ];
}
