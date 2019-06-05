Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 4 Jun 2019 21:34:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/3] Enhance virtio rpmsg bus driver buffer allocation
Message-ID: <20190605043452.GI22737@tuxbook-pro>
References: <1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com>
To: Xiang Xiao <xiaoxiang781216@gmail.com>
Cc: ohad@wizery.com, wendy.liang@xilinx.com, arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 31 Jan 07:41 PST 2019, Xiang Xiao wrote:

> Hi,
> This series enhance the buffer allocation by:
> 1.Support the different buffer number in rx/tx direction
> 2.Get the individual rx/tx buffer size from config space
> 
> Here is the related OpenAMP change:
> https://github.com/OpenAMP/open-amp/pull/155
> 

This looks pretty reasonable, but can you confirm that it's possible to
use new firmware with an old Linux kernel when introducing this?


But ever since we discussed Loic's similar proposal earlier I've been
questioning if the fixed buffer size isn't just an artifact of how we
preallocate our buffers. The virtqueue seems to support arbitrary sizes
of buffers and I see that the receive function in OpenAMP has been fixed
to put back the buffer of the size that was received, rather than 512
bytes. So it seems like Linux would be able to send whatever size
messages to OpenAMP it would handle it.

The question is if we could do the same in the other direction, perhaps
by letting the OpenAMP side do it's message allocation when it's
sending, rather than Linux pushing inbufs to be filled by the remote.

This would remove the problem of always having suboptimal buffer sizes.

Regards,
Bjorn

> Xiang Xiao (3):
>   rpmsg: virtio_rpmsg_bus: allow the different vring size for send/recv
>   rpmsg: virtio_rpmsg_bus: allocate rx/tx buffer separately
>   rpmsg: virtio_rpmsg_bus: get buffer size from config space
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 127 +++++++++++++++++++++++---------------
>  include/uapi/linux/virtio_rpmsg.h |  24 +++++++
>  2 files changed, 100 insertions(+), 51 deletions(-)
>  create mode 100644 include/uapi/linux/virtio_rpmsg.h
> 
> -- 
> 2.7.4
> 
