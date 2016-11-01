Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/1] remoteproc: Add support for xo clock
References: <1477429046-26855-1-git-send-email-spjoshi@codeaurora.org>
 <20161101000555.GK25787@tuxbot>
 <564faf01-f4d7-4bdb-ee48-76a893d3d4c0@codeaurora.org>
 <CAOCOHw4QYtvjcOUsYBGvs60OtN6Ug_a030xtsQSnYpxOTTUNzw@mail.gmail.com>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <38cfee53-8699-b3c1-22e0-cb5355ce9387@codeaurora.org>
Date: Tue, 1 Nov 2016 10:52:00 -0700
MIME-Version: 1.0
In-Reply-To: <CAOCOHw4QYtvjcOUsYBGvs60OtN6Ug_a030xtsQSnYpxOTTUNzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Trilok Soni <tsoni@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 11/01/2016 10:46 AM, Bjorn Andersson wrote:
> On Tue, Nov 1, 2016 at 10:41 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> On 10/31/2016 05:05 PM, Bjorn Andersson wrote:
>>> On Tue 25 Oct 13:57 PDT 2016, Sarangdhar Joshi wrote:
>>>
>>>> Add xo clock support required to boot up Qualcomm ADSP processor.
>>>> The ADSP remoteproc driver keeps xo clock enabled until the
>>>> driver receives "handover" irq, in order to allow ADSP processor
>>>> to vote for xo clock with rpm.
>>> Looks good, thanks.
>>>
>>> We have to add the clock to the DT binding and run that by Rob again,
>>> before merging the driver and this patch.
>>>
>> Maybe we should make the xo clock required. We always have a clock for
>> it somewhere, either RPM controlled or as a fixed rate clock so it
>> should work just as well.
>>
> As far as I can see it is required, after Sarangdhar's patch - so this
> is what I meant we need to add to the DT binding before merging that.
> And as you say, we can always make it reference "xo_board" for now.
>

Ah good then. Brain must have misread the patch.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
