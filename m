Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 9 May 2017 12:11:06 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Message-ID: <20170509191106.GQ15143@minitux>
References: <20170505183729.GG15143@minitux>
 <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
 <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org>
 <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
 <20170506011920.GH15143@minitux>
 <CABb+yY1u9mspX1Zu0mg21JMYxpKxsXsvBa9LnF6VNr1_42UJUQ@mail.gmail.com>
 <20170508055439.GJ15143@minitux>
 <CABb+yY3CfWFBDh-qoGHDeHyLhVC7mPQZFB=VDS54OaypG-BqPw@mail.gmail.com>
 <20170508191154.GM15143@minitux>
 <CABb+yY2uC6vNFTq1KtZwrrw8x4BEfc2cMjF5DwrLbGpYWBNBzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY2uC6vNFTq1KtZwrrw8x4BEfc2cMjF5DwrLbGpYWBNBzQ@mail.gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 09 May 09:41 PDT 2017, Jassi Brar wrote:

> On Tue, May 9, 2017 at 12:41 AM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Sun 07 May 23:47 PDT 2017, Jassi Brar wrote:
> >
> >> On Mon, May 8, 2017 at 11:24 AM, Bjorn Andersson
> >> <bjorn.andersson@linaro.org> wrote:
> >> > On Fri 05 May 21:48 PDT 2017, Jassi Brar wrote:
> >> >
> >> > The APCS IPC register serves the basis for all inter-processor
> >> > communication in a Qualcomm platform, so it's not only the RPM driver
> >> > discussed earlier that uses this. It's also used for other non-FIFO
> >> > based communication channels, where the signalled information either
> >> > isn't acked at all or acked on a system-level.
> >> >
> >> Something has to indicate consumption of data or "requested action
> >> taken". Otherwise the protocol is design-wise broken.
> >>
> >
> > The SMD and GLINK protocols work by providing two independent one-way
> > pipes that higher levels can use to send and receive messages. When some
> > driver pushes a message into the transmit-pipe we check if there's
> > space, then write the message, signal the remote (APCS IPC) and then
> > return.
> >
> "we check if there's space"  -> this is what mailbox api tries to do
> with last_tx_done before starting the next message.
> 

The space we're looking for is in a higher level in the protocol stack,
the APCS IPC doesn't have a space concern.

> 
> >> >> The client should call mbox_client_txdone() after
> >> >> mbox_send_message().
> >> >
> >> > So every time we call mbox_send_message() from any of the client drivers
> >> > we also needs to call mbox_client_txdone()?
> >> >
> >> Yes.
> >>
> >> > This seems like an awkward side effect of using the mailbox framework -
> >> > which has to be spread out in at least 6 different client drivers :(
> >> >
> >> No. Mailbox or whatever you implement - you must (and do) tick the
> >> state machine to keep the messages moving.
> >
> > But the state you have in the other mailbox drivers is not a concern of
> > the APCS IPC.
> >
> No, as you say above you check for space before writing the next
> message, this is what I call ticking the state machine.
> 

Sure, but you're talking about the mailbox state machine. The APCS IPC
doesn't have states.  The _only_ thing that the APCS IPC provides is a
mechanism for informing the other side that "hey there's something to
do". So it doesn't matter if there's already a pending "hey there's
something to do", because adding another will still only be "hey there's
something to do".

I'm just trying to describe the big picture, but you keep confusing the
mailbox/doorbell responsibilities with the client's responsibilities.

> 
> >>   Best designs have some interrupt occurring when the message has been
> >> consumed by the remote. Some designs have a flag set which needs to be
> >> polled to detect completion. Very few (like yours) that support
> >> neither irq nor polling, have to be driven by the upper protocol layer
> >> by some ack packet (or tracking read/write pointers like you do).
> >> These three cases are denoted by TXDONE_BY_IRQ, TXDONE_BY_POLL and
> >> TXDONE_BY_ACK respectively.
> >>
> >
> > You're confusing the APCS IPC with the larger communication mechanism,
> >
> Maybe. I am not versed with QCom technologies like RPM, SMD, GLINK, APCS etc.
> Controller driver is what physically transmits a signal to remote.
> Users above the mailbox api are client drivers.
> 

Correct, and the signal that we're trying to transmit is "hey there's
_something_ to do", nothing else.


Relate this to when Fedex drops a packet at your door; first he checks
there's space on the porch, then he puts the packet there, he rings the
doorbell and then he walks away. You are free to "answer" the doorbell
now or at any point in the future. He doesn't have to stand there are
wait and it doesn't matter if he rings the bell multiple times - you
will still only check for packages once (regardless of how many he left).

In the case of him wanting your signature, then that's an implementation
detail of the Fedex guy, it has nothing to do with how you wire your
doorbell!

> >
> > This is why I suggested that this is a doorbell, rather than a mailbox.
> > Your argumentation of how a mailbox should work makes perfect sense, but
> > it's not how the Qualcomm IPC works.
> >
> Mailbox framework is designed to support, what you call doorbell type
> of communication, just fine. There is no need to define another class.
> 

Okay good.

> >
> > Setting TXDONE_BY_POLL and specifying a dummy last_tx_done() comes with
> > a crazy overhead. To set a single bit in a register we will take the
> > channel spinlock 4 times, start a timer, iterate over all registered
> > channels and the client must be marked as blocking so we will get at
> > least 2 additional context switches.
> >
> How often does the platform send messages for it to be a considerable load?

This is the basis for all inter-processor communication in the Qualcomm
platforms, so the above list of extra hoops to jump through is not
acceptable.

> BTW, this is an option only if your client driver doesn't want to
> explicitly tick the state machine by calling mbox_client_txdone()...
> which I think should be done in the first place.
> 

There is no state of the APCS IPC, so the overhead is created by the
mailbox framework.


The part where this piece of hardware differs from the other mailboxes
is that TX is done as send_data() returns and in the realm of the
mailbox there is no such thing as "tx done". So how about we extend the
framework to handle stateless and message-less doorbells?

Regards,
Bjorn
