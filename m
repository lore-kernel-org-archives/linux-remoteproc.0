Return-Path: <peng.fan@nxp.com>
From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v2 0/3] remoteproc: imx_rproc: add virtio support
Date: Wed, 15 Apr 2020 02:42:32 +0000
Message-ID: 
 <DB6PR0402MB27603D39E31D30AA28D6893A88DB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200304142628.8471-1-NShubin@topcon.com>
 <20200406113310.3041-1-nikita.shubin@maquefel.me>
In-Reply-To: <20200406113310.3041-1-nikita.shubin@maquefel.me>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

> Subject: [PATCH v2 0/3] remoteproc: imx_rproc: add virtio support

Have you ever see https://patchwork.kernel.org/cover/11390477/?

I have been waiting for Mathieu's rproc sync state patch, then
rebase.

Thanks,
Peng.

>=20
> This patch set introduces virtio support for imx7d-m4 communication:
>=20
> - support booting loaded vim imx-rproc firmware
> - implement .kick method support using mailbox in imx-processor
> - parse vdev0vring0, vdev0vring1, vdev0buffer memory regions required for
> virtio_rpmsg_bus initialization
>=20
> Regarding imx7d-m4 boot proccess
>=20
> Citing ARM documentation:
>=20
> At Reset, Cortex-M3 and Cortex-M4 processors always boot from a vector
> table at address zero.
>=20
> "With uninitialized memory at address zero (for example, unprogrammed
> Flash or uninitialized RAM), the processor will read a spurious initial M=
ain
> Stack Pointer value from address zero and a spurious code entry point (Re=
set
> vector) from address 0x4, possibly containing an illegal instruction set =
state
> specifier (ESPR.T bit) in bit[0]."
>=20
> So to successfully boot m4 coproc we need to write Stack Pointer and
> Program counter, i see no obvious to get Stack Pointer value, so two ways
> exist ethier form a special elf section:
>=20
> "
> .loader :
>   {
>     LONG(__StackTop);
>     LONG(Reset_Handler + 1);
>   } > m_start
> "
>=20
> and put it at 0x0 address:
>=20
> "
> m_start               (RX)  : ORIGIN =3D 0x00000000, LENGTH =3D
> 0x00008000
> "
>=20
> Or (the way i've chosen) only put Entry Point at 0x04 and set stack as fi=
rst
> instruction:
>=20
> "
> Reset_Handler:
> 	ldr   sp, =3D__stack      /* set stack pointer */
> "
>=20
> Regarding mailboxes and memory regions :
>=20
> This code is heavily derived from stm32-rproc (i.e. copy pasted) and this=
 fact
> needs to reflected in commits, please tell me how to emphasize this fact.
>=20
> Attaching succesful trace booting m4 (with Add rpmsg tty driver applied) =
:
>=20
> [  143.240616] remoteproc remoteproc0: powering up imx-rproc
> [  143.251768] remoteproc remoteproc0: Booting fw image huginn.elf, size
> 466876 [  143.251786] imx-rproc imx7d-cm4: iommu not present
> [  143.251825] remoteproc remoteproc0: rsc: type 3 [  143.251837]
> remoteproc remoteproc0: vdev rsc: id 7, dfeatures 0x1, cfg len 0, 2 vring=
s
> [  143.251924] remoteproc remoteproc0: vdev rsc: vring0: da 0xffffffff, q=
sz
> 16, align 16 [  143.251935] remoteproc remoteproc0: vdev rsc: vring1: da
> 0xffffffff, qsz 16, align 16 [  143.251955] imx-rproc imx7d-cm4: map memo=
ry:
> 0x00900000+20000 [  143.251987] imx-rproc imx7d-cm4: map memory:
> 0x00920000+2000 [  143.252003] imx-rproc imx7d-cm4: map memory:
> 0x00922000+2000 [  143.252020] remoteproc remoteproc0: phdr: type 1 da
> 0x20200000 memsz 0x240 filesz 0x240 [  143.252032] remoteproc
> remoteproc0: da =3D 0x20200000 len =3D 0x240 va =3D 0x(ptrval) [  143.252=
043]
> remoteproc remoteproc0: phdr: type 1 da 0x20200240 memsz 0x5b38 filesz
> 0x5b38 [  143.252053] remoteproc remoteproc0: da =3D 0x20200240 len =3D
> 0x5b38 va =3D 0x(ptrval) [  143.252105] remoteproc remoteproc0: phdr: typ=
e
> 1 da 0x20205d78 memsz 0x4b58 filesz 0x758 [  143.252115] remoteproc
> remoteproc0: da =3D 0x20205d78 len =3D 0x4b58 va =3D 0x(ptrval) [  143.25=
2159]
> remoteproc remoteproc0: da =3D 0x200006cc len =3D 0x8c va =3D 0x(ptrval)
> [  143.252176] remoteproc remoteproc0: Started from 0x202002f5
> [  143.252211]  imx7d-cm4#vdev0buffer: assigned reserved memory node
> vdev0buffer@00924000 [  143.252232] virtio virtio0: reset !
> [  143.252241] virtio virtio0: status: 1 [  143.260567] virtio_rpmsg_bus
> virtio0: status: 3 [  143.260598] remoteproc remoteproc0: vring0: va
> c083c000 qsz 16 notifyid 0 [  143.260614] remoteproc remoteproc0: vring1:
> va c0872000 qsz 16 notifyid 1 [  143.260651] virtio_rpmsg_bus virtio0:
> buffers: va c0894000, dma 0x00924000 [  143.260666] Added buffer head 0
> to (ptrval) [  143.260674] Added buffer head 1 to (ptrval) [  143.260680]
> Added buffer head 2 to (ptrval) [  143.260686] Added buffer head 3 to (pt=
rval)
> [  143.260692] Added buffer head 4 to (ptrval) [  143.260697] Added buffe=
r
> head 5 to (ptrval) [  143.260703] Added buffer head 6 to (ptrval)
> [  143.260709] Added buffer head 7 to (ptrval) [  143.260715] Added buffe=
r
> head 8 to (ptrval) [  143.260721] Added buffer head 9 to (ptrval)
> [  143.260727] Added buffer head 10 to (ptrval) [  143.260733] Added
> buffer head 11 to (ptrval) [  143.260738] Added buffer head 12 to (ptrval=
)
> [  143.260744] Added buffer head 13 to (ptrval) [  143.260750] Added
> buffer head 14 to (ptrval) [  143.260756] Added buffer head 15 to (ptrval=
)
> [  143.260771] virtio_rpmsg_bus virtio0: status: 7 [  143.260779]
> remoteproc remoteproc0: kicking vq index: 0 [  143.260788] remoteproc
> remoteproc0: sending message : vqid =3D 0 [  143.260802] imx_mu
> 30aa0000.mailbox: Send data on wrong channel type: 1 [  143.260810]
> virtio_rpmsg_bus virtio0: rpmsg host is online [  143.261680]
> imx7d-cm4#vdev0buffer: registered virtio0 (type 7) [  143.261694]
> remoteproc remoteproc0: remote processor imx-rproc is now up
> [  143.354880] remoteproc remoteproc0: vq index 0 is interrupted
> [  143.354895] virtqueue callback for (ptrval) ((ptrval)) [  143.354912]
> virtio_rpmsg_bus virtio0: From: 0x0, To: 0x35, Len: 40, Flags: 0, Reserve=
d: 0
> [  143.354924] rpmsg_virtio RX: 00 00 00 00 35 00 00 00 00 00 00 00 28 00
> 00 00  ....5.......(...
> [  143.354932] rpmsg_virtio RX: 72 70 6d 73 67 2d 74 74 79 2d 72 61 77 00
> 00 00  rpmsg-tty-raw...
> [  143.354939] rpmsg_virtio RX: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00  ................
> [  143.354945] rpmsg_virtio RX: 00 00 00 00 00 00 00
> 00                          ........
> [  143.354956] NS announcement: 72 70 6d 73 67 2d 74 74 79 2d 72 61 77
> 00 00 00  rpmsg-tty-raw...
> [  143.354963] NS announcement: 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00  ................
> [  143.354969] NS announcement: 00 00 00 00 00 00 00
> 00                          ........
> [  143.354980] virtio_rpmsg_bus virtio0: creating channel rpmsg-tty-raw
> addr 0x0 [  143.356584] rpmsg_tty virtio0.rpmsg-tty-raw.-1.0: new channel=
:
> 0x400 -> 0x0 : ttyRPMSG0 [  143.356651] Added buffer head 0 to (ptrval)
> [  143.356658] No more buffers in queue [  143.356667] virtio_rpmsg_bus
> virtio0: Received 1 messages [  143.404302] remoteproc remoteproc0: vq
> index 0 is interrupted [  143.404319] virtqueue callback for (ptrval) ((p=
trval))
> [  143.404337] virtio_rpmsg_bus virtio0: From: 0x1, To: 0x35, Len: 40, Fl=
ags:
> 0, Reserved: 0 [  143.404350] rpmsg_virtio RX: 01 00 00 00 35 00 00 00 00
> 00 00 00 28 00 00 00  ....5.......(...
> [  143.404391] rpmsg_virtio RX: 72 70 6d 73 67 2d 74 74 79 2d 72 61 77 00
> 00 00  rpmsg-tty-raw...
> [  143.404399] rpmsg_virtio RX: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00  ................
> [  143.404405] rpmsg_virtio RX: 01 00 00 00 00 00 00
> 00                          ........
> [  143.404417] NS announcement: 72 70 6d 73 67 2d 74 74 79 2d 72 61 77
> 00 00 00  rpmsg-tty-raw...
> [  143.404424] NS announcement: 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00  ................
> [  143.404430] NS announcement: 01 00 00 00 00 00 00
> 00                          ........
> [  143.404441] virtio_rpmsg_bus virtio0: creating channel rpmsg-tty-raw
> addr 0x1 [  143.411114] rpmsg_tty virtio0.rpmsg-tty-raw.-1.1: new channel=
:
> 0x401 -> 0x1 : ttyRPMSG1
