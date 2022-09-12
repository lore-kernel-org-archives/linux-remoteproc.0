Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F464ECAAD5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Sep 2022 06:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiILGtU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Sep 2022 02:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiILGtT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Sep 2022 02:49:19 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266B518B0E
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 23:49:18 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C68PYN007516;
        Mon, 12 Sep 2022 06:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZxrsJXMEp0037xwdNe7V+xPXewdvg+9RYD9fwyrK20o=;
 b=dxUv3mbrNXej0h08Ap5TraRekIwXXovdl062kY3vio9qH3cXtzAzFp6jyrTCagA3xBO/
 No0UWM7zB0BEfthsWbArzZPd5C8li93QD8p2CG+B3dKlEMJZVjcFxmEi4fzBN4NtStGr
 7NyhgWs++i1ZZIBTWUthJ6CxHQH1DVSe26OENvY85Hu2jl7ytpgcVusii0YNzHG/B3Qg
 oXUDPhqFlxK6UNDeN9KbkaSXgV++CvqwPOYJFiRoN1kBoxkmwbxNbYTSDo9vttugdg9T
 OwSQfWHVrAx1jSWBEbZ2M2lOQ1mnw5fs+aLtH8EE8OHQ9aObu6vD8eu3Hj8xfqRSFmld lw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgkrsuc0r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Sep 2022 06:49:05 +0000
Received: from nasanex01c.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28C6htfO023197
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Sep 2022 06:43:55 GMT
Received: from [10.216.17.239] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 11 Sep
 2022 23:43:52 -0700
Message-ID: <e30a0c0f-8a26-ccc5-b98b-c804c8876b76@quicinc.com>
Date:   Mon, 12 Sep 2022 12:13:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] remoteproc: qcom: wcnss: remove unused qcom_iris_driver
 declaration
Content-Language: en-US
To:     Gaosheng Cui <cuigaosheng1@huawei.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@somainline.org>,
        <mathieu.poirier@linaro.org>, <bjorn.andersson@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>
References: <20220911090637.3208939-1-cuigaosheng1@huawei.com>
From:   Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20220911090637.3208939-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: unj2xIPeXa_ZDLcKj7u_xozVOyfObMbl
X-Proofpoint-ORIG-GUID: unj2xIPeXa_ZDLcKj7u_xozVOyfObMbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 clxscore=1011 phishscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120021
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On 9/11/2022 2:36 PM, Gaosheng Cui wrote:
> qcom_iris_driver has been removed since
> commit 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race
> with iris probe"), so remove it.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   drivers/remoteproc/qcom_wcnss.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.h b/drivers/remoteproc/qcom_wcnss.h
> index 6d01ee6afa7f..cb4ce543e68f 100644
> --- a/drivers/remoteproc/qcom_wcnss.h
> +++ b/drivers/remoteproc/qcom_wcnss.h
> @@ -5,8 +5,6 @@
>   struct qcom_iris;
>   struct qcom_wcnss;
>   
> -extern struct platform_driver qcom_iris_driver;
> -

LGTM.
Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>


-Mukesh

>   struct wcnss_vreg_info {
>   	const char * const name;
>   	int min_voltage;
