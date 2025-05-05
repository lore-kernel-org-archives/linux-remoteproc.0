Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71302566ED
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 May 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450627; cv=none; b=BZDcZNqm8K2k1mEW1S/8HkjL+MQXm5obA+uzdRlZzfquGvD4fJkXQ8EzjOicOyN0Aduf7LwDgMWDjCZiUqZbMCKW1s9kSYnEXjV67idst1Lqzcdlk81xlFg/HczT3OFiqhyEOtTaoCsSREAvQcRyFc2YrKpcWaw33S/A9zELiCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450627; c=relaxed/simple;
	bh=YTCE5j4Vt58EgRHFbcLwGaOLfSygO4aNRphxwkS/bTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FidsKM35h+CL01JolldRuPHy/E1B+yFkmsbg/VCAhprkQ6DJL+/pa7BRiGsC54wwOZMefkOPMkh/4xe/ZI0BuLHW6iuZIwaMaPLo89qP2tYiyzIpXmhR59CAxWyd4pL+tMR3176qYTf0UkpkL3fx/pFL21FNPh6ai8Pig5fPwjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAPLltGu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAPLltGu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BoPgG016270
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 May 2025 13:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	obH9j2KjKOnZhN96kr9U6Q1FPkqfOm0HIEhXHEYT52c=; b=OAPLltGugCbx8ZNM
	idX5zOu5Mr/s6ujbhLI/cP1Y3tTvHjQz+yI40s9tM6PVjtkO3VmXaxCS8RJ8fFYz
	yeWIkR7fc3SkL+dM9pdbidMt2+/XdI//6LbcwkEWYx71QOkfZAadlMRmdkGPuMur
	dvH0pR/J0nZ21/Jw68imhTVFYKkm3K8zzg9GlDNXuANN48SoCKG735oZbqM8LYGP
	wBP2HAT/sCsyjIGiSZLODrJeZ+a5JS9AsoKGrKw1tQ6cyJKsfTYDau2j25CMs1WJ
	vxZ6tW7SiHDwq1oTfJkAvOURiU48v3/T1hNs08AHksxJAL/0V6VBQEdhwZSsJ+XI
	TLtUOw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfm1e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 13:10:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74089884644so420114b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 06:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450624; x=1747055424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obH9j2KjKOnZhN96kr9U6Q1FPkqfOm0HIEhXHEYT52c=;
        b=lZUK+2zPkJiiwhP9AiFhgs5TdasE8bewlPfqQZw8sSIsIbdPTQPYckwJPEyv4yQDUX
         19tYxsBv5vYNW6K8b1LEhWguIlZI9TWcTjHOKkXO/1QozkXdFKRoPhbX7IHS/ixtk5D8
         CvkvTwTGP7VPnXrg6+/llGWIYHCHqbGlNaGkoUVbDUpV7Y+6+SJny43iVmItyCjxDed8
         ZLfBHOUv3azbbjFVPcewr34D3BdQA2hIcOlSZRL0k86qLOZwVTAI3PfDfcM+TdNV/9eV
         Bj/abHPPdtE5R6ltGfpu90USQdbph3e/2uEonmLpY6waDMVhIUb9CLF3OepbnjLzzqtf
         +MjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0+4yqZUxDLZIVEoONOnTq9QvmTgPlTvXAbY5vAwdTxUORt689TlRe/iR2x3Bwpy7YHrf2wVWDvNz7w5CcRl8T@vger.kernel.org
X-Gm-Message-State: AOJu0YzTz8mxHGR3/gka3yNGK+C4BElu/db5jl8qNlP9aDQFnxaQ+Hjl
	CJrIoLcTczasMDJ8eHQa9ZpdNR9fbilehOsVc36ikxoeWWII/IO1TtCRtoMHkSWJGiBI2E7SFc1
	wTFvU/SjOeRfbnoC/OF46R9nY8Vb6+x15ONRlesuyhPLBkIi9+2RlCiQe+HLGfhR2+RhJ
X-Gm-Gg: ASbGncud/bFJX/isLU3uqnGupPFGG0O8TniJGM4RrCZE3kltsHELQee3S6b5SzwdwPS
	3/yh57asFtglkwvqVbWDDoVaF6RNAD/13HtpiUoy840+PL9w3kOQCwtMFwHTd7Fbhc9o86PF6nM
	alR/ldNfaLy2vKSgBmHBAAPfHnOjufR+R1LKI3/oEQ7bO5w70tjrnsXf5coDBvHLr8ur42is1bN
	W/LMEi8pwYPftssm+i373xpcuyT+I7bO2k+phvIjfF0rbFz1mJTuEwprjPXYhesp1lAhat1SipP
	OpRghIJkUG+KfUSgEDMjJ8eNfc03nd+xvZm/2vRr
X-Received: by 2002:a05:6a20:d04c:b0:203:bb3b:5f1e with SMTP id adf61e73a8af0-20e962056a3mr10846580637.1.1746450623643;
        Mon, 05 May 2025 06:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuOeYnKLjaWuFtt4/w5Y62svOpcLC03We3EgbRjp7LR9AvfrfZaqT1dG3G2TDp56/FOd1b8Q==
X-Received: by 2002:a05:6a20:d04c:b0:203:bb3b:5f1e with SMTP id adf61e73a8af0-20e962056a3mr10846495637.1.1746450622797;
        Mon, 05 May 2025 06:10:22 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74065720b51sm5144488b3a.35.2025.05.05.06.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:10:22 -0700 (PDT)
Message-ID: <4a8febf7-64a6-488f-a3f9-ca064a51acc6@oss.qualcomm.com>
Date: Mon, 5 May 2025 18:40:17 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-4-gokul.sriram.p@oss.qualcomm.com>
 <72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IP77Wr4-5frgGK6Onj2OWnYuX4O3MbVg
X-Proofpoint-GUID: IP77Wr4-5frgGK6Onj2OWnYuX4O3MbVg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyNiBTYWx0ZWRfX0N55Rji5Rm7G
 xQHGJ6xwlUOiIe2l/aWO8vR+wSmB2luLIIFLmd9Rf3Os0wYgycqrx5Pa00QzXzG+HVgSqLhHj8H
 bbRVMgFCXbpQJTFFSUWhUEmJscbw4r8bXFSkp+eAy7KbLAmwL3fDR//UhXw0CGGiP6iMRh8Hg4y
 L7vLxQRGpL73mr5vhzqdi/FwVvFbthbqpnk/q4r5G7r0pHSjEwF6wvDuj9lZKbT8f/fiIm4ZnQ8
 We3ym4PnpE3H8tRvgpb72+4fg8y1PhKG2hDvbaJ5imx4MCfnvfVF8wuSU6d5pdeQPPNvaq2MfIQ
 XN+LvU0RUviNa2t6YKI4soSqCdQygOUusfMit4SuWrw2cFNPClQgq6oqbR3cNO1YYxw0gLIF8z5
 C1ZgfmYQnX3yP5q/hIAZ4qi61J2rAJNroUIcBcOzIlkfLzQqAoaeg586XwT8id2qEnFGea8P
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6818b8c0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=n4nWiP5vS5Vf-V7KPTwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=703
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050126


On 4/25/2025 5:17 PM, Konrad Dybcio wrote:
> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>
>> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
>> SoCs support secure Peripheral Image Loading (PIL).
>>
>> Secure PIL image is signed firmware image which only trusted software such
>> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
>> Peripheral Authentication Service (PAS) request to TZ to authenticate and
>> load the PIL images. This change also introduces secure firmware
>> authentication using Trusted Management Engine-Lite (TME-L) which is
>> supported on IPQ5424 SoC. This driver uses mailbox based PAS request to
>> TME-L for image authentication if supported, else it will fallback to use
>> SCM call based PAS request to TZ.
>>
>> In order to avoid overloading the existing WCSS driver or PAS driver, we
>> came up with this new PAS based IPQ WCSS driver.
>>
>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> ---
> [...]
>
>> +static int wcss_sec_start(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	int ret;
>> +
>> +	ret = qcom_q6v5_prepare(&wcss->q6);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {
> You abort probe if wcss->mbox_chan returns an errno, please rework
> this to use if (use_tmelcom) or something
Hi Konrad,

Sorry, please ignore the last respone which was unknowingly sent before
completing the email.

do you mean to use 'use_tmelcom' variable from driver descriptor? If
yes, what if mbox_request_channel( ) failed?

or based on wcss->mbox_chan, should I set 'use_tmelcom' to true or false
and use it?

based on availability of "mboxes = <&tmel_qmp 0>;"  use the response
from mbox_request_channel( ) to use tmel or tz flow?
> [...]
>
>> +static void wcss_sec_copy_segment(struct rproc *rproc,
>> +				  struct rproc_dump_segment *segment,
>> +				  void *dest, size_t offset, size_t size)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +
>> +	if (!segment->io_ptr)
>> +		segment->io_ptr = ioremap_wc(segment->da, segment->size);
>> +
>> +	if (!segment->io_ptr) {
>> +		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
>> +			&segment->da, segment->size);
>> +		return;
>> +	}
>> +
>> +	if (offset + size <= segment->size) {
> I believe this allows an off-by-one (remove '=')
ok, will check and update.
> [...]
>
>> +		memcpy(dest, segment->io_ptr + offset, size);
>> +	} else {
>> +		iounmap(segment->io_ptr);
>> +		segment->io_ptr = NULL;
>> +	}
>> +}
>> +
>> +static int wcss_sec_dump_segments(struct rproc *rproc,
>> +				  const struct firmware *fw)
>> +{
>> +	struct device *dev = rproc->dev.parent;
>> +	struct reserved_mem *rmem = NULL;
>> +	struct device_node *node;
>> +	int num_segs, index;
>> +	int ret;
>> +
>> +	/*
>> +	 * Parse through additional reserved memory regions for the rproc
>> +	 * and add them to the coredump segments
>> +	 */
>> +	num_segs = of_count_phandle_with_args(dev->of_node,
>> +					      "memory-region", NULL);
>> +	for (index = 0; index < num_segs; index++) {
>> +		node = of_parse_phandle(dev->of_node,
>> +					"memory-region", index);
> https://lore.kernel.org/linux-arm-msm/20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org/
ok, will implement of_reserved_mem_region_to_resource() and
of_reserved_mem_region_count().
> [...]
>
>> +static const struct wcss_data wcss_sec_ipq5424_res_init = {
>> +	.pasid = MPD_WCSS_PAS_ID,
>> +	.ss_name = "q6wcss",
>> +	.tmelcom = true,
> "bool tmelcom" is very non-descriptive.. call it something like
> use_tmelcom, or maybe flip the condition and call it e.g.
> tz_managed

ok, will call it "use_tmelcom". But can I avoid this variable and use
tmel or tz based on response from mbox_request_channel( ) as in 1st
query above.

Regards,

Gokul

