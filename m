Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FA71C863B;
	Wed, 23 Apr 2025 06:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745389615; cv=none; b=uVpsRBJ3Yz/Mn5HwfXDVznTt+1mAkz3rl2gCFAl5LNokuO+q2fiRPs2ernFIqE8o6ypEg+BOsvg9qkEuMJE276uuxrztkuxOdxHDcSJ9EuWOO29oYgimmp1hCAUw4ySH9XkZ4+ZzE6el+VeGajHO2Lads0YhTkYT5zXpssFwLwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745389615; c=relaxed/simple;
	bh=fsxVk9XOWghv1+ewQnwODFgpxKLKtw2NrO51KeEKuDw=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=RvaMs1mYQN1r4Rr3ml4GwsAMMixPPgiioael3yoEJLJG9eCRyna6hoZgI7qtbUQ6TFFagzig+rjkYrN6T3PfIQyk+CuoHtZnSm0plYCo9FygRtfRFWDJNX/tSdsVJK3rzEkuYVjWJKd1rZZAG0Pd4FVEC/XEKPBjZV3J2TzDnFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dd2RdKPk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dd2RdKPk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iEjF023089;
	Wed, 23 Apr 2025 06:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOEpq+rVm7WAQHFsR8yQGCIaqz7fUI8iFigg+v17DPY=; b=Dd2RdKPkROc644tz
	DJz9tw4xiX2TTeAKgexicWLcedN/KByGqg2mA+eQQtIiSxnwq8BfG2UPwy511izy
	eZsxLnxjsJDRtTG0Z+T2WqUWSwByLsiUglMpKzfGKkccUj3bnBumeo9CKgnhQ4/R
	Bhj3LZIyJ41IquttCqH0KN/YM8nfvK7e1AvnXHyatmUS5RZpP/yH/XaxEp/nzQ5H
	16vuZtC+eqFr6T7trtzlQ3kgYnfsVoeW6DQSBuU3nV9FRkk5Yay8kNbXk4/vLGro
	8K6qqn9Kxs0zVLJ7BV0mowckfdv9BSc+U+bgURPGTY4S2Se1mD+v6fMD9jUmzH3B
	MGrZkA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2930t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:26:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6Qn1c028661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:26:49 GMT
Received: from [10.218.49.64] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 23:26:47 -0700
Subject: Re: [PATCH v5] remoteproc: Add device awake calls in rproc boot and
 shutdown path
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250408104317.926833-1-quic_schowdhu@quicinc.com>
CC: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
From: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Message-ID: <76366b84-29d1-8b3a-d6a1-224d8cb68946@quicinc.com>
Date: Wed, 23 Apr 2025 11:56:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250408104317.926833-1-quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rQJaeBGFLfqlFLfOaoC0952qzvmiXApo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MiBTYWx0ZWRfX0RIS+07NVU7A rA3CdyjXfudlfVKdyZPo/IEktFDCmJjyJR866DEyTw5L3mSYyj18UBb7E6Rqtr4XU3eH3/1wkaZ TTFGq9Xp1HjZQ3ykQktBalu+Ee8Q817NH7XlWUxMUnIaNuOw9wvtl+UCozxW2XyN4QJivZSUvFc
 TvuZFnDccBYxBj56wQ2BKJ/DrDLiUceumwn5x3TIbL9gv0xjygS/Dx3wFJDWi6DBQgswKa9DMPU QwJVb7tkncRVUFJRv296aeFkwC9HO5QNlp6CTpIM1e+QmQbn4pqvvtTX/pdUnVIN+q5CWhoFWtm 0qR7eIuQBd53rjWxP8CcVAtROzDjLibU872bKUyoqoMg6u9nJxU8UrZEt7xoZZf880QwmRdb3Hh
 r2qHvLnegza2HsLtl3KIYqM1uz4sVkoxKk31t6P7PIBg9v4wVPfCSr1c+kI6TmltY9LRsztl
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6808882a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Fmxu-n3unZiJVhQ5pu8A:9
 a=sTv9GnvjkS3YtaKz:21 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rQJaeBGFLfqlFLfOaoC0952qzvmiXApo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230042

Gentle Reminder

On 4/8/2025 4:13 PM, Souradeep Chowdhury wrote:
> Add device awake calls in case of rproc boot and rproc shutdown path.
> Currently, device awake call is only present in the recovery path
> of remoteproc. If an user stops and starts rproc by using the sysfs
> interface, then on pm suspension the firmware fails to load as the
> request_firmware call under adsp_load relies on usermodehelper
> process which gets freezed on pm suspension. Add device awake calls
> to fix this.
>
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v5
>
> *Added more details to commit description
>
> Changes in v4
>
> *Remove stability from mailing list
> *Remove the extra tab in v3
> *Change the commit description
>
>   drivers/remoteproc/remoteproc_core.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c2cf0d277729..5d6c4e694b4c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1917,6 +1917,7 @@ int rproc_boot(struct rproc *rproc)
>   		return -EINVAL;
>   	}
>   
> +	pm_stay_awake(rproc->dev.parent);
>   	dev = &rproc->dev;
>   
>   	ret = mutex_lock_interruptible(&rproc->lock);
> @@ -1961,6 +1962,7 @@ int rproc_boot(struct rproc *rproc)
>   		atomic_dec(&rproc->power);
>   unlock_mutex:
>   	mutex_unlock(&rproc->lock);
> +	pm_relax(rproc->dev.parent);
>   	return ret;
>   }
>   EXPORT_SYMBOL(rproc_boot);
> @@ -1991,6 +1993,7 @@ int rproc_shutdown(struct rproc *rproc)
>   	struct device *dev = &rproc->dev;
>   	int ret = 0;
>   
> +	pm_stay_awake(rproc->dev.parent);
>   	ret = mutex_lock_interruptible(&rproc->lock);
>   	if (ret) {
>   		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> @@ -2027,6 +2030,7 @@ int rproc_shutdown(struct rproc *rproc)
>   	rproc->table_ptr = NULL;
>   out:
>   	mutex_unlock(&rproc->lock);
> +	pm_relax(rproc->dev.parent);
>   	return ret;
>   }
>   EXPORT_SYMBOL(rproc_shutdown);

