Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90A8C6FA89
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Sep 2022 14:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiIOO3v (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Sep 2022 10:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbiIOO3t (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Sep 2022 10:29:49 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918402A737;
        Thu, 15 Sep 2022 07:29:45 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FEDPfa000440;
        Thu, 15 Sep 2022 14:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mfAVznhenN+fUjO2ERSmVwM0wPbw7UcNfLXipqpYnnY=;
 b=ciSThUvlpumLnMt6Kgh+gBmaaZFOWDptosuEsxpStd0RU/KdH52nSMWDX3Y2tKbXt3E6
 UXSMW8/KhlohKXXW8DEKqgmXZSTip9Jvrjl2drgNS/aZReYeUAWJvnpIafXX101dz0bK
 YcnEvIxLtxoRPq/9UuBICYIE8hl4f4QgFf7eQMuvxO3UllE3oPWCygL1MqGCd9+GZJey
 r6NV7xVFB09SN9XeujmIs8RsV/Su0Drcev3Nv743XgZrgxfd4t+J6CSFQmOlCmR1rXW7
 8wOBSzqKlsYPHNF53wbbb5i5LJb45K06MIoylVnE9nOBlnwknqGPm+3v1Npt7y4yeOO/ XA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjy0gn80t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Sep 2022 14:29:29 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28FEOSgg013591
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Sep 2022 14:24:28 GMT
Received: from [10.216.25.163] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 15 Sep
 2022 07:24:26 -0700
Message-ID: <73159947-55a5-7de8-bc26-a5beb62de741@quicinc.com>
Date:   Thu, 15 Sep 2022 19:54:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] remoteproc: harden rproc_handle_vdev() against integer
 overflow
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Bjorn Andersson <andersson@kernel.org>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        <linux-remoteproc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <YyMyoPoGOJUcEpZT@kili>
From:   Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <YyMyoPoGOJUcEpZT@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0cTZe27wgpq2eviM0KYF30R03aoRDUtM
X-Proofpoint-GUID: 0cTZe27wgpq2eviM0KYF30R03aoRDUtM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_08,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209150084
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On 9/15/2022 7:41 PM, Dan Carpenter wrote:
> The struct_size() macro protects against integer overflows but adding
> "+ rsc->config_len" introduces the risk of integer overflows again.
> Use size_add() to be safe.
> 
> Fixes: c87846571587 ("remoteproc: use struct_size() helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/remoteproc/remoteproc_core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e5279ed9a8d7..4fc5ce2187ac 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -520,12 +520,13 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>   	struct fw_rsc_vdev *rsc = ptr;
>   	struct device *dev = &rproc->dev;
>   	struct rproc_vdev *rvdev;
> +	size_t rsc_size;
>   	int i, ret;
>   	char name[16];
>   
>   	/* make sure resource isn't truncated */
> -	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> -			avail) {
> +	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> +	if (size_add(rsc_size, rsc->config_len) > avail) {
>   		dev_err(dev, "vdev rsc is truncated\n");
>   		return -EINVAL;

Looks Good.

Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh

>   	}
