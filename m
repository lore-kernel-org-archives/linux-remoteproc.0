Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 5 May 2017 18:19:20 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Message-ID: <20170506011920.GH15143@minitux>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <20170504200539.27027-3-bjorn.andersson@linaro.org>
 <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
 <20170505183729.GG15143@minitux>
 <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
 <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org>
 <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 05 May 13:22 PDT 2017, Jassi Brar wrote:

> On Sat, May 6, 2017 at 1:23 AM, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> > On 5/5/2017 1:22 PM, Jassi Brar wrote:
> >>
> >> On Sat, May 6, 2017 at 12:07 AM, Bjorn Andersson
> >> <bjorn.andersson@linaro.org> wrote:
> >>>
> >
> > There is no way to determine if the remote processor has observed a message,
> > that does not involve pretty trivial race conditions.
> >
> Thanks for chiming in.
> How is it supposed to work if a client queues more than one request?

One such example is found in patch 5 in this series. There are two FIFOs
in shared memory, one in each direction. Each fifo has a index-pair
associated; a write-index is used by the writer to inform the reader
where the valid data in the ring buffer ends and a read-index indicates
to the writer how far behind the read is.

The writer will just push data into the FIFO, each time firing off an
APCS IPC interrupt and when the remote interrupt handler runs it will
consume all the messages from the read-index to the write-index. All
without the need for the reader to signal the writer that it has
received the interrupts.

In the event that the write-index catches up with the read-index a
dedicated flag is set which will cause the reader to signal that the
read-index is updated - allowing the writer to sleep waiting for room in
the FIFO.

> How do you know when it's ok to overwrite the FIFO and send the next
> command?

As long as there's enough space between the write-index and the
read-index we can write.

And we don't need any locks, because the writer is the only one changing
the write-index and the reader is the only one changing the read index.

>   Usually if h/w doesn't indicate, we cook up some ack packet for each
> command. Otherwise the protocol seems badly broken.
> 
>  If there is really nothing that can be done to check delivery of a
> message, I'll pick the driver as such. Best of luck :)

The protocols implemented on top will guarantee this, as needed, so it's
fine :)


I'll update patch 1 and repost patch 1 through 3 for you to merge in the
mailbox tree, patch 4 and 5 I'll pull into the rpmsg tree once I have
received some additional feedback. (We don't have any build time
dependencies between the two, so it's better to merge each driver
through their respective tree)

Thanks,
Bjorn
