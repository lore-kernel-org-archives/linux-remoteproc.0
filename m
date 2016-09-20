Return-Path: <Matt.Redfearn@imgtec.com>
Subject: Re: [PATCH v2 6/6] MIPS: Deprecate VPE Loader
References: <1474361249-31064-1-git-send-email-matt.redfearn@imgtec.com>
 <1474361249-31064-7-git-send-email-matt.redfearn@imgtec.com>
 <20160920131934.GE14137@linux-mips.org>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <fc65f123-6e32-4637-ac16-458e08029944@imgtec.com>
Date: Tue, 20 Sep 2016 14:53:08 +0100
MIME-Version: 1.0
In-Reply-To: <20160920131934.GE14137@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Ralf,


On 20/09/16 14:19, Ralf Baechle wrote:
> On Tue, Sep 20, 2016 at 09:47:29AM +0100, Matt Redfearn wrote:
>
>> The MIPS remote processor driver (CONFIG_MIPS_RPROC) provides a more
>> standard mechanism for using one or more VPs as coprocessors running
>> separate firmware.
>>
>> Here we deprecate this mechanism before it is removed.
> The world will be a better place once this is removed.

Indeed :-)

>
> I receive the occasional minor cleanup or robopatch (coccinelle or similar)
> for the VPE loader but I have no indication this is actually being used
> by anybody, so is thee any reason why not to delete it right away?

I'd like to get the remote processor implementation in, then delete the 
VPE loader in the next kernel revision, if that's ok with you. Once it 
is removed, we should also be able to remove the CMP SMP implementation, 
and other bits of infrastructure that'll no longer be needed.

Thanks,
Matt

>
>    Ralf
