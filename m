Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D43A9D84
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Jun 2026 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780622254; cv=none; b=H5QWwtJUN6iem4OPwQde4pZcwo8lDAauDkHrJF09E2lZml20Li90bnIBk3DwhPBVohodEnguaqsnmgxBei5pGTG5nR4N5SeomFdimizeKYcTLTHhJ2dEOLAJLnq95Ny2zqWu6OyGGy4SdONsC6Tp4lA3oWbNPhS7j4PGISQ9qE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780622254; c=relaxed/simple;
	bh=FoTL2eK6Xjm2tOtBLk83ox/ORpi+04NDmEvp/2RHE4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B83tb76qpLctQFrucsnLeAnaN4EvmZDGsxzGmKg/i8ZBeRdyqlfgHl64YTrK+p4zyr8hcTxb2AbJdgmbPDvkqswi4OiPFO3nYjfa+vs3d3gZHj7yZyqJZO1A0DEd2XVUY6OkafjQLe1dKOWVioja1SAQOqMa6+W0rzKAGyy1qgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3xPGA2j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXoipIBI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3xPGA2j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXoipIBI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654KKUUB2701472
	for <linux-remoteproc@vger.kernel.org>; Fri, 5 Jun 2026 01:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	230bGQ92X8rqHZh77BzSKjoSqIWkALpxCZRvN5mt1fE=; b=A3xPGA2jn6rXtOLO
	vGC5NxQlWf+yCtsh3OMLKSG5KksP9at1mijZM5x6dUL6DoMoPEe49s6JxmB0zXIO
	0mUbj1S8ygnkrheDIFMHgt9558+F0VRIHrnZBNJiMNo/ox27tXg+WPXwHUbKsEOJ
	nTtiTerEbsys8jlO4tHXH68MMMQF9OEwYi+//WxX+7p3jzmzE9Pv6oNjIAZmhjkJ
	M4jtNQxmRrKYvVC5PTXp1tePlmR41nagezt8X6u5FKZzTxmEEo/+pvlnDDNvjCA0
	7w3r5Ubw9zyWURwHWqtBZswW2QvYjjy/GIR4HSa8ean9brqGL2lhoVzSrnEdEaQQ
	+bRT6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekgaj11vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 05 Jun 2026 01:17:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf55c3f44aso19330985ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2026 18:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780622245; x=1781227045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=230bGQ92X8rqHZh77BzSKjoSqIWkALpxCZRvN5mt1fE=;
        b=MXoipIBIQInp7UR93HQwIka5BcPiEAvm8Y0uIbacE348gvr6bYidEt3fvxOALO5bEm
         32f0Nzz4d7OtD1Q8rSEa/FMrjaeYnRt1ukFahW9nKDntK8CpdzwKApJYwHxDAx1VK7WC
         FVqrZuywZ885+j/KG0BUEFEzyN88aalc54YnXIxDydZm4yRYTpYZXBK8Cv2fxMdZvwzS
         Do/82C5gpEriFIxSKnvtvIyorl195a4Kgqxdy6M6j4c+ME1nyKPiFeLBKdks+IrdXfYK
         4QfqzWZxOhC1/5gY1oVpaWYhW4mCVwafSpSci+EMkREWCDPrUc8lDHM/EwN7FKwZepWt
         DGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780622245; x=1781227045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=230bGQ92X8rqHZh77BzSKjoSqIWkALpxCZRvN5mt1fE=;
        b=N71S36Z84VBV8W/ORD9Fr1AEogBRFGq6l+hd38Tr32CSXflFqZ+3zmP9SEAtJmF+sQ
         lsXlxDxiOtUFSJmqfsy3226nTLzNrSjEXaPpWztlSbCnAlwpRzrnCWAzLIlw+e67i5PM
         tpZX0UiBZJ3qqyg2VqPRhvDOV/1S6qYuRofTf8WAqosy4qmPyC+BBSPHQlGFFOiLXEmx
         xF+4Op8fDBKJXhYEW1X79TexoEQKmp2Kz0Kjw2mXx5dpcE3+OiQYsgwkgDbUkyxC/o41
         4rBdjjzGte02ciSHau8oyOGqEfH1RuzdfMiJCCVljiscwpFmqOms4CD3qlWWXBgwjqL1
         6lew==
X-Forwarded-Encrypted: i=1; AFNElJ8D+cI0NgapWfqgiwIsi/YSG0D7CzCCMzxM68+q3/eb5cr32qtTt/WuvjY0Y0bXzgHAVomM7bfBWfmc43h1jWvM@vger.kernel.org
X-Gm-Message-State: AOJu0YwTB2IF+5OPIXkH0CQAcdh3pdLj5+vZN99is2xhTQpVog0fZSPO
	CGhDJIsPEPSsv88flAO6yneEKEhvgRb7n8JzJFNZFwwYaW/1LG7A7mA5IC8+FwmevyFGURGOSWd
	sAbF+gvBk37rDphCsvgX75DJz9BaOasvIxgvHUkjV/hMGLu4PcbyfuJ4wtm8CgoT6kSNL3Y80
X-Gm-Gg: Acq92OHy1t/dN/gr2Unl2f71CRiYJJXBM6tdPHXOCNCwA7T6AN85o14GA+uTPRZaV2U
	niZwphdyCD2ApC9Y3BHqH/BIh0tEG28dTfajjT0vfKfWJqmFlhYOVosdqsd5O58ouaaRmZ3Fx3Y
	l6dSLg39kY2CVqp8OSEPLnHqgGC/aFLVygY5G5eVpcGHFxXTrwIVfrnbs5uk9e+6VMe2Jm35/AM
	twIj73UTrNT+/z2DmNkyqkxG1bb9EbGNjPHVVLhDhp2P4bVHoIcAifSbDe6L7JD2EGV8K7ITIMa
	OS08beU9KclsypDfkjCnyNep4GRXB2JQiLsW+qyINATOuy1Zy8M6xts1tYQUGxA4VNKVVAljUju
	I/XcAomUTdOBnbEoOIvHQ8L/gV/pwCh5cZrMNknbD0MlDEb5qvS6X7K2yQ+MhOsO617Zm65oCDf
	DPknjp4XBWot64VNFpKUwm
X-Received: by 2002:a17:903:acf:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c1ec54c8f2mr4016785ad.1.1780622244801;
        Thu, 04 Jun 2026 18:17:24 -0700 (PDT)
X-Received: by 2002:a17:903:acf:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c1ec54c8f2mr4016485ad.1.1780622244342;
        Thu, 04 Jun 2026 18:17:24 -0700 (PDT)
Received: from [10.133.33.77] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ab01sm68952155ad.71.2026.06.04.18.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 18:17:24 -0700 (PDT)
Message-ID: <3896c47d-41c0-4b61-a115-c5d6ea282fa5@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 09:17:19 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: fix deadlock in endpoint destroy during
 driver detach
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAxMCBTYWx0ZWRfX6cyJnnBArN5G
 xi+uKRhmuY30MdRKet2nql8T4C21g9G6PoOyDTvQktO0dT7/C9LjN0cdhbnapFeq9gp1j0zDCQt
 es0mVztIC8x/g1+p5sFAbsnc3vurNbxAy0cihPCaxVs0SEjBqvmg5iQWV/CC4kQE89Qg3TyNf+5
 4dm8Vfes5sFB+2esKDCVE5cy9usMaf7C9z1ecKC9VjDsdwTiKJ17NZQxKu2eJJtPMUM6wounwLW
 GLHffYBkt1uaPU5iVdGqh4CxbyAidLvzoGOuvUvlMtcyk7ItfXDxRZ/pu70xw8bOc6ZIiowETEw
 lkbfSFv6e7Waqqm4mIEbDrz005tVIgZgcuu7TmowFvVtn8HmNxVFHCFxOH6eEaDkwGln7Aap5VO
 5Nb7DzzCNzXBXT2Y/PAiAmFOVLFQHqO+Ibt0d3swF7tBZzhXb0plXDfebizeItdp8iBK9M7Fz7R
 xbsKhcyMnLDgMrU5PoA==
X-Proofpoint-ORIG-GUID: IyGZn5fZ6aQpdXbU1LzSlQD4K06FuXNq
X-Authority-Analysis: v=2.4 cv=P4AKQCAu c=1 sm=1 tr=0 ts=6a2223a5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xBbfoKGClFlJqF7rv9oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: IyGZn5fZ6aQpdXbU1LzSlQD4K06FuXNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050010



On 6/4/2026 4:42 PM, Vishnu Santhosh wrote:
> During driver detach, the device core holds the device mutex throughout
> the driver's remove callback chain.  When the rpmsg endpoint is
> destroyed as part of that teardown, the GLINK endpoint destroy
> implementation attempts to unregister the underlying rpmsg device.
> That unregistration calls device_del(), which tries to re-acquire the
> same device mutex already held higher up the stack, causing rmmod to
> hang indefinitely.
> 
> The deadlock manifests with the following call chain:
> 
> [<0>] device_del+0x44/0x414  <- tries to acquire same mutex
> [<0>] device_unregister+0x18/0x34
> [<0>] rpmsg_unregister_device+0x28/0x4c
> [<0>] qcom_glink_remove_rpmsg_device+0x70/0xc0
> [<0>] qcom_glink_destroy_ept+0x58/0xbc
> [<0>] rpmsg_dev_remove+0x50/0x60
> [<0>] device_remove+0x4c/0x80
> [<0>] device_release_driver_internal+0x1cc/0x228  <- acquires device mutex
> [<0>] driver_detach+0x4c/0x98
> [<0>] bus_remove_driver+0x6c/0xbc
> [<0>] driver_unregister+0x30/0x60
> [<0>] unregister_rpmsg_driver+0x10/0x1c
> [<0>] fastrpc_exit+0x28/0x38 [fastrpc]
> [<0>] __arm64_sys_delete_module+0x1b8/0x294
> [<0>] invoke_syscall+0x48/0x10c
> [<0>] el0_svc_common.constprop.0+0xc0/0xe0
> [<0>] do_el0_svc+0x1c/0x28
> [<0>] el0_svc+0x34/0x108
> [<0>] el0t_64_sync_handler+0xa0/0xe4
> [<0>] el0t_64_sync+0x198/0x19c
> 
> The rpmsg device unregistration inside endpoint destroy is redundant.
> In both contexts where endpoint destruction is triggered:
> 
> - Driver detach path: the driver core already tears down the rpmsg
>    device.
> 
> - Channel close path: the rpmsg device is already unregistered before
>    endpoint destruction is reached.
> 
> Remove the redundant unregistration to fix the deadlock.
> 

Fixes: a53e356df548 ("rpmsg: glink: fix rpmsg device leak")

Thanks,
Jie

> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>   drivers/rpmsg/qcom_glink_native.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 401a4ece0c9777398837d4427746fae0a5003e88..ab7ff3d2f56bf797592fc4227ce5b730bce72226 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1418,9 +1418,6 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>   	channel->ept.cb = NULL;
>   	spin_unlock_irqrestore(&channel->recv_lock, flags);
>   
> -	/* Decouple the potential rpdev from the channel */
> -	qcom_glink_remove_rpmsg_device(glink, channel);
> -
>   	qcom_glink_send_close_req(glink, channel);
>   }
>   
> 
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260416-rpmsg-glink-fix-deadlock-destroy-ept-5cc7aac522a0
> 
> Best regards,

