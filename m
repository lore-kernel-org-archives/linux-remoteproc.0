Return-Path: <david@lechnology.com>
Subject: Re: [PATCH v7 0/4] ARM: davinci: complete the conversion to using the
 reset framework
References: <20180621073706.22812-1-brgl@bgdev.pl>
 <9ec10627-49a5-07ad-8c9d-5ac873096cc0@ti.com>
 <CAMRc=Me1JTuw40tMWaai2oKMxmc_ktN2OKBhF8tmGt0cQ6magg@mail.gmail.com>
 <e4bd9f57-617a-a59e-5d05-be1a6b3e6b3d@ti.com>
From: David Lechner <david@lechnology.com>
Message-ID: <345aed22-629a-abf6-df22-adee88a43df6@lechnology.com>
Date: Mon, 2 Jul 2018 10:27:53 -0500
MIME-Version: 1.0
In-Reply-To: <e4bd9f57-617a-a59e-5d05-be1a6b3e6b3d@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Sekhar Nori <nsekhar@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 07/02/2018 07:08 AM, Sekhar Nori wrote:
> Hi Bjorn,
> 
> On Thursday 21 June 2018 05:11 PM, Bartosz Golaszewski wrote:
>> 2018-06-21 12:52 GMT+02:00 Sekhar Nori <nsekhar@ti.com>:
>>> Hi Bartosz,
>>>
>>> On Thursday 21 June 2018 01:07 PM, Bartosz Golaszewski wrote:
>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>
>>>> These are the remaining patches that still need to be merged in order
>>>> to complete the conversion of the davinci dsp driver to using the reset
>>>> framework.
>>>>
>>>> They apply on top of v4.18-rc1 with David Lechner's remaining patches
>>>> merged.
>>>
>>> Series looks good to me.
>>>
>>> To preserve bisect, shouldn't the order of applying be patch #3, #4, #1
>>> and #2 ?
>>>
>>> Given the dependencies and to preserve bisect its easiest if I take the
>>> series with acks from remoteproc and clock maintainers.
>>>
>>> Open to other suggestions as well.
>>>
>>> Thanks,
>>> Sekhar
>>
>> Oops you're right about the order. Do you want me to resend?
> 
> With your ack, I can queue 1/4 for v4.19 and provide an immutable commit
> to you (on top of v4.18-rc1) for you to merge any further changes you
> want to queue from your tree.
> 
> Bartosz, given the number of moving pieces, I think its better to keep
> 2/4 for v4.20 release - once all other other dependencies have been merged.

I was thinking the same thing as well. I will pick it up in a
clk-davinci-4.20 branch if that sounds OK.
