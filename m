Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F8DC11F66
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Jun 2021 10:10:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8020461D3B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Jun 2021 10:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhF2KM6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:12:58 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:47740 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232772AbhF2KM5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Jun 2021 06:12:57 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15TA8fVL002052;
        Tue, 29 Jun 2021 12:10:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=HNidlLSuT/EgI/UAGSiAl/SFbXn1XzYYaTDoJm1qbVM=;
 b=lju3M3oT6ER1kv/CRLNLECPkaPJ2Yzbhd4dNgmo4L/jYElyS11KrnWxUlbWDPgE2u0JS
 QE7G+q4nn6EiyVYrU1An44rJqtLomNXTmscp/zJKulVrXYtxf36I+Jh9VLk0HtCmUj56
 eZbc+3QLzz4DydAd1HDD86C9VcoatBkNvjrShVQCnl98UHpVXVbxlr5xDvYwSf3O4EzQ
 dTyyzpP9LRM4/SkoTQnvgwsTzD/Tq81B3j2xvsNrBU+QCsRTDTu3oE+dk+cb/CWIX/bq
 Tso87Z4TvnNZRQqi7vCnDUJz64zCAOUsU7SKSzW1mItotHeQVTaI+BQcz+Cn9jsZYffx UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39fxbnhest-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Jun 2021 12:10:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8EC3810002A;
        Tue, 29 Jun 2021 12:10:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DBEA21ED4D;
        Tue, 29 Jun 2021 12:10:27 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 12:10:27 +0200
Subject: Re: remoteproc DMA API abuse status
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Christoph Hellwig <hch@lst.de>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210623134307.GA29505@lst.de> <20210624193514.GA1090275@p14s>
 <011dac94-cfe0-d276-980a-b8ffe1447521@foss.st.com>
 <20210628201419.GC1200359@p14s>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <3f0a2e44-c439-46ea-1100-881d19c9005d@foss.st.com>
Date:   Tue, 29 Jun 2021 12:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628201419.GC1200359@p14s>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-29_05:2021-06-28,2021-06-29 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu

On 6/28/21 10:14 PM, Mathieu Poirier wrote:
> I thought your current work on refactoring the rpmsg_char driver was part of the
> early steps on the way to splitting that patchset up...

No it is de-correlated. Here the point is the vdev0buffer memory region declared
in rproc that we associate to the rproc_virtio device to be able to use is for
RPMsg.

When I have a look this here is the approach we had trying to fix it (this
correspond to my patchset):

The objective is to suppress the dma_declare_coherent_memory usage.

=> In this case the "vdev0buffer" virtio buffer memory pool has do be associated
to the a virtio device by a declaration in device tree. Probably as a subnode of
the remoteproc device node.


&rproc {
	#address-cells = <1>;
	#size-cells = <0>;

+	vdev@0 {
+		memory-region = <&vdev0vring0>,	<&vdev0vring1>, <&vdev0buffer>;
+		compatible = "rproc-virtio";
+		reg = <0>;
+		status = "okay";
+	};
 };


=> a reproc virtio platform driver compatible should be created (based on
remoteproc core and remote_virtio restructuring). The memory region will be in
this case associated in a clean way to the remoteproc virtio device.

=> As consequence we would have 2 module devices the remoteproc and remoteproc
virtio. Both as to be synchronized to ensure that all is ready  before starting
the remote processor => reuse of the proc->subdev mechanism + (component
bind/unbind similar to DRM?)

The last but not the least we probably have to maintain the legacy a while to
let time to move on this new device tree architecture.

Now the question are:
- Is this the good approach or could a simpler patch can fix the issue.
- how to address models with one big memory pool used (TI implementation)


Regards,
Arnaud
