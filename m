Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c9b86ecfa6b84ae994da6c30d2840bbf@SFHDAG7NODE2.st.com>
References: <20170503052929.17422-1-bjorn.andersson@linaro.org>
 <20170503052929.17422-2-bjorn.andersson@linaro.org> <c9b86ecfa6b84ae994da6c30d2840bbf@SFHDAG7NODE2.st.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 3 May 2017 15:25:20 +0530
Message-ID: <CABb+yY03NHBEui+OtagpTD4bm2yxoahEiciBG99gG2jrVGjpKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] soc: qcom: Introduce APCS IPC driver
Content-Type: text/plain; charset=UTF-8
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Loic, thanks for adding me.

On Wed, May 3, 2017 at 2:58 PM, Loic PALLARDY <loic.pallardy@st.com> wrote:
>
>
>> -----Original Message-----
>> From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
>> owner@vger.kernel.org] On Behalf Of Bjorn Andersson
>> Sent: Wednesday, May 03, 2017 7:29 AM
>> To: Andy Gross <andy.gross@linaro.org>; Rob Herring
>> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Ohad Ben-
>> Cohen <ohad@wizery.com>
>> Cc: linux-arm-msm@vger.kernel.org; linux-soc@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> remoteproc@vger.kernel.org
>> Subject: [PATCH v3 2/4] soc: qcom: Introduce APCS IPC driver
>>
>> This implements a driver that exposes the IPC bits found in the APCS Global
>> block in various Qualcomm platforms. The bits are used to signal inter-
>> processor communication signals from the application CPU to other masters.
>>
>> The driver implements the "doorbell" binding and could be used as basis for a
>> new Linux framework, if found useful outside Qualcomm.
>>
> Hi Bjorn,
>
> Even if Qualcom APCS IPC is limited, why don't you rely on existing mailbox framework.
> It is there to gather all IPC management under the same interface.
> No need to create a new one from my pov.
> If you don't provide message data, mailbox framework behaves as doorbell.
>
QCOM RPM reinvented the wheel for what mailbox framework already did,
despite my pointing it out =>
http://lkml.iu.edu/hypermail//linux/kernel/1406.2/03918.html

The driver bypassed mailbox framework and was pushed via another tree.
Same is being attempted now, only now it is more expensive to switch
to generic mailbox framework having spent so much time on QCOM
specific implementation of controller and protocol drivers inside
drivers/soc/qcom/
