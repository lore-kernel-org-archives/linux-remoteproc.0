Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from wsip-184-185-158-229.sd.sd.cox.net ([184.185.158.229]:46199
        "EHLO s0-postfix.allcaps.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727170AbgBFBQt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Feb 2020 20:16:49 -0500
Subject: Re: How to get src and dst for pru_rpmsg_send?
References: <f22d9305-326f-f584-4480-9509c5f903fb@allcaps.org>
 <20200205232148.GC25901@xps15>
From: "Andrew P. Lentvorski" <bsder@allcaps.org>
Message-ID: <49d5fcdb-e51e-f289-15fb-eea2efdcf477@allcaps.org>
Date: Wed, 5 Feb 2020 17:16:47 -0800
MIME-Version: 1.0
In-Reply-To: <20200205232148.GC25901@xps15>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi, Mathieu,

On 2/5/20 3:21 PM, Mathieu Poirier wrote:
> Hi Andrew,
> 
> On Wed, Feb 05, 2020 at 02:24:07AM -0800, Andrew P. Lentvorski wrote:
>> I seem to be missing something obvious: Where do I get the values for
>> src and dst in the pru_rpmsg_send() function?
>>
>> The TI examples do a pru_rpmsg_receive() first and then echo back to the
>> same src and dst.  That seems ... odd.  What's the point of having a
>> variable src and dst if they are effectively hardwired to a single
>> communication channel?
> 
> Since pru_rpmsg_send/receive() don't exist in the mainline kernel you will have
> to be more specific... What TI examples are you referring to?  Where can we find
> them? 

TI keeps the examples here:
https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/

This is a good example of the rpmsg system being used with the echo I
talked about:
https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/tree/examples/am335x/PRU_RPMsg_Echo_Interrupt1

That example works on the Beaglebone Black (an am3359 based Linux board).

> There are other rpmsg_sendxyz() functions that allow you to send messages to
> different addresses[1].  Given the amount of information, I'm afraid there isn't
> much else I can add at this time.
> 
> Thanks,
> Mathieu  
> 
> [1]. https://elixir.bootlin.com/linux/latest/source/include/linux/rpmsg.h#L125

Thanks for the pointers.

It looks like I need to drag the src/dst out of the rpmsg_device or
rpmsg_channel_info on the Linux side and then pass it to the PRU side by
some method.  An initial message is as good as any and better than most.

I completely flaked that this wouldn't be in mainline.  Even a simple
thought about the name "*pru*_rpmsg_send" should have set off alarm
bells.  Sorry about that.

Thanks for the help,
-a
