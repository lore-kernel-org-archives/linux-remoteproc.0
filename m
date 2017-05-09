Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170508191154.GM15143@minitux>
References: <20170504200539.27027-3-bjorn.andersson@linaro.org>
 <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
 <20170505183729.GG15143@minitux> <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
 <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org> <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
 <20170506011920.GH15143@minitux> <CABb+yY1u9mspX1Zu0mg21JMYxpKxsXsvBa9LnF6VNr1_42UJUQ@mail.gmail.com>
 <20170508055439.GJ15143@minitux> <CABb+yY3CfWFBDh-qoGHDeHyLhVC7mPQZFB=VDS54OaypG-BqPw@mail.gmail.com>
 <20170508191154.GM15143@minitux>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 9 May 2017 22:11:22 +0530
Message-ID: <CABb+yY2uC6vNFTq1KtZwrrw8x4BEfc2cMjF5DwrLbGpYWBNBzQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Content-Type: text/plain; charset=UTF-8
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, May 9, 2017 at 12:41 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Sun 07 May 23:47 PDT 2017, Jassi Brar wrote:
>
>> On Mon, May 8, 2017 at 11:24 AM, Bjorn Andersson
>> <bjorn.andersson@linaro.org> wrote:
>> > On Fri 05 May 21:48 PDT 2017, Jassi Brar wrote:
>> >
>> > The APCS IPC register serves the basis for all inter-processor
>> > communication in a Qualcomm platform, so it's not only the RPM driver
>> > discussed earlier that uses this. It's also used for other non-FIFO
>> > based communication channels, where the signalled information either
>> > isn't acked at all or acked on a system-level.
>> >
>> Something has to indicate consumption of data or "requested action
>> taken". Otherwise the protocol is design-wise broken.
>>
>
> The SMD and GLINK protocols work by providing two independent one-way
> pipes that higher levels can use to send and receive messages. When some
> driver pushes a message into the transmit-pipe we check if there's
> space, then write the message, signal the remote (APCS IPC) and then
> return.
>
"we check if there's space"  -> this is what mailbox api tries to do
with last_tx_done before starting the next message.


>> >> The client should call mbox_client_txdone() after
>> >> mbox_send_message().
>> >
>> > So every time we call mbox_send_message() from any of the client drivers
>> > we also needs to call mbox_client_txdone()?
>> >
>> Yes.
>>
>> > This seems like an awkward side effect of using the mailbox framework -
>> > which has to be spread out in at least 6 different client drivers :(
>> >
>> No. Mailbox or whatever you implement - you must (and do) tick the
>> state machine to keep the messages moving.
>
> But the state you have in the other mailbox drivers is not a concern of
> the APCS IPC.
>
No, as you say above you check for space before writing the next
message, this is what I call ticking the state machine.


>>   Best designs have some interrupt occurring when the message has been
>> consumed by the remote. Some designs have a flag set which needs to be
>> polled to detect completion. Very few (like yours) that support
>> neither irq nor polling, have to be driven by the upper protocol layer
>> by some ack packet (or tracking read/write pointers like you do).
>> These three cases are denoted by TXDONE_BY_IRQ, TXDONE_BY_POLL and
>> TXDONE_BY_ACK respectively.
>>
>
> You're confusing the APCS IPC with the larger communication mechanism,
>
Maybe. I am not versed with QCom technologies like RPM, SMD, GLINK, APCS etc.
Controller driver is what physically transmits a signal to remote.
Users above the mailbox api are client drivers.

>
> This is why I suggested that this is a doorbell, rather than a mailbox.
> Your argumentation of how a mailbox should work makes perfect sense, but
> it's not how the Qualcomm IPC works.
>
Mailbox framework is designed to support, what you call doorbell type
of communication, just fine. There is no need to define another class.

>
> Setting TXDONE_BY_POLL and specifying a dummy last_tx_done() comes with
> a crazy overhead. To set a single bit in a register we will take the
> channel spinlock 4 times, start a timer, iterate over all registered
> channels and the client must be marked as blocking so we will get at
> least 2 additional context switches.
>
How often does the platform send messages for it to be a considerable load?
BTW, this is an option only if your client driver doesn't want to
explicitly tick the state machine by calling mbox_client_txdone()...
which I think should be done in the first place.

thanks
