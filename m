Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170510190046.GT15143@minitux>
References: <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org>
 <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
 <20170506011920.GH15143@minitux> <CABb+yY1u9mspX1Zu0mg21JMYxpKxsXsvBa9LnF6VNr1_42UJUQ@mail.gmail.com>
 <20170508055439.GJ15143@minitux> <CABb+yY3CfWFBDh-qoGHDeHyLhVC7mPQZFB=VDS54OaypG-BqPw@mail.gmail.com>
 <20170508191154.GM15143@minitux> <CABb+yY2uC6vNFTq1KtZwrrw8x4BEfc2cMjF5DwrLbGpYWBNBzQ@mail.gmail.com>
 <20170509191106.GQ15143@minitux> <CABb+yY2LoX_rOSCkhnp-gS7EHTN+98xNn2E1+z7_7bFjQ2wtoA@mail.gmail.com>
 <20170510190046.GT15143@minitux>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 11 May 2017 07:37:01 +0530
Message-ID: <CABb+yY2Upw_RALXjL_=yAUCOMzpb+PV6v_OjiznKBUJnFE2UVQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Content-Type: text/plain; charset=UTF-8
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, May 11, 2017 at 12:30 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Tue 09 May 19:33 PDT 2017, Jassi Brar wrote:
>
>> On Wed, May 10, 2017 at 12:41 AM, Bjorn Andersson
>> <bjorn.andersson@linaro.org> wrote:
>> > On Tue 09 May 09:41 PDT 2017, Jassi Brar wrote:
> [..]
>> > The part where this piece of hardware differs from the other mailboxes
>> > is that TX is done as send_data() returns and in the realm of the
>> > mailbox there is no such thing as "tx done". So how about we extend the
>> > framework to handle stateless and message-less doorbells?
>> >
>> This is a very common usecase. It would be unfair to other platforms
>> to modify the API just because you find it awkward to call
>> mbox_client_txdone() right after mbox_send_message(). For example,
>> drivers/firmware/tegra/bpmp.c
>> I'd much rather have mbox_send_message_and_tick() than implant a new api.
>>
>
> I wasn't proposing to implement a new API
>
Introducing mbox_controller.txdone_none for underlying mailbox
controllers is indeed a new API.

>; for mailbox controllers with
> tx method set to POLL the client will only have call mbox_send_data()
> nothing else. So I proposed [1] yesterday, that will make the apcs
> controller behave just like this case.
>
mbox_send_data()    for POLL usecase
mbox_send_data()+mbox_client_txdone()   for your usecase.

> Looking at it again, making sure that tx method is TXDONE_BY_ACK should
> make mbox_client_txdone() essentially a nop, only locking the channel
> spinlock twice and then returning, as send_data() didn't leave any data
> in the queue. Is my understanding of this correct?
>
Not exactly. tx_tick() frees the busy flag 'chan->active_req'.

> So please let me know what you think about [1], if you don't like it
> I'll fix the things pointed to by Stephen and we'll have to live with
> the two calls.
>
My last reply was about [1]. Other platforms call
mbox_send_data()+mbox_client_txdone() see
drivers/firmware/tegra/bpmp.c, but you want to introduce another API
in the innards of the framework. If we must do it, it should be done
above the framework by introducing

void mbox_send_message_and_tick(struct mbox_chan *chan, void *mssg)
           OR
void mbox_ring_doorbell(struct mbox_chan *chan, void *mssg)
{
   (void)mbox_send_message(chan, mssg);
   mbox_client_txdone(chan, 0);
}
