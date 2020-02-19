Return-Path: <mathieu.poirier@linaro.org>
MIME-Version: 1.0
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 19 Feb 2020 11:24:30 -0700
Message-ID: <CANLsYkzeAyGhYqewGaHfd-myW5EzE83WUOwAbKwTP-34pbUR-w@mail.gmail.com>
Subject: Re: [PATCH 0/9] remoteproc: imx_rproc: support i.MX8/8M/7ULP
Content-Type: text/plain; charset="UTF-8"
To: peng.fan@nxp.com
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Peng,

On Wed, 19 Feb 2020 at 00:33, <peng.fan@nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> This patchset aim to replace NXP vendor imx_rpmsg.c driver.

You mean remoteproc/imx_rproc.c ?  Upstream rpmsg/imx_rpmsg.c doesn't exist.

>
> This patchset is tested with Loic PALLARDY's patch
> "remoteproc: add support for co-processor loaded and booted before kernel"
> https://patchwork.kernel.org/patch/11265869/,
> and inspried from st's remoteproc early boot support.
> Since Loic's patch is still under review, just expect your comments :)

Did you base your work on top of Loic's because your MCU firmware is
always loaded by the bootloader?  If not please send another revision
of your work without early boot support.  When we have a clear view on
how to proceed with the early boot support you can send another set to
enable that.

Thanks,
Mathieu

>
> Patch [1,2]/9: dt-bindings convert to json and new SoC support
> Patch 3/9: skip firmware load when recovery. To i.MX8, firmware is not
>            handled by Linux.
>
> Patch [4-9]/9: i.MX specific part to support rpmsg/virtio with mbox.
>       because NXP release image not have resoure table, so add resource
>       table in dts
>
> My test dts diff for i.MX8QXP MEK, but I have tested this patchset
> for i.MX8QXP MEK, i.MX8MM EVK, i.MX7ULP EVK:
>
> +
> +       imx8x-cm4 {
> +               compatible = "fsl,imx8qxp-cm4";
> +               rsrc-table = <
> +                       0x1 0x2 0x0 0x0 0x18 0x5c
> +                       3
> +                       /*fw_rsc_vdev*/
> +                       7 0 1 0 0 0x200
> +                       /*fw_rsc_vdev_vring*/
> +                       0x90000000 4096 256 1 0
> +                       0x90008000 4096 256 2 0
> +                       3
> +                       /*fw_rsc_vdev*/
> +                       7 1 1 0 0 0x200
> +                       /*fw_rsc_vdev_vring*/
> +                       0x90010000 4096 256 1 0
> +                       0x90018000 4096 256 2 0
> +               >;
> +               early-booted;
> +               mbox-names = "tx", "rx", "rxdb";
> +               mboxes = <&lsio_mu5 0 1
> +                         &lsio_mu5 1 1
> +                         &lsio_mu5 3 1>;
> +               mub-partition = <3>;
> +               memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>,
> +                               <&vdev1vring0>, <&vdev1vring1>, <&vdev0buffer>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               vdev0vring0: vdev0vring0@90000000 {
> +                       compatible = "shared-dma-pool";
> +                       reg = <0 0x90000000 0 0x8000>;
> +                       no-map;
> +               };
> +
> +               vdev0vring1: vdev0vring1@90008000 {
> +                       compatible = "shared-dma-pool";
> +                       reg = <0 0x90008000 0 0x8000>;
> +                       no-map;
> +               };
> +
> +               vdev1vring0: vdev1vring0@90010000 {
> +                       compatible = "shared-dma-pool";
> +                       reg = <0 0x90010000 0 0x8000>;
> +                       no-map;
> +               };
> +
> +               vdev1vring1: vdev1vring1@90018000 {
> +                       compatible = "shared-dma-pool";
> +                       reg = <0 0x90018000 0 0x8000>;
> +                       no-map;
> +               };
> +
> +               vdev0buffer: vdev0buffer {
> +                       compatible = "shared-dma-pool";
> +                       reg = <0 0x90400000 0 0x100000>;
> +                       no-map;
> +               };
> +       };
> +
>
> Peng Fan (9):
>   dt-bindings: remoteproc: Convert imx-rproc to json-schema
>   dt-bindings: remoteproc: imx-rproc: support i.MX[8,8M,7ULP]
>   remoteproc: add support to skip firmware load when recovery
>   remoteproc: imx_rproc: surport early booted remote processor
>   remoteproc: imx_rproc: parse early-booted property
>   remoteproc: imx_proc: enable virtio/mailbox
>   remoteproc: imx_rproc: add i.MX8QM/QXP
>   remoteproc: imx_rproc: support i.MX7ULP
>   remoteproc: imx_rproc: add i.MX8MM support
>
>  .../devicetree/bindings/remoteproc/imx-rproc.txt   |  33 --
>  .../devicetree/bindings/remoteproc/imx-rproc.yaml  |  95 +++++
>  drivers/remoteproc/imx_rproc.c                     | 455 +++++++++++++++++++--
>  drivers/remoteproc/remoteproc_core.c               |  19 +-
>  include/linux/remoteproc.h                         |   1 +
>  5 files changed, 531 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
>
> --
> 2.16.4
>
