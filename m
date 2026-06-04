Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02543E277F
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Jun 2026 21:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780607532; cv=none; b=L+GCofig/Y2v4+hT03tM0wW2gCgKoUV0DIclQAxCl+B5MfauUhzLZlORaqd6Yr2LkbwiA41YZoGQWhB12PYT1Egsakq2ZZ0vOkcwyuymTt2dTRArE6AkNeS/lYw+nctAT5AZQmdadiqkjzT6EuPu6lJ67wrwmAscDhI7oOi87g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780607532; c=relaxed/simple;
	bh=0C7ujDu4p8ivbrv6Ec3RCV7NjdSKJTj94Hi7V8BVfpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9tFdy8J5fS/TkDQKFM/IYSYngY3CVp/XIKqr19eqftiJRGEK9NV0U2iCPxet6ri09vPjQVdB0TcGCbKbozkA9BVtumfjGxe6r1HPnmh0sCgATzgz7rcXdo0OI7wOIlVj3fKTt40A8KlsURWtSk93Lcco4UQhE0NyWeZPknobqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izy6xfuT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYxFFd7u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izy6xfuT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYxFFd7u"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EiLhs1132984
	for <linux-remoteproc@vger.kernel.org>; Thu, 4 Jun 2026 21:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlndOMG5hS1z7TmgESNZVL4Ym5kMFIGDnRoewaftmVs=; b=izy6xfuTfBxt9G2l
	f21hZdLUfOnTbrfl4H2xO1jmw6sregFKceloKorEWhFGzpyKwnRl+GnEYqJt2iIg
	Q14uLthRUSEX/HoRWU5LrTyDaJ4DUdO1Z9MXcpKMBTR6ZJZhByqxenevBpjlqNB3
	0VP9FJu1PCJPkzO9r6msBZQtGYps094uN3GNoHLccxPNXZFrfM9cYD9AOF3id77c
	/4BV0SZI21vekrSKn3MG1/0Cdq7/Edpph1GsYLqdL6MsU3YqmnxOeooaqJEA+edT
	tZrFmjuy6Yd9+ncpuBYR+HXhlGfULacAwWymEfFVoITCGDbeHLm726XDU4TiI3tW
	HIhsxw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsk921-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2026 21:12:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304f1820babso1512990eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2026 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780607526; x=1781212326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QlndOMG5hS1z7TmgESNZVL4Ym5kMFIGDnRoewaftmVs=;
        b=QYxFFd7u/4CxDH0TRzzwFihRLX+FSn2PQfTDJXakFdVI+XFqHMXqO+TxhAkuAZkcpj
         VNWPdK9GuRBeLGQSZKyRsuhZvt4p1nqZzWNY+sDJv5JqcrUi18h4WQA/enLvHyvKmroY
         oj4cTU4MBg1nogsl0xMaOtJROvz69Syrp8TN+TnDn833TpERv4mfq4NpDQP0Z7Pj9Ulv
         WF/PHjleEB++tKAAknloOkmgScLgbC0bifeIHJ0+Tt/i67ZzXiFvClMBTzB6XhGSMasE
         Vk8XYOLhXR7aA/78igjA2cwb1RJt1r17YTeEdvjU8zDDvEYA7eH8vjjpNs0ldicTuNJW
         /LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780607526; x=1781212326;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlndOMG5hS1z7TmgESNZVL4Ym5kMFIGDnRoewaftmVs=;
        b=gXoZXHCSU7MiGk+twBcQh0PvMgbvZTLCAJW+WJOOcATsldeHeGN20rlgHaISX7VTYU
         yv5VUip6EC2W/PNUoVFlV0qqbRxeBc7aPXJew+hsd/GCVXsFA+aYiHQ+8OABy2ewAmaR
         ltOnKXkvywYI1W5XVOP+b37+IKeDSFuhcdohF9xRwfvf1jHTre1KHbnOWKnNmxwhqsEO
         LQwXTD6dlTQNZUnObmgW6RH4Y2W/jkRORAdur3bCZa4upcMg/mbZH2/9DTwoE/4/foJp
         MAxznzVhcL9bfjWt29m8mF36zAeJ8tJqXJi8RgI9bYFlR/0VJBl/ieeu+l4IsLkvnnPZ
         WsOg==
X-Forwarded-Encrypted: i=1; AFNElJ8pXKta8W2PwHjfKKHueC7EF81OgMqA1UWK8VehPDx6cxPJM7tJDCThd2cdb3DUHAn22wgH1ALiY41miHlaqRFa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cO+XfpPQ5XK7ZESO+JgxD/H/wC5umUP+pobgIC/JwKUDYyAs
	jWxPFvom5H39QQQ+KvQr22jC7MEM0ZwgSBbXmxRWyfzJc09pUZNBY73Iz7QfD67ZcxRzwaWhJkC
	9x68CNJmjv3GJJpxrF2tNtyu8jjU7gA5LLvk7YTXyUqonu3S2ZQK4SnIWQ1d/If+UFjR0BBf7
X-Gm-Gg: Acq92OEEgTWwZbpKCTJdZcif3vuQ2My6dEfcOmQGiZ5SyZpr37bU3ZfplmxU9Tvwl09
	2zx7gui5xiIdX6F57v22zKCoZq3aydtTyUZnyBbOcEvwzMIHH6L2/BUKzQCm4ISrffAlMCc4l80
	9IPft9GXlDKaFdtjabx/zJnHRr3Jgy8jz5M59Y2BlweRDrrE0oDIZVYHYFTEjYNCdRG32bdpAsB
	SExIYVWd3UaKovf2NBH2LLqzF5gcJa4ZrlIte0SX0gOUoMgNW7Tb6KSsF7q9RIEdhJjkmVmdWrw
	b7IT/VkVzT1ANcMq4Z+PNnijo8h4U/LHuzJBsHsDr8B8Tiu1dN55VJzQ90VlRN4e8uGV9kfgsdJ
	TNZKDAq9pQYLvNv+N4FcweCL+/XJba20RmOFsD3NkD7T24Rw+yEnYKyqWXSnwaryAt2pIJMOFTE
	QetBK3wRLxEK588MfhbtZg0t02
X-Received: by 2002:a05:693c:374a:b0:2f5:5907:3a48 with SMTP id 5a478bee46e88-3077b25d11fmr239486eec.1.1780607526239;
        Thu, 04 Jun 2026 14:12:06 -0700 (PDT)
X-Received: by 2002:a05:693c:374a:b0:2f5:5907:3a48 with SMTP id 5a478bee46e88-3077b25d11fmr239459eec.1.1780607525555;
        Thu, 04 Jun 2026 14:12:05 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df75ff6sm6112567eec.26.2026.06.04.14.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 14:12:05 -0700 (PDT)
Message-ID: <8612d109-dc49-403d-9499-9c0319930cca@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 14:12:03 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/1] remoteproc: qcom: Add NOTIFY_FATAL event type to
 SSR subdevice
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com,
        quic_viswanat@quicinc.com, quic_mojha@quicinc.com
References: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y1r3rkJzMKu9eRxxPJj4YOOh4UVK89jB
X-Proofpoint-ORIG-GUID: y1r3rkJzMKu9eRxxPJj4YOOh4UVK89jB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIwOCBTYWx0ZWRfX+f92cq4TQXoN
 GtJwnNMvTdun/XiszTrSWOpM+eRbhoh+QQsBo7bR4jrF89Rf4g7E0UVEjLmC0vbnpJbHxBIFRLU
 D5gHSPD/OtmEyTgSsM8iKEn1h9WnFx/Q5YGFt9ve2/cin86PkfRS+yOccFp48ywiBmIBePrpG+m
 eQhy4J3NZYzt/3KdlNFBVq5OuUZRZiLYnQWH9N2t2Eo0Oo+P/TyxUeQASgj0kqy8SUykpw6rt0N
 b71rU3jTgNs3T9Y5rgD0ORWnKgov6MlBmWu/LT4NsoYD03dymihly3AeMG4amNB6KUY46L+qJ5a
 mhDMo7Ues9tXo4JK7x7GEge4epPYtZIsf5xfDLtpFsHNmUAUZThfkxYc1VPby9cqFeUMarWOc2M
 A8m0STChbZ9R+KPmzGlA0fAzmZ/MyNs4Q6HWq6Fl92Ef7rlb45wjqtz1SDsdExXRu65/4vckfws
 hjAXw1D1B1xrlVONQDA==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a21ea27 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=0s-kRFMrQEE18jlnkSwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040208

On 8/19/2024 11:09 PM, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> Currently the SSR subdevice notifies the client driver on crash of the
> rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
> However, the client driver might be interested to know that the device
> has crashed immediately to pause any further transactions with the
> rproc. This calls for an event to be sent to the driver in the IRQ
> context as soon as the rproc crashes.
> 
> Add NOTIFY_FATAL event to SSR subdevice to atomically notify rproc has
> crashed to the client driver. The client driver in this scenario is a
> ath Wi-Fi driver which is continuously queuing data to the remoteproc and
> needs to know if remoteproc crashes as soon as possible to stop queuing
> further data and also dump some debug statistics on the driver side that
> could potentially help in debug of why the remoteproc crashed.
> 
> Validated the event in IPQ9574 and IPQ5332 by forcing the rproc to crash
> and ensuring the registered notifier function receives the notification
> in IRQ context.
> 
> The client driver in this scenario is a Wi-Fi driver which is continuously
> queuing data to the remoteproc and needs to know if remoteproc crashes
> as soon as possible to stop queuing further data and also dump some 
> debug statistics on the driver side that could potentially help in
> debug of why the remoteproc crashed.
> 
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
> changes since v1:
> 	- No changes. Rebased on top of linux-next.
> 	- We will now have a user for this notifier, ath12k.
> 
>  drivers/remoteproc/qcom_common.c      | 60 +++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_core.c  | 12 ++++++
>  include/linux/remoteproc.h            |  3 ++
>  include/linux/remoteproc/qcom_rproc.h | 17 ++++++++
>  4 files changed, 92 insertions(+)

Core review comments below assisted by Claude:claude-sonnet-4-6
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 8c8688f99f0a..6efee422cc23 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -86,6 +86,7 @@ struct minidump_global_toc {
>  struct qcom_ssr_subsystem {
>  	const char *name;
>  	struct srcu_notifier_head notifier_list;
> +	struct atomic_notifier_head atomic_notifier_list;
>  	struct list_head list;
>  };
>  
> @@ -377,6 +378,7 @@ static struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
>  	}
>  	info->name = kstrdup_const(name, GFP_KERNEL);
>  	srcu_init_notifier_head(&info->notifier_list);
> +	ATOMIC_INIT_NOTIFIER_HEAD(&info->atomic_notifier_list);
>  
>  	/* Add to global notification list */
>  	list_add_tail(&info->list, &qcom_ssr_subsystem_list);
> @@ -428,6 +430,51 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
>  }
>  EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
>  
> +/**
> + * qcom_register_ssr_atomic_notifier() - register SSR Atomic notification
> + *					 handler
> + * @name:	Subsystem's SSR name
> + * @nb:	notifier_block to be invoked upon subsystem's state change
> + *
> + * This registers the @nb notifier block as part the atomic notifier
> + * chain for a remoteproc associated with @name. The notifier block's callback
> + * will be invoked when the remote processor crashes in atomic context before
> + * the recovery process is queued.
> + *
> + * Return: a subsystem cookie on success, ERR_PTR on failure.
> + */
> +void *qcom_register_ssr_atomic_notifier(const char *name,
> +					struct notifier_block *nb)
> +{
> +	struct qcom_ssr_subsystem *info;
> +
> +	info = qcom_ssr_get_subsys(name);
> +	if (IS_ERR(info))
> +		return info;
> +
> +	atomic_notifier_chain_register(&info->atomic_notifier_list, nb);
> +
> +	return &info->atomic_notifier_list;
> +}
> +EXPORT_SYMBOL_GPL(qcom_register_ssr_atomic_notifier);
> +
> +/**
> + * qcom_unregister_ssr_atomic_notifier() - unregister SSR Atomic notification
> + *					   handler
> + * @notify:	subsystem cookie returned from qcom_register_ssr_notifier

@notify kdoc parameter references wrong function name

Should be qcom_register_ssr_atomic_notifier. The two notifier chains are
independent; notify from qcom_register_ssr_notifier points to
&info->notifier_list (SRCU), while notify from
qcom_register_ssr_atomic_notifier points to &info->atomic_notifier_list.
Passing the wrong cookie to atomic_notifier_chain_unregister would corrupt the
wrong list. The doc misleads callers about which cookie to pass.

> + * @nb:		notifier_block to unregister
> + *
> + * This function will unregister the notifier from the atomic notifier
> + * chain.
> + *
> + * Return: 0 on success, %ENOENT otherwise.
> + */
> +int qcom_unregister_ssr_atomic_notifier(void *notify, struct notifier_block *nb)
> +{
> +	return atomic_notifier_chain_unregister(notify, nb);
> +}
> +EXPORT_SYMBOL_GPL(qcom_unregister_ssr_atomic_notifier);
> +
>  static int ssr_notify_prepare(struct rproc_subdev *subdev)
>  {
>  	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> @@ -478,6 +525,18 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>  				 QCOM_SSR_AFTER_SHUTDOWN, &data);
>  }
>  
> +static void ssr_notify_crash(struct rproc_subdev *subdev)
> +{
> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +	struct qcom_ssr_notify_data data = {
> +		.name = ssr->info->name,
> +		.crashed = true,
> +	};
> +
> +	atomic_notifier_call_chain(&ssr->info->atomic_notifier_list,
> +				   QCOM_SSR_NOTIFY_CRASH, &data);
> +}
> +
>  /**
>   * qcom_add_ssr_subdev() - register subdevice as restart notification source
>   * @rproc:	rproc handle
> @@ -504,6 +563,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>  	ssr->subdev.start = ssr_notify_start;
>  	ssr->subdev.stop = ssr_notify_stop;
>  	ssr->subdev.unprepare = ssr_notify_unprepare;
> +	ssr->subdev.notify_crash = ssr_notify_crash;
>  
>  	rproc_add_subdev(rproc, &ssr->subdev);
>  }
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f276956f2c5c..1828831e0e77 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1140,6 +1140,16 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
>  	}
>  }
>  
> +static void rproc_notify_crash_subdevices(struct rproc *rproc)
> +{
> +	struct rproc_subdev *subdev;
> +
> +	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
> +		if (subdev->notify_crash)
> +			subdev->notify_crash(subdev);
> +	}
> +}
> +
>  /**
>   * rproc_alloc_registered_carveouts() - allocate all carveouts registered
>   * in the list
> @@ -2712,6 +2722,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));
>  
> +	rproc_notify_crash_subdevices(rproc);
> +
>  	queue_work(rproc_recovery_wq, &rproc->crash_handler);
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2..5101a7ec01bb 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -596,6 +596,8 @@ struct rproc {
>   * @stop: stop function, called before the rproc is stopped; the @crashed
>   *	    parameter indicates if this originates from a recovery
>   * @unprepare: unprepare function, called after the rproc has been stopped
> + * @notify_crash: notify_crash function, called in atomic context to notify
> + *		  rproc has crashed and recovery is about to start
>   */
>  struct rproc_subdev {
>  	struct list_head node;
> @@ -604,6 +606,7 @@ struct rproc_subdev {
>  	int (*start)(struct rproc_subdev *subdev);
>  	void (*stop)(struct rproc_subdev *subdev, bool crashed);
>  	void (*unprepare)(struct rproc_subdev *subdev);
> +	void (*notify_crash)(struct rproc_subdev *subdev);
>  };
>  
>  /* we currently support only two vrings per rvdev */
> diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
> index 82b211518136..f3d06900f297 100644
> --- a/include/linux/remoteproc/qcom_rproc.h
> +++ b/include/linux/remoteproc/qcom_rproc.h
> @@ -11,12 +11,14 @@ struct notifier_block;
>   * @QCOM_SSR_AFTER_POWERUP:	Remoteproc is running (start stage)
>   * @QCOM_SSR_BEFORE_SHUTDOWN:	Remoteproc crashed or shutting down (stop stage)
>   * @QCOM_SSR_AFTER_SHUTDOWN:	Remoteproc is down (unprepare stage)
> + * @QCOM_SSR_NOTIFY_CRASH:	Remoteproc crashed
>   */
>  enum qcom_ssr_notify_type {
>  	QCOM_SSR_BEFORE_POWERUP,
>  	QCOM_SSR_AFTER_POWERUP,
>  	QCOM_SSR_BEFORE_SHUTDOWN,
>  	QCOM_SSR_AFTER_SHUTDOWN,
> +	QCOM_SSR_NOTIFY_CRASH,
>  };
>  
>  struct qcom_ssr_notify_data {
> @@ -29,6 +31,10 @@ struct qcom_ssr_notify_data {
>  void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb);
>  int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb);
>  
> +void *qcom_register_ssr_atomic_notifier(const char *name,
> +					struct notifier_block *nb);
> +int qcom_unregister_ssr_atomic_notifier(void *notify,
> +					struct notifier_block *nb);
>  #else
>  
>  static inline void *qcom_register_ssr_notifier(const char *name,
> @@ -43,6 +49,17 @@ static inline int qcom_unregister_ssr_notifier(void *notify,
>  	return 0;
>  }
>  
> +static inline void *qcom_register_ssr_atomic_notifier(const char *name,
> +						      struct notifier_block *nb)
> +{
> +	return 0;

qcom_register_ssr_atomic_notifier disabled stub returns integer 0 instead of NULL

The function return type is void *. Returning integer 0 rather than NULL will
trigger a -Wint-conversion compiler warning in kernel builds (return makes
pointer from integer without a cast). The immediately preceding sibling stub
qcom_register_ssr_notifier correctly returns NULL.

Fix: return NULL;


> +}
> +
> +static inline int qcom_unregister_ssr_atomic_notifier(void *notify,
> +						      struct notifier_block *nb)
> +{
> +	return 0;
> +}
>  #endif
>  
>  #endif

