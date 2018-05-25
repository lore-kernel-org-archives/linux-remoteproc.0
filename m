Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
In-Reply-To: <767dc01f-abed-8192-0274-ff5fc092f60b@codeaurora.org>
References: <1526194908-19027-1-git-send-email-rohitkr@codeaurora.org>
 <20180523062645.GY14924@minitux> <767dc01f-abed-8192-0274-ff5fc092f60b@codeaurora.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 25 May 2018 11:00:42 -0500
Message-ID: <CAL_Jsq+kHSBfUoAUFp1=BbzFJOdc6Ffv=us8REZbJdYzRnj_Og@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: Add APSS based Qualcomm ADSP PIL driver for SDM845
Content-Type: text/plain; charset="UTF-8"
To: Rohit Kumar <rohitkr@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Banajit Goswami <bgoswami@codeaurora.org>, sbpata@codeaurora.org, asishb@codeaurora.org, rkarra@codeaurora.org, RajendraBabu Medisetti <rajendrabm@codeaurora.org>, Krishnamurthy Renu <krishnamurthy.renu@codeaurora.org>, asishb@qti.qualcomm.com, Ramlal Karra <rkarra@qti.qualcomm.com>, Rohit Kumar <rohkumar@qti.qualcomm.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, May 24, 2018 at 12:18 AM, Rohit Kumar <rohitkr@codeaurora.org> wrote:
> Thanks Bjorn for reviewing.
>
>
> On 5/23/2018 11:56 AM, Bjorn Andersson wrote:
>>
>> On Sun 13 May 00:01 PDT 2018, Rohit kumar wrote:
>>

>> [..]
>>>
>>> +static inline void update_bits(void *reg, u32 mask_val, u32 set_val, u32
>>> shift)
>>> +{
>>> +       u32 reg_val = 0;
>>> +
>>> +       reg_val = ((readl(reg)) & ~mask_val) | ((set_val << shift) &
>>> mask_val);
>>> +       writel(reg_val, reg);
>>> +}
>>> +
>>> +static inline unsigned int read_bit(void *reg, u32 mask, int shift)
>>> +{
>>> +       return ((readl(reg) & mask) >> shift);
>>> +}
>>
>> I don't like these helper functions, their prototype is nonstandard and
>> makes it really hard to read all the calling code.
>>
>> I would prefer if you just inline the operations directly, to make it
>> clearer what's going on in each case - if not then at least follow the
>> prototype of e.g. regmap_udpate_bits(), which people might be used to.
>
> Sure. Will update these APIs to follow standard format used in regmap and
> other drivers.

Just use readl/writel directly. If we wanted bit access functions,
then we'd have common ones implemented already. They exist for regmap
because with regmap you also need locking. Here you either don't need
locking for RMW or you forgot it. Either way, wrapping a RMW operation
into a function gives the illusion of being atomic when it is not.

Rob
