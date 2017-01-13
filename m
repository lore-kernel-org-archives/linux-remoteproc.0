Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v1 0/6] rtio_rpmsg: make rpmsg channel configurable
References: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <3b1b4f00-c4a4-e7f5-f46f-10b0dcde591f@st.com>
Date: Fri, 13 Jan 2017 14:25:50 +0100
MIME-Version: 1.0
In-Reply-To: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org, patrice.chotard@st.com
Cc: linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 12/07/2016 09:35 PM, Loic Pallardy wrote:
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

Hi Bjorn,

Gentle reminder. This series is present on ML since one month without 
update or objection. I hope to see it in your next pull request for v4.11.

Best regards,
Loic

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
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 176 ++++++++++++++++++++++++++++++-------
>  include/linux/rpmsg/virtio_rpmsg.h |  32 +++++++
>  2 files changed, 177 insertions(+), 31 deletions(-)
>  create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>
