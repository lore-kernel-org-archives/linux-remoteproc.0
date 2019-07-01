Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 30 Jun 2019 23:13:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/3] Enhance virtio rpmsg bus driver buffer allocation
Message-ID: <20190701061353.GE1263@builder>
References: <1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com>
 <20190605043452.GI22737@tuxbook-pro>
 <2d60dd1e-f7a0-ea63-9fda-0ea97aab0406@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d60dd1e-f7a0-ea63-9fda-0ea97aab0406@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Xiang Xiao <xiaoxiang781216@gmail.com>, ohad@wizery.com, wendy.liang@xilinx.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 05 Jun 00:33 PDT 2019, Arnaud Pouliquen wrote:

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

Having an implementation that uses small fixed size buffers seems very
reasonable and I'm in favour of making the message size configurable.

I would however prefer to have this implemented in a way where the
remote side should not be receiving messages in a way that's based on
the remote side's allocation parameters.


I don't think this series prevents the introduction of such isolation,
but it would render this code unnecessary.

Regards,
Bjorn
