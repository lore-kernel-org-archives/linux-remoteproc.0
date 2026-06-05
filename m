Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8ABEACD
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Jun 2026 04:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780633233; cv=none; b=RhfOktpQ2rmuj6NAcc5fkto4gg/VU0rQvEQgGfpQ/IpiUw3GAMTYUiKMID6rbObKliJOA/XFexNp/ie0SMPdbm7TIHhxjQdHKGrzw3vW6w8o4H8pGZ8vPfDdh+lvDD4dWc/vubPFA5Zn5YsbFl12TsZ8ewbF1QUHOGe7Eu3e5fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780633233; c=relaxed/simple;
	bh=/1G8Cw1Xjst/4UP/6F2jifftweRUSpOdTYJLuJxQHt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDi4Z6hiwuFMSLDDdXOjPk06D5x2yvELG9Dsq4QsPzwhL0jmhkxuqWajcg9KdF5SyhnSO52VXMZyDKgKXEqajGfTeacAnWAK41AkNQBhFEKd8xke9Nhmq7bsyW5M3imBWqgHpeKzeoVKnzqfYf3lXBDrRVhoznVPjcFHiX8FvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TeFlzpWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8Cn3BRC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TeFlzpWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8Cn3BRC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65525b9X820570
	for <linux-remoteproc@vger.kernel.org>; Fri, 5 Jun 2026 04:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xSdIr74WsECiFVFTbvdmX76z6Kdvl0NJjOUdtSDNmM=; b=TeFlzpWNj1+Gd0M5
	s8EyHohdiVBeqfXS7AbtMxDxWB0DhZJnJFcYpcMgmS2IWh8pyF9o1IRwqQnLte5x
	C12weqeyvinXhsHQ/7C/inAxKeG15KS734M15pxsuO86tOqiYRkYmlcYZiNvbUQ8
	j89prfPIXErFjjDU6bUjZWdyXePDb2cW4C7RutL9P1+jFY2DdiYqUmUADbRPqPns
	liTNrKutgV/twx3SqEtzXgdYqPga92WBrVb5KPILJQX3PeJvXevZPE/4bl2Y7jsp
	4mAkr+qC3cyd3nhG8Sxr4IuYzS/1BpzznRp8HL97lk4gpqXASYz39NbloX70/Zqo
	X0ZrJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekncbgd4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 05 Jun 2026 04:20:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso1987718a91.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2026 21:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780633229; x=1781238029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xSdIr74WsECiFVFTbvdmX76z6Kdvl0NJjOUdtSDNmM=;
        b=U8Cn3BRCRiUgLH4fS0JiAQV3MlDeHkTD7COZ4corXJo2FFpccOAuPjNzzM5ZlWgDWU
         fn3nphROePSdld/RHNTd0kWk/DKaJTQtWQ4xQshVOWBDL7uhCapdq1ObSGfn9zsY0G5h
         twd9nwijWZDOr8Jylk8GdT/Jz3/TU9eP6AjtAcv4p5wIMANKyR7jSEjuV/XsJmXcVGlJ
         wmPzAXo0tP5AQ8XKNW4ggLZtiiCUqsSrWwsRzb1XKKZRYmmfimX+Jh8wjIDyKJ+TBYol
         dn8usLY3kgNSuZdbS4WX/UmZhrAmlqRUma/JbVWGpSfrggTy3BTJ0Q44GZzeVZlGYzt4
         eH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780633229; x=1781238029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xSdIr74WsECiFVFTbvdmX76z6Kdvl0NJjOUdtSDNmM=;
        b=fBdPadZUyrhyZQg38UPIG+YKIidzDMz/uvUE1qtd+nsOdnUTATDNXB1NWWTyMPsEYj
         +x9R+gglRpIAsQAhlWqX78De3rUukW8Eend8tYWr9levfAzbpnRWslX4HhaC3fqGap+C
         srQIJuvR5Xr6IIHuVe3BfJl10gBDCr8PCXOCXlEWnaj9o1kfSm8bw1d8wrtD0mdql2Tg
         ccDUoJR3Q24g6F/fP8zyi6YHWKRW3e1PtlgpM2P++r1kRDEao0IrIEBXBKVWulgrZnlH
         YVKvmQRXD9TAm5bu3JnPMVPAa63NcOiYbgFmsum3SPUPgrucgTfPUqmWNNbtECrF/CCe
         vLmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yFH6SzBR6ZGChpXLN1ipQbfa8x2Z4watOKkXMDl/vSn7UW0Sk14If8B7w8mAa/7ArwvDZnvZ/3ABmaqNl/ayV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw89UczrPtYLXKWS5WtOuODXo35HCBb7BgYDa6Jb/dC3Akk5+7k
	7n+WGAyhZjNgJE+bSVQ1GHtO6Cd8ze9PfGcJ37HI0mxbnteyyboMOUVX65b4Ywafyxk19XetDem
	w4bEEt521Z01k1MJfhh6R3E8kwj1Vyg8H9ylG3zGkrKgV8tA3qA20sRZnha3aj9WEO+RvFNre
X-Gm-Gg: Acq92OFAqp25m6UpyXgwbDx6IBUcTy/iRQKozDH9tYEAa6QwvEvnIGaIfgrxpdIyQ51
	4G9iyAeQ74NeEs5I0t5+QQ+FQh4lgK8x0FqYsVpF5ogkrkVLuM1YD+pne7El39wux6fMi/TOKld
	+25FHpLEL8IWFtt0utUAVIv6v3QOyZvXSgPwIc0ATVyndgL132No1eK+0HDZyGG56W/9LUP8vM5
	tRAQDDL/Ju7JIOrmZg6hHeLMY9Q6fWjAtrEv9hqeJzu4StiZj42m5isuOpeKbuhO0N/p2+0qX4v
	VRcZO2dNa8ekbvamUaViQ42wN2IfVgwJw1g+b3KSO3HNLbilMndqGqhf3CTiubPWUiT0kKZbMHd
	KRQrM9LJ7dnDkel7h3/atwXaZbzopfZ3EClUgOaknCjkLeymhbbVM1Mfqk3ikeMFsvNrR8Q==
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr2176041a91.19.1780633229221;
        Thu, 04 Jun 2026 21:20:29 -0700 (PDT)
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr2175993a91.19.1780633228706;
        Thu, 04 Jun 2026 21:20:28 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8679esm74673315ad.21.2026.06.04.21.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 21:20:27 -0700 (PDT)
Message-ID: <b83f7fa5-346d-4795-bbe0-bc17772321fa@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 09:50:23 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/1] remoteproc: qcom: Add NOTIFY_FATAL event type to
 SSR subdevice
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com,
        quic_viswanat@quicinc.com, quic_mojha@quicinc.com
References: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
 <8612d109-dc49-403d-9499-9c0319930cca@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <8612d109-dc49-403d-9499-9c0319930cca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OauoyBTY c=1 sm=1 tr=0 ts=6a224e8e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=X4DHI3SWk1nqzx7-H5UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAzOCBTYWx0ZWRfX5WpWNpekMOgA
 bTtuOU5pATpQ7VIpCBknor/YhYaJENHwFg0TqVdLxY9ge6hZItd1g8jeheXjEnfQJf9Jb+J2Gd6
 mPEnR/Wrx1fAopIpbdOo2CXsH5h/4mqeBL+YOAIRRl1+Hh/zWPxRxMMGWoUVehFKE9zRCFRHrwJ
 hXV7LhOIfOJ9mijJzt6/Ccp802GVROcSvTiH+ovGHZjn0smPa9kqwcxOjvcdXxhFDJHkJ20e5/r
 MCaGdtv2EvDaP0P7Dr1lEtgQwU20QDcf/ELoreABu+nJoCjJRo96E4Q1Qj3xdrf4VADD2OzhDbj
 uQlJDsBoAPMj2YcrwUFqUAUBAfbaxaXSQn/g37+ypwfgZlmuniACqCZbDIiOb5RrqPUVQ487ydB
 QYnFtZcW5ncZzz79gi6Vlae18NlGRVeAGQxMUceHBf8HFrgieSZf5q9Sw+1KZdTxpPyl5oZbotX
 O8T0vW5KqOXpqrINltA==
X-Proofpoint-GUID: v2lq1wY97HZi0pdS7NuITLaqE9lf8iYj
X-Proofpoint-ORIG-GUID: v2lq1wY97HZi0pdS7NuITLaqE9lf8iYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050038



On 6/5/2026 2:42 AM, Jeff Johnson wrote:
> On 8/19/2024 11:09 PM, Gokul Sriram Palanisamy wrote:
>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>
>> Currently the SSR subdevice notifies the client driver on crash of the
>> rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
>> However, the client driver might be interested to know that the device
>> has crashed immediately to pause any further transactions with the
>> rproc. This calls for an event to be sent to the driver in the IRQ
>> context as soon as the rproc crashes.
>>
>> Add NOTIFY_FATAL event to SSR subdevice to atomically notify rproc has
>> crashed to the client driver. The client driver in this scenario is a
>> ath Wi-Fi driver which is continuously queuing data to the remoteproc and
>> needs to know if remoteproc crashes as soon as possible to stop queuing
>> further data and also dump some debug statistics on the driver side that
>> could potentially help in debug of why the remoteproc crashed.
>>
>> Validated the event in IPQ9574 and IPQ5332 by forcing the rproc to crash
>> and ensuring the registered notifier function receives the notification
>> in IRQ context.
>>
>> The client driver in this scenario is a Wi-Fi driver which is continuously
>> queuing data to the remoteproc and needs to know if remoteproc crashes
>> as soon as possible to stop queuing further data and also dump some 
>> debug statistics on the driver side that could potentially help in
>> debug of why the remoteproc crashed.
>>
>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>> changes since v1:
>> 	- No changes. Rebased on top of linux-next.
>> 	- We will now have a user for this notifier, ath12k.
>>
>>  drivers/remoteproc/qcom_common.c      | 60 +++++++++++++++++++++++++++
>>  drivers/remoteproc/remoteproc_core.c  | 12 ++++++
>>  include/linux/remoteproc.h            |  3 ++
>>  include/linux/remoteproc/qcom_rproc.h | 17 ++++++++
>>  4 files changed, 92 insertions(+)
> 
> Core review comments below assisted by Claude:claude-sonnet-4-6
>>
>> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
>> index 8c8688f99f0a..6efee422cc23 100644
>> --- a/drivers/remoteproc/qcom_common.c
>> +++ b/drivers/remoteproc/qcom_common.c
>> @@ -86,6 +86,7 @@ struct minidump_global_toc {
>>  struct qcom_ssr_subsystem {
>>  	const char *name;
>>  	struct srcu_notifier_head notifier_list;
>> +	struct atomic_notifier_head atomic_notifier_list;
>>  	struct list_head list;
>>  };
>>  
>> @@ -377,6 +378,7 @@ static struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
>>  	}
>>  	info->name = kstrdup_const(name, GFP_KERNEL);
>>  	srcu_init_notifier_head(&info->notifier_list);
>> +	ATOMIC_INIT_NOTIFIER_HEAD(&info->atomic_notifier_list);
>>  
>>  	/* Add to global notification list */
>>  	list_add_tail(&info->list, &qcom_ssr_subsystem_list);
>> @@ -428,6 +430,51 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
>>  
>> +/**
>> + * qcom_register_ssr_atomic_notifier() - register SSR Atomic notification
>> + *					 handler
>> + * @name:	Subsystem's SSR name
>> + * @nb:	notifier_block to be invoked upon subsystem's state change
>> + *
>> + * This registers the @nb notifier block as part the atomic notifier
>> + * chain for a remoteproc associated with @name. The notifier block's callback
>> + * will be invoked when the remote processor crashes in atomic context before
>> + * the recovery process is queued.
>> + *
>> + * Return: a subsystem cookie on success, ERR_PTR on failure.
>> + */
>> +void *qcom_register_ssr_atomic_notifier(const char *name,
>> +					struct notifier_block *nb)
>> +{
>> +	struct qcom_ssr_subsystem *info;
>> +
>> +	info = qcom_ssr_get_subsys(name);
>> +	if (IS_ERR(info))
>> +		return info;
>> +
>> +	atomic_notifier_chain_register(&info->atomic_notifier_list, nb);
>> +
>> +	return &info->atomic_notifier_list;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_register_ssr_atomic_notifier);
>> +
>> +/**
>> + * qcom_unregister_ssr_atomic_notifier() - unregister SSR Atomic notification
>> + *					   handler
>> + * @notify:	subsystem cookie returned from qcom_register_ssr_notifier
> 
> @notify kdoc parameter references wrong function name
> 
> Should be qcom_register_ssr_atomic_notifier. The two notifier chains are
> independent; notify from qcom_register_ssr_notifier points to
> &info->notifier_list (SRCU), while notify from
> qcom_register_ssr_atomic_notifier points to &info->atomic_notifier_list.
> Passing the wrong cookie to atomic_notifier_chain_unregister would corrupt the
> wrong list. The doc misleads callers about which cookie to pass.

Ack.

> 
>> + * @nb:		notifier_block to unregister
>> + *
>> + * This function will unregister the notifier from the atomic notifier
>> + * chain.
>> + *
>> + * Return: 0 on success, %ENOENT otherwise.
>> + */
>> +int qcom_unregister_ssr_atomic_notifier(void *notify, struct notifier_block *nb)
>> +{
>> +	return atomic_notifier_chain_unregister(notify, nb);
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_unregister_ssr_atomic_notifier);
>> +
>>  static int ssr_notify_prepare(struct rproc_subdev *subdev)
>>  {
>>  	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
>> @@ -478,6 +525,18 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>>  				 QCOM_SSR_AFTER_SHUTDOWN, &data);
>>  }
>>  
>> +static void ssr_notify_crash(struct rproc_subdev *subdev)
>> +{
>> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
>> +	struct qcom_ssr_notify_data data = {
>> +		.name = ssr->info->name,
>> +		.crashed = true,
>> +	};
>> +
>> +	atomic_notifier_call_chain(&ssr->info->atomic_notifier_list,
>> +				   QCOM_SSR_NOTIFY_CRASH, &data);
>> +}
>> +
>>  /**
>>   * qcom_add_ssr_subdev() - register subdevice as restart notification source
>>   * @rproc:	rproc handle
>> @@ -504,6 +563,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>>  	ssr->subdev.start = ssr_notify_start;
>>  	ssr->subdev.stop = ssr_notify_stop;
>>  	ssr->subdev.unprepare = ssr_notify_unprepare;
>> +	ssr->subdev.notify_crash = ssr_notify_crash;
>>  
>>  	rproc_add_subdev(rproc, &ssr->subdev);
>>  }
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index f276956f2c5c..1828831e0e77 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1140,6 +1140,16 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
>>  	}
>>  }
>>  
>> +static void rproc_notify_crash_subdevices(struct rproc *rproc)
>> +{
>> +	struct rproc_subdev *subdev;
>> +
>> +	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
>> +		if (subdev->notify_crash)
>> +			subdev->notify_crash(subdev);
>> +	}
>> +}
>> +
>>  /**
>>   * rproc_alloc_registered_carveouts() - allocate all carveouts registered
>>   * in the list
>> @@ -2712,6 +2722,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>>  		rproc->name, rproc_crash_to_string(type));
>>  
>> +	rproc_notify_crash_subdevices(rproc);
>> +
>>  	queue_work(rproc_recovery_wq, &rproc->crash_handler);
>>  }
>>  EXPORT_SYMBOL(rproc_report_crash);
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index b4795698d8c2..5101a7ec01bb 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -596,6 +596,8 @@ struct rproc {
>>   * @stop: stop function, called before the rproc is stopped; the @crashed
>>   *	    parameter indicates if this originates from a recovery
>>   * @unprepare: unprepare function, called after the rproc has been stopped
>> + * @notify_crash: notify_crash function, called in atomic context to notify
>> + *		  rproc has crashed and recovery is about to start
>>   */
>>  struct rproc_subdev {
>>  	struct list_head node;
>> @@ -604,6 +606,7 @@ struct rproc_subdev {
>>  	int (*start)(struct rproc_subdev *subdev);
>>  	void (*stop)(struct rproc_subdev *subdev, bool crashed);
>>  	void (*unprepare)(struct rproc_subdev *subdev);
>> +	void (*notify_crash)(struct rproc_subdev *subdev);
>>  };
>>  
>>  /* we currently support only two vrings per rvdev */
>> diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
>> index 82b211518136..f3d06900f297 100644
>> --- a/include/linux/remoteproc/qcom_rproc.h
>> +++ b/include/linux/remoteproc/qcom_rproc.h
>> @@ -11,12 +11,14 @@ struct notifier_block;
>>   * @QCOM_SSR_AFTER_POWERUP:	Remoteproc is running (start stage)
>>   * @QCOM_SSR_BEFORE_SHUTDOWN:	Remoteproc crashed or shutting down (stop stage)
>>   * @QCOM_SSR_AFTER_SHUTDOWN:	Remoteproc is down (unprepare stage)
>> + * @QCOM_SSR_NOTIFY_CRASH:	Remoteproc crashed
>>   */
>>  enum qcom_ssr_notify_type {
>>  	QCOM_SSR_BEFORE_POWERUP,
>>  	QCOM_SSR_AFTER_POWERUP,
>>  	QCOM_SSR_BEFORE_SHUTDOWN,
>>  	QCOM_SSR_AFTER_SHUTDOWN,
>> +	QCOM_SSR_NOTIFY_CRASH,
>>  };
>>  
>>  struct qcom_ssr_notify_data {
>> @@ -29,6 +31,10 @@ struct qcom_ssr_notify_data {
>>  void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb);
>>  int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb);
>>  
>> +void *qcom_register_ssr_atomic_notifier(const char *name,
>> +					struct notifier_block *nb);
>> +int qcom_unregister_ssr_atomic_notifier(void *notify,
>> +					struct notifier_block *nb);
>>  #else
>>  
>>  static inline void *qcom_register_ssr_notifier(const char *name,
>> @@ -43,6 +49,17 @@ static inline int qcom_unregister_ssr_notifier(void *notify,
>>  	return 0;
>>  }
>>  
>> +static inline void *qcom_register_ssr_atomic_notifier(const char *name,
>> +						      struct notifier_block *nb)
>> +{
>> +	return 0;
> 
> qcom_register_ssr_atomic_notifier disabled stub returns integer 0 instead of NULL
> 
> The function return type is void *. Returning integer 0 rather than NULL will
> trigger a -Wint-conversion compiler warning in kernel builds (return makes
> pointer from integer without a cast). The immediately preceding sibling stub
> qcom_register_ssr_notifier correctly returns NULL.
> 
> Fix: return NULL;

Ack.

Thanks,
Vignesh
> 
> 
>> +}
>> +
>> +static inline int qcom_unregister_ssr_atomic_notifier(void *notify,
>> +						      struct notifier_block *nb)
>> +{
>> +	return 0;
>> +}
>>  #endif
>>  
>>  #endif
> 
> 

