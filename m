Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBA81FECB0
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 May 2025 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438949; cv=none; b=Q6ZYk0wIafkTQL0vCShYbq7getRhAkFbFD/daPSUUTNcO4CEVBXvbXxtYOQ5DK1tHjek9+RngempLMtl/vYpd3V0PEwgPDY2RlJepndaaRwnrtKBE51fP/D12DuBc/wB4kMVUnLoJ/oDsu7NTA9qtjYO4RXl0e7DLTzgbI+IHDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438949; c=relaxed/simple;
	bh=4fXXGQzfUtKtkKuKQhES1f00tVzlysT3cxFwz6vRIHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFTcBJf3uGoq81T2FZyy9EKWNwGzyZA3Bv4R6UNiKfPyZve0KNUUYQo/aJxZeYExCsmvrdSAI5e0nCNR2JnJ/lvE/e022AmyVhfwpgfqKAKNBCHnjCe20qCE0KOnjY/topZ4s2G4wZChox6tZ3UCH60qeTHO/0Mmz3T8D+0ap5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEBvWWkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEBvWWkD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MhJCx002441
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 May 2025 09:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2/mHzBkdkIdu/XMlXL1MKLhp
	gnZzaTuY/YtYOHlKf3k=; b=gEBvWWkDAkH2mH/o/AVZkrUpWTD4uiNsgHtK99c8
	AvUfzmTcVjreuEAaeGXJ/02eEIQVkGXFDalkYM/5GLCSAn99rML7YNX/pC50nIsS
	ARbmezpJL6NLNvoI3xhEWcqOXRB44X8Q8sidxWpM8ISrkmYsS9k+rRN9UuHyU3jP
	A0G+3psf8E207D7s+ToOAFiLPZ63rTuWfnr6jTdTV37lmBzKyhOSU+mogdFjQU0r
	JWA8PEzy62ISv8yXGXeBuGteAJsCyKuFcoMvKC9GMlth9GJOmbaJ86zYnIXXRJdB
	ZlY3rRmqSodzYAYI6sr0mGzsxaT7lWLHiiD3/YwD8mPf2g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xst70h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 09:55:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f4b72d4ba0so80733216d6.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 02:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746438945; x=1747043745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/mHzBkdkIdu/XMlXL1MKLhpgnZzaTuY/YtYOHlKf3k=;
        b=k5XMA9O3+ml61U0rCUvo19h2rN8wKGK7gT5gBK5qcTk7aJq5BSnvlr++dAoWAHOYOQ
         W013Pg+EwNMzFNp7Xg6w8ckLUQZLMRkEJNSFJGtTTXvfxLbouEA9jLqbSGi6XjXSrsM7
         B3DmT7hafzM71ph2f4M4uwQ8Dn62L7kQcRIxYJG5FQNvuBOz/iZ0fIqFP7Oe1IhKMm+n
         c6a28/W9Iqs3ocTLZNrcVn56O7cMYT1mhyLLSX5f48H+ncm1elGRZtLrpcJOVuZraCh7
         A4eI5EZIgmV9FEMc64U0mBzWGC5vMC1AA8K/SU22IJ/KjUqrEhrM1V2+qQg+45XXcPIZ
         MnOA==
X-Forwarded-Encrypted: i=1; AJvYcCX3yrSPQN5AiSbe14FY1UNiPA6G5GQ7CshVbr5EDQYo4wfOmDYn1CEkcBsG6FAj/6FE/rf/gG0F/zrXrWTCGf6U@vger.kernel.org
X-Gm-Message-State: AOJu0YyNU848zY86avYotRFv9mfPV4LNuOIAWON8fIr+d8AcoYJjQ+sp
	ssY/orriq3q25tUjucThE6B+FieBpIUxrCTR32/022loSufYuylb1FNRtBuep/8MuP+GC56SnmQ
	Wx+7DSgLwe3FFfwSVkY1haS1WDEXfJyiYNRn2pMMnkMELB78VMbUHLrUVbhv3i164lYkT
X-Gm-Gg: ASbGncsYcbKp7jjalWXyKCfa0zKGQBYHv00djXyMk0X/HKZO16eSlBjeZRbgaFVDjrt
	H1RmxsMSJBj5VDGPXM2DlYXm0jPe6dPWwoKY7LDuOFjtXUMjKAYvmLAPHGsJrPbOdVvxtZANQ0L
	PPezSkzVZt10Md5c0pBll3+OGOMvojslh5VDvOyboWp6nuzacb0uVXjrssotqvYduR0btpUCjW9
	xuIZjSgpH3S4MhPfK4beg+BrykxJGLNJ7Be4N2m88Ck9v7TDeVClWKSYBzqizKP00AQsYHTG2AK
	WfpcgDqYpkK8BVlmXuia0JP3a78QJgdxh7eTQWbtnZmUIkXFo5084YDDXwq/AhkN6SpvN8bzA8k
	=
X-Received: by 2002:a05:6214:1c0e:b0:6f5:117c:76cf with SMTP id 6a1803df08f44-6f51580c00fmr168424626d6.40.1746438945416;
        Mon, 05 May 2025 02:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGknyWbznndebKntrV92c9APdUuAC3oqeLq7ISMW2xppAZupC/c68JL1jEz5Pc9uS8Y/NJ8Dg==
X-Received: by 2002:a05:6214:1c0e:b0:6f5:117c:76cf with SMTP id 6a1803df08f44-6f51580c00fmr168424416d6.40.1746438945126;
        Mon, 05 May 2025 02:55:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6a9fsm1658248e87.234.2025.05.05.02.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:55:44 -0700 (PDT)
Date: Mon, 5 May 2025 12:55:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] SC8280XP SLPI
Message-ID: <xwuxekxqqt76xi5vitfwp4juwm7vowkdn7zjniymup6pmcwwef@rkr366xgetxz>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
X-Proofpoint-GUID: Yc12dAuaovhtdgjHOooUQrdlTPS4Ovhz
X-Proofpoint-ORIG-GUID: Yc12dAuaovhtdgjHOooUQrdlTPS4Ovhz
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68188b22 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=x_-MvMI86miFrt3VAdAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5MyBTYWx0ZWRfX3I+tWZIt8YY2
 tUJbfWAAQGAXy81lZEs5hfB9XdTLH1qKcA2xEOwXYUGhgLj83QI0Ht72MUyAwVoMZ2mwDmijCo9
 ljYLM2HQ5JzffTFqiSIz36xgiWenU3+s0B1mf8PJ+qcimBML4l2exLSVywwz1wf0zu9Ykb1XOjC
 8Mja3D3xZJBemdVTJSiNtqd6c0nTG8W0QkOBClvG9nN6F5SjtgywNyx3r7QItX29NjAvV0OVCN3
 lJ+08HeygeuY9e6xCj8EkljmMYKJexjaGy/Vl/Q0RKBuOL6YUX4maHG2UTzQ3cn6gQajEdooPjL
 Ifc2XPQ4Q93UO2OhwcIWV/Q2L9Sh9I9pAO7vnAYQ+AAkt0fFi8RtpabtZcuUFo/bqIwPvYneKIO
 fMF0qWrNwJNH3H/TQJ2fukUQeeJKhOOBKMqaAUb4Wki0PIqeJS7hkIrB/A501DXyaT5tVolM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=611 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050093

On Sat, May 03, 2025 at 12:37:58AM +0200, Konrad Dybcio wrote:
> SC8280XP features a SLPI, much like its distant relative, SM8350.
> 
> This series adds the bindings and dt node for it (also cleaning up the
> DTSI in meantime)
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
>       arm64: dts: qcom: sc8280xp: Fix node order
>       arm64: dts: qcom: sc8280xp: Add SLPI
> 

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # Lenovo X13s

-- 
With best wishes
Dmitry
