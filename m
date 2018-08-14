Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH] remoteproc/davinci: Mark error recovery as disabled
References: <20180723232757.9147-1-s-anna@ti.com>
 <0550997f-8e32-fb56-2a70-74235b969ce2@ti.com> <20180813185224.GG5090@builder>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <5a6e69f7-7da1-1b8e-d082-18f39d5139dc@ti.com>
Date: Tue, 14 Aug 2018 10:50:54 +0530
MIME-Version: 1.0
In-Reply-To: <20180813185224.GG5090@builder>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On Tuesday 14 August 2018 12:22 AM, Bjorn Andersson wrote:
> On Mon 13 Aug 08:11 PDT 2018, Suman Anna wrote:
> 
>> Hi Bjorn,
>>
>> On 07/23/2018 06:27 PM, Suman Anna wrote:
>>> The Davinci remoteproc driver does not support error recovery at
>>> present, so mark the corresponding remoteproc flag appropriately
>>> so that the debugfs flag shows the value as 'disabled' by default.
>>>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>
>> Can you pick up this minor patch for 4.19 please, I do not see this in
>> your rproc-next branch?
>>
> 
> Of course, the patch is applied now, will send my pull request in a few
> days.

Can you also please pick patch 1/4 here:

https://patchwork.kernel.org/patch/10479365/

Thanks,
Sekhar
