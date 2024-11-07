Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D6B11713
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 Nov 2024 02:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730945285; cv=none; b=niyuz5fuYLnJch2b1862Lsf+w0Fdhy5O7CgNRukDijom/VEBjuBeS9KQeoAZ03Big/qCJj85ULl+kkTaAZGSduySd7cYFLsvb7bC0ahCVqZ8ykGmkbof/f7Zu/xfJfsOhAVC2YiIejYNPorq05yU1azDv4bdnOeIs+dTsjBJZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730945285; c=relaxed/simple;
	bh=4hcSiM3HvSnsJkBKVWWHfR+OcrvQ9pBtuHjvrv//mng=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hGd9F1HOXIq8T2tSzi1LQsz2LBqxLDLAAePWrtz6C8LeQG4rBeHHVcM74XrT0fmzQUldirM++3PTj2RF4MMUyvd5ZalXo0lxH/SN8002A0kbakW7L3QsNz6zHwQAGQ2HLqI6mN04ky+heFOhB50sN0fM/y6J6+5Lw3a0egFl6ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RptsQbMf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RptsQbMf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6KVP08024626;
	Thu, 7 Nov 2024 02:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tbVX/Lu8/EVai82guWJxRpvI8RvHfw07oPdU9TaF+XU=; b=RptsQbMfzx2MK28S
	GF2RK5cYJ/u3JkVwXSVNgp7lv454ZMLiNYdjdsbejxEFzB9Ied1BvpUHPldlpqWb
	IaClMXvLVL6sYe5MectV1WavpvU3YM/FWaUT747lnxebtcRMQPFymS8WFLBepvgY
	I+iKrJn3jV+d81qdAhWqHiwhaya+MqcokhG+n0iyn0UTvYlVgISdKqbEtGx8VMvb
	CflH0iU6YYgLSnjhPG/e8HeJKrzRUcnxWBOnpgyK+FxZ568VuNayLHZhDWaxopPk
	UvkbwcbYUBdoByOBvmgjMjD9jRi4huda6mizhl/hXPv9Gt8CzsOE4dGVfRV9jLit
	wJYVGg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r3c1atpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 02:07:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A727vlJ015557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 02:07:57 GMT
Received: from [10.71.115.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 18:07:56 -0800
Message-ID: <2eb54159-7e92-42a7-bbb7-1b4848f49a80@quicinc.com>
Date: Wed, 6 Nov 2024 18:07:56 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: pas: Remove subdevs on the error path
 of adsp_probe()
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>
References: <20241105092055.255127-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241105092055.255127-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iAbQtdF5aWNJUNV_ZUV0pNHb7avr2h_F
X-Proofpoint-ORIG-GUID: iAbQtdF5aWNJUNV_ZUV0pNHb7avr2h_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 clxscore=1011
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070014

Hi Joe,

On 11/5/2024 1:20 AM, Joe Hattori wrote:
> Current implementation of adsp_probe() does not remove the subdevs of
> struct qcom_adsp *adsp on the error path. Fix this bug by calling
> qcom_remove_{ssr,sysmon,pdm,smd,glink}_subdev(), qcom_q6v5_deinit(), and
> adsp_unassign_memory_region() appropriately.
> 
> Fixes: 5b9f51b200dc ("remoteproc: qcom: enable in-kernel PD mapper")

The ssr, sysmon, glink subdevs and qcom_q6v5_init() are the calls that 
leak resources. I think this issue existed before the in-kernel PD 
mapper patches so this Fixes tag isn't accurate.

Would this apply to the other remoteproc files like qcom_q6v5_adsp.c?

> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ef82835e98a4..27b23a000c7a 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -759,16 +759,16 @@ static int adsp_probe(struct platform_device *pdev)
>   
>   	ret = adsp_init_clock(adsp);
>   	if (ret)
> -		goto free_rproc;
> +		goto unassign_mem;
>   
>   	ret = adsp_init_regulator(adsp);
>   	if (ret)
> -		goto free_rproc;
> +		goto unassign_mem;
>   
>   	ret = adsp_pds_attach(&pdev->dev, adsp->proxy_pds,
>   			      desc->proxy_pd_names);
>   	if (ret < 0)
> -		goto free_rproc;
> +		goto unassign_mem;
>   	adsp->proxy_pd_count = ret;
>   
>   	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, desc->load_state,
> @@ -784,18 +784,28 @@ static int adsp_probe(struct platform_device *pdev)
>   					      desc->ssctl_id);
>   	if (IS_ERR(adsp->sysmon)) {
>   		ret = PTR_ERR(adsp->sysmon);
> -		goto detach_proxy_pds;
> +		goto deinit_remove_pdm_smd_glink;
>   	}
>   
>   	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
>   	ret = rproc_add(rproc);
>   	if (ret)
> -		goto detach_proxy_pds;
> +		goto remove_ssr_sysmon;
>   
>   	return 0;
>   
> +remove_ssr_sysmon:
> +	qcom_remove_ssr_subdev(rproc, &adsp->ssr_subdev);
> +	qcom_remove_sysmon_subdev(adsp->sysmon);
> +deinit_remove_pdm_smd_glink: > +	qcom_remove_pdm_subdev(rproc, &adsp->pdm_subdev);
> +	qcom_remove_smd_subdev(rproc, &adsp->smd_subdev);
> +	qcom_remove_glink_subdev(rproc, &adsp->glink_subdev);
> +	qcom_q6v5_deinit(&adsp->q6v5); >   detach_proxy_pds:
>   	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
> +unassign_mem:
> +	adsp_unassign_memory_region(adsp);
>   free_rproc:
>   	device_init_wakeup(adsp->dev, false);
>   
