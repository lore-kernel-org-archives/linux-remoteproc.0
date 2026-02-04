Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9018F332EB3
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Feb 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208050; cv=none; b=k4FS36Lo5wNkziLKmtp536kI4oXF/DJlO5fQSx0H9+M+Il03Fti4DqPCghNgMKUQcJSDOrW6ElSsaPut6o3noTrKluo9SRtY5L63oAwMklNqsO4Ug7Dd7t3mrjsD+B1M+5/hgYs+j677SsEy67bhEfz6O9S/ktAM36qF+rT90k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208050; c=relaxed/simple;
	bh=NoYePyJeITtDZWLlxbhjjztLmLVupNOCPRBxKEy1RQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k70Axfbu3SfX5JLQiFtEO/yaeUrmVbxJsn431iAqDID3uSydCB6ry46jJAHDE//HdLKs3Wxmt0yZBvLtaVdDs+OmlKwVsU0iYnqf+dRrTKIRtHlEKyzkVFHjzWgdWsnXg3oXGMX8KDwsqDNzf14shoeKyH02FYiHSpnma8DJggc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgdugH8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ym6eHBAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgdugH8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ym6eHBAP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CISGQ1880669
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Feb 2026 12:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ZUN7KJFcQHbFuSjPGjBedNKVJ9a0qz7QZKFlGaIl+E=; b=ZgdugH8oM9/wNysq
	cS80xGS5uMmZ6HV5kL+Utj/tuM28O5RK7svyRzc9Gc+ihbx1uVCEm8wt4Ri6iZnt
	qYBhSmGcYgHgfNXb+eSyGx/c+5H3szmxh3kvxnCtXJ9rTMTwiVG5OeyCj86B/QXg
	TEDC6DjqPGfCk3HyBdV88wC6fHvITLyhpYXCulU2AeaQvcp/lwNhITGcbexll0pl
	r5AlnPPgmCgWOMIOjAdmouH/8YVzLJy1Krnxxz4iBh4RlMdJv9V0s8EeH4QJM1/e
	R0Q0SRuw4oq0CxWed8LMNIIobMna8z308obqgBqSNn4IsTm6aIlejUL/SY/pFkhU
	r/Na9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43n9rey0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Feb 2026 12:27:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c709a3a56dso180851085a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Feb 2026 04:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770208049; x=1770812849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ZUN7KJFcQHbFuSjPGjBedNKVJ9a0qz7QZKFlGaIl+E=;
        b=Ym6eHBAPl0bVsPql3viwkdpnof18opX2r4U/FuMYCr6jCWUzdX/tKZ24NPNv+HMsBv
         l8Pd9GjBAAyGLUMg02jvGal3GJ55VIusH/gJMZadfc3yoMma/JJivQCtsAasq5d45q0D
         VOSZFcQfLKFFOdqCoozFTzpLs4LToQlVlvplJH3n2LRRrFkIv8GMsus6MDgs3FiZTj7a
         3YxogqcAZMzvX3DBaD6u3OYIewfqvPV5FNLg9ssD1dPV9Vuks1KkMEML8NUxdBfUzaCC
         otDnqjaZ/O3Es0ZsBvsSUr1Y1c/cZlj5i6eLCz0WmePvnw3EkjP+ZSgFSjmKTRDtrfrp
         kVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770208049; x=1770812849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZUN7KJFcQHbFuSjPGjBedNKVJ9a0qz7QZKFlGaIl+E=;
        b=hzS6R4Ut+tZ8NSdr3jWg0hQZH1RgrjFg1rmAeTKa385Z+O15lC7keB6q3QFxSZI+Sr
         JvCxx8FOtcyUwQB6DlRMtjV0c9Apz9PkHDq5puZQr5WElZHbJoRYJeLJubzpipdUJM59
         lDrwYWDR1dFtyDiy8sPksFeJTaNCzcTntERfXp1JCueetqIXN3TbiUa8eu4Um2ioQC0W
         7Z4J5Yi7MkAYvnxAxwL71Rdjz0gSIE3BftMCsvegSq1Pg/lDHQ9byT+jqxh3ZPtXJ2zv
         tg23Of4h9/wGuiapV4tpmt2VN7T92XohBzUU1hYNmo5tsmIiIaS46APROumVk+IzxTv8
         HX8A==
X-Forwarded-Encrypted: i=1; AJvYcCVE047SeYBvYqumvbLZ4/YTSkeyxRKFh9OCstb44zris2hoFIZa0S4ACWBT3RA3Nb0bsPSy+nOFUvygsRa88EZZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzhfTs82CUz1XE9D4aYZkCjh9nKbpVzhgkt7dNaMZ9R3zV09ivl
	+izq0lk0WOq2xnFJEhSREiae8wKvAXutOl0VYEEUDOApgogNdNmOPMQSy04Z5s6qv/SmUs8hD+N
	lf3i5un5sjLEhtAbZ7l80EYwNnPgURh5liXNlTWDpo7XOOF/tGaTlkCaOBqSXlTrCI0tJkAvGna
	aEX37U
X-Gm-Gg: AZuq6aJFlJAAqxI3IqKvM92Cx01+EcI0qidq7h+csrUp4msR1h3x51R0THiLSyFU8BX
	AKPdcgDRaywsNEZcaZ+cxLqiiGkTmRwRTWoXNmgFCyDTkvMzbPaFWcDROosGRVmL9x9bljuOECm
	aldt0nSPsZwy21F1bRZ0ilX3yiXA8Ao4CoN0CazmSHKQHCfGOYrRwSFZDergwxdYt6W2xBGUzAL
	TyKjmVrqc85niMp84xt579DSj5QtVBnDBWqx5YSLf89BJEoPREn2BGlqAqNyRd5WEcJzbqTQVCF
	bq7JyEjVbp9eNNFfkzzwI1Xow796wiAdrpTdD49qziCpbLSMGhaq2rmWRRc8BbAWPjJHvpvucIM
	zp6+5VQGgVzhebipZ6vHE5ZnU+fOR58GrDWgh7aHeXSd6AlSipcuZ7W26loGqA85OU/s=
X-Received: by 2002:a05:620a:4614:b0:8b9:fa81:527b with SMTP id af79cd13be357-8ca2f85b2a9mr262848585a.5.1770208048708;
        Wed, 04 Feb 2026 04:27:28 -0800 (PST)
X-Received: by 2002:a05:620a:4614:b0:8b9:fa81:527b with SMTP id af79cd13be357-8ca2f85b2a9mr262845185a.5.1770208048142;
        Wed, 04 Feb 2026 04:27:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8f17sm121235966b.12.2026.02.04.04.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:27:27 -0800 (PST)
Message-ID: <17896786-5984-4ffe-9f4d-3c352b583a63@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 13:27:25 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
 <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
 <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
 <aXv/W2CDvixANtIx@hu-clew-lv.qualcomm.com>
 <52c585a7-bb57-44ce-bb95-6ae9d8d99400@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <52c585a7-bb57-44ce-bb95-6ae9d8d99400@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5MyBTYWx0ZWRfX6T1Mol9XDBOn
 LGz+IGUP9olaqdKywTsgNCSLHa1PCkg8nTPhcyRlJVRJnLRzq0sJzoxNfotFfWPIXc+tLfCluE9
 E3aeH1/1rBjDLWcapRpM1pbaZk6YP7YniFyD4XRcu3gMqeXX/AEiNfrwNSgfYbQ7GoqhCnYZR0z
 Hvel9LT5kw+Q0B493Jq1KQXF+eU7OGIp1H/wbkpbRjAKYzHFbc5HZLRo9K67pnYAeByxFoq5xwy
 QHS0eIo9MKRMmbx3sc51k3zJkbQ/djPC3Kr1f3aGnNR8H/t9cCVmjRfFsmk+h9r0xQI7qNmCLnM
 ojWylPz0OUnyJEVfHSDyqFnewP2RwE9PIgEcU24dgoku0LWFDpt85kkLbUJxInSkGZc8FXm0l97
 wrjK/1CdDclrcKa8I2ZoWPe8jRKUNFEY3tmKo2dvcooxYEZJ1dpHLtmSfAntori/rVDS4JKDzFU
 sDfyOsfv08aMrXWTxqQ==
X-Proofpoint-GUID: MW_oKcgDsDdyHgK5j_krUseQUNhmdleb
X-Proofpoint-ORIG-GUID: MW_oKcgDsDdyHgK5j_krUseQUNhmdleb
X-Authority-Analysis: v=2.4 cv=b42/I9Gx c=1 sm=1 tr=0 ts=69833b31 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6I_ioz3amzGIYnAhojEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_03,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040093

On 2/4/26 8:21 AM, Deepak Kumar Singh wrote:
> 
> On 1/30/2026 6:16 AM, Chris Lew wrote:
>> On Thu, Jan 29, 2026 at 04:26:38PM +0530, Deepak Kumar Singh wrote:
>>> On 1/27/2026 6:25 PM, Konrad Dybcio wrote:
>>>> On 1/27/26 11:38 AM, Deepak Kumar Singh wrote:
>>>>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>>>>
>>>>> A remoteproc booted during earlier boot stages such as UEFI or the
>>>>> bootloader, may need to be attached to without restarting the remoteproc
>>>>> hardware. To do this the remoteproc will need to check the ready and
>>>>> handover states in smp2p without an interrupt notification. Create
>>>>> qcom_smp2p_start_in() to initialize the shadow state without notifying
>>>>> clients because these early events happened in the past.
>>>>>
>>>>> Add support for the .irq_get_irqchip_state callback so remoteproc can
>>>>> read the current state of the fatal, ready and handover bits.
>>>>>
>>>>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>>>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>    1 file changed, 55 insertions(+)
>>>>>
>>>>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>>>>> index cb515c2340c1..c27ffb44b825 100644
>>>>> --- a/drivers/soc/qcom/smp2p.c
>>>>> +++ b/drivers/soc/qcom/smp2p.c
>>>>> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>>>>        }
>>>>>    }
>>>>> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>>>>> +{
>>>>> +    unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>>>>> +    unsigned int pid = smp2p->remote_pid;
>>>>> +    char buf[SMP2P_MAX_ENTRY_NAME];
>>>>> +    struct smp2p_smem_item *in;
>>>>> +    struct smp2p_entry *entry;
>>>>> +    size_t size;
>>>>> +    int i;
>>>>> +
>>>>> +    in = qcom_smem_get(pid, smem_id, &size);
>>>>> +    if (IS_ERR(in))
>>>>> +        return;
>>>>> +
>>>>> +    smp2p->in = in;
>>>>> +
>>>>> +    /* Check if version is initialized by the remote. */
>>>>> +    if (in->version == 0)
>>>>> +        return;
>>>>> +
>>>>> +    for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
>>>>> +        list_for_each_entry(entry, &smp2p->inbound, node) {
>>>>> +            memcpy(buf, in->entries[i].name, sizeof(buf));
>>>> Is there a reason for this copy at all?
>>> I don't see a compelling reason. This code snippet is same as present in
>>> qcom_smp2p_notify_in().
>> My understanding was that we do this copy because we don't want to do a
>> strcmp on memory that the remote could change at any time. Maybe it's
>> overkill but I thought it was considered good practice and as Deepak
>> mentioned, it is similarly present in qcom_smp2p_notify_in().
>>
>>>> [...]
>>>>
>>>>> +    /* Check inbound entries in the case of early boot processor */
>>>> "in case a remote processor has already been started"?
>>> This i can update in case new patch set is required.
>>>> Konrad
> 
> Are you expecting new patch for this update or current one is ok?

I don't have any more comments. Bjorn left a review on the previous
version so I'd be happy to see him ack this

Konrad
