Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B4C12F5A5;
	Thu, 22 May 2025 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896415; cv=none; b=MGEgzyJyFj+doHHVFHrdmBPWo/wAWhHAFraripTHeDcc1EUD69uWJ1ocZMGqyN8+7/ICKhdeWoVeKcLaA9vglMYWZ3IekL4Omjp4B6sEsBh+VIsxTwTkhS8ppsTrQmc7BOPozNKvM2ovU39FXWG9/suK8F9s2ZHV3ZOroP7Q4XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896415; c=relaxed/simple;
	bh=GntJ46Pe7OL9GI/++GGxztMdl1ZF1FnVhVklUpvl2HI=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bT1Ql+amdqV99jbx0qH1wAdnNW2lnvCHaecLO1mA6+ODiSbnty6Ui8hBcAddDuNBm6bXf6q2BZZUOvRJqUM08d6OoFP6RweRmDG/sAiWkVGuGD2nUi2dFnja0wKqOscy2wdfa3fo97r42NIQWMTWEWAnZr/2Zv/dvWSZmDEPZFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fZ9CViOj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fZ9CViOj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIUrH9029931;
	Thu, 22 May 2025 06:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYC0rzIdZxlJJeGf6OrdPUKmgETi+Xr2+QL01aSGH5k=; b=fZ9CViOjuH82jasi
	Qi4jh6zpb8Xg0dIvHlLpXAiL2zDTWOD1L4vDVe1JHpxaG7Qmr2etVfuvxHxJwBsH
	ZNebRTYt71YcXqjKCbqH7ikAnWJNo7n/WHZXXxs5AP3kvWQ+t/QRkqQzgho4A5IR
	qpd80hSjHsl7JHXMJIYYGa4cSviiF92PO5TUYWcivXT2fmiqTviY15L89xWmfF9x
	+MyH0QCRTsTwe/6Q5D+DvxB/oHTGB6YamMs2oN23VMqt0sTTG2Me6N06Vm2K6n09
	4jSSh10lPpn47DMbPWMSaXSIpZG7QYwvbebP0umx+ju+oQBcHiRMJtdyVwE7a+mJ
	3O8LCA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf45c2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 06:46:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54M6knnK016781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 06:46:49 GMT
Received: from [10.218.49.64] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 23:46:47 -0700
Subject: Re: [PATCH v5] remoteproc: Add device awake calls in rproc boot and
 shutdown path
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250408104317.926833-1-quic_schowdhu@quicinc.com>
 <91d8efa0-c61c-eb17-b6f4-cb9804e5fff9@quicinc.com>
 <cf3fffda-8d88-b962-398d-d038cd10b981@quicinc.com>
CC: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
From: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Message-ID: <fde458da-5f44-7947-f746-270b9ecf2991@quicinc.com>
Date: Thu, 22 May 2025 12:16:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cf3fffda-8d88-b962-398d-d038cd10b981@quicinc.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA2NiBTYWx0ZWRfX8zewmwTo5zBy
 3McAB7WnZg6WNjjoBvctL4hHXvguDA0VBwyE4ysMb+/426u1eQhflwSzUX6Ldc8S7n/2xTOK16M
 vGaqgCjny/0I36vAWsR7L2JVCbs5woKbnWMx9pUT6W6rL5Pfmvnoh4nDog0PKBPhXegDFdnmNIT
 Dw5dyH2eZn686cM+/CeziThJtUyfSKoivJLtsjKyFEbZr/Us5+J+cysFn5c6SmvcmMtjN/buhHW
 rFWxMwJ5hHuesrATjaXfIKkqiWjkYYny3CjRx7MshnIZUMHRbqo3rh1/qnZNkkw7SitiqZQGH3p
 cYIjCDO1WU9LnHZZZ2nmxeinRVjvpMV5IjlVEGAXr7C3mF5m29q7Hen/EqO9EnjI3E9Y7sREAr0
 yejpyHRqt4MC+vgC9O003IPb6KQUlJMnpUx8xxawhgFLHT7wTMO+6NgSblANWKa8az2vRtEQ
X-Proofpoint-GUID: UPjDAgniazdh4w5HozastPh2DpawPt81
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682ec85a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=N659UExz7-8A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Q4YDo1DU0dsJeT-W-eMA:9 a=pILNOxqGKmIA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UPjDAgniazdh4w5HozastPh2DpawPt81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220066

Gentle Reminder


On 5/19/2025 10:54 AM, Souradeep Chowdhury wrote:
> Gentle Reminder
>
>
> On 5/14/2025 1:03 PM, Souradeep Chowdhury wrote:
>> Gentle Reminder
>>
>>
>> On 4/8/2025 4:13 PM, Souradeep Chowdhury wrote:
>>> Add device awake calls in case of rproc boot and rproc shutdown path.
>>> Currently, device awake call is only present in the recovery path
>>> of remoteproc. If an user stops and starts rproc by using the sysfs
>>> interface, then on pm suspension the firmware fails to load as the
>>> request_firmware call under adsp_load relies on usermodehelper
>>> process which gets freezed on pm suspension. Add device awake calls
>>> to fix this.
>>>
>>> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
>>> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> ---
>>> Changes in v5
>>>
>>> *Added more details to commit description
>>>
>>> Changes in v4
>>>
>>> *Remove stability from mailing list
>>> *Remove the extra tab in v3
>>> *Change the commit description
>>>
>>>   drivers/remoteproc/remoteproc_core.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c 
>>> b/drivers/remoteproc/remoteproc_core.c
>>> index c2cf0d277729..5d6c4e694b4c 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -1917,6 +1917,7 @@ int rproc_boot(struct rproc *rproc)
>>>           return -EINVAL;
>>>       }
>>>   +    pm_stay_awake(rproc->dev.parent);
>>>       dev = &rproc->dev;
>>>         ret = mutex_lock_interruptible(&rproc->lock);
>>> @@ -1961,6 +1962,7 @@ int rproc_boot(struct rproc *rproc)
>>>           atomic_dec(&rproc->power);
>>>   unlock_mutex:
>>>       mutex_unlock(&rproc->lock);
>>> +    pm_relax(rproc->dev.parent);
>>>       return ret;
>>>   }
>>>   EXPORT_SYMBOL(rproc_boot);
>>> @@ -1991,6 +1993,7 @@ int rproc_shutdown(struct rproc *rproc)
>>>       struct device *dev = &rproc->dev;
>>>       int ret = 0;
>>>   +    pm_stay_awake(rproc->dev.parent);
>>>       ret = mutex_lock_interruptible(&rproc->lock);
>>>       if (ret) {
>>>           dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
>>> @@ -2027,6 +2030,7 @@ int rproc_shutdown(struct rproc *rproc)
>>>       rproc->table_ptr = NULL;
>>>   out:
>>>       mutex_unlock(&rproc->lock);
>>> +    pm_relax(rproc->dev.parent);
>>>       return ret;
>>>   }
>>>   EXPORT_SYMBOL(rproc_shutdown);
>>
>

