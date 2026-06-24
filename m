Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE45A223708
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 11:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301640; cv=none; b=r7qpnbG3Tuo1WANu23RCmrvDNw6FC+cGD91atBUb4mOt7EsNfxuWleaomEyHX0Hwt9pUxKQjNExsnAWYJbvLN+S3p2x5PiO4vWPNj45ZGK/kg5A0MamqbkBBQ68OKcJqMbV0KnmR/7EkXMGN2SumjkGJlOALmMMxwM96/IrcYwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301640; c=relaxed/simple;
	bh=m+D2Ojfh7y2W4IfWhV1bnkOXK2cyeKGPtIt9xTv5Rkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8VRsRldRGzT6+q24acIA9HRSTd6fjG75M4LPbSLEKHKibGIMbWbpke82U7NGxK1b/tRhfPqwkOhmc41eahH43sx5ZrV4nDyBRLqj0zf24thYAjAH/mb+Ou6xYLoRaREXmo8jOs7MJ03zwpdXISAH42xbfKz/nNDBojB5AFPy4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJtoS7QT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+oMECoG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJtoS7QT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+oMECoG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANmfM4180623
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 11:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5rGXAB1X6Zoy3PV4+JclHBHuvTkW+lSntNrPMGPmo0=; b=VJtoS7QTmjlblt5a
	0Vp0WIWI/qwiYPZIkT8JdvhcAj82SgaETXuS+uTALGptiqawWymcm7vX4/H1++7u
	+r8MXBFllLH043xuA4CCu8+G0pNTCHt1anzUN4IVWVgn+lsCVm2jLRT/3z6J8vRK
	bZy8CGYIWmw7gOjTsGYdUC+nno3GQ+KrZovpavtp75s2+Zq6nbd+xBDFawR+QEt0
	5w2TnkAtqrf8ZhkuZDE8AcDAqBIVDTjMw43iw101wbv37VFcogyRse0gDvlrKT5G
	HDnRqEsqd9tFW0zKrIAXAYM4Vf8P8E45g0DDVQYtozN90i74aLR1Knqh+kjOSKLO
	C1rHIg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp91fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 11:47:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a07295d67so3138511cf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 04:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782301636; x=1782906436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5rGXAB1X6Zoy3PV4+JclHBHuvTkW+lSntNrPMGPmo0=;
        b=B+oMECoGog20wv6NwPW2BbK9ofUQd+xOrI2NuehNA9QBUJ3tUwCVMrobDtJPxSZzjz
         xY2pNbiH2UupA3wq8zrYmR9vdIxn6UHVJxcxA2Vqg0YF7gds+mnI2bN5KPk49Zdm3WpR
         rna0ngqVspoqMl2fvXXPWGewkwMPmG+hvi/YtDbU/0eeNehSQWINPz4NpYtrUGhaVkDB
         8f04RmOJdyH+O3ruAB78VxDbGMtUsJLlJToFce1V5yEXWPY0vzp+gwNf1J6dY5l9d3YJ
         /1HLOQT5XinyEZe7So+Xy21AZ5o6MgKGEaOUswskjOSwz9/JfnQ6H3VuUp+QfS67XvZI
         PkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782301636; x=1782906436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5rGXAB1X6Zoy3PV4+JclHBHuvTkW+lSntNrPMGPmo0=;
        b=TOyWJiG42dWWVW7apg/ANZNjfGou6DLswVrPjUJWDLB19cjMemp0fa4HyP6T3SpHE+
         z+ye0KanMg0cXXn3H0R3XYtGnNW9MjD8QQhON5gDmwUjS/YeQBf0KZs6PvBFnsZ+yclK
         vJfPrIICe+R+le01uOwW3wCBYN8dY1ld4oiCZg7mTA3KNyZAH43H5UzyqA+MscJmQnAW
         gxjqvCd9fnYmwZElBEralBo+XPPD/wLHiX5IgKEQBXdhcsz3/DNW7NF8fZ09Er94Z8i7
         S47qA41IFmj0QpLM7rPDMekXybkstLF2cj7OMtwWqsr7rwQgHalXnKGzTXt1xslN75tV
         JJOA==
X-Forwarded-Encrypted: i=1; AFNElJ9ESiKVS/oA5JYiiHndB92vkhyuTVrIxtie9gD4XoE2k6ah0UEnMd0hRFiHmcUFlzrIyRH4cQ/xl4rI3YVScZQY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr7JAPxx7lgYakPI2TrDlxmqRcl+Z6zkpiLFbgfbFFuL6RcPVb
	0dgpxhzhlkGSz5GtsI+2LiDtez9Eri9VMUu1FOOlMGAx1Ou0HvF7jWblB+2ggimB2xI5vqGjx0/
	8SmF2Fp85RlWLA/BUT3PIEiKKYXxypA4F5nL3KNFY4ReeLSUgUQgDvMF+m9orrnxVBbHhVLjb
X-Gm-Gg: AfdE7cnarqm2J/5C1dmOVplxKXCmz+fVP6FVLpaovBnQAgAGmN5ncj52tvsAQZKfAaa
	X3MupV2+H66xaejVgThgjPMwLtc23Xl/wKjTXM+z5f+a7pXiuUJns+GjIJVFQ1MkXsTyCl49xOa
	hEEbx41vjQL3kW5IFcvfuB8v1hgmpB0V+JQwvFP4i8Fy5WNTOmVXgRBvdh1tbtVmSt7ZkAFYAIh
	mut/+nYaQ+iFzY9IWJpUGg1bVbOoMw1GTynrrRnxstyS6KZBZ5hfRZjJxbtBHY8j4KjNKFPAV63
	vlz/ed2wcJCxwOOs4ykUFSuzL8Q04kPgH5FJZyH5V+PTfEXYQX3a6Rj025P9e4DafM9GVpfdfvJ
	dQbIOzxDjW8WjXNJSdhJwdGl/fllJNInJVDs=
X-Received: by 2002:a05:622a:489:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51a4f502a89mr88876671cf.7.1782301636088;
        Wed, 24 Jun 2026 04:47:16 -0700 (PDT)
X-Received: by 2002:a05:622a:489:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51a4f502a89mr88876511cf.7.1782301635696;
        Wed, 24 Jun 2026 04:47:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd44d0sm977210a12.29.2026.06.24.04.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:47:14 -0700 (PDT)
Message-ID: <7fbaa271-1eb2-43e5-bdf3-ff35dec3bd40@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:47:13 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] remoteproc: qcom: pas: Drop unused dtb_mem_region
 field
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-6-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430191253.4052025-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jtgriL_0Gp9uYlRGJRHrhWJb1i_nvUvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5NyBTYWx0ZWRfX53RGvVfWAPZd
 /jhf6xoSjvuA2dwLq/hYu1bEec7I8NMGvGiU8/hkWZPOzdi7AGV4VA30mQD4FnIeMaBZ7sm0yqY
 B/ehUWpTl0UJn5UfGAABJJObGuE89Kb27g6Pm3zxdiI3PWLjRgxOjRQ71CLRoCMPk5wOc/6EEWu
 dMJaMJe/BBN0ofYJ/ZhXmSvLC9z3zo034RR9829CvvsVUMHGZsOaCFdM4TR1lS03QYK2H++I9F9
 jSgwqEE0rlMw+twt6+hs5xzL9MtcFjUa8IESvwRnVKRmdMQ8uyl+CBn0wXvFexURhl1/ejlgla4
 nDdGuxvagofKLOmIuarGfz8QV/9VFvQdOYlwnbxkkgvxsz3iKiIBxMGyO4vSbUeyiPIa1nzJf9S
 nZ4rZD0nboOyWDwdaUuS4AHEDPv8ig==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3bc3c5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=l34an3bRNhP6mDLsExEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5NyBTYWx0ZWRfX2hEazVFV+zLZ
 4xJtsH1qAplnhfPRatLGH+hGcYtPnDqSLEv4+4kIZRn2tj3oW7cTUE+4OH8I56+sBHTACj8Kp2f
 nZLSgj1Oe5DRoIVcZaJsD3i/c4LQFPk=
X-Proofpoint-GUID: jtgriL_0Gp9uYlRGJRHrhWJb1i_nvUvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240097

On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> dtb_mem_region is no longer referenced after the ioremap was moved
> to respective places where mapping is required. Remove it from
> struct qcom_pas.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

I'dve squashed it into the previous patch but it's ok

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
