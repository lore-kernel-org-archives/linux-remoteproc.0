Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6262450F2
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184378; cv=none; b=KGTkDNTfNw2e0v7aqtOrcN/GMT2NsSdMmpgRVsFDTxw77OM0hYApWsTUlaFoQh4TXHDiBO+LJ1q93kPwtDdKjAP3wFIskuYCskpL4uu2ysberkHDvrmpQCrGd8dw6ZYqeFXzBJxVWWSrmTm+qb8uFQvl0+8+UAJTjGM7bqaGwgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184378; c=relaxed/simple;
	bh=ocwk98ebP18x4J5Gue7LXL3yvqHWJ7jrGUYf9KdE/aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XErEMMyMR/O1msNUuFkeJuujzTac2NISSCBp7LqfxJQlOsftV+WcacEx6C+ZN2abXmYll3LwIHvtHhXeZwo3C2xqscrX04gq12/5DTRtu7WJBDIvoAYe/H+dOfUzViOeXQCXz3ZNnNlOYWWXl3qf20NEP2VbB2MpH+Me4Zo1Teo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mf8BWIeK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADB8MoYd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mf8BWIeK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADB8MoYd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV5NI7F3541042
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 12:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4f8Ohw9RlteCxQUZWgjNwsvJ9mz8ifExO0etY46Zc8M=; b=Mf8BWIeKAvQe/vR7
	XXcsyrzDDeXRbGwbyIcvrrI+8xxscN5FGGqfKkQd0BL1RUa8cEBVjVIavnIANnst
	4R/vlv7ZrOvS5z45YaU2cui7dYJWN011Y6rboAMo9BHyuTrAQBQJvth0wNNqT7IK
	UR/hAlSHab8yfhDWTc2dSqBWyxBvKyFrh7GtERgKOR2Ld618G9eB8MRInVZ9uwFp
	b+wT55CfXP+PgbD5FG6U/9IUWQgg/Rb147EYHh2Zfqwcfbhacvd4GMaXCbGLoTA/
	lrb+nsR979AV3G4e7l6WK4+8NqFVAGpBswPgdE7DpcQf/0cSfYGy0E2QMWXppeau
	25fZMQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88ykhnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 12:32:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8887c61412bso37080896d6.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767184374; x=1767789174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4f8Ohw9RlteCxQUZWgjNwsvJ9mz8ifExO0etY46Zc8M=;
        b=ADB8MoYdKCGEQSbhJufFlBeaH9Ec5k/0S825nBfEO5pILruOhca+LbzrOVUeDMqASX
         K34FVN+4OtgU/3LKwGjqtvayXhsXv0wwMkbd8iu0z6JCy+l5JYycxIU3NYkKoFN+4lny
         SBzJprFzHrVoElkGUdfEveq/YyrG9jVF/b/gNESaOfgq52fXgUXDBLCFKOTPbwNU1395
         8GYhG9PYInYRe6QmphyYH0DwBwS/ZqWxcIy565+/biPvLqqoflsXN+QBGvQob1Ryyubs
         S2xgyNt8c4qdHLRE8GFy/QPFeXgrM1SUX20QcH9Lq4eJFKOQZmepM7s/pWKfz3kkiCH3
         4MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184374; x=1767789174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4f8Ohw9RlteCxQUZWgjNwsvJ9mz8ifExO0etY46Zc8M=;
        b=eDyNSvno7YFhY1F1v8jHSMmCpm+Y/GwLliQWB0iu3jLb8O87vzXnGP/7/qyySe0GJy
         28ZEw25SkTEAfrB0bK1cLv3NwC3SAAXRY1YCMCJGEUmqLBZPlwNuMz/C8hT+jjCpYXvd
         rkbbsNHIGJabB4ixVY0gdyIu96SGhijTv+mFy0cpik8IhzHv1Os7lvVNbsyoPjz67sac
         imJWk0JzocU7ch49ico52f7lMItJVF/h641jVqzSa7K1+1AvIxWs9eVZ+G7U+yuCRSzA
         RiF70cLMIb2RME2e4VA+NyaAQY/H6oetUc//aewZeUAmWCL8i+wk0Ws06rOQQfOVig0n
         7Mwg==
X-Forwarded-Encrypted: i=1; AJvYcCX9P+MTsFNDxN5/QA48dSGdbvGt1gkQ8pX2FwUbpj+OkAK1I/zrKm8dDnAaQO79BKYNkzZKMAk2vPJA7wNFSyC+@vger.kernel.org
X-Gm-Message-State: AOJu0YxZcjTzcCEPFApf1QKh27JyuhvVB7R46VlVTU/wPSLfXQk43cdM
	OHXWvpea8Ygl+/mSp9+YnpImvqsC5W5rLaURdsRgQh2aGcx3lIZeZTWkRKP0m6Zhr9Wz6SdX5xN
	bpt0YXEWZWxCzghNN85WdwHW4UYpgPVDkA1khsHnfbkPfIdRl/Cnzg4jwxlAtKUUVIz2MARkW
X-Gm-Gg: AY/fxX65dm/2N1q2ZxONQBT8xm5Km9cfelx170aA2SwVhFZh+dO9aqiEEL7J6q6p4nc
	IrgjD0AewYzdzc7fk3OCY9RlUa2S+BHF7PX9zUj0umMg0Xmq65EH3JJFJgZS16d3r0x2gaZ5VG0
	WEeVEXSrzHrlwsJXUq+qsT2Uh9z+SRj35Poao94xbK63sUbQ7k9qN5gWpNSFR1QwSNOhBq1+L9A
	HX3lvZIL5gO1h3LM1nRzAmiBzR6LCyFPF7259T3UTAb+1NtVp9QnkZBE06nInuH36Ausgzxan3+
	KkbVXdXv1EXyIJK8bLXCqdDLDegC6K/QbuGHnKMrv0AcuQHeFImgHwDsPfxdR0J4XHnMvAQZP5+
	HhvMIsx1NWvvXLwvIQ/Q4FvFuaX/HuUr6rJWc238m3RrUGr3+gXiT39Q3IjLIs+Q2lw==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr407672111cf.8.1767184374617;
        Wed, 31 Dec 2025 04:32:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlGFbMPjijBA1sn/PHyiGytwNZHCVbgS7+Ai/QZREe094f4YBz9CVh7hBVFNBuxiBhBIr4AA==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr407671821cf.8.1767184374182;
        Wed, 31 Dec 2025 04:32:54 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f519c0sm3908703966b.71.2025.12.31.04.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:32:53 -0800 (PST)
Message-ID: <4ffc63e0-ffbd-452f-a5ec-2a5b2720e66f@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:32:51 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
 <20251219031010.2919875-6-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219031010.2919875-6-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=695517f7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8
 a=s3MJbU7F5wKsRGJXuN0A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1ruyV4XcbMxmqVN-sz9Y6qt26Me1v6aN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOSBTYWx0ZWRfXyy+07Flu3un4
 G7O3nubwGzee3Ut+V+sQlnF0lHvZAFxM67xoKmhp8+J3rm5iQf5HE7f5qt7dW1+4Y0alfZ3eozg
 oIV7/2nWExNCrVX08IkRUApBtvCxvY8lGCClj43Agfp0ZeBAzuR24N/sWcznfdJ7K/F5eIKs3b8
 lJSZIUfspulFrdunZmqtHxlFOgFXw9xChAwGCdYSCfoUsNWjjdDFrbUNvdl1UnSFPlB9z1NvzBO
 aJiN+9n59jab6+YMMaCfnCIhkQuhfd6awIu0bt5t0BOgx8IydFnTytt4NE52w8mkfOJI/SrpEXA
 jXdK8ibXFWq1yTyCy2HvAyhwWKsV18AWoKOschpusLfXYblO06AflrUPToSRiHlg/QwBLwyecDh
 EOcl8a0xVoofknKkupbJiVyo2zynumu0KRSYmK6rUFIKquahX/3vgPSIACMx3nKkCQ6KwaJSzHw
 ET7Uq0M43s5iNi9w2Dw==
X-Proofpoint-GUID: 1ruyV4XcbMxmqVN-sz9Y6qt26Me1v6aN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310109

On 12/19/25 4:10 AM, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

My rb was lost somewhere since v5

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
