Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD632C433B4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 16:43:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8846561177
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 16:43:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhEDQoq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 12:44:46 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:6138 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231602AbhEDQop (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 12:44:45 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 144Gb6jU023605;
        Tue, 4 May 2021 18:43:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=e4GHW6KQzv3cVavsJTuYmCHdmlph4nc7Fv8hSyOSqhE=;
 b=VbuvjYKpdlB2wIjoDVIId9AxHsuXVWk/u2aXE0ZYPEmiHieniaqu0I3eGgflcPY+NHFg
 bU5citlNI1pckg6K5jlHdUg1Ohtn+m7j2SdMuLqBYEQw9dwczUALMUmr/IQGQXJkpY/G
 ObHHBhMoS/dQG3Dqt4an/MgylsyEGHBUVT0nVFmlYHbvvrXpiopfAcX4nwz3XpR1ibmj
 h7xeWX75KbiE7DI5FdENhaabUAyFhp0QEc6iR9Jc4Uuu5BSr3YKp3NrLg+UJ3DMgjvPY
 q7NBxGtvpFGvOHdQTBKjNwHo7VEZAYKFY8E741GkvMJmf9531QxEqH4SztN5Fl7WhK85 tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38akujydqr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 May 2021 18:43:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A6BCC10002A;
        Tue,  4 May 2021 18:43:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8789C2A4D98;
        Tue,  4 May 2021 18:43:48 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May
 2021 18:43:47 +0200
Subject: Re: race condition issue at remote proc startup
To:     Yann Sionneau <ysionneau@kalray.eu>,
        <linux-remoteproc@vger.kernel.org>
CC:     Pierre-Yves Kerbrat <pkerbrat@kalrayinc.com>,
        Vincent Chardon <vchardon@kalrayinc.com>,
        Julien Hascoet <jhascoet@kalrayinc.com>
References: <b086d39f-ee2e-39b5-c4b1-bf9fbbd6a83b@kalray.eu>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <d6827a71-81ea-579f-dc89-68ca9055dac1@foss.st.com>
Date:   Tue, 4 May 2021 18:43:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b086d39f-ee2e-39b5-c4b1-bf9fbbd6a83b@kalray.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-04_09:2021-05-04,2021-05-04 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Yann

On 5/4/21 11:45 AM, Yann Sionneau wrote:
> Hello,
> 
> We (at Kalray) have some difficulties during initialization of a remoteproc
> device, and there seem to have no clean way (at least not one we know of) out of
> this problem.
> 
> We need vring defined in the resource table to be completely initialized before
> the remoteproc device is started. By completely initialized I mean that the
> vring device address defined in resource table shall be changed from 0xff..ff to
> a proper address. Currently the remote device is started before the
> initialization has completed, which creates a race condition between Linux and
> the remoteproc device. (We have a particular architecture in which the processor
> running Linux is the same as the embedded processor, this is why this problem
> happens in our case but probably not when the processor running Linux is much
> faster than the embedded processor).

Is the remote side waiting for the vdev status[1] update before accessing the
vrings?

[1] https://elixir.bootlin.com/linux/latest/source/include/linux/remoteproc.h#L307


> 
> Our best attempt up to now is to configure the virtio ring sooner i.e during
> subdevice preparation instead of subdevice start.
> i.e. in rproc_handle_vdev change code from
>     rvdev->subdev.start = rproc_vdev_do_start;
> to
>     /* da field in vring must be initialized before powering up
>      * the remoterproc, or else race condition may occur.
>      * Indeed the remoteproc may read it before it has been initialized.
>      */
>     rvdev->subdev.prepare = rproc_vdev_do_start;
> 
> This works but it has undesired side effects. In particular some notifications
> are sent (the remote proc kick function is being called), but since the remote
> CPU has not been started yet we are not able to handle them, thus we simply
> ignore them if the state of the remote proc is not RUNNING.
> At least this seems to solve our problem, but this is a particularly unpleasant
> way of solving the problem, in particular it might impact the existing
> remoteproc devices. Do you have any suggestion on some cleaner to way to solve
> this problem?
> 
> FYI, here is our arch specific remote proc implementation:
> https://github.com/kalray/linux_coolidge/blob/coolidge/drivers/remoteproc/kvx_remoteproc.c
> 
> 
> PS: there seem to be a similar problem when the remote device is being stopped.
> The vring buffer are destroyed and only after is the remote proc device stopped.
> There is once again a race condition as the remote proc device might try to
> access the vring after their destruction by the host. Proposed change is as follow:
> In rproc_handle_vdev change code from
>     rvdev->subdev.stop = rproc_vdev_do_stop;
> to
>     rvdev->subdev.unprepare = rproc_vdev_do_stop;

Should also be handled with the vdev status.

> 
> Note this change has much less impact on existing remote proc and is symmetric
> to the previous change thus it might make it sound more logical
> 
> PS2: I guess that this issue never showed up before because most other use cases
> are using fixed addresses in the resource tables and not dynamically allocated
> ones at runtime.

We use dynamic vring address allocation without any issue on STM323MP1 platform,
with the coprocessor started before the main processor running Linux.

Regards,
Arnaud

> 
> Regards,
> 
