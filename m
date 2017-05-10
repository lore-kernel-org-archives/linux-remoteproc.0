Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170509191106.GQ15143@minitux>
References: <20170505183729.GG15143@minitux> <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
 <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org> <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
 <20170506011920.GH15143@minitux> <CABb+yY1u9mspX1Zu0mg21JMYxpKxsXsvBa9LnF6VNr1_42UJUQ@mail.gmail.com>
 <20170508055439.GJ15143@minitux> <CABb+yY3CfWFBDh-qoGHDeHyLhVC7mPQZFB=VDS54OaypG-BqPw@mail.gmail.com>
 <20170508191154.GM15143@minitux> <CABb+yY2uC6vNFTq1KtZwrrw8x4BEfc2cMjF5DwrLbGpYWBNBzQ@mail.gmail.com>
 <20170509191106.GQ15143@minitux>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 May 2017 08:03:53 +0530
Message-ID: <CABb+yY2LoX_rOSCkhnp-gS7EHTN+98xNn2E1+z7_7bFjQ2wtoA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Content-Type: text/plain; charset=UTF-8
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, May 10, 2017 at 12:41 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Tue 09 May 09:41 PDT 2017, Jassi Brar wrote:


>>
>> >> >> The client should call mbox_client_txdone() after
>> >> >> mbox_send_message().
>> >> >
>> >> > So every time we call mbox_send_message() from any of the client drivers
>> >> > we also needs to call mbox_client_txdone()?
>> >> >
>> >> Yes.
>> >>
>> >> > This seems like an awkward side effect of using the mailbox framework -
>> >> > which has to be spread out in at least 6 different client drivers :(
>> >> >
>> >> No. Mailbox or whatever you implement - you must (and do) tick the
>> >> state machine to keep the messages moving.
>> >
>> > But the state you have in the other mailbox drivers is not a concern of
>> > the APCS IPC.
>> >
>> No, as you say above you check for space before writing the next
>> message, this is what I call ticking the state machine.
>>
>
> Sure, but you're talking about the mailbox state machine. The APCS IPC
> doesn't have states.  The _only_ thing that the APCS IPC provides is a
> mechanism for informing the other side that "hey there's something to
> do". So it doesn't matter if there's already a pending "hey there's
> something to do", because adding another will still only be "hey there's
> something to do".
>
> I'm just trying to describe the big picture, but you keep confusing the
> mailbox/doorbell responsibilities with the client's responsibilities.
>
I think I do understand the bigger picture...

The client driver sets up data packet in SHM and submit a "doorbell"
to be ringed. The controller driver simply sets some bit to trigger an
irq on the remote side (doorbell). And before submitting a "doorbell"
the client makes sure there is some space for data packet to be
written. Right?  You see, in the big picture you do have a
state-machine.

                 [Message to send]
                               |
                               |
           |-------------->|
           | No             |
           |                   |
           |___[Space Available?]
                               |
                               |Yes
                               |
                               |
                  [ Setup Data in SHM]
                               |
                              V
                    [Ring Doorbell]


Mailbox framework supports this whole picture. There is even a
callback (tx_prepare) to setup data packet just before the doorbell is
to be rung.

>> BTW, this is an option only if your client driver doesn't want to
>> explicitly tick the state machine by calling mbox_client_txdone()...
>> which I think should be done in the first place.
>>
>
> There is no state of the APCS IPC, so the overhead is created by the
> mailbox framework.
>
Overhead remains the same if you move the check from your client
drivers to last_tx_done.
OR your client driver, rightfully, drive the state machine by calling
mbox_client_txdone() like other platforms.

                 [Message to send]<----------|
                               |                             |
                               |                             |
           |-------------->|                             |
           | No             |                             |
           |                   |                             |
           |___[Space Available?]             |
                               |                             |
                               |Yes                       |
                               |                             |
                              V                             |
                  [Setup Data in SHM]           |
                               |                              |
                              V                              |
                 mbox_send_message()        |
                               |                               |
                              V                              |
                 mbox_client_txdone()           |
                               |                              |
                               V______________|


> The part where this piece of hardware differs from the other mailboxes
> is that TX is done as send_data() returns and in the realm of the
> mailbox there is no such thing as "tx done". So how about we extend the
> framework to handle stateless and message-less doorbells?
>
This is a very common usecase. It would be unfair to other platforms
to modify the API just because you find it awkward to call
mbox_client_txdone() right after mbox_send_message(). For example,
drivers/firmware/tegra/bpmp.c
I'd much rather have mbox_send_message_and_tick() than implant a new api.

Thanks.
