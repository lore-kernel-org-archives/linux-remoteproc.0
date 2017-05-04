Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170504161035.GC15143@minitux>
References: <20170503052929.17422-1-bjorn.andersson@linaro.org>
 <20170503052929.17422-2-bjorn.andersson@linaro.org> <c9b86ecfa6b84ae994da6c30d2840bbf@SFHDAG7NODE2.st.com>
 <CABb+yY03NHBEui+OtagpTD4bm2yxoahEiciBG99gG2jrVGjpKQ@mail.gmail.com>
 <20170504054516.GB15143@minitux> <CABb+yY1YJ6cNG0UKahsnri3A4izdD3ZBpY6LLCHFkc=O3c0TcA@mail.gmail.com>
 <20170504161035.GC15143@minitux>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 4 May 2017 22:30:42 +0530
Message-ID: <CABb+yY1=-zYcyGgd2r1ckEgsYRQ8f4esZa4i4hb30b75kBRK7Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] soc: qcom: Introduce APCS IPC driver
Content-Type: text/plain; charset=UTF-8
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Loic PALLARDY <loic.pallardy@st.com>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, May 4, 2017 at 9:40 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Thu 04 May 00:54 PDT 2017, Jassi Brar wrote:
>
>> On Thu, May 4, 2017 at 11:15 AM, Bjorn Andersson
>> <bjorn.andersson@linaro.org> wrote:
>> > On Wed 03 May 02:55 PDT 2017, Jassi Brar wrote:
>> >
>> >> Loic, thanks for adding me.
>> >>
>> >> On Wed, May 3, 2017 at 2:58 PM, Loic PALLARDY <loic.pallardy@st.com> wrote:
>> >> >
>> >> >
>> >> >> -----Original Message-----
>> >> >> From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
>> >> >> owner@vger.kernel.org] On Behalf Of Bjorn Andersson
>> >> >> Sent: Wednesday, May 03, 2017 7:29 AM
>> >> >> To: Andy Gross <andy.gross@linaro.org>; Rob Herring
>> >> >> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Ohad Ben-
>> >> >> Cohen <ohad@wizery.com>
>> >> >> Cc: linux-arm-msm@vger.kernel.org; linux-soc@vger.kernel.org;
>> >> >> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> >> >> remoteproc@vger.kernel.org
>> >> >> Subject: [PATCH v3 2/4] soc: qcom: Introduce APCS IPC driver
>> >> >>
>> >> >> This implements a driver that exposes the IPC bits found in the APCS Global
>> >> >> block in various Qualcomm platforms. The bits are used to signal inter-
>> >> >> processor communication signals from the application CPU to other masters.
>> >> >>
>> >> >> The driver implements the "doorbell" binding and could be used as basis for a
>> >> >> new Linux framework, if found useful outside Qualcomm.
>> >> >>
>> >> > Hi Bjorn,
>> >> >
>> >> > Even if Qualcom APCS IPC is limited, why don't you rely on existing mailbox framework.
>> >> > It is there to gather all IPC management under the same interface.
>> >> > No need to create a new one from my pov.
>> >> > If you don't provide message data, mailbox framework behaves as doorbell.
>> >> >
>> >> QCOM RPM reinvented the wheel for what mailbox framework already did,
>> >> despite my pointing it out =>
>> >> http://lkml.iu.edu/hypermail//linux/kernel/1406.2/03918.html
>> >>
>> >
>> > The RPM interface works by writing various information in shared DRAM
>> > and then invoking an interrupt on the remote processor.
>> >
>> This is what _most_ platforms do, and they use mailbox framework. If
>> mailbox framework doesn't suit RPM, then it doesn't suit most
>> platforms that use it.
>>
>> > My argumentation against using the mailbox framework for the RPM case
>> > was that the message model is a software construct and doesn't fit the
>> > mailbox framework.
>> >
>> Mailbox framework works beneath protocol layer (software construct).
>> As I said years ago, the h/w bits of the controller should be under
>> mailbox api, while the message structures and signals are protocol
>> specific and be in QCOM specific location.
>>
>
> Okay, now I finally get what you're saying. The RPM driver handles the
> protocol but the actual triggering of the remote interrupt should be
> done via the mailbox framework.
>
> That makes sense, until now I haven't seen the need for having a driver
> exposing the APCS IPC register (used by among others the RPM driver),
> but I will rewrite this patch as a mailbox controller and turn the RPM
> driver into a mailbox client.
>
Cool, thanks.

>>
>> > But which one of these would be appropriate for a "mailbox channel" that
>> > doesn't have any actual messages?
>> >
>> >   mbox_send_message(chan, NULL)
>> > or
>> >   const int one = 1;
>> >   mbox_send_message(chan, (void*)&one);
>> >
>> It depends upon your h/w.
>> If each physical channel is hardwired to work on a predefined single
>> bit, then the driver could do without that bit being explicitly
>> passed.
>> If a physical channel can be mapped onto any bit(s), then you do need
>> to pass that info via mbox_send_message().
>>
>
> It's a 32-bit register, writing a bit invokes the associated interrupt
> on some remote processor. I.e. bits 0, 1 and 2 represents different
> interrupts on the resource-power-management CPU while bit 12, 13, 14 and
> 15 will invoke interrupts on a modem CPU.
>
No problem. For such arrangement, you could have a channel per
interrupt/bit. Have the DT specify which bit goes as what interrupt to
which cpu. The controller driver would then associate each channel to
its 'bit' and a client would always acquire the right channel
(specified by DT) and need not know/pass which bit should be set for
its messages i.e, mbox_send_message(chan, NULL)

> I'll rework the proposed driver and we can look at the actual
> implementation instead.
>
>>
>> >> The driver bypassed mailbox framework and was pushed via another tree.
>> >> Same is being attempted now, only now it is more expensive to switch
>> >> to generic mailbox framework having spent so much time on QCOM
>> >> specific implementation of controller and protocol drivers inside
>> >> drivers/soc/qcom/
>> >
>> > I'm not sure I follow this, there's no extensive rework going on here -
>> > all I'm trying to do is abstract the "writel(BIT(x), ipc_reg)" line of
>> > the RPM driver, because it's being used in other clients as well.
>> >
>> No, I meant ideally RPM should have used mailbox api for the
>> controller programming, but moving to that now will be expensive
>> because you already developed huge code base around QCOM specific
>> mailbox implementation.
>>
>
> The part discussed above was implemented using syscon, so it's a few
> lines of code to grab hold of a handle and instead of
> mbox_send_message() there is a single call to regmap_write(). All the
> other parts of the implementation is protocol-specific, and as you say
> the next layer up. So the transition is quite straight forward!
>
Great!

Thanks.
