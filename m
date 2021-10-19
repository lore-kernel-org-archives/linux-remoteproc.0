Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9603C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Oct 2021 12:54:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFE0161360
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Oct 2021 12:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235739AbhJSM5C (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Oct 2021 08:57:02 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:50848 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230267AbhJSM5C (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Oct 2021 08:57:02 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J95u8J003961;
        Tue, 19 Oct 2021 14:54:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=exCJlW6Ssj7lW040BPKHMvuACcu4HDdKqcgtA+Rl08s=;
 b=nyn3/HKffQMHFsBIk+C9550QNzTAn37kTgoggAFjYLDrjghUGWvBx6BiUSaPKLUM75Sq
 I6jIn4JuGTDmyYCM/qBcKbLbN9rTRhjHXO9UwFXk4Osjnmy99thW1I0DjrUqhDTyHgVF
 wfBQZAu8oSvamdJGgl3Q3e8IJiCIMUdvHQ4bNoa85bmn9hnp7qp3BfF/uE33b+3XC/jZ
 lmEae7yysYbxsmbfMbilX7Y6XisshmkTOWLXVclT9+hNiM5zqgHO4g1Lvn7QSteHiHiC
 EZbRJVQba3jqViwgS9wQ6+3v0jGq4InkmJcKRRQsUXbyPzmt/oQXeTFiL8nJ6s0wGlbE HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bsp76kn0t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 19 Oct 2021 14:54:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 137F4100034;
        Tue, 19 Oct 2021 14:54:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DF792171E2;
        Tue, 19 Oct 2021 14:54:45 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 19 Oct
 2021 14:54:44 +0200
Subject: Re: [PATCH v5 0/4] Restructure the rpmsg char to decorrelate the
 control part.
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <YWDSXu/MDOwOLDg0@ripper> <8b7179ff-6d0a-8ed5-c0a3-4298fa9b9dc6@foss.st.com>
 <YW47S1HKWKPVHqtp@ripper>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <e6ee34b8-ca30-d73c-3383-f696650f6bb1@foss.st.com>
Date:   Tue, 19 Oct 2021 14:54:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YW47S1HKWKPVHqtp@ripper>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-19_01,2021-10-19_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/19/21 5:28 AM, Bjorn Andersson wrote:
> On Mon 11 Oct 03:38 PDT 2021, Arnaud POULIQUEN wrote:
> 
>>
>>
>> On 10/9/21 1:21 AM, Bjorn Andersson wrote:
>>> On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
>>>
>>>> Main update from V4 [1] 
>>>>  - complete commit messages with Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>  - rebased on kernel V.14-rc1.
>>>>
>>>> This series can be applied and tested on "Linux 5.14-rc1"(e73f0f0ee754) branch
>>>>
>>>> Series description:
>>>> This series is the second step in the division of the series [2]: 
>>>> "Introducing a Generic IOCTL Interface for RPMsg Channel Management".
>>>>
>>>> The purpose of this patchset is to split the code related to the control
>>>> and the endpoint. The code related to the control part is moved in the rpmsg_ctrl.c.
>>>
>>> I'm not convinced about the merits for this refactoring, you're creating
>>> yet another kernel module which is fairly tightly coupled with
>>> the rpmsg_char kernel module and the only case I can see where this
>>> would be useful is if you want to be able to create reach
>>> RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_EPT_IOCTL without having to
>>> include the rpmsg_char part in your kernel.
>>
>> This is what we discussed during a meeting we had on the rpsmg_tty subject the
>> July 7, 2020. [1] sump-up what you requested from me before introducing the
>> rpmsg tty. But we miss-understood your requirement?
>>
>> This work is the result of our discussion:
>> - decorrelate the control and stream part of the rpmsg_char to be able to reuse
>> the control for other rpmsg services such as the rpmsg_tty.
>> - Add capability to instantiate other rpmsg service from Linux user land
>> applications.
>>
>> The correlation between the rpmsg_char and the rpmsg_ctrl is due to the support
>> of the RPMSG_CREATE_EPT_IOCTL RPMSG_DESTROY_EPT_IOCTL legacy controls for the
>> QCOM driver.
>>
>> At the end I guess the rpmsg_ctrl could become, in the future, a channel for
>> endpoint signaling between processors.
>>
>> [1] https://lkml.org/lkml/2020/7/15/868
>>
>>>
>>>> This split is an intermediate step to extend the controls to allow user applications to
>>>> instantiate rpmsg devices.
>>
>>>>     
>>>
>>> Can you give a concrete example of when this would be used?
>>
>> Similar to what it is done with the RPMSG_CREATE_EPT_IOCTL but based on the
>> channel not the endpoint (as the rpmsg_bus virtio is channel based).
>>
> 
> I've always seen the rpmsg_endpoint as some form of pipe (with the
> special case in virtio rpmsg of it possibly not being connected to
> anything) and then the rpmsg_channel being essentially the glue between
> a "primary" endpoint and an rpmsg_device.

Referencing the documentation channel should be more than that:
"Channels are identified by a textual name and have a local ("source") rpmsg
address, and remote ("destination") rpmsg
address."
On the other side when creating an endpoint we provide channel info...
The border between the channel and the endpoint is quite blurred, and can
therefore be interpreted in different ways...

> 
> As such I assumed that it would make sense to do NS announcements of
> rpmsg_endpoints in general, not only rpmsg_channels.
> 
>> For instance we received several issue reports from customer on rpmsg
>> communication. The reason was that the coprocessor creates an unidirectional
>> channel to transfer data to the main processor. But nothing works because the
>> coprocessor doesn't have the remote address until the main processor send a
>> first message. The workaround is to send a fake message from the Linux to
>> provide is ept address.
>> Making this in the other direction allows the Linux application to initiate such
>> link when it is ready to receive data.
>>
>> Other examples of usage:
>> - Create a temporary channel to get for instance logs of the remotre proc
>> - destroy and re-create some channels on Linux suspend/resume.
>>
> 
> What's the context these two sets of channels live in? A separate
> rpmsg_device or you're having some userspace entity invoke the
> create/destroy during suspend and resume?
> 

Exemples are not concrete use cases but a projection of what our (mass market)
customers could do with such services.
I have in mind userland services/applications that would dynamically manage the
interaction with the co-processor. some other examples:
- For telematics control, the main processor could create temporary channels for
diagnostics.
- A low power tools that performs measurements using the coprocessor. The main
processor would be activated only to manage a HUI. When the HUI is enabled, the
main processor would be start a rpmsg service to get data and display it.
- more generally, by destroying a service some processing could be suspended on
coprocessor.

>> As the proposal of exposing the capability to userland to initiate the link (if
>> i well remember) is coming from you, don't hesitate if you have some extra
>> uscase that i can add in the cover letter.
>>
> 
> Right, I remember expressing the need to extend rpmsg_char (somehow) to
> make it possible for userspace to initiate the creation of a channel to
> the other side.
> 
> It's the part where userspace pokes the kernel, so that the kernel goes
> and create the rpmsg_device, which magically ends up probing some driver
> that I'm wondering about...

The RPMSG_CREATE_EPT_IOCTL do quite the same, it creates a device.
The difference is that the  RPMSG_CREATE_DEV_IOCTL create an additional parent
rpmsg device, while the RPMSG_CREATE_EPT_IOCTL attach this device to the rpmsg
chrdev device.

In term of device creation, the RPMSG_CREATE_DEV_IOCTL does nothing else more
than the NS announcement does.

Regards,
Arnaud

> 
>>>
>>> Per our previous discussions I believe you intend to use this to bind
>>> your rpmsg_tty driver to arbitrary channels in runtime, which to me
>>> sounds like you're reinventing the bind/unbind sysfs attrs.
>>
>> Please tell me if I wrong, but the bind /unbind allows to probe/remove an
>> exiting device. the RPMSG_CREATE_DEV_IOCTL creates a new one on the rpmsg bus,
>> so not exactly the same use case.
>>
> 
> You're correct, it wouldn't allow you to locally create a new
> channel/endpoint and have some driver attached to that.
> 
> Regards,
> Bjorn
> 
>> Regards,
>> Arnaud
>>
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> Notice that this patchset does not modify the behavior for using the RPMSG_CREATE_EPT_IOCTL
>>>> and RPMSG_DESTROY_EPT_IOCTL controls.
>>>>   
>>>> The next step should be to add the capability to:
>>>> - instantiate rpmsg_chrdev from the remote side (NS announcement),
>>>> - instantiate rpmsg_chrdev from local user application by introducing the
>>>>   IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate the rpmsg devices,
>>>> - send a NS announcement to the remote side on rpmsg_chrdev local instantiation.
>>>>
>>>> [1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793
>>>> [2]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
>>>>
>>>> Arnaud Pouliquen (4):
>>>>   rpmsg: char: Remove useless include
>>>>   rpmsg: char: Export eptdev create an destroy functions
>>>>   rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
>>>>   rpmsg: Update rpmsg_chrdev_register_device function
>>>>
>>>>  drivers/rpmsg/Kconfig             |   9 ++
>>>>  drivers/rpmsg/Makefile            |   1 +
>>>>  drivers/rpmsg/qcom_glink_native.c |   2 +-
>>>>  drivers/rpmsg/qcom_smd.c          |   2 +-
>>>>  drivers/rpmsg/rpmsg_char.c        | 184 ++-----------------------
>>>>  drivers/rpmsg/rpmsg_char.h        |  51 +++++++
>>>>  drivers/rpmsg/rpmsg_ctrl.c        | 215 ++++++++++++++++++++++++++++++
>>>>  drivers/rpmsg/rpmsg_internal.h    |   8 +-
>>>>  drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
>>>>  9 files changed, 293 insertions(+), 181 deletions(-)
>>>>  create mode 100644 drivers/rpmsg/rpmsg_char.h
>>>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
>>>>
>>>> -- 
>>>> 2.17.1
>>>>
