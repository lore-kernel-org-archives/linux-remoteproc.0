Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F9AC43462
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 May 2021 10:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EB1261209
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 May 2021 10:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236148AbhEQKHK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 May 2021 06:07:10 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:56021 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236320AbhEQKGx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 May 2021 06:06:53 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14HA2mZL005468;
        Mon, 17 May 2021 12:04:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sEJrkV+PRh8YyBsUrW6p2Qmd2mVyyFFa4+vqrgyw2So=;
 b=aaSJ52COxAqVNSyfYlbcW8O7QuCZ5LSJG2JnSm+G8OdVP06VqMTUn2LQRstQuqcfCIge
 CqDGSibfSj1SZyxvZ5p6dOaLSTTRDG4f9Qzh0t6ruRjJz4rC7cjbFbnSMbZbo1XUbvrR
 yaPvXJxns48YCPdVgUlGRBagZyEkky9GJ5LTmmeMPEZMDlqtjEbPnayI4siAH9ArFdl9
 P8EofIUfM5tkBdV3S/wMpmtkn9kuHbTuT+CAmyJ25dyEPDgCnuVp1HpdBMlCPk+WFLS2
 3kSVDtOI9ysI4O2wSDv/o7IYbTMPD8tVS3MI+LDsDpEtlH81uvXStQIXRbLaXoNDt+wX Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38kmb2rufx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 May 2021 12:04:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 801D710002A;
        Mon, 17 May 2021 12:04:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D4202248D1;
        Mon, 17 May 2021 12:04:31 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 12:04:30 +0200
Subject: Re: [PATCH v3 5/6] rpmsg: char: Introduce a rpmsg driver for the
 rpmsg char device
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
 <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
 <20210505164159.GB1766375@xps15>
 <5a41e653-4d75-c5d5-a8e3-e247a50507f3@foss.st.com>
 <20210506161125.GA1804623@xps15>
 <e54fb7ce-41c9-4282-22d0-3188af81dc0f@foss.st.com>
 <20210507163113.GA1907885@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <17df93bf-a055-5519-f6e5-ab4751a81ebf@foss.st.com>
Date:   Mon, 17 May 2021 12:04:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210507163113.GA1907885@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-17_03:2021-05-17,2021-05-17 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Mathieu,

On 5/7/21 6:31 PM, Mathieu Poirier wrote:
> Good morning,
> 
> On Fri, May 07, 2021 at 11:30:30AM +0200, Arnaud POULIQUEN wrote:
>> Hi Mathieu,
>>
>> On 5/6/21 6:11 PM, Mathieu Poirier wrote:
>>> Good day,
>>>
>>> On Wed, May 05, 2021 at 08:25:24PM +0200, Arnaud POULIQUEN wrote:
>>>> Hi Mathieu,
>>>>
>>>> On 5/5/21 6:41 PM, Mathieu Poirier wrote:
>>>>> Hi Arnaud,
>>>>>
>>>>> On Thu, Apr 29, 2021 at 03:55:06PM +0200, Arnaud Pouliquen wrote:

[snip...]

>>>>>> +};
>>>>>
>>>>> The sole purpose of doing this is to create instances of rpmsg_chrdevs from the
>>>>> name service - but is it really needed?  Up to now and aside from GLINK and SMD,
>>>>> there asn't been other users of it so I'm wondering if it is worth going through
>>>>> all this trouble.
>>>>
>>>> It is a good point.
>>>>
>>>> Just as a reminder, the need of ST and, I assume, some other companies, is to
>>>> have a basic/generic communication channel to control a remote processor
>>>> application.
>>>>
>>>> Nothing generic exists today for a virtio transport based implementation.
>>>> Companies have to create their own driver.
>>>>
>>>> The purpose of my work is to allow our customer to use RPMsg without developing
>>>> a specific driver to control remote applications.
>>>>
>>>> The rpmsg_chrdev char is a good candidate for this. No protocol, just a simple
>>>> inter-processor link to send and receive data. The rpmsg_tty is another one.
>>>>
>>>> Focusing on the rpmsg_chrdev:
>>>> We did a part of the work with the first patch set that would be in 5.13.
>>>> But is it simple to use it for virtio transport based platforms?
>>>> If we don't implement the NS announcement support in rpmsg_chrdev, using
>>>> rpmsg_chrdev for a user application seems rather tricky.
>>>> How to instantiate the communication?
>>>
>>> Since we already have /dev/rpmsg_ctrlX user space can instantiate an 
>>> using that interface, which is how things are done in the GLINK/SMD world.
>>>
>>> Wouldn't that cover the usecases you had in mind?
>>
>> I have in mind that to make RPMsg easy to use, we need a generic driver with a
>> basic user interface to send end receive data, that supports the NS announcement:
>> -  remote side could instantiate it.
>> -  an instantiation of the device by a Linux application generates a NS
>> announcement sent to the remote side (for instance to create a channel for debug
>> trace).
>>
> 
> The communication using a rpmsg_chrdev should be happening in two different ways,
> i.e RPMSG_CREATE_EPT_IOCTL and RPMSG_CREATE_DEV_IOCTL (as you had in a previous
> patchset). 
> 
> From user space communication using a rpmsg_chrdev should be initiated in two
> different ways, i.e RPMSG_CREATE_EPT_IOCTL and RPMSG_CREATE_DEV_IOCTL (as you
> had in a previous patchset). 
> 
> Regarding RPMSG_CREATE_EPT_IOCTL, patches 1, 2 and 3 take care of the legacy
> compatibility and I am quite happy with that.  In this case the driver works the
> same way regardless of the transport mechanism - virtio, GLINK or SMD.

Ok i will send a new revision including only this ones, and continue the updates
in a new patchset.

> 
> Then there is instantiation with RPMSG_CREATE_DEV_IOCTL.  That creates a new
> channel (with endpoint) when coming from /dev/rpmsg_ctrlX.  When we have that
> functionality we can make the rpmsg_chrdev available from the name service, making
> sure the end result is the same regardless of source of the request (remote
> processor or user space).  I was under the impression that functionality would
> be part of an upcoming patchset.
> 
> Unless I'm missing parts of the story, proceeding this way should cover all the
> requirements we talked about.

From my windows, there are 3 remaining features:
- capability to instantiate rpmsg_chrdev from the remote side (NS announcement)
- capability to instantiate rpmsg_chrdev from local user application
  (RPMSG_CREATE_DEV_IOCTL)
- capability to send a NS announcement to the remote side on  rpmsg_chrdev local
instantiation using RPMSG_CREATE_DEV_IOCTL. This one could be more tricky to
implement as the endpoint can be created after the channel.

To simplify the review while keeping the overall picture in mind (and perhaps
prioritize based on other companies' interests), Please, just tell me what would
be your preference in term of splitting and next step.

> 
>> On the other side, the initial work requested by Bjorn seems to be reached:
>> de-correlate the control part to be able to reuse it for other rpmsg devices.
>>
>> I just have the feeling that we are stay in the middle of the road without the
>> patches 4,5 and 6 to have a first basic interface relying on RPMsg.
>>
>>>
>>> As you pointed out above rpmsg_chrdev should be light and simple - eliminating
>>> patches 4, 5 and 6 would yield that.
>>>
>>
>> My concern here is more about the complexity of using it by application, for
>> platforms that rely on virtio rpmsg transport. For instance applications need to
>> know the notion of local and remote RPMsg addressing.
>>
>> Based on your feeling, here is my proposition for next steps:
>>  1- resend a version a version with only patch 1,2 3 + the patch to clean-up the
>>    #include in rpmsg_char
>>  2- switch back to the RPMsg TTY upstream.
>>  3- extend rpmsg_ctrl IOCTLs to allow instantiate RPMSG_TTY from Linux userland.
>>
> 
> Introducing RPMSG_TTY makes sense if a serial controller is only accessible from
> the remote processor.  On the flip side it is an overkill if we just want a raw
> message passing mechanism.  For that the rpmsg_chrdev driver, with the above
> extention, should be used.
>  

Yes the rpmsg_chrdev should be the default one to use for basic communication.
The main purpose of the RPMSG_TTY (from ST company POW) is to easy the
transition in term of communication between an external and an internal
processor based on a serial link. It provides an abstraction layer that the
application does not have to manage the transport layer.

Both seem to me interesting to implement, but let's continue to focus on
rpmsg_chrdev first.

Thanks,
Arnaud

>>
>> Then, we can come back to patches 4, 5 and 6 depending on the feedback from the
>> users.
>>
>> Does this proposition would be OK for you?
>>
>> Thanks,
>> Arnaud
>>
>>
>>>> The application will probably has to scan the /sys/bus/rpmsg/devices/ folder to
>>>> determine the services and associated remote address.
>>>>
>>>> I don't think the QCOM drivers have the same problem because they seems to
>>>> initiate the communication and work directly with the RPMsg endpoints ( new
>>>> channel creation on endpoint creation) while Virtio works with the RPMsg channel.
>>>>
>>>> By introducing the ability to instantiate rpmsg_chrdevs through the NS
>>>> announcement, we make this easy for applications to use.
>>>>
>>>> And without rpmsg_chrdevs instantiation, It also means that we can't create an
>>>> RPMsg channel for the rpmsg_chrdevs using a new RPMSG_CREATE_DEV_IOCTL control,
>>>> right?
>>>>
>>>> That said, If we consider that the aim was only to extract the rpmsg_ctrl part,
>>>> I'm not against leaving the rpmsg_char in this state and switching to the
>>>> rpmsg_tty driver upstream including the work on the rpmsg_ctrl to create rpmsg
>>>> channels.
>>>>
>>>> We could come back on this if requested by someone else.
>>>>
>>>> Thanks,
>>>> Arnaud
>>>>
>>>>>
>>>>> As such I suggest we don't go out of our way to expose rpmsg_chrdevs to the name
>>>>> service.  That way patches 4, 5 and 6 of this set can be dropped.
>>>>>
>>>>> Thanks,
>>>>> Mathieu
>>>>>

