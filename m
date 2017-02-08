Return-Path: <hugues.fruchet@st.com>
From: Hugues FRUCHET <hugues.fruchet@st.com>
Subject: Re: [PATCH v2 0/6] virtio_rpmsg: make rpmsg channel configurable
Date: Wed, 8 Feb 2017 10:21:24 +0000
Message-ID: <3c4a43c2-92ac-88e2-6e50-395b51c33c54@st.com>
References: <1485867097-6960-1-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1485867097-6960-1-git-send-email-loic.pallardy@st.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <758EA36ED014004CAA22D23A49684C37@st.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Loic PALLARDY <loic.pallardy@st.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>, Patrice CHOTARD <patrice.chotard@st.com>, "peter.griffin@linaro.org" <peter.griffin@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Acked-and-tested-by: Hugues Fruchet <hugues.fruchet@st.com>

Tested on B2260 ST Platform with st-delta video decoder V4L2 kernel=20
driver=20
(http://www.mail-archive.com/linux-media@vger.kernel.org/msg107644.html).


On 01/31/2017 01:51 PM, Loic Pallardy wrote:
> This goal of this series is to offer more flexibility for virtio_rpmsg
> communication link configuration.
>
> It should be possible to tune rpmsg buffer size per Rpmsg link, to provid=
e
> selected configuration to coprocessor, to take into account coprocessor
> specificities like memory region.
>
> This series introduces an optional virtio rpmsg configuration structure, =
which
> will be managed as an extension of struct fw_rsc_vdev present in coproces=
sor firmware
> resource table.
> Structure access is possible thanks to virtio get and set API.
> This structure contains the different information to tune the link betwee=
n the
> host and the coprocessor.
>
> Patch "rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a valid
> kernel address" has the same goal as Wendy's RFC [1]. I don't have tested
> Wendy's series with level driver buffer allocation.
>
> Last patch "rpmsg: virtio_rpmsg: set buffer configuration to virtio" has =
a
> dependency with remoteproc subdevice boot sequence as coprocessor resourc=
e
> table must be updated before coprocessor start. See [2]
>
> [1] http://www.spinics.net/lists/linux-remoteproc/msg00852.html
> [2] http://www.spinics.net/lists/linux-remoteproc/msg00826.html
>
> ---
> Changes from v1:
> - No more dependency with [2]. Coprocessor firmware should wait for first=
 kick
> indicating virtio rpmsg link ready before accessing resource table inform=
ation.
> - Correct issues reported by Suman
> - Fix warnings found by checkpatch with --strict option
>
>
> Loic Pallardy (6):
>   rpmsg: virtio_rpmsg: set rpmsg_buf_size customizable
>   rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a valid
>     kernel address
>   include: virtio_rpmsg: add virtio rpmsg configuration structure
>   rpmsg: virtio_rpmsg: get buffer configuration from virtio
>   rpmsg: virtio_rpmsg: don't allocate buffer if provided by low level
>     driver
>   rpmsg: virtio_rpmsg: set buffer configuration to virtio
>
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 176 +++++++++++++++++++++++++++++++=
------
>  include/linux/rpmsg/virtio_rpmsg.h |  32 +++++++
>  2 files changed, 179 insertions(+), 29 deletions(-)
>  create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>=
