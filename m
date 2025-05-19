Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3AC1CF96;
	Mon, 19 May 2025 05:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747632302; cv=none; b=aCM9PLb8s6DAlPOwsm3hjH5YktSxGHZcUc4T6IQKNs6NwV82uJZ1QAId2/7H7oMvf3P2qCc0VKis7KwW/19hzVi/oUvNXsOlB3O9/0Yck41WE/vWPlhfnEr8anZv4hxWNnbHZZubx69xH5jTVahwtGnVeiK5UDLFKJdC+2VrLvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747632302; c=relaxed/simple;
	bh=DcNtTSjJRfPh0JXirryZ/pFXiyFUVCYRXBOF0XJ2lZg=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DvJ1GGvuZ5m/mK1MHgRd0hhgcfuLJ0zU/d8zQXvROsLKN/xNKXgzalc0sPWm729gaHmeXEDtb2DKybc1eI9LmuNrXLs1vCEUK4wBJwtIZx/aYA1AY1tEE8BUVVn2RdQIhjTdXUGvyt0Xq3VpeTVxWRqPeHP0JjbyHSeDITB9jNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eIgyNFfb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eIgyNFfb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILb0og017287;
	Mon, 19 May 2025 05:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmZZzjSy/eT0NOji6i3HAopjzSWwfq+/gwsuSksAV3w=; b=eIgyNFfbG9ynjRLg
	Uxv0PFO7QsMyTuHr4GO1dYH8sWynOJoThWFr7SFXR7gpfvxfqgnDpw2Wkeri+fZR
	SZLWQfqkmC9eFVNtYi3ty3fjvpGUIf2oIHRRa8GUZhgachENHq8TBMnYnIZoSbnO
	SHx+3PsO7t8JGXnKUCPjHWy17MpThe3Sqlt6LY3GAotsCXce2hQ9AJAn6v0hH/zz
	uCbQWIJwRC8Mah25OADqhBtFqdILymvq/NWtFiQHJhFsVcIhTMSfVoOEv3OGXQHr
	TLSofz0ciRSN/HKeQbaIjlg1g9FtvtpFpLYe7MDPB42rIs7LChEMnRLlMZbBlDVI
	NJBRNQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyk4rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 05:24:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54J5OtC3026903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 05:24:55 GMT
Received: from [10.219.56.16] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 18 May
 2025 22:24:53 -0700
Subject: Re: [PATCH v5] remoteproc: Add device awake calls in rproc boot and
 shutdown path
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250408104317.926833-1-quic_schowdhu@quicinc.com>
 <91d8efa0-c61c-eb17-b6f4-cb9804e5fff9@quicinc.com>
CC: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
From: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Message-ID: <cf3fffda-8d88-b962-398d-d038cd10b981@quicinc.com>
Date: Mon, 19 May 2025 10:54:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <91d8efa0-c61c-eb17-b6f4-cb9804e5fff9@quicinc.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA0OSBTYWx0ZWRfX8VmkWuwDPg1i
 vy4LX1NFeI7wUs5UzmaWVTEWcsgEwgsdZ8N0IiOorggeXco+JZ6MVCR8+eg5X0RsDuoe412RiNx
 +Tx66Mq0b1dggRU7fLJ8u2acPB2nqwSu+h6PBZb/WNA0gRg5T6+HRsIueiuzQTNwamH1nSpZTuU
 PQ74Y3H1H4ToIxKFVMWwKSy216Xwl/3uNClblqdw2VAHnmdQsPvkKogHcDZIQmzlaTz/YyRRgdl
 14n29L+K+pxxKS3Nc4H9EtvDWulTOPQf3dDVbZZlXlyKWrJQJPT1mzqyA1egkge5ZK/sB5WVdFG
 Vw2/OfhoBlb9UvOUJuq5igFDdXukrN24VjzFhYEAD99vJwSETlgWSX6tyzWyc2Lsz8Odzn/Ixnk
 tVt8CqQ3xM7XiEcrJ3wfn7oxKcUOLKygQq+rknpW4Baww+7p+PNOK+zKH3tweX3LS6GZC2AQ
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682ac0a8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=N659UExz7-8A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=T9jlel3K9Aby5IBUjGQA:9 a=pILNOxqGKmIA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IczBKUOMeQbkjJWOWgIvyHlYuFNNBJ2w
X-Proofpoint-ORIG-GUID: IczBKUOMeQbkjJWOWgIvyHlYuFNNBJ2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190049

Gentle Reminder


On 5/14/2025 1:03 PM, Souradeep Chowdhury wrote:
> Gentle Reminder
>
>
> On 4/8/2025 4:13 PM, Souradeep Chowdhury wrote:
>> Add device awake calls in case of rproc boot and rproc shutdown path.
>> Currently, device awake call is only present in the recovery path
>> of remoteproc. If an user stops and starts rproc by using the sysfs
>> interface, then on pm suspension the firmware fails to load as the
>> request_firmware call under adsp_load relies on usermodehelper
>> process which gets freezed on pm suspension. Add device awake calls
>> to fix this.
>>
>> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
>> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> ---
>> Changes in v5
>>
>> *Added more details to commit description
>>
>> Changes in v4
>>
>> *Remove stability from mailing list
>> *Remove the extra tab in v3
>> *Change the commit description
>>
>>   drivers/remoteproc/remoteproc_core.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c 
>> b/drivers/remoteproc/remoteproc_core.c
>> index c2cf0d277729..5d6c4e694b4c 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1917,6 +1917,7 @@ int rproc_boot(struct rproc *rproc)
>>           return -EINVAL;
>>       }
>>   +    pm_stay_awake(rproc->dev.parent);
>>       dev = &rproc->dev;
>>         ret = mutex_lock_interruptible(&rproc->lock);
>> @@ -1961,6 +1962,7 @@ int rproc_boot(struct rproc *rproc)
>>           atomic_dec(&rproc->power);
>>   unlock_mutex:
>>       mutex_unlock(&rproc->lock);
>> +    pm_relax(rproc->dev.parent);
>>       return ret;
>>   }
>>   EXPORT_SYMBOL(rproc_boot);
>> @@ -1991,6 +1993,7 @@ int rproc_shutdown(struct rproc *rproc)
>>       struct device *dev = &rproc->dev;
>>       int ret = 0;
>>   +    pm_stay_awake(rproc->dev.parent);
>>       ret = mutex_lock_interruptible(&rproc->lock);
>>       if (ret) {
>>           dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
>> @@ -2027,6 +2030,7 @@ int rproc_shutdown(struct rproc *rproc)
>>       rproc->table_ptr = NULL;
>>   out:
>>       mutex_unlock(&rproc->lock);
>> +    pm_relax(rproc->dev.parent);
>>       return ret;
>>   }
>>   EXPORT_SYMBOL(rproc_shutdown);
>

