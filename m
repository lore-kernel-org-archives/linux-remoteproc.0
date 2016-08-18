Return-Path: <clabbe.montjoie@gmail.com>
Return-Path: <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH RFC 1/3] hwspinlock: sun8i: add Allwinner sun8i HardWare
 Spinlock
References: <1471002394-1106-1-git-send-email-clabbe.montjoie@gmail.com>
 <20160812190641.GI26240@tuxbot>
From: Corentin LABBE <clabbe.montjoie@gmail.com>
Message-ID: <0a17ceec-13f7-ddeb-69dd-2505154e8ccf@gmail.com>
Date: Thu, 18 Aug 2016 21:38:04 +0200
MIME-Version: 1.0
In-Reply-To: <20160812190641.GI26240@tuxbot>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hello

Thanks for your review, I will fix all your reports for next version.

On 12/08/2016 21:06, Bjorn Andersson wrote:
> On Fri 12 Aug 04:46 PDT 2016, LABBE Corentin wrote:
> 
>> Add hwspinlock support for the Allwinner Hardware Spinlock device
>> present on the A83T, H3 and A64 SoCs.
>>
>> This Hardware Spinlock device provides hardware assistance
>> for synchronization between the multiple processors in the system.
>>
> [..]
>> +		goto clk_fail;
>> +	}
>> +
>> +	dev_info(&pdev->dev, "Sun8i hwspinlock driver loaded with %d locks\n",
>> +		 priv->num_locks);
> 
> Please don't advertise the driver on success.
> 

I was doing that because datasheet specify only 32 slot, but later a register give a possibility of more slots.
Perhaps its better to advertise only for uncommon hardware (slot > 32) ?

Regards

LABBE Corentin
