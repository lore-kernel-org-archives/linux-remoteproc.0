Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 8 May 2017 12:11:54 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Message-ID: <20170508191154.GM15143@minitux>
References: <20170504200539.27027-3-bjorn.andersson@linaro.org>
 <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
 <20170505183729.GG15143@minitux>
 <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
 <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org>
 <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
 <20170506011920.GH15143@minitux>
 <CABb+yY1u9mspX1Zu0mg21JMYxpKxsXsvBa9LnF6VNr1_42UJUQ@mail.gmail.com>
 <20170508055439.GJ15143@minitux>
 <CABb+yY3CfWFBDh-qoGHDeHyLhVC7mPQZFB=VDS54OaypG-BqPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY3CfWFBDh-qoGHDeHyLhVC7mPQZFB=VDS54OaypG-BqPw@mail.gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sun 07 May 23:47 PDT 2017, Jassi Brar wrote:

> On Mon, May 8, 2017 at 11:24 AM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Fri 05 May 21:48 PDT 2017, Jassi Brar wrote:
> >
> > The APCS IPC register serves the basis for all inter-processor
> > communication in a Qualcomm platform, so it's not only the RPM driver
> > discussed earlier that uses this. It's also used for other non-FIFO
> > based communication channels, where the signalled information either
> > isn't acked at all or acked on a system-level.
> >
> Something has to indicate consumption of data or "requested action
> taken". Otherwise the protocol is design-wise broken.
> 

The SMD and GLINK protocols work by providing two independent one-way
pipes that higher levels can use to send and receive messages. When some
driver pushes a message into the transmit-pipe we check if there's
space, then write the message, signal the remote (APCS IPC) and then
return.

It's then up to the higher level driver and protocol what to do next. In
some cases it will expect that there will appear a packet on the
incoming pipe indicating that the action was taken, but there's nothing
in the communication path enforcing this.

By this you can have strictly one-way notifications, two-way
stop-and-wait style communication or multiple-messages-in-flight
communication over the same transport mechanism.


The remote will update the read index (in shared memory) as it consumes
the data from the FIFO, but under normal circumstances there are no
reason for it to actively notify the sender or for the sender to wait
for it to be consumed.

> > But regardless of the protocol implemented ontop, the purpose of the
> > APCS IPC bit is _only_ to invoke some remote handler to consume some
> > data, somewhere - the event in itself does not carry any information.
> >
> Yes, every platform that uses shared-memory works like that. However
> there is always something that tells if the command has been acted
> upon by the remote. In your case that is the read-pointer movement.
> 

In a straight forward stop-and-wait flow control based setup like the
version of RPM previously discussed this makes a lot of sense. But there
are a multitude of different protocols using this mechanism to signal
that something has happened.

> >> The client should call mbox_client_txdone() after
> >> mbox_send_message().
> >
> > So every time we call mbox_send_message() from any of the client drivers
> > we also needs to call mbox_client_txdone()?
> >
> Yes.
> 
> > This seems like an awkward side effect of using the mailbox framework -
> > which has to be spread out in at least 6 different client drivers :(
> >
> No. Mailbox or whatever you implement - you must (and do) tick the
> state machine to keep the messages moving.

But the state you have in the other mailbox drivers is not a concern of
the APCS IPC.

>   Best designs have some interrupt occurring when the message has been
> consumed by the remote. Some designs have a flag set which needs to be
> polled to detect completion. Very few (like yours) that support
> neither irq nor polling, have to be driven by the upper protocol layer
> by some ack packet (or tracking read/write pointers like you do).
> These three cases are denoted by TXDONE_BY_IRQ, TXDONE_BY_POLL and
> TXDONE_BY_ACK respectively.
> 

You're confusing the APCS IPC with the larger communication mechanism,
flow control is taken care of in some higher layer - if it's needed at
all.

This is why I suggested that this is a doorbell, rather than a mailbox.
Your argumentation of how a mailbox should work makes perfect sense, but
it's not how the Qualcomm IPC works.

>   If no client driver will ever submit a message if there is no space
> in FIFO, then you can specify TXDONE_BY_POLL and have last_tx_done()
> always return true. That way you don't need to call
> mbox_client_txdone().

Clients of the APCS IPC will never post a message to the mailbox, it's
non-blocking and the "transaction" is done when the operation returns.
All the other parts of a "non-broken protocol" is a concern of some
other part of the software stack.


Setting TXDONE_BY_POLL and specifying a dummy last_tx_done() comes with
a crazy overhead. To set a single bit in a register we will take the
channel spinlock 4 times, start a timer, iterate over all registered
channels and the client must be marked as blocking so we will get at
least 2 additional context switches.

Regards,
Bjorn
