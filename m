Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170505183729.GG15143@minitux>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <20170504200539.27027-3-bjorn.andersson@linaro.org> <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
 <20170505183729.GG15143@minitux>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 6 May 2017 00:52:30 +0530
Message-ID: <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Content-Type: text/plain; charset=UTF-8
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat, May 6, 2017 at 12:07 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Fri 05 May 03:26 PDT 2017, Jassi Brar wrote:
>
>> On Fri, May 5, 2017 at 1:35 AM, Bjorn Andersson
>> <bjorn.andersson@linaro.org> wrote:
>>
>> > +
>> > +static int qcom_apcs_ipc_send_data(struct mbox_chan *chan, void *data)
>> > +{
>> > +       struct qcom_apcs_ipc *apcs = container_of(chan->mbox,
>> > +                                                 struct qcom_apcs_ipc, mbox);
>> > +       unsigned long idx = (unsigned long)chan->con_priv;
>> > +
>> > +       writel(BIT(idx), apcs->base + apcs->offset);
>> > +
>> When/how does this bit get ever cleared again?
>> You may want to add last_tx_done() callback to check if this bit is
>> cleared before you can send the next interrupt. And set
>> txdone_poll/irq accordingly.
>>
>
> It's a write-only register, writing a bit fires off an edge triggered
> interrupt on the specific remote processor, which will ack the
> associated IRQ status and handle the interrupt.
>
> As the "message" is just a notification to the other side that it needs
> to act on "something", there's no harm in notifying it multiple times
> before it has a chance to ack the IRQ and a write after that will be
> seen as a separate interrupt.
>
What causes it to return to '0'?

I think the driver should wait for it to become 0 before writing 1.
For example, the protocol has a command that says to remote cpu to
increase the voltage supply by 0.1v. This command is filled in a
structure and laid out in the shared memory before you ring the
'doorbell'.  In this situation you don't want the remote cpu to act
twice on the same command. Also for a new command, you don't want to
overwrite the last command packet before remote cpu has consumed it.
