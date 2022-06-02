{
  outputs = { self, nixpkgs }:
    let
      inherit (builtins) attrNames concatStringsSep mapAttrs;

      modules = {
        "zephyr" = { owner = "zmkfirmware"; repo = "zephyr"; rev = "312ceebdede48e28230450f3e763f6729a137e23"; sha256 = "vHSv4ivOhGA5/LpNQGsLUfK2WEU2jh+aWA2kQeeDS8c="; };

        "modules/lib/canopennode" = { repo = "canopennode"; rev = "1052dae561497bef901f931ef75e117c9224aecd"; sha256 = "af0LVmv7rPrBxa+/wGEkMn1O8/rTsVQRNgy+GAfa8zw="; };
        "modules/lib/civetweb" = { repo = "civetweb"; rev = "094aeb41bb93e9199d24d665ee43e9e05d6d7b1c"; sha256 = "ogFwEeH8OBgaLP4OcVA2Ai/cxwRVWJVv/gayjZyR0tY="; };
        "modules/hal/cmsis" = { repo = "cmsis"; rev = "b0612c97c1401feeb4160add6462c3627fe90fc7"; sha256 = "Ltcg9z5xbQDYsM3ppDNuhdc8w/QrNZiF1t7n9xtoci4="; };
        "modules/fs/fatfs" = { repo = "fatfs"; rev = "09a9d913c61dccbb8ff92d8943b452c614ac5292"; sha256 = "Uw0bxo/4Kzh8K3Qn54CR1D5deJ+1Lf5KDURysELEdyY="; };
        "modules/hal/atmel" = { repo = "hal_atmel"; rev = "9f78f520f6cbb997e5b44fe8ab17dd5bf2448095"; sha256 = "1nI2OOqQKV6Zz21sgwzfCYh8D3Ylb1B2FIZDkPgF9iI="; };
        "modules/hal/espressif" = { repo = "hal_espressif"; rev = "bcd7565ffa390d5774dc2fbe71a002faa9a7d082"; sha256 = "NVF45CoqgjumfupDAhTLdd77lJS5ibuwEvpaCE75aP4="; };
        "modules/hal/gigadevice" = { repo = "hal_gigadevice"; rev = "242a7f4be7a3136606c7a65169775f7ef85ad444"; sha256 = "wGnc+FCYOULegFim81fOXubQNP9YgqvwHEWRrH7wvu0="; };
        "modules/hal/nordic" = { repo = "hal_nordic"; rev = "a42b016d7c7610489f5f8c79773fedc05ba352ee"; sha256 = "0UuYXCyyRL9wWNNmcOKHPVEjd9JjAuMfSEDEzBum+s0="; };
        "modules/hal/nuvoton" = { repo = "hal_nuvoton"; rev = "b4d31f33238713a568e23618845702fadd67386f"; sha256 = "vp4G1qKfVVxEUJgD0lBy9fO3SNcJ8rnRQcS4fW1UgiQ="; };
        "modules/hal/quicklogic" = { repo = "hal_quicklogic"; rev = "b3a66fe6d04d87fd1533a5c8de51d0599fcd08d0"; sha256 = "XpPROaiZN0KRxQCtEOYaXSEBtxAo+atnH1ytOMXpYUI="; };
        "modules/hal/rpi_pico" = { repo = "hal_rpi_pico"; rev = "191f5ba46fda49523cdaaef27583d1c875ba2c36"; sha256 = "Dy+ebCXjshscsSaUu41UorNyWVmYH+nDPKO6e8TEi6c="; };
        "modules/hal/stm32" = { repo = "hal_stm32"; rev = "300109f80730cb2477bfcc706a6602b9870336b3"; sha256 = "KTig3wbEhLRyTjHLMtd1ZbZ8NgSKq7feCzv6ymdsAJI="; };
        "modules/hal/telink" = { repo = "hal_telink"; rev = "ffcfd6282aa213f1dc0848dbca6279b098f6b143"; sha256 = "kXKzw0gwT2b9LaBPRJOeCisg/XQ9O1To9OfHOz8nK9o="; };
        "modules/hal/libmetal" = { repo = "libmetal"; rev = "f237c9d420a51cc43bc37d744e41191ad613f348"; sha256 = "FD9yE6TL+2rWIxodvpHwoelk7igCw/UfnQCKKC7P+NA="; };
        "modules/fs/littlefs" = { repo = "littlefs"; rev = "33509ed9c3d369cdb9d909cd40c5eea8f64a902c"; sha256 = "wRKt+mSAZOcv1t8VhvZnNm/u/XwAEK7Ubm6vpltPmTU="; };
        "modules/lib/gui/lvgl" = { repo = "lvgl"; rev = "783c1f78c8e39751fe89d0883c8bce7336f55e94"; sha256 = "ht8yabUXYXsbg1DQKgv0DXHLDLlEkP47tQNtZdssOsY="; };
        "modules/lib/lz4" = { repo = "lz4"; rev = "8e303c264fc21c2116dc612658003a22e933124d"; sha256 = "zqItRECBLA2poyihoEXwpNxfn7koxxyA5vud8Po7Gs8="; };
        "modules/crypto/mbedtls" = { repo = "mbedtls"; rev = "3e3e58a92de76069730c63e0d524f40fea948a61"; sha256 = "VSEWObcr/j57eCro6JxEKv3bdO3urrkMjLFLFqCaU4g="; };
        "modules/debug/mipi-sys-t" = { repo = "mipi-sys-t"; rev = "d9da086b11cda494d85f4d8a9829f505c2d5e380"; sha256 = "Zf70wjZjTcBaCn3XpxB/GPdj5qUEBsWxgCziN3hKggE="; };
        "modules/lib/nanopb" = { repo = "nanopb"; rev = "d148bd26718e4c10414f07a7eb1bd24c62e56c5d"; sha256 = "6r7aJX4xx4iU1t+KEqqqM7d6NCkS2ul/DKNul5x2zL8="; };
        "modules/bsim_hw_models/nrf_hw_models" = { repo = "nrf_hw_models"; rev = "b8cea37dbdc8fc58cc14b4e19fa850877a9da520"; sha256 = "IqToh5ljBabj2+P69CyYsVsYooH1xV4KbNPNXrWJNG0="; };
        "modules/lib/open-amp" = { repo = "open-amp"; rev = "cfd050ff38a9d028dc211690b2ec35971128e45e"; sha256 = "q9LUmC/kCBcsJGb2ayoX9e1KLdkakt03EqZKm1QOxJI="; };
        "modules/lib/tflite-micro" = { repo = "tflite-micro"; rev = "9156d050927012da87079064db59d07f03b8baf6"; sha256 = "Aa5mFsGFc3c7F7GleL0QfB5XBl1ihYGsGIDCnEPBP98="; };
        "modules/lib/tinycbor" = { repo = "tinycbor"; rev = "40daca97b478989884bffb5226e9ab73ca54b8c4"; sha256 = "MbJbXqX+CJMQ0ctGDDGG4nOvX6IM6CB1srE452SOQAs="; };
        "modules/crypto/tinycrypt" = { repo = "tinycrypt"; rev = "3e9a49d2672ec01435ffbf0d788db6d95ef28de0"; sha256 = "5gtZbZNx+D/EUkyYk7rPtcxBZaNs4IFGTP/7IXzCoqU="; };
        "modules/debug/TraceRecorder" = { repo = "TraceRecorderSource"; rev = "e8ca3b6a83d19b2fc4738a0d9607190436e5e452"; sha256 = "e4id+mrC5HspykkpvHqfS4MQOB43h/ezWJq/vyJcdyQ="; };
        "modules/tee/tf-m/tf-m-tests" = { repo = "tf-m-tests"; rev = "52814181f0fde6d1422fac204d42cde30c62e40e"; sha256 = "kWw4DEkHpdgnWevX2VnWSTiWauZG92libwVV8Qxg1Wk="; };
        "modules/tee/tf-m/psa-arch-tests" = { repo = "psa-arch-tests"; rev = "0aab24602cbef30f6422e7ef1066a8473073e586"; sha256 = "vyJVQhPuOi5tEpeKL1ITGGwZnhhtXfGH4xniNV3Ihnw="; };
        "modules/lib/zscilib" = { repo = "zscilib"; rev = "12bfe3f0a9fcbfe3edab7eabc9678b6c62875d34"; sha256 = "5GR2l7iQ1TLSi6wwEbfxgO6E8R1MEySL1tU+fBpPS6w="; };
      };

      buildInputs = pkgs: with pkgs; [
        git
        gcc-arm-embedded
        cmake
        bzip2
        ccache
        dtc
        dfu-util
        libtool
        ninja
        gperf
        xz
        (python3.withPackages (p: with p; [
          pyelftools
          pyyaml
          pykwalify
          canopen
          packaging
          progress
          psutil
          intelhex
          west
        ]))
        qemu
      ];

      moduleSetupCommands = pkgs: let
        fetchFromZephyr = args: pkgs.fetchFromGitHub ({ owner = "zephyrproject-rtos"; } // args);

        modulePackages = mapAttrs (path: spec: fetchFromZephyr spec) modules;

        # ln -s might actually work
        moduleSetupCommand = path: pkg: "mkdir -p $(dirname ./${path}); cp -r ${pkg} ./${path}";
      in concatStringsSep "\n" (map (name: moduleSetupCommand name modulePackages.${name}) (attrNames modulePackages));

    in {
      lib = rec {
        devShell = { system }:
          let
            pkgs = nixpkgs.legacyPackages.${system};
          in pkgs.mkShell {
            nativeBuildInputs = buildInputs pkgs;

            ZEPHYR_TOOLCHAIN_VARIANT = "gnuarmemb";
            GNUARMEMB_TOOLCHAIN_PATH = pkgs.gcc-arm-embedded;

            shellHook = ''
              export ZEPHYR_BASE=$PWD/zephyr
            '';
          };

        defaultZmk = { system }:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in pkgs.fetchFromGitHub {
          owner = "zmkfirmware";
          repo = "zmk";
          rev = "41dc774848dace9b4bcfa59691c81a229dd416e1";
          sha256 = "/BIVgqOfavHVIIVGLfg7rOx6T8GPhEjOsokvq1uw6sw=";
        };

        firmwarePackage =
          { name ? "zmk-firmware"
          , board
          , shields
          , config ? ./config
          , zmk ? null
          , system
         }:
        let
          pkgs = nixpkgs.legacyPackages.${system};

          realZmk = if zmk == null
                    then defaultZmk { inherit system; }
                    else zmk;

          src = pkgs.stdenv.mkDerivation {
            name = "zmk-firmware-source";

            src = realZmk;

            buildPhase = ''
              mkdir -p .west
              cat >.west/config <<EOF
              [manifest]
              path = app
              file = west.yml

              [zephyr]
              base = zephyr
              EOF
              ${moduleSetupCommands pkgs}
            '';
            installPhase = ''
              cp -r . $out
            '';
          };

        in pkgs.stdenv.mkDerivation {
          inherit name src;

          nativeBuildInputs = buildInputs pkgs;

          CCACHE_DISABLE = 1;
          ZEPHYR_TOOLCHAIN_VARIANT = "gnuarmemb";
          GNUARMEMB_TOOLCHAIN_PATH = pkgs.gcc-arm-embedded;

          # dontUseCmakeConfigure = true;
          configurePhase = ''
            # The west commands needs to find .git
            git -C zephyr init
            git -C zephyr config user.email 'foo@example.com'
            git -C zephyr config user.name 'Foo Bar'
            git -C zephyr add -A
            git -C zephyr commit -m 'Fake commit'
            git -C zephyr checkout -b manifest-rev
            git -C zephyr checkout --detach manifest-rev
          '';

          buildPhase = ''
            export ZEPHYR_BASE=$PWD/zephyr
            cd app
            ${concatStringsSep "\n" (map (shield: "west -vvv build -p -d build/${shield} -b ${board} -- -DSHIELD=${shield} -DZMK_CONFIG=${config}") shields)}
            cd ..
          '';

          installPhase = ''
            mkdir -p $out
            ${concatStringsSep "\n" (map (shield: "cp app/build/${shield}/zephyr/zmk.uf2 $out/${shield}.uf2") shields)}
          '';
        };
      };
    };
}
