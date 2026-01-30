Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7083335CB7B
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768535; cv=none; b=NcfoCboTh7QNGJ3HTpwBAReIzTMzklG/RxgYG6DR7ZLiyjeAWB5YDZvrfQ3kYGXR70BCm5B1uqz532dGOsQweTlIZHnICA+OheDrJ1W528iAJEB0UMoZqUH1pd2o5Lku+qydz+alUyclyPI7VdqxvJGfkOUm5DL/VnrJqh71yC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768535; c=relaxed/simple;
	bh=ztPKY6XHM3k4XQpFpIWxSk64jJzvQPmSjuIlXhvrPdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CrEw2iILGhBU2XKMvmTl3G9Yxp5DtRNwnwzF8TnCtpGESLMq+3jnqrxOqcuEZuy8/VplFZBKqAeryvsHSlTnjgJ0SjVc6ubnqieWLs9xPzHADjjAwrNxwC+j8P4IXacboSkSKmCexF2RO8WSeHhPp+Cr9MF20qg/kDl1V9sgGZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIHdHt0u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5I3qjNh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIHdHt0u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5I3qjNh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9V00v2675381
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 10:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IhwTqwGQwCpOE8eWbIm7gM76YBPrk4H8irWBzrqY4UY=; b=lIHdHt0uJdrM80OB
	b1TJkjQbFhYQebFv3zSrp6+FshK11m0WtJEmvnwHnBKCX5+1+qFyk/Cn66vShW8d
	NTa7NoeATPjE6b4wwOaAFBudpypWMAEFV9f/hP5tl5v8JLIjoIXF2bVqK2MHOFWt
	aviH1J9r9P2Bo8R0D1qvDyKr/yRaapMat6AXsTkoDvtlvmhUwKXbk4nxbYdmpvnG
	/3NbKu9nkzCQhHSbpzQXqv8OS34nRE4uBg3PmRKYfqSwLY3MgAlanortAzb7Ol3k
	A9tXj2/lYSulAc1DN+44xqAaAHmPefAfmcPH59XHIIJ7yzU0z0YeWD82PN03qh6p
	LIQXFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t3405ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 10:22:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7177d4ab4so11480885a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 02:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769768533; x=1770373333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhwTqwGQwCpOE8eWbIm7gM76YBPrk4H8irWBzrqY4UY=;
        b=P5I3qjNhe/RY4q0Pco5mk1FL3Rx5hgWBRO6wb1WaXPN21PTsrk6RpZXtUUjbedrsCo
         rwI1CrH6aLoS1nUSglCRo/buNE+mSKDvHclkdk3ITBBbgJ+Yc5ATwpu+5/h3206Y1CSz
         Y6jeCOxlgtMT5GyvjKHeXHYMJF0YPZJmtCenstPShHDiPO4y1ttQzSfZidEErRiGm4pK
         9geKTjtT7Zw/YrDrNZiugKOaQvGpBQkAX3PCyDxJdzF/claJkDeBdda7jWLEbxT+akPE
         aZIZDl5lbKHI1xmbCUiwR/vluI67RMWDQvHGwpTdnxrH14dmzlkgraFhOh9kNUktPOix
         OlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768533; x=1770373333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhwTqwGQwCpOE8eWbIm7gM76YBPrk4H8irWBzrqY4UY=;
        b=qRoTWqBfFiNmkvfzyB64lQul9r8O9htyHrYjHuhdKxCbyPw12KHvgBx340pyk/Zr6a
         7UL9WvtTDU1R/wobEB6wjlnrg2UH/OWFPFAdRNxGUPEPLd4mpUW6sA/JW96Nnxr9TYow
         rEcCOsIp+rMlk5HHHzqa3v51VT0fEPpG/xCpHgl4W5K4Y3Il7P0CNDuoc2Hyzua4bylb
         kNrfkaXefxPR6nvDAl7M46AUd48z4VjKCu4lL17VvL8zqLuH+rQ4vMZi4yr39jzvpQxb
         BzcfHHlTYG5AD9tzstQKBlXRo8ibQuJAjyY1j4xNxqeL2W6fj08Mp5WUZyGDLDYkttAU
         HjRA==
X-Forwarded-Encrypted: i=1; AJvYcCX2EsWkKfSAYa6ocgU3dghmaaLFlzoCXzIil088DNYHRDN78rMjtfDf1gBK5ZlPhVIkB2f3AozS13cXQ4ZmjzHj@vger.kernel.org
X-Gm-Message-State: AOJu0YzP5GCwmvLQKE0c4dhKmm+05dAPm+K+5lAdv6MSxUMLp3Zaobyx
	B+6MF/anwISQb7T5qcD43bLdmljP53Br21EsyO+X5ra4cMvcKdpMO1hn19gYuQCuyNqVWfPeDvY
	PmeX5mCRe0xK3sOVk+pz/TQZqNJH6s0MGf7WAmfXApeJDOiIIjLJd7HII2C7BSx8cd8xv0rsz
X-Gm-Gg: AZuq6aJOM/iEDKEgB0EfGcWZT0XTo4MMsodoj8f3zIDO3L4YSmBvX5Erah+jafKZAEV
	i9NiRXB7j64O0VV1dqIMZOpmSIS9vJVwqj3j1VoW595KOLQIzlPc5evpRQIQ4WW1ZXQyicdnM9r
	PO/TLY7KZktuxmCRFG/nIfymy8ClBeq4jJZUlbrNJJrSTKOzNmsc8s7M9uW28Tx4ZahLuPe0HkZ
	zKpOOTIY2wz1DBnJuKP+q3kcZsmnW1QQOHKE05IgOv+E/LmQn9oqFS8xNpyk5889s+zSN8zkZnT
	WNaG1YZos+g1yahkYsbpvF9HRyWA8Es9uETjpK/sZ8FBtmF4DfkarspAnvy/zzFyS/wsfUv/Yto
	smWwPsxJfJ/Rt5PXfVyQsTUJpV8WtkdWjGvJTOzL7fnoamPxQg5x/+R1wZcdUkfQZo0A=
X-Received: by 2002:a05:620a:2550:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c9eb265908mr236754785a.2.1769768532826;
        Fri, 30 Jan 2026 02:22:12 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c9eb265908mr236752085a.2.1769768532365;
        Fri, 30 Jan 2026 02:22:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b42569c7sm3750765a12.4.2026.01.30.02.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:22:11 -0800 (PST)
Message-ID: <473298b7-2b96-4ede-99f0-2fd5407ce1d1@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 11:22:08 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4MyBTYWx0ZWRfX4jZ/54xSgHRr
 OW1PTisG2q6erneTjaZX2R0f8fkTOxtPeXTiGDial+LG9nA5DnRjs+8iOkTPIiDK7ofWnBBiXa4
 qXTdA1ym1t51jLMpf2lVUndTFjYDetvzOrKktkYXAK5EYdtS9jLR1RVsWzGSY+umx+Zn8cm1wJ4
 BxAuQvmlVfnP+95E6bofsec8UMDa/uYWbAsipfbZRWL2TE1aWdS7mdEOOSXQsyJv+0B3bXLsNVW
 YzsAyw+MP5KaHosM3QHCIzaXeH2gsZ2t+nbZrhPUW0rm0Az4oh+nPtG8miw9wx3ciyS1RGgj5c+
 T5i+SV1EMv5nN2yq4LTOjTWTS0SAU7HetNcWPoRikZvzuL0B+QbXyrWnUtFFJraDY6OyzFLpRnp
 ZxbieBzW/ZzJMSTvmWJa1tuACMKZkFBf7yo4xy6n8O+6uZUj/1IvtkerXsCGkJDmh9SEyxYSw49
 xGn3VKjiveZzzW6DiRA==
X-Proofpoint-ORIG-GUID: pShp3jntg2EnbfeUp3QTRHHMTYgcq3rH
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697c8655 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=U3Ut5sJg-URQ3oAxDygA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: pShp3jntg2EnbfeUp3QTRHHMTYgcq3rH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300083

On 1/13/26 10:20 AM, Varadarajan Narayanan wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v8: Swap the order of the items in 'qcom,smem-state-names" to resolve dt-bindings-check error
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

