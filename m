Return-Path: <SRS0=A2u3=D3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F26C433E7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Oct 2020 07:17:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC8C02223C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Oct 2020 07:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="JaYoO3xY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbgJTHRi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Oct 2020 03:17:38 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:19108 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728165AbgJTHRi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Oct 2020 03:17:38 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09K7BuFr024057;
        Tue, 20 Oct 2020 09:17:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=aQDUbd6GMCzKxCiaZb7oambJxJJxxcs3uqQKe7LiA68=;
 b=JaYoO3xYEJ6pSkjitlqL5gK82Nfl1VXjFb3MfCa11Jo5CsLV+v5g6+98zVHWF3GHe42s
 KwA9IMTUuyJlHw/4K95DJwCanaVxW/mlHAMXKtvPcGXMxHgrOLx6ThLrZWzu0xn7p3cf
 8xzrJhIhZ5VWClFVHJWMBDA+hOanfWsD0aixTORNcyF2JhvKz6nFbicduCje0zR3cqQG
 mbmg+oDxk7qQjnslaf2Qf7Kt4NPTU7qgTlJEMIA7qkITfUh00/oTl/GMvIdVrcm0U/Kr
 Zvx40rPS8ps8xVTSQrU0v2qPig68KMk8gCWOQbO7VnqWFsRqFU3ix2n/bawRSi+8ATAO fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 347p30gqx7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Oct 2020 09:17:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF9F6100039;
        Tue, 20 Oct 2020 09:17:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F5FA2AD9E2;
        Tue, 20 Oct 2020 09:17:32 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 09:17:31 +0200
Subject: Re: [PATCH v3 0/8] rpmsg: Make RPMSG name service modular
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201019203438.501174-1-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <f20359a0-6112-4373-7d6e-c60f3065822f@st.com>
Date:   Tue, 20 Oct 2020 09:17:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019203438.501174-1-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-20_03:2020-10-16,2020-10-20 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 10/19/20 10:34 PM, Mathieu Poirier wrote:
> This set starts by making the RPMSG protocol transport agnostic by
> moving the headers it uses to generic types and using those in the
> current implementation.  From there it re-uses the work that Arnaud
> published[1] to make the name service modular.
> 
> The main difference with this revision is the usage of a variable
> (rpmsg_device::little_endian) rather than an operation to determine
> the byte representation of the transport layer.  It is also
> addressing a problem that would have prevented git bisect to work
> properly in rpmsg_ns_cb() where the rpdev was used.
> 
> In short patches 1 to 3 and patch 7 have to be reviewed again.  They
> changed enough that I did not add RB tags to them.  Patches 4 to 6
> have not changed from the previous revision.
> 
> Tested on stm32mp157 with the RPMSG client sample application.  Applies
> cleanly on v5.9.

No more comments from my side, thank you very much for your work on this topic!

Regards,
Arnaud 

> 
> Thanks,
> Mathieu
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
> 
> -------
> New for V3:
> - Using rpmsg_device::little_endian variable rather than an operation
> - Fix an implementation problem that would have prevented git bisect to work
> 
> 
> Arnaud Pouliquen (4):
>   rpmsg: virtio: Rename rpmsg_create_channel
>   rpmsg: core: Add channel creation internal API
>   rpmsg: virtio: Add rpmsg channel device ops
>   rpmsg: Turn name service into a stand alone driver
> 
> Mathieu Poirier (4):
>   rpmsg: Introduce __rpmsg{16|32|64} types
>   rpmsg: virtio: Move from virtio to rpmsg byte conversion
>   rpmsg: Move structure rpmsg_ns_msg to header file
>   rpmsg: Make rpmsg_{register|unregister}_device() public
> 
>  drivers/rpmsg/Kconfig            |   8 ++
>  drivers/rpmsg/Makefile           |   1 +
>  drivers/rpmsg/rpmsg_core.c       |  44 ++++++++
>  drivers/rpmsg/rpmsg_internal.h   |  14 ++-
>  drivers/rpmsg/rpmsg_ns.c         | 108 ++++++++++++++++++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 185 +++++++++++--------------------
>  include/linux/rpmsg.h            |  63 ++++++++++-
>  include/linux/rpmsg_byteorder.h  |  67 +++++++++++
>  include/linux/rpmsg_ns.h         |  59 ++++++++++
>  include/uapi/linux/rpmsg_types.h |  11 ++
>  10 files changed, 433 insertions(+), 127 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
>  create mode 100644 include/linux/rpmsg_byteorder.h
>  create mode 100644 include/linux/rpmsg_ns.h
>  create mode 100644 include/uapi/linux/rpmsg_types.h
> 
