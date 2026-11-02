Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623372;
	b=ToURGr2+AzeY84cRaCIetqj/hgbdLS/vDNt5VTYhmjywrmqAnHZ+Udw1m5nvcawkz0t6
	 0R+MoomISaiGpeVw4WFjyRdAHVtB7vFvEi1wZ6wfpYCQ0lXf7dwYaPE3xPXjyTrXfc8/B
	 O3SJzoZcYWDo/pN++ROB7uADL6OdOy6qYC65AB6In5dtadKBfLxb27mj2o4auxbVUrD7s
	 02aprR+M3evvPGuATCf4qTZ3/3VsnJzkDGLXtvQJT7TU5AzekBbNoulauYZa/sDZaYPVl
	 rX8iwe6pWLIfTfUGS9WbzsMzic+OZmVDmDb0Ab46M+BLHOBvYaryCfvzOXgTE903QPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
	b=RDv48ZrKq39YIimJtgCI7G02fJkic/O9UlqODPVfuhkPKcDxNGadPz74I+wgpYSG2CjC
	 qs066/jwS2rT/EezFKVoeP62q1zoFfpjvRKfmi+PMeV1l1rndiUC0JdhL+AMtM0fMwjVC
	 Sj/yHo3/U2U8SiOcfah+JmnqQiM5Gt/xMI3iJdDsdRa4wFCHWOFHjleNRPJj69cAuCGTb
	 +9Abs7OHLeHfXfnijtZnmUv9mCVWsphu9xl3lZ/lPXQYSDzCwhxo6pfhxmg5CFHTYy0g9
	 A13DHd8szOH8/Uh7J/PKIrIblHNyRiZYnkWe0Si19ve0yRj2F6bcdY5ODW8VL1zMaig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imzn9mgE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCXAe2dL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465C60A2604
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Nov 2026 12:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3465C60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imzn9mgE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCXAe2dL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1j73402501
	for <linux-remoteproc@vger.kernel.org>; Mon, 2 Nov 2026 12:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=; b=imzn9mgE7jpQF7UJ
	l5NhN9P2tCVnLxb4TdTBR2FOSNJYdj8wTOT26//AF1GPF5PuPIQFSP5ViGDCvCa2
	4mmGrgG3D6wFmc0KCDipUueSrm3NRhQkBzh3GoNpLwmwC9BYu7cq7Ua57vaYcUdl
	7YgM3f7Fj1J108Q1ZgoO2WvAuWPIwY2sapviVFR5lXCi3+SLKGXIo/izg2gXY3oL
	7iTbK1ENuliAtSaY73WLoFYMb56uptzP5XHbepiephZGbLxaLYsO/JhzEU4QKGII
	YlJK7qieMGwQeYo3B/Q8gJ8RC+Ywd4G10lvOIH5zpCYXkTkGoH1cH/FMvobYmo0l
	TdgZ3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe94g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 02 Nov 2026 12:42:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5476f5bd009so1838131cf.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Nov 2026 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623365; x=1794228165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
        b=aCXAe2dLx6AvaA3Ui7ABcy+OyV6uebqnuOlRF+vCG7XQ5sOZCJbjH38nn86tQ/NYsD
         YYHpQ0CWi+7ui8DF6l2AjxJdeI6Y4UvnZQtB3GAlb77QbHRCih8R5vYiiSauBZvOExKP
         2jH92wiR69s8RF7UfIU5k9ufPo9HtEVpRpWX/lgyVyGo900JuD1Cjp70VmCU7/praxrP
         nx/03JbllRjZT+mXWgHKTTSPJkgJMS+itfhFm2n5jS2MEg+B1iTjWmpNXUw3TM2TKK0b
         pVUNtw3RqR4FaHbd1o9f4BfO+pCy/y87D+jgBkDHMhZCAy4S+DB9OKwpg33wHyV8FkaV
         mvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623365; x=1794228165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
        b=cMbloqern5VPvGqpRIS2JmosRvPEcOn6Tec2Gee/GdNOfrWFoY8jt50rEYVBc3r/FK
         dzWIOlVHgV04fMt3bBzc1DYGE7Ob1/YG69KmFZiQnESvQATCGAKU2YK1ONrms3+vul9Y
         xEKS9rjZcI6TYhzBIyM/D3kRN2LASQTKRzLeOOcl9ewkOD8AtDZO7PwZ6qyOq306cxe3
         Ce3dXzacIIOBzvBN5ttDvdmspYOC2HUNbmtJoxRFd1sHOdMWxU7o14tserEE01Fh3lA9
         RHO7NLGMAtfzGjjYqFa4W0mzrfKJ4pbRoNS5oq/DO/7dRYjWV1BxIGV6c3e9HYJ/5hOK
         5INg==
X-Forwarded-Encrypted: i=1; AKwUvBy1Ywj0FHwFJVMKD03nalUw6qt15L2GmRWnFrGWLr5lfXsI7Q197V5RFAiZ7ZIi77hlZmfHCe5SI/pJvzdxI8U1@vger.kernel.org
X-Gm-Message-State: AFq9FYKVavgu/Hpxl2LBkS+UK7dLco+Cctg7kcaisSdeMZ/tRVVNDVgl
	KXt4ROOISOZf3W18Rm41o2YUkDtnqzI5Ctomz3Z9sbPncy5dTpzsB75BrQBt8pyqUTeXlo4haJP
	dYYsSqM6LMKhnqAvYlaYetMEbMYl5GuJkf3YuGl2UM0jydHw3nSqF6xc94QUygyzxHjz7qQ1n
X-Gm-Gg: AYBFou1oCEJflhIn8mkkrw55z4tRSHR0bVA+HZ3rK5GyHp6dYlRkyVKMzTA0uTenSF9
	6jwnY34Li+YPQji2hhxRD6HGifDC8kfHHTddLk+8ErFi/FkOwADrBMk56iZTRA7Pxosia4yHabz
	a1eSwFPKaIWyrb4JmGb3SCzciWk8HbaXqlGzpyZevkg7DPlVga1ZXvUF728W77jj3VNscYiRaRX
	R9bEQJhYgHHETwzGX6eFtSq49aWriyJAxVuILfXA9IqygSQxk4aZ9iPQTSHcYEkLq5VW87stUGo
	8BZcfDf3Ny8NKmGW5U3lYPJ+S7R44KLZkf8KqoXOtXmGKvfc+vrk+icIzl57V6jxQh6A/6ZVJNW
	4Yu0zDLQdJpVsnmkoSFyj2chS1viXU470tISkS/NXjvShtrJ0zAghBXerWm5129iGtbl9WB0=
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1608069385a.2.1793623365453;
        Mon, 02 Nov 2026 04:42:45 -0800 (PST)
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1608063585a.2.1793623364967;
        Mon, 02 Nov 2026 04:42:44 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18e78sm399183066b.9.2026.11.02.04.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:42:44 -0800 (PST)
Message-ID: <99023059-0d9f-4ad4-a861-299006ae32a3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:42:40 +0100
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm64: dts: qcom: Add initial support for
 MSM8952
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar
 <jassisinghbrar@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae88546 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OuZLqq7tAAAA:8 a=pjH4mUHWGEoP9p1cUU8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX4Fx6c37sx22X
 DF5eQf4wZByCs7sXLdeuardlI5btDqHE7pSH8h8/NICp6iFpHKJGUXaXzpM7/LFrrKDMDGHRhrV
 O7e5b1Wx0rQT2O0drJSzX/wzrVSBZzOtA+iBMXXhlvQO39tMhUimpXWAf2uLexwKExK3HWoBdIz
 Wza/Z3IcGy9CSiSWCdcUTfGzM3IqJ/ewldAI5hFJ5PxLawCZvC9EQP37FlCSV355oM8qeCMBd2j
 VzU9rs3KiSPsbrEf4jwEuNa7QVDfdPx+PDpWXyjXKu+B5Wqrw9Tl84n9xIA7WT1Rl6AlXz6XI/q
 9cL1htDIKpacdB9i1SzQ3tPEfsO1P/lDg6DL8ZwwX+1tVT470PaGswJCZDueVIrTQLZHo38t06W
 Zf7c55qlWaK1fUyP5JtpRZ0HJdKfTeq19T33V/4eLdJFGa9FdIX11RXNwruNS0TAEjJxGZAdpEw
 gXLMu2rtHBw0gBMU9qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfXzuR227z2iS1I
 gwR+aS0r8/Yd6JtsdNRW83cusRVdRJ6GIAL3xhWivJ+q8ySzuE0WP/RchY5cwfS0Egf95ASVFmL
 EMEbjnA7StMKFsB+BiZEjIe/Y4FEZAs=
X-Proofpoint-ORIG-GUID: -Ev-R7b3UHNJx_-3adPhCZj2DsKdmV6b
X-Proofpoint-GUID: -Ev-R7b3UHNJx_-3adPhCZj2DsKdmV6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 10:02 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add initial support for MSM8952 SoC.
[...]

> +		mpm: interrupt-controller {
> +			compatible = "qcom,mpm";
> +
> +			interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
> +
> +			mboxes = <&apcs1 1>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			#power-domain-cells = <0>;
> +			interrupt-parent = <&intc>;
> +			qcom,rpm-msg-ram = <&apss_mpm>;
> +			qcom,mpm-pin-count = <64>;
> +			qcom,mpm-pin-map = <2 184>, /* TSENS UPLOW */
> +					   <49 140>, /* USB ASYNC */

USB DP> +					   <53 72>, /* MDSS */
> +					   <58 134>, /* USB */

USB DM

> +					   <62 190>; /* SPMI */



Konrad
