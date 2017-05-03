Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v4 0/5] virtio_rpmsg: make rpmsg channel configurable
References: <1490701787-15205-1-git-send-email-loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Message-ID: <e599dcbd-a218-660d-39cc-9dd777f80d51@st.com>
Date: Wed, 3 May 2017 17:34:09 +0200
MIME-Version: 1.0
In-Reply-To: <1490701787-15205-1-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, patrice.chotard@st.com, hugues.fruchet@st.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 03/28/2017 01:49 PM, Loic Pallardy wrote:
> This goal of this series is to offer more flexibility for virtio_rpmsg
> communication link configuration.
>
> It should be possible to tune rpmsg buffer size per Rpmsg link, to provide
> selected configuration to coprocessor, to take into account coprocessor
> specificities like memory region.
>
> This series introduces an optional virtio rpmsg configuration structure, which
> will be managed as an extension of struct fw_rsc_vdev present in coprocessor firmware
> resource table.
> Structure access is possible thanks to virtio get and set API.
> This structure contains the different information to tune the link between the
> host and the coprocessor.
>
> Patch "rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a valid
> kernel address" has the same goal as Wendy's RFC [1]. I don't have tested
> Wendy's series with level driver buffer allocation.
>
> Last patch "rpmsg: virtio_rpmsg: set buffer configuration to virtio" has a
> dependency with remoteproc subdevice boot sequence as coprocessor resource
> table must be updated before coprocessor start. See [2]
>
> [1] http://www.spinics.net/lists/linux-remoteproc/msg00852.html
> [2] http://www.spinics.net/lists/linux-remoteproc/msg00826.html
>
> ---
> Changes from v1:
> - No more dependency with [2]. Coprocessor firmware should wait for first kick
> indicating virtio rpmsg link ready before accessing resource table information.
> - Correct issues reported by Suman
> - Fix warnings found by checkpatch with --strict option
>
> Changes from v2:
> - Fix warnings reported by kbuild test robot
>
> Changes from v3:
> After discussions with Bjorn, virtual address sharing between low level driver
> and virtio_rpmsg could be replaced by associated a dedicated memory region to
> vdev and changing virtio_rpmsg allocation from dev->parent->parent to
> dev->parent, i.e. vdev and not rproc device.
> The advantage of the solution is that there will be only few changes in
> virtio_rpmsg layer and it will be common with virtio_console driver.
> These will be part of a dedicated patch series.
> So v4 drops previous patch 5 "rpmsg: virtio_rpmsg: don't allocate buffer if
> provided by low level driver" dealing with buffer previously allocated and va
> fields from struct virtio_rpmsg_cfg.
> In addition, patch series has been rebased on kernel 4.11-rc4.
>
Hi Bjorn,

Any time to review this series?

Regards,
Loic

>
> Loic Pallardy (5):
>   rpmsg: virtio_rpmsg: set rpmsg_buf_size customizable
>   rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a valid
>     kernel address
>   include: virtio_rpmsg: add virtio rpmsg configuration structure
>   rpmsg: virtio_rpmsg: get buffer configuration from virtio
>   rpmsg: virtio_rpmsg: set buffer configuration to virtio
>
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 123 +++++++++++++++++++++++++++++++++----
>  include/linux/rpmsg/virtio_rpmsg.h |  30 +++++++++
>  2 files changed, 141 insertions(+), 12 deletions(-)
>  create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>
