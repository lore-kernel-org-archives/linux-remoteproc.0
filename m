Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E27134CF
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764314712; cv=none; b=qz5kqXCkHwK1TTjFm3KmZDhi4LulrFODXco/QLdq3oiTl4uWQrXBX7sDCxIZjvHHeT42cnhxeNFnCKqjWcZeJ5KKzrnymdX1jZ+X9mOHPsmwrsaN3sKp84bur/nFi6j6Jx1Oz9Gg6B9dr7JRzs0ghKfjpEpNtW1MvdtBpjKkz08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764314712; c=relaxed/simple;
	bh=kIZXvin9cnnh0pojhdAk9Teh5TQjteUocSpZeeYhLcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drfVq9swAxi0FN5oMUQtyiQU6jytKN3Ep1CCnxeaaeyPvdmB8vFhdxnc4H8knVZYR/CYq8+5guzo3g+HK716MLLd49gQs66N/NQkF34OtZ9btlJpChfjINMQAirH/iBtzH2Ho5OkYV2ysr6WZOGWdR8ig21hmsQzz5ZuOHnxZpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vypn+m5V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMAvKIkn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vypn+m5V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMAvKIkn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARNXGYC2306198
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 07:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tTKAUyyvbf9EgTRzxnW+Rf1YwWktnacgxL9Sy4qepZ0=; b=Vypn+m5Vz1oC7MBy
	H1PJzJXN5PklJtJUOdAjJfcyAXAmGsKyLkSsRAPQ66ICZ/37cmSYLlMqW6HyTk+u
	OBP99NQR6uZ8573k26MdU7sKKMG2WeFFPJu8hfLp1XqNDONabGd7YBdvH3JDN8y+
	m2hziJkylLzkTjlVpvoGzISPFF87e15zlGf45JjVq4AO73JeYgCskE/t3eCE1U4U
	BTcy4rJFfrLA3GR5kTmF3vNktbib/sEazgL/HvfV0d8mME7Gc5a28PruQ2OgAsyZ
	O9hb1Ycj2UWX9Sc94e83/gL14CEHCzSUZ9Cc/3gyTxNvN5g8dWwtJY8VWHyIv/Ia
	dQMzng==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apq66j20k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 07:25:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c7957d978aso1479324b3a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 23:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764314708; x=1764919508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tTKAUyyvbf9EgTRzxnW+Rf1YwWktnacgxL9Sy4qepZ0=;
        b=TMAvKIknQrYrSVXp3YmNACcUUmNxb5UdMQRLiGwx5SblIQSAiIbBmQSZEm7MaMrKN+
         iAGrGFJUsqXbyw++YUOPPcgHjPsgOAgoepxk2gxkkIgToIx/c3XKLTr+55pKk9xG+UFs
         v/8cYwozj6XeUDBRi4YfoBEgTM9TUDzm5IKueufG9TQRqd5M5WhzNRtGMbM4Yn/TvX74
         1Pa6dztLKMStdsCzz1/kvLGfxnsiENfkXYRAPV0wxdjeP4GUO9YapQkaOha0RYJihlTY
         abXqB47DRIaUmxmPle43a/pAvyCepsuE7O5det0SSvAGLXhzg8inCVD/TLc5+99X0VQp
         c3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764314708; x=1764919508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTKAUyyvbf9EgTRzxnW+Rf1YwWktnacgxL9Sy4qepZ0=;
        b=BjNmW0UwLtkTwajWUG0nCZ1vNTrPJGDSBpwEoSNe/+4FALrQnD61ukTQPXs2BZcp/+
         xXaa+wXTtoS/gcYgj6xRlguY3pCWHC8A3/DYsrRMxiJEIgVlJJ81YuIVn13noaDDhA0V
         q0blMv8MfLhnJJSuVC9S3ONkLS/lnKbqC1idhU8CzuKstc7G8RzZ12Ww5mjBxsPMldna
         0VA1UKyXBUIwiFWhOPjRhrUuQYOqEc/PpfP7uJ64AzAqja9YlsIVON7N4FSD/wIooDik
         CdN0QjPiZXJ+WsTWDmh78PbammAeucOyoYRqWTHfZKGebyWxvKI+mWqdwlznVKjBs0AO
         yCrw==
X-Forwarded-Encrypted: i=1; AJvYcCVNVdkPTZN6uPXkGn+q4Fvsoo8uIr1GPNdvzpSrhJUxNv6Xn8TS7rctKRgSK4QdQmIsYNtnxLgEzJbmwlZmvcjE@vger.kernel.org
X-Gm-Message-State: AOJu0YyBMYFytiz7vLlkfpP2X9lJ7SFFu4UWCBbOe6gWRCgVXZ17gWgs
	WWsMHU+M+zOVmh4jO6npUrquhvwzabJ7u64zfnLCitX2xyuYVfiwpSXVHaJv0Vn11QrkwRTTt8Q
	BXG04xyuAFpbGhGUuqy8jxiX7ZFKOIiB0Pz1VEADNtnf2Sr80X7OG1doKb+cWsoYYGn+ESESH
X-Gm-Gg: ASbGnctVyZnIO/htKEg4T6tQyBET0haI8SX7FaQCHp/5AeyjNx+UNBioV6f87KnFOlS
	IDanMSwtBIwNmpz8l5Zwc2PjzXPS3QoyC8pDVaHQTOq+HyN0tHFx+Q1ZuFLXXrB6g3Y5G+bob7a
	PuXo44mZ/Xl/mn5q3dvIOnJlm40vyQwB5WFkt3vRfJfU4r8Iq679fm1OH4UoZpXRjngNq/2Wq19
	YkbD3l/VJvbTwQkw61bVQ/fJxemwoftZGk/ztMs5sCxHv2s4qCfW6GcfIlWWpokXAxEWCEmvjzO
	p9jgumsUvryhlMDDuIOwqSYNhiF1CDq5BhFaardxosOaK5Co7cIWmnTI9KXvSSik4mUOY3UNX4U
	YYdHS85Ef9FhVsllWn4J2b805bZY/LTW0G45DsNEFiHzY2HfdpXsa6ifbmFr9RoQ3Xqd80J9/oO
	tTRKNH
X-Received: by 2002:a05:6a20:914d:b0:35d:3b70:7629 with SMTP id adf61e73a8af0-36150e5fe3bmr27895428637.18.1764314708461;
        Thu, 27 Nov 2025 23:25:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpKEWI8QM/XS7iNTHezZm0qAuETBg/iHpl+6S5dWqWcnJ6BR8CTXV3BxUXE86sgK4CWjxu8Q==
X-Received: by 2002:a05:6a20:914d:b0:35d:3b70:7629 with SMTP id adf61e73a8af0-36150e5fe3bmr27895406637.18.1764314707982;
        Thu, 27 Nov 2025 23:25:07 -0800 (PST)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fbb00bd1sm3791321a12.11.2025.11.27.23.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 23:25:07 -0800 (PST)
Message-ID: <2db4a957-4291-466c-bdb7-cee5c03a353b@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 15:25:03 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: Stefan Roese <stefan.roese@mailbox.org>, linux-remoteproc@vger.kernel.org
Cc: Tanmay Shah <tanmay.shah@amd.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, zhongqiu.han@oss.qualcomm.com
References: <20251127130712.1190765-1-stefan.roese@mailbox.org>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251127130712.1190765-1-stefan.roese@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ggi29GVVrtMv-DiFPsIIZiPRN7zJZjl4
X-Proofpoint-ORIG-GUID: ggi29GVVrtMv-DiFPsIIZiPRN7zJZjl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA1MiBTYWx0ZWRfX+TYol/ecNrYS
 gTWFFYjlrkkDPTM81D/NeUK8kiBipFic+sDUI2pfvdv9x4jQFgskiRfh2Fu+IdaekT7RZXRT+23
 PAiJR+b3007QqqDMUvuYJB6vF+9h8JLbiNe/KxrWQMrLGYtAmNkIgpE+fO5XgyzNgV6+1AM7+Ck
 AePQLx1A/CrZDqiPcyx9PTj1ziscBwTEYsO5BzE5bWF0KQQFqIxmeIC5I0oB0ABlYpiGCwTkBuu
 uKcSCk9aamW/me8knnlpZcrIGVX/hkcoXlgF+XYJz08vIhjpz9T5R3OMgZ2SJR05PVCvo/HRxdv
 0CKecf1MPYZvNXPsRcR6nJeIlCryFk0pfwQiVJzGQf3loJCZFkxvmLXuBB4g5Jfap23HtlLR5pv
 xv05JeFfwUJPCnMkpG5d7aGbYlsyUA==
X-Authority-Analysis: v=2.4 cv=BYHVE7t2 c=1 sm=1 tr=0 ts=69294e55 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=zd2uoN0lAAAA:8 a=KKAkSRfTAAAA:8
 a=bSi6YAuuKXwpVA5jqiIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=Rv2g8BkzVjQTVhhssdqe:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280052

On 11/27/2025 9:07 PM, Stefan Roese wrote:
> Testing on our ZynqMP platform has shown, that some R5 messages might
> get dropped under high CPU load. This patch creates a new high-prio
> workqueue which is now used instead of the default system workqueue.
> With this change we don't experience these message drops any more.
> 
> Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
> Cc: Tanmay Shah <tanmay.shah@amd.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   drivers/remoteproc/xlnx_r5_remoteproc.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index feca6de68da28..459373901c973 100644
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
> @@ -1194,12 +1204,21 @@ static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	cluster->workqueue = alloc_workqueue(dev_name(dev),

Hi Stefan,

destroy_workqueue() should also be invoked in zynqmp_r5_cluster_exit() 
to prevent resource leaks, right?


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
>   		kfree(cluster);
> +		destroy_workqueue(cluster->workqueue);

Please adjust the call seq to avoid UAF.

>   		platform_set_drvdata(pdev, NULL);
>   		dev_err_probe(dev, ret, "Invalid r5f subsystem device tree\n");
>   		return ret;


-- 
Thx and BRs,
Zhongqiu Han
