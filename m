Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21C62561AE
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 May 2025 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450763; cv=none; b=ibuuLK5YvoTV2rLmwcEl+TYx9ZPN9oS1vwsXk4W16bLNkIAtAJy5G/f8xs3Uqy3pgXHDA1avpfoMwDenALM9REUOwY+s1abuyK4IvRvhOevLVOFFWrAix6/DPb4NgPQaiYOkW78idlEbONIKa7pF8GuoaaJfCJNkBCCWADoBQ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450763; c=relaxed/simple;
	bh=USF+sNnBEJKQ1y96l81A26s3nnhS4sYU9mA8l6FJcj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nox7YUjNGaUOAS4Y1YPbq+9C/VntQDp4ZgMCV8mfhluIbvMhl8ZwHzqf5p8FG0wZv+m9QalnpLGeiOz0ARN2CKgTuOy7mrKB6nGNtBvF+50cW05oRFNYS1r16W/xSfPRDNXiq7+DwqrYcf0nwMUdEKN9A+mlo30k6sODjuIY6/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hARKPk25; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hARKPk25"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545Bgq0g023465
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 May 2025 13:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgGrNXXTksvJen/Mk1Biwc5pmi1abVHe5nBBkizEdEs=; b=hARKPk25iTRhLQcq
	qHqQ5jtR3CdTqLJbkVMvIw0kMJLSjSe3/dhPm7EhV9jlSKfKtudd7vNFaivEjLmn
	idqPezgr77PjKfV+cnYZQrEj+Y6/2z30kmGU5lQkmNzQMpVTCEO7c0rDTO4tO8Cr
	aQfEbdetzu2PHdE48NcLW7VdIy6c+dhGjtuW2lBaiv3KD4aj5iglni8WZSdea76X
	0YJEPCYxYbA3tO9vDg+Xa9o+Sc/iymxrsSS48IRHsu62JO/wUOzOvATtf2LeYn8v
	qOLhl0AXunRrN44jbV9v+G6WWHL6V9A5M1kXykMOBUvKTq5f5I5z2lB2ZbA1u9dQ
	vRIgEQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep49fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 13:12:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7377139d8b1so3373640b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 06:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450759; x=1747055559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgGrNXXTksvJen/Mk1Biwc5pmi1abVHe5nBBkizEdEs=;
        b=vQUnGNZ/aXtyUijDmiSpeJhp8BZ1CzDYQTFEcHHFTk/GCBfWWo1KrYA+HCshxOTk0I
         CNSoyV6TNvSDwG/ILmtj4xOjRk2XcsiFvziW+tHAaC7J3ATLAqR5aliEXK/55rRmfrft
         hvlcN7yLAt/d19dIG9NO0swPluQ4Q+ZlwJtFIdCpAfwn92Z2oXHawaieqBpv5EKVX8rh
         J5vIdqo9OO5YFOQ26Zn+Rd402MwNmvLHyx7glXz/fnt7A8a0UvKK3aQyPciOc585rZcv
         YKECkC6/Sl8vyr05lgickEinLSNe0iC1+DJzRR7xKFFlF0jVtvrGe3JAeQfwuMKyCQGR
         ubLA==
X-Forwarded-Encrypted: i=1; AJvYcCVn/ATRfPLfpHDuLRgTIUBwUsZNs77VMsXnH3PQxc7MZETGTmeQo6cIm5+a4YhZTHWRdzZshJzT3FsFcI9Z3HPT@vger.kernel.org
X-Gm-Message-State: AOJu0YyNdO3BPQS/aPNai3ju+Km+Xt2zlXXUC9S8qvfMwD2lUVrYQWkR
	8ahLbvRVtBSTl2pQjyoTCG/W1TJA6B/FKI3f0m2eSHhBFhT71rAMPfanBJjXNmI4CQMhhse0sEC
	Ux01M2sLN8QgoDhj8AfrLPDmvXGo5H8QL74E5x8oJhL//VG0fxXJ2mozJEtZYGHBOAYOd
X-Gm-Gg: ASbGncu/u9SoJuRdWI+JKLgyNryvB7FgeV2vCCuAUNbcvM6G6XRt2AP8zAVH+fvkTyF
	FazHlSQHsFhk3/bHWUH2x0B4s1ZaFytFjl/gOc4FfYw2xLBtO7wCkVtI9UAwkDyJf76TmLZWuCU
	e12ldqjy/kdQss15G1tqqCfg0t/1URuEtURhPPdxXTlVnzF2/pfCX81259NaqjK6cbUISBwWGqO
	pz77GV0hjhLCNmS+uleOIfuaW8qfZuXGd1+h46VQSM7LR1BvepidpNdB7ePDVFSjOmssrkkU9nF
	NEOIiKTZu/sG1eTECJur/dMB3RgG+LwC8cPbWKOs
X-Received: by 2002:a05:6a00:8d96:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7406f08d250mr9121701b3a.1.1746450759025;
        Mon, 05 May 2025 06:12:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqUfiCSwWdQe5qpNIiS7x7TI6ViUuKuy6cSCxgbpddLVSOvpIaIj/adAo66kYzDkz5Sxxs6Q==
X-Received: by 2002:a05:6a00:8d96:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7406f08d250mr9121657b3a.1.1746450758599;
        Mon, 05 May 2025 06:12:38 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fbc81a1cdsm4192894a12.60.2025.05.05.06.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:12:38 -0700 (PDT)
Message-ID: <b2fa60fb-3312-435c-a216-f217428ca683@oss.qualcomm.com>
Date: Mon, 5 May 2025 18:42:32 +0530
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
 <538b32d1-c7b7-41b5-aa93-d285604d1f05@oss.qualcomm.com>
 <9e8c9de6-19a9-44bc-83b7-5947bb626962@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <9e8c9de6-19a9-44bc-83b7-5947bb626962@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6818b948 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=HF60lDfbR_BPLWgDsHYA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mTIVM2k2hQWOC9GSgIJaoXs8bOAf2YgK
X-Proofpoint-GUID: mTIVM2k2hQWOC9GSgIJaoXs8bOAf2YgK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyNCBTYWx0ZWRfX9BSqeJPpTCMB
 1qVzrgxN5cADfHF4DtXrKttyt19R7EfaIahkBokWYb8JYZ6VtaljYxhyYgMyb1neqUkzALtx134
 fxVS1AxuDtBhxRJLtC/YwrDC2pGTgQwE3Gi7GjGmItoK7Y6dK+sEFSgE9KPQTZi6VaXYN3WBWGy
 04wMKoIumNpjfOmsW/Eh1mTQA/sTQ5AqdYGCzUKNNhUtSU1KQimVp9euJNpvapJmswQJ1nwqCbW
 8JNfm5nt7CkyveCxyDLNx/9PG/5T6HMYHJTJTF1gsPT48AvTI207LgFnFpYHXAeeTY68sdhmQZj
 Db04E79mew746JDzDHeZqD7BSBJZeNk96p1dH2R/+mzQtpnf5/mAUZheDGCBIrAyzqy0xM1473v
 4PYE86UFtPFeH1VWw1Bn+iXeP1b4raKH8ssgliqlV2YY0PJIPdWb/jRVml+/tdYI8BwlUbcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=558 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050124


On 5/5/2025 6:37 PM, Konrad Dybcio wrote:
> On 5/5/25 2:30 PM, Gokul Sriram P wrote:
>> On 4/25/2025 5:17 PM, Konrad Dybcio wrote:
>>> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>>>> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>>>
>>>> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
>>>> SoCs support secure Peripheral Image Loading (PIL).
>>>>
>>>> Secure PIL image is signed firmware image which only trusted software such
>>>> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
>>>> Peripheral Authentication Service (PAS) request to TZ to authenticate and
>>>> load the PIL images. This change also introduces secure firmware
>>>> authentication using Trusted Management Engine-Lite (TME-L) which is
>>>> supported on IPQ5424 SoC. This driver uses mailbox based PAS request to
>>>> TME-L for image authentication if supported, else it will fallback to use
>>>> SCM call based PAS request to TZ.
>>>>
>>>> In order to avoid overloading the existing WCSS driver or PAS driver, we
>>>> came up with this new PAS based IPQ WCSS driver.
>>>>
>>>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +static int wcss_sec_start(struct rproc *rproc)
>>>> +{
>>>> +	struct wcss_sec *wcss = rproc->priv;
>>>> +	struct device *dev = wcss->dev;
>>>> +	int ret;
>>>> +
>>>> +	ret = qcom_q6v5_prepare(&wcss->q6);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {
>>> You abort probe if wcss->mbox_chan returns an errno, please rework
>>> this to use if (use_tmelcom) or something
>> Hi Konrad,
>>
>> do you mean to use 'use_tmelcom' variable from driver descriptor? If
>> yes, what if mbox_request_channel( ) failed?
>>
>> or based on wcss->mbox_chan, should I set 'use_tmeeiihcckgddglcom' to
>> true or false and use it?
> Add 'use_tmelcom' in match data and then make decisions based on it
> if the mailbox channel get fails and use_tmelcom is true, fail probing
> etc.

Got it. Will update.

Regards,

Gokul

