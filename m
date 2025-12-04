Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673C2307AF7
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Dec 2025 06:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764831224; cv=none; b=UfQk6lKlZyT7+mLaykmL4TTU3VoDWRqnelKBSkhGX6A5ZwjGyHpDxDJbjtaIm6v0p/2OAGPFcGUnpRxi51a5YsgI82386vPDlWj+GGM3i8M00ns6UaKZLfE6sDl0G5KgVKLx0+mOeEEd6Kn/jQ9ZO1g6dYaB4lplMiiCc2W/iBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764831224; c=relaxed/simple;
	bh=iRsKvS0taesuyzHMZO1l8YDqIKXGdnxBtJHOVfF04+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LL5KwWnOAZIlssNXm6ttamAXVLSvZr9GOUlVpIVMumTji0nHz/oeNZA7XAAqwTNAQfj0eQfKBoJnQNjwzeM4fOvWmZWA35LC4ZuWoj2SiuX1dXiqPLQVqCRb7vB/XFu+95Jn9zTSncBVQvNXAwj+g4ArbrpAqVMfQuUzzVvf38Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTRPPFUP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeWYsFfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTRPPFUP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeWYsFfJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468ik3599117
	for <linux-remoteproc@vger.kernel.org>; Thu, 4 Dec 2025 06:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ucSSWDGOESlupOfB5eXVEN6dWxDPLJeS7ztTf3LNjLA=; b=pTRPPFUPDF2PQDkI
	hOX6aFeKu87FZx7j3XXRYvT3plRhIh1KD+1e4v5JvWeO+T0JU5CuFz5QRH+nFAtz
	7LF/VuFyvUE+LdGUbUm7AX5j+OfVtQI0qK4HGjS2V66eSK2U671hNa6RzhHtsHU0
	S6LNnuMd89L5Wg/ftZJItD4XLJ8EEVgkHWkicuxiQ4988drW8fZVgy/gzFU6Vx6c
	Bt2CRDsvLRyK9xXJylrkRF6HO2W0YxbyXpIz1KBc+CPOYP+PoCIB0EvxK/MRTmZ6
	UvhgrmGG3KuOnnU/nubH50GVDZZ0bsLYJiRREdhBCOudR9gdhKCn8Yi+EP+lYVJh
	oIAMXQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f00nen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 04 Dec 2025 06:53:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dfae179bso13526775ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 22:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764831220; x=1765436020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ucSSWDGOESlupOfB5eXVEN6dWxDPLJeS7ztTf3LNjLA=;
        b=aeWYsFfJF2LqS6pLdBCKrRBLyFeqo86dv7sBrHS5lzAO/6rKkQBwYpLGukyaofRXXR
         6/FHNs6GC5dlzeGlx+Ioy9kWASaqZE9C9mCar8x02LaS1MMV//yu5A8rAdd1L0NPLhX+
         r7LJXWxUhMQ82jJRrXSWTNjYgbsvCzqvBakjOZHOlCcE6Xrq997LQks67LMtf6yt+nDj
         YCDWzGGU743nLgn+Jr017Gmm74M6wStsC2EhXsKmIYu5BRJaYvHTgSLq+SsXYbnqw4wb
         ayPVy2HI+UJDnQDsVySG49ZXd/gJZl7rgOQVZEtQebZHjKrc9NnlSFVzn1nxmXMe16mx
         hHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764831220; x=1765436020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucSSWDGOESlupOfB5eXVEN6dWxDPLJeS7ztTf3LNjLA=;
        b=WVxp6Krr+sn+lRGa8SD6QYNJUWFWI3XXILXbmzyHJAiw74hvqj3Oy50xHhKZIwgd69
         g1XU+Uz5z/zJMZ4+LBKu02XRH7ojPgn326v9I3k5rhiSHrB+HF1zPcp99xXnNA8k1AaE
         +4rznOYy6ZBvtAl3U7wn6BiVznsNvu3oM7dg7vMYlv6jyjMe7TAL+frS545Z8ytvV+qc
         4Ngk+V0xg+AQciogkxZcqLtSDdflOUgy8WlLFSZHLEClFAUcJy6bphckaGUGOwjUGY63
         5r75WTStOPmr+BY/v1JIGW2yFPkA6cx+r/3jbWFTz0oPCOsftx0/T7Nh6n2A2GgWdPe3
         yCsg==
X-Forwarded-Encrypted: i=1; AJvYcCXs0AL60FW4Ey2xUc2arrxUP+upAcwobWpAtTe8joJANcRjiDvflelm8Yn632AcUDVCYQ69wxKg/K9gGCJHa0aX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzma88jwxO3eI1/CeLUVYzQJy0MZjxlxLAG5asTn9pzbXmLLWoR
	2q6oY1b6VWS7GjRWWJ6e9dXvlE/+PBH5R27sd9prki0qFLtBquWw58d5D6Uhsw3A8IPPXG0uQUp
	39/r2dg3Psrp8y6gTlvevpwwLtU/INdnf0R+raVgQkK/3BlW2vfn3k0kVP0Vaseh3P2J9oL1k
X-Gm-Gg: ASbGnctGCSfUNG8aFZhT2c+5f5Zl3BF3Pgqk0ANXOsSJwwUdzEbM6/lT5gLDsUhPxKh
	KS6Yl4gVMw2+HbavN76ezzDAVTUaY8haJtaQoPX09NviM+xy84UAkAWFqRAjmzN8bK3qTFrCDvK
	uwp/b3+RU3V7Fvh9Uw/JR/pmIea8fQv+tFuVHpzvXW06UnVxHrSs/bo2dNciNMM3NSZAuO9SU1M
	wTVwdEBVgCJlip9HhumJrYTemtNw6GIn97hFYhY4p7YxcI2tq47ME0Gd94CPLuKYhC9laxnky2c
	LHuXgcNxQBLAhP2xCwARXkyAW/T+BIYLh+YYZ8a4qyg1Lqo4+IGFkiL7FcHD8mepFyVro4lM7w6
	K+OkodqaaWIcmAXVeNAXT9yqxnnGqHP08Z4Pqdd1dxmJBdTKo73XEgmmzDwbzFfGRITJaibaHRF
	6eLD/rPg==
X-Received: by 2002:a17:903:3a8b:b0:295:8db9:305f with SMTP id d9443c01a7336-29d68419b82mr52910925ad.34.1764831219949;
        Wed, 03 Dec 2025 22:53:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbL/eTbvwB5Khd4hHbTjXSp2o/yeO9bxCBcuMJpO+29BPviiawxUY7fS89EvAPZOinnfrawQ==
X-Received: by 2002:a17:903:3a8b:b0:295:8db9:305f with SMTP id d9443c01a7336-29d68419b82mr52910655ad.34.1764831219401;
        Wed, 03 Dec 2025 22:53:39 -0800 (PST)
Received: from [10.133.33.183] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49cbdfsm9121225ad.1.2025.12.03.22.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 22:53:39 -0800 (PST)
Message-ID: <70c1d755-8ac3-4c3a-bbd8-5dfafd32059d@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:53:35 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: Stefan Roese <stefan.roese@mailbox.org>, linux-remoteproc@vger.kernel.org
Cc: Tanmay Shah <tanmay.shah@amd.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        zhongqiu.han@oss.qualcomm.com
References: <20251203135057.140349-1-stefan.roese@mailbox.org>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251203135057.140349-1-stefan.roese@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: daFxZ-sSfjMkCADaWoflJmTXiqQWCqKH
X-Proofpoint-ORIG-GUID: daFxZ-sSfjMkCADaWoflJmTXiqQWCqKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1NCBTYWx0ZWRfX1S+v4ATvpoI3
 eEXAcfjaK3OBX9PuNboYAgBWgbs42gEGd1oMpHJq11Grwrcf7hMUwzoEgbL4EakrQAjNzLxUnOI
 RI05mi0Y+8ZTBQrqMTm0xj/jJ+YPjE8lz8Zu19ICy1EVLqqb/PKexO4xQu6zNSrmFLu2m58l/S8
 5dxEwHG/yrhOSMY134PgfyKy8oKiVQULplvhLEZ/gOQfV0mIsGrGLe9bUJWY6lGzTHjHHJbRySG
 GH+5Qwl4FkClqukfAI81LUzDXnL34hQQf4Gh+QV0Qe1V1zSEiaeVz1Rp0SwzURi7c/okOaKKRVY
 sz3WLfM1exYxU05EZPVLFMrFC/kD0me+U4+gz6EUy2qk+hRPYs3lhmKynFjuKPRB9AmT2L1qKHT
 4njfx3aes4f7ksg16GyifgbbOJcq9w==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69312ff4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=b3CbU_ItAAAA:8 a=zd2uoN0lAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-B8Z16WdgnbfsTl0cLIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040054

On 12/3/2025 9:50 PM, Stefan Roese wrote:
> Testing on our ZynqMP platform has shown, that some R5 messages might
> get dropped under high CPU load. This patch creates a new high-prio
> workqueue which is now used instead of the default system workqueue.
> With this change we don't experience these message drops any more.
> 
> Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
> Cc: Tanmay Shah <tanmay.shah@amd.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
> v2:
> - Also call destroy_workqueue() in zynqmp_r5_cluster_exit() (suggested by Zhongqiu Han)
> - Correct call seq to avoid UAF (suggested by Zhongqiu Han)
> 
>   drivers/remoteproc/xlnx_r5_remoteproc.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index feca6de68da28..42c8884bc760f 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -16,6 +16,7 @@
>   #include <linux/of_reserved_mem.h>
>   #include <linux/platform_device.h>
>   #include <linux/remoteproc.h>
> +#include <linux/workqueue.h>
>   
>   #include "remoteproc_internal.h"
>   
> @@ -116,6 +117,7 @@ struct zynqmp_r5_cluster {
>   	enum  zynqmp_r5_cluster_mode mode;
>   	int core_count;
>   	struct zynqmp_r5_core **r5_cores;
> +	struct workqueue_struct *workqueue;
>   };
>   
>   /**
> @@ -174,10 +176,18 @@ static void handle_event_notified(struct work_struct *work)
>   static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>   {
>   	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> +	struct zynqmp_r5_cluster *cluster;
>   	struct mbox_info *ipi;
> +	struct device *dev;
>   	size_t len;
>   
>   	ipi = container_of(cl, struct mbox_info, mbox_cl);
> +	dev = ipi->r5_core->dev;
> +	cluster = dev_get_drvdata(dev->parent);
> +	if (!cluster) {
> +		dev_err(dev->parent, "Invalid driver data\n");
> +		return;
> +	}
>   
>   	/* copy data from ipi buffer to r5_core */
>   	ipi_msg = (struct zynqmp_ipi_message *)msg;
> @@ -195,7 +205,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>   	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>   		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>   
> -	schedule_work(&ipi->mbox_work);
> +	queue_work(cluster->workqueue, &ipi->mbox_work);
>   }
>   
>   /**
> @@ -1162,6 +1172,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>   	}
>   
>   	kfree(cluster->r5_cores);
> +	destroy_workqueue(cluster->workqueue);

Hi Stefan,
Thanks for your patchset v2.

https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/remoteproc/xlnx_r5_remoteproc.c?h=rproc-next

static void zynqmp_r5_cluster_exit(void *data)
{
	struct platform_device *pdev = data;
	struct zynqmp_r5_cluster *cluster;
	struct zynqmp_r5_core *r5_core;
	int i;

	cluster = platform_get_drvdata(pdev);
	if (!cluster)
		return;

	for (i = 0; i < cluster->core_count; i++) {
		r5_core = cluster->r5_cores[i];
		zynqmp_r5_free_mbox(r5_core->ipi);  <--------freeing ipi
		iounmap(r5_core->rsc_tbl_va);
		of_reserved_mem_device_release(r5_core->dev);
		put_device(r5_core->dev);
		rproc_del(r5_core->rproc);
		rproc_free(r5_core->rproc);
	}

	kfree(cluster->r5_cores);
	kfree(cluster);
	platform_set_drvdata(pdev, NULL);
}


Please consider calling cancel_work_sync before freeing ipi to avoid
potential UAF.


>   	kfree(cluster);
>   	platform_set_drvdata(pdev, NULL);
>   }
> @@ -1194,11 +1205,20 @@ static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	cluster->workqueue = alloc_workqueue(dev_name(dev),
> +					     WQ_UNBOUND | WQ_HIGHPRI, 0);
> +	if (!cluster->workqueue) {
> +		dev_err_probe(dev, -ENOMEM, "cannot create workqueue\n");
> +		kfree(cluster);
> +		return -ENOMEM;
> +	}
> +
>   	/* wire in so each core can be cleaned up at driver remove */
>   	platform_set_drvdata(pdev, cluster);
>   
>   	ret = zynqmp_r5_cluster_init(cluster);
>   	if (ret) {
> +		destroy_workqueue(cluster->workqueue);
>   		kfree(cluster);
>   		platform_set_drvdata(pdev, NULL);
>   		dev_err_probe(dev, ret, "Invalid r5f subsystem device tree\n");


-- 
Thx and BRs,
Zhongqiu Han
