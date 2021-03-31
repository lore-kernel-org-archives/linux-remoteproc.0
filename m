Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92A6C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 31 Mar 2021 07:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9186A619DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 31 Mar 2021 07:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234042AbhCaHbr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 31 Mar 2021 03:31:47 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:42716 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234211AbhCaHbg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 31 Mar 2021 03:31:36 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12V7QQ3L020854;
        Wed, 31 Mar 2021 09:31:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VQ1IfAzKcaF8aoBGfFcQIald1k/JOPDpqfP8TPZYx1c=;
 b=ApZP3RpxakmeywKr0rWxNXjcASZ2lcS292+sV6L735BMiq5OdqVvkrXjP5z7v0zTe6Lv
 eWc+qL37pDSrwBYGUkQN7bT+QeeYfFYSRCRggKxw8NGhCSW5csVZQsIE1DLnzS89AA/Q
 hOFXvcQmRIxW5SWpsqaz8EVPK9vj5PvgJZ/JHyfIC1GH9/BSnmMHwaCi8WmzlukCnzMe
 rzWTemrq2nxgz4L6lBW4p3eD8oitmMaG+4FhC7y/FlRNgNGNhsftFxAJzYsMF1hqh9k9
 4Z23owpHNgh+VpTjn0nGgRi/zsChcOvOqjM2J/zyUZzIQdj73vNMn6EJ6S1bcZQDZp5t qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37maa2jurh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Mar 2021 09:31:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE779100034;
        Wed, 31 Mar 2021 09:31:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BAE922321C;
        Wed, 31 Mar 2021 09:31:22 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar
 2021 09:31:21 +0200
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: stm32-rproc: add new
 mailbox channel for detach
To:     Rob Herring <robh@kernel.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>
References: <20210322092651.7381-1-arnaud.pouliquen@foss.st.com>
 <20210322092651.7381-2-arnaud.pouliquen@foss.st.com>
 <20210330144141.GA278273@robh.at.kernel.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <90f39f07-a9c0-73b9-ddad-e26b155d3b32@foss.st.com>
Date:   Wed, 31 Mar 2021 09:31:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330144141.GA278273@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-31_01:2021-03-30,2021-03-31 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 3/30/21 4:41 PM, Rob Herring wrote:
> On Mon, 22 Mar 2021 10:26:50 +0100, Arnaud Pouliquen wrote:
>> Add the "detach" mailbox item, that allows to define a mailbox to
>> send a IPCC signal to the remote processor on remoteproc detach action.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> update from V1:
>>
>> Fix indentation error reported by 'make dt_binding_check'.
>>
>> ---
>>  .../bindings/remoteproc/st,stm32-rproc.yaml           | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Thank Rob for the review
Since there is already a v3 that fixes the patch 2/2 , i will send a v4 to
include your reviewed-by

Regards,
Arnaud
