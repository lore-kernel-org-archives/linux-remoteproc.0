Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 7 May 2017 22:54:39 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Message-ID: <20170508055439.GJ15143@minitux>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <20170504200539.27027-3-bjorn.andersson@linaro.org>
 <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
 <20170505183729.GG15143@minitux>
 <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
 <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org>
 <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
 <20170506011920.GH15143@minitux>
 <CABb+yY1u9mspX1Zu0mg21JMYxpKxsXsvBa9LnF6VNr1_42UJUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY1u9mspX1Zu0mg21JMYxpKxsXsvBa9LnF6VNr1_42UJUQ@mail.gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 05 May 21:48 PDT 2017, Jassi Brar wrote:

> On Sat, May 6, 2017 at 6:49 AM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Fri 05 May 13:22 PDT 2017, Jassi Brar wrote:
> 
> >> How is it supposed to work if a client queues more than one request?
> >
> > One such example is found in patch 5 in this series. There are two FIFOs
> > in shared memory, one in each direction. Each fifo has a index-pair
> > associated; a write-index is used by the writer to inform the reader
> > where the valid data in the ring buffer ends and a read-index indicates
> > to the writer how far behind the read is.
> >
> > The writer will just push data into the FIFO, each time firing off an
> > APCS IPC interrupt and when the remote interrupt handler runs it will
> > consume all the messages from the read-index to the write-index. All
> > without the need for the reader to signal the writer that it has
> > received the interrupts.
> >
> > In the event that the write-index catches up with the read-index a
> > dedicated flag is set which will cause the reader to signal that the
> > read-index is updated - allowing the writer to sleep waiting for room in
> > the FIFO.
> >
> Interesting.Just for my enlightenment...
> 
>   Where does the writer sleep in the driver? I see it simply sets the
> bit and leave.
> Such a flag (or head and tail pointers matching) should be checked in
> last_tx_done()
> 

In the case of the FIFO based communication the flow control is
implemented one layer up. You can see this in glink_rpm_tx() (in patch
5/5), where we check to see if there's enough room between the writer
and the reader to store the new message. 

The remote side will process messages and increment the read index,
which will break us out of the loop.


Note that its possible to write any number of messages before invoking
the APCS IPC and there's no harm (beyond wasting a little bit of power)
in invoking it when there's no data written.

> If you think RPM will _always_ be ready to accept new messages (though
> we have seen that doesn't hold in some situations), then you don't
> need last_tx_done.

Whether the remote processor is ready to accept a new message or not is
irrelevant in the sense of APCS IPC. When a client sends the signal over
the APCS IPC it has already determined that there was space, filled in
the shared memory buffers and is now simply invoking the remote handler.


The APCS IPC register serves the basis for all inter-processor
communication in a Qualcomm platform, so it's not only the RPM driver
discussed earlier that uses this. It's also used for other non-FIFO
based communication channels, where the signalled information either
isn't acked at all or acked on a system-level.

But regardless of the protocol implemented ontop, the purpose of the
APCS IPC bit is _only_ to invoke some remote handler to consume some
data, somewhere - the event in itself does not carry any information.

> The client should call mbox_client_txdone() after
> mbox_send_message().

So every time we call mbox_send_message() from any of the client drivers
we also needs to call mbox_client_txdone()?

This seems like an awkward side effect of using the mailbox framework -
which has to be spread out in at least 6 different client drivers :(

Regards,
Bjorn
