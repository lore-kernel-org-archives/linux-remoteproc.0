Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A2F32D0D8
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768051; cv=none; b=iKsMeNL51pzaE4MOgjQUlqUCRzWuv8XSUif3X2Mh+1C4pxUKgzYyVUSe4+4t8YgfCYY1hVWyG80pUaZykXD6ogMBgSwdcCnZ9BaTbaMr1IEDPaYrd9SAUsNeOa9cBPtL+hWVGc5OsSULFLbgIxWsjw3vnjgtjVnypUf4ZymruLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768051; c=relaxed/simple;
	bh=s3KF/yQ3BM5iy/tXrc50P5H1OS6kAXhytZ7aZaHZf9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scAFwjz7NFHmfxubBbovFvQC/5icIUWF29KTitXjjDQBfRRx8y9odJJoqzx5wEnKraDKye5/jJuHqbqHzvJUvmlfE3ua/XzDkcLNhgeVGdw3/A/0WU9WR9QKfCSgZ871YJrOvH8sqy4mxY2BGgHxjuEocLL5IFe+7tbdfFaMbYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wd/Ea7y+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeHHckh9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wd/Ea7y+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeHHckh9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U52uSk556130
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 10:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQ7DT8Rq8DEXmVEdKQ1S+FaAMBjjkX+Eb6i7XWBVFIk=; b=Wd/Ea7y+JEjiy3Yz
	G0IX5rWZ3pPtCGUkP5nWjkRKfYu7xFKKlZyNXKUFvaRCJqlDbk8pLtEGTuDxJcWn
	+w4jcm8pZfPDXYgcQYZ3Wq/oiZPQwnrRIm6g1CAdaTFagwt8BuMl3fFUN2NgH0Ap
	rvotqwnnrBbr5s7BNV55qiJ6Lz3uGzRWgRlINB9E7QBzgiD9Ypo5s9HCu9jOp4Gj
	xrXwbdDwZ0u2sQgUhPEMm6q6gR92Kao6wRVgIG956Spss0L/3u4ruUr3lsGfaEb0
	eaNXg2GbYSkHhGSDxWTpvsSJ4ZLOCiRnYJOw5bA+idJCL92cK2jETS2Kw3t2xdM1
	VpgLkQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p59gw9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 10:14:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c53892a195so34284985a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 02:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769768042; x=1770372842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sQ7DT8Rq8DEXmVEdKQ1S+FaAMBjjkX+Eb6i7XWBVFIk=;
        b=ZeHHckh9wEwHTXfYwOoiC/oGBNDDRiappX+92+kANypUQGvia5dIOLv14jFQ1QMhsG
         Aohz5/TMqrpRx/vj5D8UHz94WoHLGHanmhJUwhX1xRNgMIlSvAmPxhvEzk8dEpj+pwkL
         M/kIPGGHQkGXv0swEYTCOlSpiBJRxEhXMy7HqusKjQ0EgMN8WzEz39aF2mUbfU281nLy
         czQfSZXaUf4RpT3Uj2ERuhx1vlkqgqvVWp6Z1s5jfTVJx731k5ia9qjDsNhL/5TQWNzq
         cjvaNJAh2LeM/4yaC0I7X3jkx4CVZxTkg098r8p2fZaysC3oRm/oeYZMpeWohAYXG6ny
         C17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768042; x=1770372842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQ7DT8Rq8DEXmVEdKQ1S+FaAMBjjkX+Eb6i7XWBVFIk=;
        b=p4+tdIWAhupWo/EgrVL6xfQjLZQ8PpBfXwaransBfB+zrTiWN2QtgRuXUNtZZrfAoe
         Jg3LbDuPKUQli/3but8vQhSj5XOwjvzU+0DA0f1wwjirFMytP5p02WZcYhbVPmjyzKRh
         9wq6p0hPNuky+578BhvT8nULNhwjmzDCswMaNQOpWm8Y5smBeokS7Ba7xBC5TGI0H0i6
         YZyyiUFQ28OMlW7x4rqHYgZagva0mBlPU4xNptTA229DK/yHq1exYrAMDIqD0iVLeYDQ
         riaGkMJ9gnIlFMO+w/xdELvAGxXeFK8f01MYzp+psioHo9pv3woj3plGCQeyxcQ4nP+p
         mK8A==
X-Forwarded-Encrypted: i=1; AJvYcCWW9RvbqzHZFYOcILT2qNVBzb7Z8oS3Hfj58Dm0cexI+lbUSRtxUIN5vcYhiRrTkKvA3erdNNcuVkABhiBsvb5q@vger.kernel.org
X-Gm-Message-State: AOJu0YwCM2vK950g1x+HQcuY82mVYTvu6/dGFMQL0ILj2T5oAZ+efEtH
	ZUoHUJe83s+9SOjPJKujPHdokW8vyBOIg7Ha9CUz0rLQ9byt4yT8dWwREbS1kzy7eAzd+7rkVp5
	AOSivXZHyVDG8ZH0mF96V5DYTf+oe8Qt+W2Hm2LhXKe5okkj5aGzKwUcfli89EMBC/rQZbAvyvL
	zZyjKm
X-Gm-Gg: AZuq6aKRPYtqPb3jhHemde2Y9AYDadULnO/ALNJt0wSUB92rsBAxu/0xZeBX/jIvHwy
	OCq39+IXRVjh6Gms1W0Z9yb+WciNg5jwK90Nyl25mDYo1kZ3m70nPTFDJYUtDdrrWpeZIrHE8Bv
	rUQj1IdsdcUAUphlHiMmdvhZNlUXu9qRYY6TEMG1BbTH6zJKfbQwSFdj9OD/+buEDRtk3IymJcS
	6EvTF7lmCxrBmGWiXe4d5ljSj+rTC9QVxxY2WAhjM9FN36ftH9CTICSmsWEQNbgmRlQefOtk2Ah
	ivlR+aTA6ITGWZTxgWFJY6ti6la42+D/RnugfuaYup4ZnkphhT/vtYDx2N5sXRXXXtNlU/IVWf8
	xKdeEISl2BxcfCc5O146P0DPDxoWcjm1GfJ+jV8sBekoiW6NEiYOyeNHweQwLOTj13Zs=
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr245498385a.6.1769768041975;
        Fri, 30 Jan 2026 02:14:01 -0800 (PST)
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr245497185a.6.1769768041463;
        Fri, 30 Jan 2026 02:14:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691e53sm3856751a12.21.2026.01.30.02.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:13:59 -0800 (PST)
Message-ID: <65de918d-9608-43e6-890d-16672305a2b2@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 11:13:56 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc: qcom: smp2p: Add irqchip state support
To: Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
 <20260127-smp2pv2-v3-1-4060b859b1e2@oss.qualcomm.com>
 <1395db8b-c31e-4c09-9b73-30c1e814d769@oss.qualcomm.com>
 <52d01bf9-2d73-4a7a-a734-2330bc426bd7@oss.qualcomm.com>
 <aXv/W2CDvixANtIx@hu-clew-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aXv/W2CDvixANtIx@hu-clew-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6I11f6YDAM7DeWgj8PSBqdZFu3mpseB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4MiBTYWx0ZWRfX4NMN/8klYjsh
 VerRmt82YhiX48Mw4CFhqpduOMuVMLAJqZHZrrZv7f+GFI59ktAPhR9uF3zEvPR3e6JuC3Dnqgi
 CES6TPKDYJTem7yQHT6M+QgCL5obZsLs7UCQDO3pbdGW4U4L/PbJd0PSEU39yP0/I8ED8/RHCpm
 0Ob4Z48gBIu0YUA/igs/SssAPtbm4s4FwYT83Q6lLN/9Q0hJsxClG+DmbbE5B0d+ngI39Xz5W94
 zj2IFR4Vhn5pPdjPYBuIUGlw+10gy+taSvkVEzsUuvHkqD/WOLwMZ1x9viMHWmtQuo0pvnx7mQX
 /fFtNfLO6OHkkII3wAUNuEkd2L/AaoV4orSICEPRUGUzrNsUATwlBoVn8+FY2KF3J66A4VzyCJy
 BULmgQ6T3e6jyCWXrTcs6GwZklerxd3IH4dEOlHA89itm5gZLFphLmp607s+7s41evZIr473Hvz
 EiNLDLm0+Ix8gY+lKzw==
X-Proofpoint-GUID: 6I11f6YDAM7DeWgj8PSBqdZFu3mpseB0
X-Authority-Analysis: v=2.4 cv=Re+dyltv c=1 sm=1 tr=0 ts=697c846a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nPnaW-RSxlbj0giFajYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300082

On 1/30/26 1:46 AM, Chris Lew wrote:
> On Thu, Jan 29, 2026 at 04:26:38PM +0530, Deepak Kumar Singh wrote:
>>
>> On 1/27/2026 6:25 PM, Konrad Dybcio wrote:
>>> On 1/27/26 11:38 AM, Deepak Kumar Singh wrote:
>>>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>>>
>>>> A remoteproc booted during earlier boot stages such as UEFI or the
>>>> bootloader, may need to be attached to without restarting the remoteproc
>>>> hardware. To do this the remoteproc will need to check the ready and
>>>> handover states in smp2p without an interrupt notification. Create
>>>> qcom_smp2p_start_in() to initialize the shadow state without notifying
>>>> clients because these early events happened in the past.
>>>>
>>>> Add support for the .irq_get_irqchip_state callback so remoteproc can
>>>> read the current state of the fatal, ready and handover bits.
>>>>
>>>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>> ---
>>>>   drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 55 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>>>> index cb515c2340c1..c27ffb44b825 100644
>>>> --- a/drivers/soc/qcom/smp2p.c
>>>> +++ b/drivers/soc/qcom/smp2p.c
>>>> @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>>>   	}
>>>>   }
>>>> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>>>> +{
>>>> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>>>> +	unsigned int pid = smp2p->remote_pid;
>>>> +	char buf[SMP2P_MAX_ENTRY_NAME];
>>>> +	struct smp2p_smem_item *in;
>>>> +	struct smp2p_entry *entry;
>>>> +	size_t size;
>>>> +	int i;
>>>> +
>>>> +	in = qcom_smem_get(pid, smem_id, &size);
>>>> +	if (IS_ERR(in))
>>>> +		return;
>>>> +
>>>> +	smp2p->in = in;
>>>> +
>>>> +	/* Check if version is initialized by the remote. */
>>>> +	if (in->version == 0)
>>>> +		return;
>>>> +
>>>> +	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
>>>> +		list_for_each_entry(entry, &smp2p->inbound, node) {
>>>> +			memcpy(buf, in->entries[i].name, sizeof(buf));
>>> Is there a reason for this copy at all?
>> I don't see a compelling reason. This code snippet is same as present in
>> qcom_smp2p_notify_in().
> 
> My understanding was that we do this copy because we don't want to do a
> strcmp on memory that the remote could change at any time. Maybe it's
> overkill but I thought it was considered good practice and as Deepak
> mentioned, it is similarly present in qcom_smp2p_notify_in().

Ok, right, I didn't take that into account

Konrad
