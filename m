Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E64221D9B
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 20:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745612868; cv=none; b=Rvllr2fzZH72rRwHQHd8ttEsEx5aeC1ap6KVcB/nBT8b4FCJCWUTILdQbzAuqRK5UzSeWSyd5U9fOjcG+vq3IaeWnk03vhGVHr62ZD7Uh5ZqpXhfZ2Nz0NWpEQBaCJCcJHwT/B9EtCFQBQOqvQmHGuLWrD2rAwJgFz0GqOzBBw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745612868; c=relaxed/simple;
	bh=Bp/8yYVQpxs9p48lraKkfl/ZtzLHL9fRJ4OuscV0zs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kw+E2lpVVnuZahe1OeVUf6MhlCopuA4JOtWSvGjEcDHh+L2/uRCIJ9joK7slgaM/U8w+t7BkHa9gZdtkOCQjiJCV8A+Od/+1IXXx27ndf29GaQnURWxqa96x0wSg+PonmhRyZt4O5NnpSLWBZm2/FlMJ4IUyqd3G0Dl8y3x0PU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRJBMi8s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRJBMi8s"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtH0011069
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 20:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4EcgRHPewAtUtbp4yexVOTr9c6zfgS93HtWDULPfMI=; b=QRJBMi8sa3zWTigD
	39mttphbK/k+wvwm0n6lPmmuITeJjueN2GI0How103pLDSpS9XqzjiTyju3X3Ced
	2vwqcC+RA5nQe3i+3xLdb+wNIObwgHZPd6UEcphfkshaXkvF1bwT9U4BJpcAtQok
	GZbOUWLTp385m9I1O6TuWWNV+/jASkShpMlwYR2PCNNpvjI1qQmYVG+T/UZ+mX7u
	FrPmRsYtAXEB4FcaXuuT+q3sF/2BTOZVYO+VOpVnhnJvqcD1D4yAduRNZe8gWQGs
	CjmLYSZ/qHgNVFgU7ElZUSfsMHegMUaof05RYSYEhiRhikhiEosnpKNvg/sTUVl6
	tzO+7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jcwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 20:27:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476a4a83106so2065501cf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 13:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745612865; x=1746217665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4EcgRHPewAtUtbp4yexVOTr9c6zfgS93HtWDULPfMI=;
        b=iS9icTtXdAz8VSzH59LV4VSGG4949eBnCql+xIvYS/5/zQ5xmd5pCnHKpzv97welNv
         FaFuMw78V6nzGLf2Pu+8GMIijC5cwj7NZptfANtvb4LLBSBSHpYCbm94Jn9bQ1tlLzow
         FzJngXbaQMvIl+9nCoWLNGntW7p60ighVgvCNgc8i8z7UAjYMek2yzde5lQl0itA/QbW
         iyYhFRKiXpjDU2L5Of8HGTKMKseG39Li7IUrFh/kZ8CBIu2FEFGoPbctFMuV0u6CHHl6
         hZ4TUx+t5Z1op+jadKuKg2JZuboPER7J0bR9Q1M9XDRR7Tsj/daNYb32/v91M5WUvwAk
         Y/7w==
X-Forwarded-Encrypted: i=1; AJvYcCUf6HEuey1aEytkmiNNUIeFzMxR6lfKN4wzae7soLcBG+2t1KrpESXpSjVJLW0vMLERXu/+08h/MGdak10RA366@vger.kernel.org
X-Gm-Message-State: AOJu0YzvGvmTUdWpFMtqK3FafAzyrp9a+81bFr3yWsm49lI8VjzSi1rn
	8D/wP91PaOfnb6yVDhgvbY8OAW2fa4z0ZWxhtNulclV3Qg3wlntIgWFacPgWHfTLKafksrNGdY9
	ajmq5UdKw96xAscZN7ffM4uPMHHbUkg5nxQ6lUxYer+LJRp0hOgqunXcnq66cKWRlWLcEmgVYJz
	x5
X-Gm-Gg: ASbGnctzTzkVDelA7/DDLhn/+w3QmBLjnAl0CiBawVbOkBWWxdA1Mx/r7jkqR+EpCnb
	Ex86SY2hZw67bp1UKUeghw23EwRVmDWEh5lK2ED+51xrHsXxcVkfuz3blhN582DRMjksWJFjOZv
	fF8mc+RbQQ0cf1rN00zSBRsEOUmKf3/In/GgX0PKJlIAvN+l1lplGi34IhZjQAz2irUg/cPbYh2
	18T9CdkGFuqPUxynNiOV9b5Ly9XjEAUbfFgCljlCzqugwcNaacBHY9D/BlgSfUwMqv+M6Ala3Ga
	xbPErvMnb6LjRg/qN8qSXrI9avr/idJGW3qgsyhdgkfFDGGm/Muta5qKdPW3VknoDZw=
X-Received: by 2002:ac8:7d8f:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-48019432c87mr22456221cf.0.1745612865015;
        Fri, 25 Apr 2025 13:27:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9v1JisejrtijwP5qeW5Pm0wWfpGfc5yQL9pJrWn69TJ9TdWlr4f7hVwQdgScSmqEqvvXw/w==
X-Received: by 2002:ac8:7d8f:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-48019432c87mr22456041cf.0.1745612864720;
        Fri, 25 Apr 2025 13:27:44 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1d34sm183290666b.185.2025.04.25.13.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:27:44 -0700 (PDT)
Message-ID: <5a17d866-a459-40c8-9e3f-90bb1cdbd846@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:27:41 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 5/6] arm64: dts: qcom: ipq5424: add nodes to bring up
 q6
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-6-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417061245.497803-6-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QrR3L7GhEKRnv1AzyJNtEQkDjGKDQyOP
X-Proofpoint-ORIG-GUID: QrR3L7GhEKRnv1AzyJNtEQkDjGKDQyOP
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bf042 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ngdhHd9oJ9b5tb6U8IEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NiBTYWx0ZWRfX2LUUHhINOcZN IveYr9mguG1IRAdNG1AFxsGDZLHhlTCf3seedoGSlnRlioAnljXipCmiLTMzx8Ri3Zo/fFDpkFC +crd1UurrGvtKjgn6NjsnbdtW+efkRDpMLl53V27L8hIhM5ntH08qeeXxxOgfBOTDjr2/2kPWNH
 LzjrNoPaXSkTV8sqyVxGY1rOzl8hlZbOjNy9NrfZzcLL/nDvEKXYuLz8wwG4U7mIFKqXyGD4gTA 4mh1XEBMAgUrOGiB6zeSWokv0lcsn2/rFD2MYtR5VIyfZyF3BIIQg/RKTlDTNot3w2rDe2fh3FL oNdpUS7YhYBKN+oFXWQL9gT+scl/F1QRrBXe+w/QFteAJBOZlPs37xlNx0/Gpu0G0fm214EYAPS
 lQr4AqusCjI5+wPFrvZcQTKcG41ky46cLrtPysAeI70uMxYxUMTavCGs/KJusYlHAf5HtlNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=761 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250146

On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---

[...]

> +		apcs_glb: mailbox@f400004 {
> +			compatible = "qcom,ipq5424-apcs-apps-global",
> +				     "qcom,ipq6018-apcs-apps-global";
> +			reg = <0 0x0f400004 0 0x6000>;

So either the offset in the driver is wrong, or the base here
is wrong

The IPC register is at 0x0f40000c

+ length is 0x10_000

[...]> +			#clock-cells = <1>;
> +			#mbox-cells = <1>;
> +		};
> +
> +		tmel_qmp: qmp@32090000 {
> +			compatible = "qcom,ipq5424-tmel";
> +			reg = <0 0x32090000 0 0x2000>;

0x4000-long, this should be much later on (sorted by unit address)

> +			interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;

I'm not a 100% sure this is the right interrupt, but I'm not saying
it's necessarily wrong

The rest looks ok

Konrad

