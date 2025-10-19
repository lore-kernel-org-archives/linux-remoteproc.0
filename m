Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467071C6FE1
	for <linux-remoteproc@vger.kernel.org>; Sun, 19 Oct 2025 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888231; cv=none; b=V+xzlRKQnUS2J9c8V7Nq5HsIGDotrcU5+YIP9hptqv6+JcruFjIOs8KvByy039R8RcjKCP6onwerRJww53TBD/y6WD8VRK1fEqwnmgqKizSekL/rBepGdA1KcMWhOno6AyD61Dg71Anu4GVXMqk9/JxWjaw5DImAv/MSWJrUNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888231; c=relaxed/simple;
	bh=hEg0Yf5DlxazGnnjSpW/iDt6B0Pv1nMwGAFG4Zj4n4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtmtEbrplXUmcMtb8HCw9EHaE76DE6YMXZIeZ5/Y5+R2k9JphNJNTcpRjJOPeZ6RdlObpGcNPimIsJnu79H3Uz7mbZigIuuE2a4p7JNgOdnXP2vgqkIL6G63IBLD9bs5V8sFggKLfu+mxr4+F0fP3f5DDM4uKJdWgEfArrGK+tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcntXBQu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcntXBQu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J4F2Fg024567
	for <linux-remoteproc@vger.kernel.org>; Sun, 19 Oct 2025 15:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RL1Dojucgmcs5IbhdQTmfeBq
	uHEdKHvcZ4h5XAH9v8U=; b=JcntXBQuK98J117bXuEzc0MMlkGUc+okL818sRX+
	vh4EwV6K30es2tqhm1w7GEpBxPstcAfnqsfZ40cPCHTYrCWpzLPWs/Kc8VgZtmpr
	ovt6s9UslnAxBUsLkU5iLs+DEfVKZTOS+z6htFrbIyO7JHuN6/k91BI7uhFV/T+r
	FfRRljLwdsLn/q5ik8O6rOLDJ5ToDX7MGpQtmQaB69FsvRE1mYaR/5XAiYald9Kz
	QlonOnuJShCQGHcmOnWW5Q+4BqSygTrKL2pW1y10Pmh3pFTWY07utaG6wSVPzWSA
	YwuljvRJ8kc66/HXcrDMvmpH0MwiAf+xGuYg8Qgv3mbawg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3982hwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 19 Oct 2025 15:37:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78e5b6f1296so108214466d6.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Oct 2025 08:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888228; x=1761493028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL1Dojucgmcs5IbhdQTmfeBquHEdKHvcZ4h5XAH9v8U=;
        b=D3wpF3hoQ5vU1sOaTWhcRyk/69leetx+RNNzEjSWGa9iqZyKQr0Zfe87ed2iphii1c
         tpCc2iHaiIioRNVtMY7H+BnxteYMoXIL4fCUiI30WpuG9QnlkdYHTn6ASaRWiIt7xVIk
         5hS6PB0kHTiYufN5FBAjTDRtNNi/+unbsQ1nodqzz7qFOJH8SpLaKdvkvO5S46Rr9GpE
         h1H1Bt4+bed0RquJeVxqZB2aioKf+B6nvU3hDQsCtjj/i/Q5zYKA/ef0tweYA7aMfNDL
         O3zD+/0KTYUBQPjdj0BbjS8bj/A/v0iv9zxVLaIQ32v3+OWVQ03eUkFmVT1V7chabVrt
         Xdvw==
X-Forwarded-Encrypted: i=1; AJvYcCXOeD4oG1zftSajgUyVnLySVycTK7W9K/uyeCGjfF/wgxjx2KfRHtGFxRtAPsbqd9KJ2EYZZpJ9LbgWZtRIEKGM@vger.kernel.org
X-Gm-Message-State: AOJu0YxmSsUGCkylZzdilO2Wlye9Zx6G9vXbhBXU4cDjw9mRmp38IXOz
	57HGXT+zhk7LG1I64iajdrkxXRW3A7+F2bn0853etfzTcgV7BjrfODHHCH3z12qe0+tjFsV1uV3
	OrdtvCqaCUFvZqnBqDD9PgmGcwB5pZz0I8GSqrLbA4Db9lq9k34kwyqiAbudhcWXXJEwP6rMI
X-Gm-Gg: ASbGnctNqYqhuNVKJQ80bY2YeugrUY4Yx9NrHOSJfZjt+4STzjgDilNhaE0+WfL0I6i
	dQM+QXeACzxDXW4BaxORX48tZKpClLAyDKiVYwU8VX9YNvImbjqkNQKGfGZnwukNx4x4ieU/hqV
	SyDn66xxT+e6qgPbSSnoQVGWbte6mVfICVXigDnwHuqKDgrrn5frnqWzwIojz7Fhw6RdKi5ENdu
	SqvM8g99aC4QshHrA8iC/4CGFNj2MTBhI9mmA6/7FsY+dlfuzJT58glQQWzEtJEVGmolhBdLNR3
	2PQ1VVoWQjqw1L9sCqQDvbkNhMD1JRC7Pw0yMHm8cfm80OicqHzn4Sv0se6kCfk8tIVFyx8SyY1
	/H90DkRDqXs43ae2ncrkVpABVe8IYXcS5P5+ac5nMpAJFSPWOlHLWlxITK5T8IS+5Sv36LaT1n+
	yZP6BGzmf5Th0=
X-Received: by 2002:a05:622a:1351:b0:4cf:a3fa:47a0 with SMTP id d75a77b69052e-4e89d263e40mr127009091cf.15.1760888228265;
        Sun, 19 Oct 2025 08:37:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSXAeyNtiUxZMmTENJ6PxpIf0/vFPNuiwpyiUppu7120CbuRClJJ/SHmE9tFl+nmG6N6HwKA==
X-Received: by 2002:a05:622a:1351:b0:4cf:a3fa:47a0 with SMTP id d75a77b69052e-4e89d263e40mr127008631cf.15.1760888227802;
        Sun, 19 Oct 2025 08:37:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deea8765sm1671336e87.7.2025.10.19.08.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:37:07 -0700 (PDT)
Date: Sun, 19 Oct 2025 18:37:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: pas: Add support for SDM660 CDSP
Message-ID: <sasjgm6pua77syu5qjbr5zxl37jorvhs4dx75lbiqlisr5aq4h@zjxu4k2wcfye>
References: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
 <20251019-qcom-sdm660-cdsp-v2-3-0d3bcb468de0@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019-qcom-sdm660-cdsp-v2-3-0d3bcb468de0@mainlining.org>
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f505a5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=X1EvOAfQj5F5E2kYnQAA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX6iyEYGakeGsC
 0ooDyjtvLbyF3UjnozLN3rzwtCaeisVWHa/BDAdA58K7218Fksjo2FGo/MJkOfACDLvbOfIe+g4
 Z24Lw3FzI4KSOXUJzYD5e+Kw56TUSYC5EXbEXXuGayZnZoUwi0+QT091qjU49id8sDNSK/64jOJ
 aJadXnKUJmhvEA3JoXTsdjqAk6FhhwnDY67PSMakB9dR4E00Huwuj3su+iaz1n3FpQC0+LHnYA9
 A9YLsgxCpORg0Dn4jXquW5ObSn9ngVB0GU/fb6ucEybo5J6bVPvEiniXENUCjYtHs9bMjjFoOzB
 EAoNbV62VTegBaRmOGW/fALDh1Le2SQBWGy9VeEsjiiNktiLoOQgLZqkdfmJLPShAzh3tB6tfEn
 h0inLa5XvcYS6FTpAdZsYims+BXLpQ==
X-Proofpoint-GUID: USm8s-TPDEzFUAfiSCGq-9YNeZlSioMb
X-Proofpoint-ORIG-GUID: USm8s-TPDEzFUAfiSCGq-9YNeZlSioMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025

On Sun, Oct 19, 2025 at 05:20:21PM +0300, Nickolay Goppen wrote:
> Compute DSP in SDM660 is compatible with generic cdsp_resource_init
> descriptor.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # ifc6560

Please send DT patches too.

-- 
With best wishes
Dmitry
