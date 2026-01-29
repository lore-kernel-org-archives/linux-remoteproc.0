Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3084385506
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684206; cv=none; b=cJ1W6axz7i8vkNzs9XajEqCyjcOZ0x9LFvMNh2wzqc0KA62AG0QCLCbZqXJ5tXDwF0SfaHGlnAeuXcxaI+fZDjcSr+bFXv0BxnY9SvzlJpimQGXg0PkPGbnm0lv/wK1r00MzsvV8CabDZUn8gx4TjN+PNytyzvkrNCSwxNY+Do8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684206; c=relaxed/simple;
	bh=NftH4NbySuxTwiS3x7VPTmzHnoh0WpL/QxwCqSDMyvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLelERHEFZvdQeNPDBwWRBwjlPi12FlvVWerW1ih2JSDhDvwNHxY7RWCyPSv1NlYwBOs7J/vVoBKlYd1RsGbGadkhMugjbTh76jxpzqOk+6wpBLaPTwkk7p/wX7qhPn5mRQuWpisc58RERgInpCbXWg5FYfk8a9O9yk+qC0DekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fe/0YN+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VT9TtOW3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fe/0YN+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VT9TtOW3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TALADp3676045
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 10:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+70wOe9GzJyEZl1jsTNS3cNPpQOsspWrv2NzcTlOHI=; b=fe/0YN+gbNWgLrb+
	rVRwkg9k2vWOD7p4PQrUolrDCEs+KJnAi0ruzt3Rpw3NMK4dBkbqw3jlhRCWobdP
	xszs2zjf77mY4eVYgLc/duduE54abowqX8GaKHLwhT6aBW8kK+td/uNhZMAfcZ+i
	5z4URz4V+quOh0EG1+GvnnG7OFYSceTRSr0HngyDGtsoHIKTBxvnsWMz7Vys0j29
	IqFlOdvjqNFO9Txl0WLCjiknX0L8nGDxBWylDfXhNc4no4hO1VwNZwyK/+Uqn1rz
	Lhx/iaFL8mgqsPjlYqFHY1drMyt7FO4RTC4pr+2Y0BnAHpI0mJK6m+T53tsiT4Y6
	hZ6R7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05q7g3cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 10:56:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a76b0673dcso8341265ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 02:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769684203; x=1770289003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+70wOe9GzJyEZl1jsTNS3cNPpQOsspWrv2NzcTlOHI=;
        b=VT9TtOW35ZjAETEyeOHzwhJ8z7UGnJUYOUJSckWZYNQplDNUg7aXlMZ/rdxNGpMNXz
         Kqwt5KUetv+sGz1lq+nDHco8cKosGkotb94Z6/Xe/g0xkhPR8lHQzKkILfZVN9avmEo8
         TSj+smGY0if1B8qqGLu7TEwfMgyBg1KO5SlMOiJ9h37NxQaze0cBl+dv/RuAVLSX6WwI
         NXCmIwQA6WSyH9Rvd8JNt0jXCg8/bbs2YFc/GIFdHT5/CXq/K5dA9I/Hrzw4520Ef8Hz
         PXCfXjSwbWQIMqRqSiWB1HEvxfqbE982I/wycCxDYEgVyTBrRcAZWv/MQCNHfv8e8kP/
         1J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684203; x=1770289003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+70wOe9GzJyEZl1jsTNS3cNPpQOsspWrv2NzcTlOHI=;
        b=ZsSxksNH6VSs/jgSsag/1J3Me07yNxgC+vItr3YyzRZnfS6fn4N1OlhE5zZJ3FXnNU
         Rlkh3GOEwZ2Ghibw16TkFtAjpRjkPQQWtl6k7MUIePsB4AENAmZBm0xxN9HOHwbPNvJX
         dqDicdlBwXL+EJki0SdIR/B1BsgA69nA81KiCckjs0yVwI2os/6q7Hc7vJa7PcYTltC0
         vw2ExlqaqzTdKi7q57OfgbzvwHDQZLAyHdXEBo7EOy84u5/ko9V4JBnUZ9knziVQWPlW
         9nnJK/a9acZAGO5O0P0LGaGrjdmvxEmYHsK78JgqQtDsbo5qnYwk59KknDEP1e0cVOPy
         LL6A==
X-Forwarded-Encrypted: i=1; AJvYcCVDbh7CHhUxhRcdel+CWLl4E4+qZ/PLqsKE46zujQL8HqBtZNgoCeUQsIzjX3q42YhpmZN/4N6i/0gGeyS5IO3H@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3F0IFdiVDSG2uWq848Nic1jE0H6l8FcQF8G5q7Oa2ybEKYbY
	cZOE0X8WK5UtP0XS/Mk3mydVC41CD5850jd1nGwnZGwXRaN/GCA49gy0G/9wWOBs/q0FYr0lQzg
	855kjq8rdGZAHQxF/OKCaencDm5LKystI8DiGko+SXRFCgRI3jpi5zFPC/Hn6Z7qZqyF2A+t5
X-Gm-Gg: AZuq6aKdQl8b2AfhOaUvfsMPcaHGr6bDxvp/d5UKRcKTZC/Qsk5fwR5/eiiySRGfcLE
	aPp/gOVN4dcLd/WiyxXZScJB/JyDG4tyzskJN+LGA9peAU96Hv6hMVkdijmiP+SYJcHAnltnwcW
	gTLW31LSb3EYRhk1/tLseNeLq/fF+jhgD8AmsadHw0NrPdcbqkgveef4y9k3vHYG8dPVEMsw304
	DdnmCSNhJZVDorfKdED549oSYLmjVxOc7I2TDRsOU9DmpQqESD8l4H0d37xIEhmsjqWqDU4oxnX
	kbFZjzxmWJUCsz+FIOGvjq90+NihxwBXe+yqtTb92C9MQtSI+LrayrNW/GnSR90PaYDEuv6aW1L
	XCS9lO6Ao5Ty/Vgz0ktgVZKgOTARklUAr0JF7ypw=
X-Received: by 2002:a17:90b:4fd0:b0:343:c3d1:8b9b with SMTP id 98e67ed59e1d1-353fed6fc6dmr7148482a91.19.1769684202951;
        Thu, 29 Jan 2026 02:56:42 -0800 (PST)
X-Received: by 2002:a17:90b:4fd0:b0:343:c3d1:8b9b with SMTP id 98e67ed59e1d1-353fed6fc6dmr7148465a91.19.1769684202472;
        Thu, 29 Jan 2026 02:56:42 -0800 (PST)
Received: from [10.217.239.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6103e9fsm7877407a91.2.2026.01.29.02.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:56:42 -0800 (PST)
Message-ID: <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 16:26:38 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
 <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
Content-Language: en-US
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
In-Reply-To: <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qeDf9Uszliu8EKB-fLZI00UmYSPml697
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MiBTYWx0ZWRfX4xrGaJBgG2SQ
 5vD9RD+a6KP4yHxlAoTLW8sYNUhHjoTnsdClyBm8Tb6TMYloGHlqh1Cvquu54IH+cF+egv4XCKa
 v8siyVkM824fAi8s9PGxSRxqGaNPwF9SrJ7Wj0Lisou6lbR9pFEr0GKNMPitL2Y0+MUmM+dhiS+
 hqyBQLnGPsDyWBzJMWLFxOKSFA5DAYiBPc3Lxrkmi4v7wmTKwlkXoVRPjgO4UJkb4iI4hmHDv3e
 90MiiamTeaw4z75qKrkHK0dPWvWcXjWIIbEEuUhwNhydW1SbhELHpH+Bm9SRLbbJSN1h1u/cAi/
 CehQ3DXSt3RXG2qsFSK8aAaNFZHOtRgatNIUp5RqSVVpApgw+B3NilN6EolAsVwiulZkmLdMkTc
 wxIh6aUEllPIWuCv1dK/gfV3i/K4mEkokqdlAeUWuA5S3eMrbGun/iiC9CRT1lWPTP8LQmmT7zY
 rUxmoCwznaLP7QQW5Qg==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=697b3ceb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eYfYLhE3UDMrALPLOrsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: qeDf9Uszliu8EKB-fLZI00UmYSPml697
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290072


On 1/27/2026 6:25 PM, Konrad Dybcio wrote:
> On 1/27/26 11:38 AM, Deepak Kumar Singh wrote:
>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>
>> A remoteproc booted during earlier boot stages such as UEFI or the
>> bootloader, may need to be attached to without restarting the remoteproc
>> hardware. To do this the remoteproc will need to check the ready and
>> handover states in smp2p without an interrupt notification. Create
>> qcom_smp2p_start_in() to initialize the shadow state without notifying
>> clients because these early events happened in the past.
>>
>> Add support for the .irq_get_irqchip_state callback so remoteproc can
>> read the current state of the fatal, ready and handover bits.
>>
>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>> index cb515c2340c1..c27ffb44b825 100644
>> --- a/drivers/soc/qcom/smp2p.c
>> +++ b/drivers/soc/qcom/smp2p.c
>> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>   	}
>>   }
>>   
>> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>> +{
>> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>> +	unsigned int pid = smp2p->remote_pid;
>> +	char buf[SMP2P_MAX_ENTRY_NAME];
>> +	struct smp2p_smem_item *in;
>> +	struct smp2p_entry *entry;
>> +	size_t size;
>> +	int i;
>> +
>> +	in = qcom_smem_get(pid, smem_id, &size);
>> +	if (IS_ERR(in))
>> +		return;
>> +
>> +	smp2p->in = in;
>> +
>> +	/* Check if version is initialized by the remote. */
>> +	if (in->version == 0)
>> +		return;
>> +
>> +	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
>> +		list_for_each_entry(entry, &smp2p->inbound, node) {
>> +			memcpy(buf, in->entries[i].name, sizeof(buf));
> Is there a reason for this copy at all?
I don't see a compelling reason. This code snippet is same as present in 
qcom_smp2p_notify_in().
> [...]
>
>> +	/* Check inbound entries in the case of early boot processor */
> "in case a remote processor has already been started"?
This i can update in case new patch set is required.
> Konrad
>
