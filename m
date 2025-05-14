Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C391A3155;
	Wed, 14 May 2025 07:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208029; cv=none; b=j6XXe+gotZli1nqawzB6vvjM7AApYRZ0ts2d1vQCLrJ19FKwrujGokuTbdLq20dFT9xvpnfPq65o6Ns/m4EO76i4C8y5o/eoe03+T65BfWIEsP8HoCAxtkv4ZqAYvULNsVDa+QjqwE55qPIgicTcmvGjbsUSsVC2VOO6Q2HB4mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208029; c=relaxed/simple;
	bh=R9qSr7i2b92VxtyO7BqEMoPOjqzU3eE8FayTrU9uz/M=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=eo3iFoFx1MlSzjuil4sQtV3Ot70c3XnT6oGXmDGa3yE4jExg7mfxMNMpwR2ZSsz0UnDZ7/HLi1egg5FbUzMh6QqvSVOYA2TLzBxTTHqQLC5eWbLlOjTeSoCubC5qUIw06hhR6G7/5gXkjWFeVuHTPE2+U/A6jt51ECycoX/CO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q8pfqWhU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q8pfqWhU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E7ATBN000731;
	Wed, 14 May 2025 07:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDcQEMkZpL8Jeu6aKiNe2MFjMOcpt0DukJK1fmuMQDo=; b=Q8pfqWhUggWJRj6l
	4iLdWb86dk77rNxK5xfFsy5CgL792/KDdstkp1i8MAE+QarjQZTuTHhXUrk+b0Uf
	2jWoKQzcP8bEHXyB52oUxJSZGGj3m5fM1zkzrOOZeGrdEbvKaQmkQrfKjkRjN4pJ
	adZ43EJq11ryEQBUoZaQIwlE8BRfCg3A1gQ7wUT9e3sVNoiQoTCAVXsQoC8gRlG/
	Qg4Merp64yJy/+ku6GCoFfPeKi5hEQZoj0MXgo5nL1iklfOLuu3e1ApUGN+zSDM9
	J6KomT4bGG4fu4m5iZWKW9S6v9/TyENwZdYiNwl1CxNDr5Lde4S01HqT1clvscbd
	0O94zQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr9ss9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 07:33:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E7XgJm021455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 07:33:42 GMT
Received: from [10.216.0.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 00:33:39 -0700
Subject: Re: [PATCH v5] remoteproc: Add device awake calls in rproc boot and
 shutdown path
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250408104317.926833-1-quic_schowdhu@quicinc.com>
CC: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
From: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Message-ID: <91d8efa0-c61c-eb17-b6f4-cb9804e5fff9@quicinc.com>
Date: Wed, 14 May 2025 13:03:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250408104317.926833-1-quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZF0_kFr6gdOzPxlarMeNQwuVdD5BIe2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA2NSBTYWx0ZWRfX8Kj8LKa0iSxZ
 NmT7Y0/EClT/JWPflfR6hRcOu/Q9Prut5aPk8obtVt2YnmYEUl43UY1Q5iP4LMjeYWC4XpZpY72
 f0v6xkVaCSmPSw5fKAXFPUCyY/n7eEIic1UQ/elzj2pewZyRnkR1dusGZNecuxGG4uBvh0Jl0+a
 m+sLSAe1TogcP54x9Yx8AvcCRWBKdxeIT5oBq2iEE2u5cSpxh33D8l0z8qd2zgyUWBoRpGpDk49
 l45P6xBajt46z+jlttvfsfqNLRJ3c2n9oba7C4rlJroJpl9AU41sJEFR63Q4d8yDKMCejLuNE58
 p5nPyBhLgpksfYHe14w98GmnTxNJgEgPqGQ/gjr/JXlVF6O4j4tqlNHGTSF+ieq8kia45Cgup/Q
 ha48THCymRVGV+6K2eWo7I5Y7QTbTsy+O6a3k/Rsp7fIjsydKE2sWW6Y866lJyBo3Qn183Ku
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68244757 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=N659UExz7-8A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Fmxu-n3unZiJVhQ5pu8A:9 a=sTv9GnvjkS3YtaKz:21
 a=pILNOxqGKmIA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZF0_kFr6gdOzPxlarMeNQwuVdD5BIe2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140065

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

