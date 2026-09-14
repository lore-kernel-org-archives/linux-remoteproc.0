Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B94D3D7D6C
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 11:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383993; cv=none; b=eywejgJ0fpmbvcXmx1PKIjZj9OI1HUm7ZwbRnBVZSdMe0bnVW3cTGqh5Yd/Q2LbXgVgypT7dh0cFE/SrpVnF+O04uyNkWnEx6lKcBhqlZWAXl7VG4zqD9sjwBIx3NXQWVWSs1lLvgtO8hyeLfKh6AhsfkAEqfHm4m277JzsBhW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383993; c=relaxed/simple;
	bh=IQcctOlp+ZBNyk+MWt9pjtBT+n2ACcBUvj8zTzblXDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W644nAH2oNYV15YsOyiUrFuaMsLRHMYdfIYxokEX8YpGzY9oJUXCx57SlQoZ10x9fcmhpRRtAn6GmXMl1Pq3ruFfl+LV32nC4FCVzAo8njAHrd2lClTQ5/YNVB7190aAR5MxBJr/anlf44otI9TpKP2yPKNTuaL3ndTRCasrFkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEaniymq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6axgOS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEaniymq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6axgOS+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlvfI3860371
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 11:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=; b=WEaniymqpGs7X1a1
	YXKHEC/bDwWWQU4ynDdBe+ExsVgbOrk8zK2zpesiiUJMlv/6dPxDjWvWp2/dQJ3y
	8U1MDOU65vpZdnK+lHMxSVEl3tNF3/a2/sNa5AHQx15aZaIV2QHggenwhl+Ze4I8
	2RMnI4/KGgHoJW59O09HJomooPMcZ/vltZEAgg6bdE7Y9CX/FdRnYG6C1N/Vgbq6
	tp6SYKfA/3uMfmKl+IvmdQbRoYxyWDzk6xnjYxoUE6d9t3iHPmSday/s480Wqn/y
	GA3/cxRX14EhTF6JsjgSdzMnbDPwHKWHYBt5TQL11xIfmn0+ZNXGYs5CJHWYTod9
	Dc3gCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0p7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 11:06:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530db5af1dcso13162551cf.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383857; x=1789988657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=;
        b=i6axgOS+TneU4jG7eHWgzWAfsuULk6n17uJmZ3IKV8tFqhiKIMJqKFR8nN68A9TLz1
         cUvdL4LEmX6CT0QRBA1fjw98wLbsoe+taX6SdTxKK8GeUtmJO7PRJFZYWUhV0rJXqf6+
         DPSirbfTO9xOrv3cfrCjCvgYjNezwMDcNxvnwpE9fGiBLmQXTdqzN84sl9ZLNh6JOr3i
         hKpZNSoW/I16LybIqZFhZxd1316j9ZvYBTMLfG3NwEMhcSVWXku+odFRIqOVViaTYj6F
         hNNRgKvZs68jojiSZJdeQe+/4bnILQvlLQb5Id+RMwngQ8YOI0OvWfdXqB1VElHvl/cH
         Gwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383857; x=1789988657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=;
        b=MvXvpcW6bkpwgJGkGaqHJTBd6rhNrxjgb2n4EkuB/jBKmG6qeaEMvhmwk4BApPoItI
         GhY+719T84HWaTWwypduoN1jiCO7vR+hEI9jhXFxqte1Up85YFdx/jEBOeJigCn5xhlu
         mz1iI6geeNOOsd0s0zuFeNjKvgxERrS2hmQOA2x/O+4/J6H+HuHFwXStGsQeI1cZC74y
         2ASvd0VEL7v49szNCYh3OUSuFKyxBXqe0S1ly/wD0ak6Lzd6yZFaUCRGegVkqw7z/8SW
         PX6d9UD3F2rsdh8ILal20P1EdNRbwiFo0hwMggWA2bUCOBIB84aO3ywQ3hSWbAElKovH
         DG6g==
X-Forwarded-Encrypted: i=1; AKwUvBw3F5AwbEElgCYRIIdrOxL+/Pm6S/rF3XYNw1JK5/OPdwsfseND81Xo18NVNTLno3eiJvkJlcqkzW06rvXaz9vC@vger.kernel.org
X-Gm-Message-State: AFuF++nku0HLYGRHaBI4pJfaQsct2YrUqUR/7bM/rRAH/FswtJJ1WshD
	nWBJinN1nPyt05nOHGKG68n9K9X64mAGBpfui9Yd+4QNoheWagV/K+FyhV0v4RGxdKEGP8WG+tR
	zP9rKPGJ8vLVWHw1Jz9yZF7Tnf64DV1wuZJ8gE/ITm3uVOMQ7gn7AHnRKw6U50eQMhuajzZn8
X-Gm-Gg: AYBFou1SwlS6ZwdF10NHD5QEkbyfx3X9m1zIh7LmIb691UMewsRzZPj28SpUFyDRH1H
	KSmmny6+6YtfDqlVACbIlMA/AwAOrvuxZJ7hBdsZayFvqBKubPiI11x9AdPaWHxNsFvyv37DIBl
	DCzqKxiNgKq6e3lXTKumIUKEhTABlov39gBbXz3F+aD4R7wCDj2Rk9HDgxC1hc2yVhh+GhsldIU
	K5gq81Vf/B7mSqKlnJj0k4nXpu/J89mW1SAiz/2yllkkks5wWbWXW1dEVzAKUGu9/CoANAvshGo
	1Y7JncW3U3+w2ieSr+W2OYgVIPKugVzsCXtwEXFjUE6HTcxg5dD1u9S4Gx1Exe+Cb5Hkts9P8Ti
	EKRuVqjs8SOggST1IL5SgIQ==
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr203892985a.5.1789383857111;
        Mon, 14 Sep 2026 04:04:17 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr203881985a.5.1789383856403;
        Mon, 14 Sep 2026 04:04:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9c7e82cc1sm3020828a12.0.2026.09.14.04.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:04:15 -0700 (PDT)
Message-ID: <f0409205-b5bf-481c-bcbc-45e56d9b9bc5@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:04:13 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 49wC8U9ZoYs1h3Srn1oadEXJMm2aViqb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX1/VucMctCRSD
 oT3r5AGEpCip5DvtZEElCBoo3CB/ypdsKN+L7gMc42greAMTbkHGO/4zh8sQP0vVSGYcXhA5pYa
 a7e2tmD5L6oeb4UNhc7SWKZGCOoaC88=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX/tkSbxKaCBOZ
 t4nTvCua2eLpcOsnaIL7bEJbRGEhNqwix6NR56vySyLCkeygs1h1qPr7HL5gbSBKObzv9mTjfey
 5Tnq+pQlgbv10L9g4sA6mgDrOR7/yqe6/lIoFamr1u4zRZTXyvYBiXThlPuE0yWTiaqd3N55zPq
 nUXZcorQe1Rh/KzjDjhuQvb9SSwgOsRAecIppwiUeg/b+Xv3QM3wPtU5Zr3BOzUiqSIx4QMqqkU
 QjJeOC06h/djcX7XC54akIUX3dpoe3cNTgRYEPL/BGleIxd2ESiXhFy4Za0uwDfVKMNmdduwpU/
 2DhmpKJ7hF/HcCbBRRwKuVdgYogodxGNdfIkUPCFCDHwpUOYPf5OkBI+/43gyk49xp7LMtD05aL
 wkk6ytpSaa/Rq7TIx5DOcYiVgI+2YaTQ3YA9u/qa2ngrb7JcNot1trRsUl+KphHoOmX0F9dIEIA
 TX8TCshVLBZCPGVjqTg==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7d531 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4mQfpWPmsH_nVP9DenEA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 49wC8U9ZoYs1h3Srn1oadEXJMm2aViqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140157

On 9/9/26 12:50 PM, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and bail out on failure, unwinding any
> previously voted proxy PDs via the existing unroll path. A proxy
> performance state failure indicates that the requested OPP is not
> supported by the underlying power domain; continuing would leave
> the remoteproc running with an unconfigured voltage/frequency
> vote, so treat it as fatal.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
