Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com>
 <20190605043452.GI22737@tuxbook-pro> <2d60dd1e-f7a0-ea63-9fda-0ea97aab0406@st.com>
In-Reply-To: <2d60dd1e-f7a0-ea63-9fda-0ea97aab0406@st.com>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Wed, 5 Jun 2019 16:35:00 +0800
Message-ID: <CAH2Cfb-sv3SAL8bcczC-Dc3_r58MYZCS7s7zGtn1Qfo3mmBqVg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Enhance virtio rpmsg bus driver buffer allocation
Content-Type: text/plain; charset="UTF-8"
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben Cohen <ohad@wizery.com>, wendy.liang@xilinx.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Jun 5, 2019 at 3:33 PM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
>
> Hi Bjorn,
>
> On 6/5/19 6:34 AM, Bjorn Andersson wrote:
> > On Thu 31 Jan 07:41 PST 2019, Xiang Xiao wrote:
> >
> >> Hi,
> >> This series enhance the buffer allocation by:
> >> 1.Support the different buffer number in rx/tx direction
> >> 2.Get the individual rx/tx buffer size from config space
> >>
> >> Here is the related OpenAMP change:
> >> https://github.com/OpenAMP/open-amp/pull/155
> >>
> >
> > This looks pretty reasonable, but can you confirm that it's possible to
> > use new firmware with an old Linux kernel when introducing this?
> >
> >
> > But ever since we discussed Loic's similar proposal earlier I've been
> > questioning if the fixed buffer size isn't just an artifact of how we
> > preallocate our buffers. The virtqueue seems to support arbitrary sizes
> > of buffers and I see that the receive function in OpenAMP has been fixed
> > to put back the buffer of the size that was received, rather than 512
> > bytes. So it seems like Linux would be able to send whatever size
> > messages to OpenAMP it would handle it.
> >
> > The question is if we could do the same in the other direction, perhaps
> > by letting the OpenAMP side do it's message allocation when it's
> > sending, rather than Linux pushing inbufs to be filled by the remote.
>
> IMHO, both could be useful and could be not correlated.
> On-the fly buffer allocation seems more efficient but needs an
> allocator.This can be a generic allocator (with a va to da) for system
> where large amount of memories are accessible from both side.
>
> Now what about system with small shared memory? In this case you have to
> deal with a limited/optimized memory chunk. To avoid memory
> fragmentation the allocator should have a pre-reserved buffers pool(so
> similar to existing implementation). This serie seems useful to optimize
> the size of the pre-reserved pool.
>

Maybe we can reuse rxbuf_size/txbuf_size to trigger the different
allocation policy:
1.If buf_size equal 0xfffffff, turn on the dynamic allocator
2.If buf_size equall 0, turn on the fixed allocator with the default buffer size
3.otherwise, turn on the fixed allocator with the configed buffer size
So, both requirement could be satisfied without breaking the compatibility.

> >
> > This would remove the problem of always having suboptimal buffer sizes.
> >
> > Regards,
> > Bjorn
> >
> >> Xiang Xiao (3):
> >>   rpmsg: virtio_rpmsg_bus: allow the different vring size for send/recv
> >>   rpmsg: virtio_rpmsg_bus: allocate rx/tx buffer separately
> >>   rpmsg: virtio_rpmsg_bus: get buffer size from config space
> >>
> >>  drivers/rpmsg/virtio_rpmsg_bus.c  | 127 +++++++++++++++++++++++---------------
> >>  include/uapi/linux/virtio_rpmsg.h |  24 +++++++
> >>  2 files changed, 100 insertions(+), 51 deletions(-)
> >>  create mode 100644 include/uapi/linux/virtio_rpmsg.h
> >>
> >> --
> >> 2.7.4
> >>
>
> --
>
> Regards,
> Arnaud
