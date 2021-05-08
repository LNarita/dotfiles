# TODO

## Struct

```
setup/
├── tools/
├── distro/
│   └── [distro]/
│       └── pkg/
│           ├── [pkg-manager].txt
│           └── [profile]/
│               └── [pkg-manager].txt
├── common/
│   ├── distro/
│   │   └── [distro]/
│   │       ├── config/
│   │       │   └── [.sh-to-source]
│   │       └── home/
│   │           └── [symlink-to-same-path-@-home]
│   ├── config/
│   │   └── [.sh-to-source]
│   └── home/
│       └── [symlink-to-same-path-@-home]
└── [profile]/
    ├── distro/
    │   └── [distro]/
    │       ├── config/
    │       └── home/
    ├── config/
    └── home/
```

## Setup Script

- [ ] decide paths based on current distro
- [ ] backup dotfiles before setting up env
- [ ] symlink files
- [ ] install pkgs

## Custom Aliases

- [ ] pkg manager: save/remove pkg name if operation successful

## Other

- [ ] docs?
