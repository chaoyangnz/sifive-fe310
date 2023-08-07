const micro = @import("microzig");
const mmio = micro.mmio;

pub const devices = struct {
    pub const FE310 = struct {
        pub const peripherals = struct {
            ///  Coreplex Local Interrupts
            pub const CLINT = @as(*volatile types.peripherals.CLINT, @ptrFromInt(0x2000000));
            ///  Platform Level Interrupt Control
            pub const PLIC = @as(*volatile types.peripherals.PLIC, @ptrFromInt(0xc000000));
            ///  Always On
            pub const AON = @as(*volatile types.peripherals.AON, @ptrFromInt(0x10000000));
            ///  Power Reset Clock Interrupts
            pub const PRCI = @as(*volatile types.peripherals.PRCI, @ptrFromInt(0x10008000));
            ///  One Time Programmable Memory
            pub const OTP = @as(*volatile types.peripherals.OTP, @ptrFromInt(0x10010000));
            ///  General Purpose Input Output
            pub const GPIO0 = @as(*volatile types.peripherals.GPIO0, @ptrFromInt(0x10012000));
            ///  Universal Asynchronous Receiver Transmitter
            pub const UART0 = @as(*volatile types.peripherals.UART0, @ptrFromInt(0x10013000));
            ///  Quad Serial Peripheral Interface
            pub const QSPI0 = @as(*volatile types.peripherals.QSPI0, @ptrFromInt(0x10014000));
            ///  8-bit timer with 4 cmp
            pub const PWM0 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x10015000));
            ///  Universal Asynchronous Receiver Transmitter
            pub const UART1 = @as(*volatile types.peripherals.UART0, @ptrFromInt(0x10023000));
            ///  Quad Serial Peripheral Interface
            pub const QSPI1 = @as(*volatile types.peripherals.QSPI0, @ptrFromInt(0x10024000));
            ///  8-bit timer with 4 cmp
            pub const PWM1 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x10025000));
            ///  Quad Serial Peripheral Interface
            pub const QSPI2 = @as(*volatile types.peripherals.QSPI0, @ptrFromInt(0x10034000));
            ///  8-bit timer with 4 cmp
            pub const PWM2 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x10035000));
        };
    };
};

pub const types = struct {
    pub const peripherals = struct {
        ///  Coreplex Local Interrupts
        pub const CLINT = extern struct {
            ///  Hart 0 software interrupt register
            msip: mmio.Mmio(packed struct(u32) {
                value: u1,
                padding: u31,
            }),
            reserved16384: [16380]u8,
            ///  Hart 0 time comparator register
            mtimecmplo: u32,
            ///  Hart 0 time comparator register
            mtimecmphi: u32,
            reserved49144: [32752]u8,
            ///  Timer register
            mtimelo: u32,
            ///  Timer register
            mtimehi: u32,
        };

        ///  Platform Level Interrupt Control
        pub const PLIC = extern struct {
            reserved4: [4]u8,
            ///  Interrupt Priority Register
            priority1: u32,
            reserved4096: [4088]u8,
            ///  Interrupt Pending Register
            pending0to31: u32,
            reserved8192: [4092]u8,
            ///  Interrupt Enable Register
            enable0to31: u32,
            reserved2097152: [2088956]u8,
            ///  Priority Threshold Register
            threshold: u32,
            ///  Claim/Complete Register
            claim: u32,
        };

        ///  Always On
        pub const AON = extern struct {
            ///  Watchdog Configuration Register
            wdogcfg: mmio.Mmio(packed struct(u32) {
                scale: u4,
                reserved8: u4,
                rsten: u1,
                zerocmp: u1,
                reserved12: u2,
                enalways: u1,
                encoreawake: u1,
                reserved28: u14,
                cmpip: u1,
                padding: u3,
            }),
            reserved8: [4]u8,
            ///  Watchdog Counter Register
            wdogcount: u32,
            reserved16: [4]u8,
            ///  Watchdog Scaled Counter Register
            wdogs: u32,
            reserved24: [4]u8,
            ///  Watchdog Feed Register
            wdogfeed: u32,
            ///  Watchdog Key Register
            wdogkey: u32,
            ///  Watchdog Compare Register
            wdogcmp: mmio.Mmio(packed struct(u32) {
                value: u16,
                padding: u16,
            }),
            reserved64: [28]u8,
            ///  RTC Configuration Register
            rtccfg: mmio.Mmio(packed struct(u32) {
                scale: u4,
                reserved12: u8,
                enalways: u1,
                reserved28: u15,
                cmpip: u1,
                padding: u3,
            }),
            reserved72: [4]u8,
            ///  RTC Counter Low Register
            rtclo: u32,
            ///  RTC Counter High Register
            rtchi: mmio.Mmio(packed struct(u32) {
                value: u16,
                padding: u16,
            }),
            ///  RTC Scaled Counter Register
            rtcs: u32,
            reserved96: [12]u8,
            ///  RTC Compare Register
            rtccmp: u32,
            reserved112: [12]u8,
            ///  AON Clock Configuration Register
            lfrosccfg: mmio.Mmio(packed struct(u32) {
                div: u6,
                reserved30: u24,
                enable: u1,
                ready: u1,
            }),
            ///  AON Clock Configuration Register
            lfxosccfg: mmio.Mmio(packed struct(u32) {
                reserved30: u30,
                enable: u1,
                ready: u1,
            }),
            reserved128: [8]u8,
            ///  Backup Register
            backup0: u32,
            ///  Backup Register
            backup1: u32,
            ///  Backup Register
            backup2: u32,
            ///  Backup Register
            backup3: u32,
            ///  Backup Register
            backup4: u32,
            ///  Backup Register
            backup5: u32,
            ///  Backup Register
            backup6: u32,
            ///  Backup Register
            backup7: u32,
            ///  Backup Register
            backup8: u32,
            ///  Backup Register
            backup9: u32,
            ///  Backup Register
            backup10: u32,
            ///  Backup Register
            backup11: u32,
            ///  Backup Register
            backup12: u32,
            ///  Backup Register
            backup13: u32,
            ///  Backup Register
            backup14: u32,
            ///  Backup Register
            backup15: u32,
            ///  Backup Register
            backup16: u32,
            ///  Backup Register
            backup17: u32,
            ///  Backup Register
            backup18: u32,
            ///  Backup Register
            backup19: u32,
            ///  Backup Register
            backup20: u32,
            ///  Backup Register
            backup21: u32,
            ///  Backup Register
            backup22: u32,
            ///  Backup Register
            backup23: u32,
            ///  Backup Register
            backup24: u32,
            ///  Backup Register
            backup25: u32,
            ///  Backup Register
            backup26: u32,
            ///  Backup Register
            backup27: u32,
            ///  Backup Register
            backup28: u32,
            ///  Backup Register
            backup29: u32,
            ///  Backup Register
            backup30: u32,
            ///  Backup Register
            backup31: u32,
            ///  PMU Wake Program Memory
            pmuwakepm0: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Wake Program Memory
            pmuwakepm1: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Wake Program Memory
            pmuwakepm2: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Wake Program Memory
            pmuwakepm3: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Wake Program Memory
            pmuwakepm4: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Wake Program Memory
            pmuwakepm5: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Wake Program Memory
            pmuwakepm6: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Wake Program Memory
            pmuwakepm7: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Sleep Program Memory
            pmusleeppm0: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Sleep Program Memory
            pmusleeppm1: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Sleep Program Memory
            pmusleeppm2: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Sleep Program Memory
            pmusleeppm3: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Sleep Program Memory
            pmusleeppm4: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Sleep Program Memory
            pmusleeppm5: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Sleep Program Memory
            pmusleeppm6: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Sleep Program Memory
            pmusleeppm7: mmio.Mmio(packed struct(u32) {
                delay: u4,
                reserved5: u1,
                vddpaden: u1,
                reserved7: u1,
                corerst: u1,
                hfclkrst: u1,
                padding: u23,
            }),
            ///  PMU Interrupt Enable Register
            pmuie: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                rtc: u1,
                dwakeup: u1,
                awakeup: u1,
                padding: u28,
            }),
            ///  PMU Cause Register
            pmucause: mmio.Mmio(packed struct(u32) {
                wakeupcause: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Power-on wakeup
                        PowerOn = 0x0,
                        ///  External wakeup
                        External = 0x1,
                        ///  Watchdog wakeup
                        Watchdog = 0x2,
                        _,
                    },
                },
                reserved8: u6,
                resetcause: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Power-on reset
                        PowerOn = 0x0,
                        ///  External reset
                        External = 0x1,
                        ///  Watchdog reset
                        Watchdog = 0x2,
                        _,
                    },
                },
                padding: u22,
            }),
            ///  PMU Sleep Register
            pmusleep: mmio.Mmio(packed struct(u32) {
                sleep: u1,
                padding: u31,
            }),
            ///  PMU Key Register
            pmukey: u32,
        };

        ///  Power Reset Clock Interrupts
        pub const PRCI = extern struct {
            ///  Clock Configuration Register
            hfrosccfg: mmio.Mmio(packed struct(u32) {
                div: u6,
                reserved16: u10,
                trim: u5,
                reserved30: u9,
                enable: u1,
                ready: u1,
            }),
            ///  Clock Configuration Register
            hfxosccfg: mmio.Mmio(packed struct(u32) {
                reserved30: u30,
                enable: u1,
                ready: u1,
            }),
            ///  PLL Configuration Register
            pllcfg: mmio.Mmio(packed struct(u32) {
                r: u3,
                reserved4: u1,
                f: u6,
                q: u2,
                reserved16: u4,
                sel: u1,
                refsel: u1,
                bypass: u1,
                reserved31: u12,
                lock: u1,
            }),
            ///  PLL Divider Register
            plloutdiv: mmio.Mmio(packed struct(u32) {
                div: u6,
                reserved8: u2,
                divby1: u1,
                padding: u23,
            }),
            ///  Clock Configuration Register
            coreclkcfg: u32,
        };

        ///  One Time Programmable Memory
        pub const OTP = struct {};

        ///  Universal Asynchronous Receiver Transmitter
        pub const UART0 = extern struct {
            ///  Transmit Data Register
            txdata: mmio.Mmio(packed struct(u32) {
                data: u8,
                reserved31: u23,
                full: u1,
            }),
            ///  Receive Data Register
            rxdata: mmio.Mmio(packed struct(u32) {
                data: u8,
                reserved31: u23,
                empty: u1,
            }),
            ///  Transmit Control Register
            txctrl: mmio.Mmio(packed struct(u32) {
                enable: u1,
                nstop: u1,
                reserved16: u14,
                counter: u3,
                padding: u13,
            }),
            ///  Receive Control Register
            rxctrl: mmio.Mmio(packed struct(u32) {
                enable: u1,
                reserved16: u15,
                counter: u3,
                padding: u13,
            }),
            ///  Interrupt Enable Register
            ie: mmio.Mmio(packed struct(u32) {
                txwm: u1,
                rxwm: u1,
                padding: u30,
            }),
            ///  Interrupt Pending Register
            ip: mmio.Mmio(packed struct(u32) {
                txwm: u1,
                rxwm: u1,
                padding: u30,
            }),
            ///  Baud Rate Divisor Register
            div: mmio.Mmio(packed struct(u32) {
                value: u16,
                padding: u16,
            }),
        };

        ///  8-bit timer with 4 cmp
        pub const PWM0 = extern struct {
            ///  PWM Configuration Register
            cfg: mmio.Mmio(packed struct(u32) {
                scale: u4,
                reserved8: u4,
                sticky: u1,
                zerocmp: u1,
                deglitch: u1,
                reserved12: u1,
                enable: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Increments counter until overflow.
                        OneShot = 0x2,
                        ///  Increments counter.
                        Always = 0x1,
                        ///  Doesn't increment counter.
                        Off = 0x0,
                        _,
                    },
                },
                reserved16: u2,
                cmp0center: u1,
                cmp1center: u1,
                cmp2center: u1,
                cmp3center: u1,
                reserved24: u4,
                cmp0gang: u1,
                cmp1gang: u1,
                padding: u6,
            }),
            ///  Counter Register
            count: u32,
            reserved16: [8]u8,
            ///  Scaled Halfword Counter Register
            pwms: u32,
            reserved32: [12]u8,
            ///  Compare Register
            cmp0: mmio.Mmio(packed struct(u32) {
                value: u16,
                padding: u16,
            }),
            ///  Compare Register
            cmp1: mmio.Mmio(packed struct(u32) {
                value: u16,
                padding: u16,
            }),
            ///  Compare Register
            cmp2: mmio.Mmio(packed struct(u32) {
                value: u16,
                padding: u16,
            }),
            ///  Compare Register
            cmp3: mmio.Mmio(packed struct(u32) {
                value: u16,
                padding: u16,
            }),
        };
    };
};
