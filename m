Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5EE2701CC
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 Aug 2025 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754317088; cv=none; b=goUbgDlie8eMY5jzQ56+MIZ2s4eqx83u85utsxsOvQNMueF0j32nS/hsHWSr41/DKFgaxL9s1nZYspu4HoayIv3mc7hxZ23g6cFD15aw3qlGdjyVWSpqNEcZEn5fCfM/TteYk2crMQAZjAEoR8dKy7iflbQiRHpGK4yFdPYkYHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754317088; c=relaxed/simple;
	bh=VKZmdjotUC3YbS16o6pwylau9DHkDdk5aDr5RC+8Sb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0Z6HJnmqpsdcqoHgTRmghju0KTPV4x+nJdENwLk/dZhGlbbH3b5Ovgu4yZTRYOdA5nu9aMLrEfCz9YIIj2hN4xzwPSB1UNhXOqSK2uDi7sL7iCLK6osNolmwpV6Dob+QO9u5ls1UiBvtMpxewsxDcUoPbARcEAgsaCGNVuJXvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMp4iUAd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMp4iUAd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574CSoif011363
	for <linux-remoteproc@vger.kernel.org>; Mon, 4 Aug 2025 14:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yV10ozYgUe4tzTx22lApIwGp
	t095dJ2LaBUIJh0zJQw=; b=RMp4iUAdZ9MiaxFspe846207a/m9KYLu8rIGQKjJ
	qB4vNnU8PaDP1Ad933PHN0PyrgvOI0fhe2SGeJ77pV9WJgEDfyRM1Ae4aDn7aWNf
	IArKKl93H++Hq7ONRD+H4cj1YfYK67jEveI1tDzu0H3ULUuMenzm0QKUmIhAfn78
	eP/TJ68EYRxJALyFI17JPBWUmbN/MiaxK8jEF1ZMT/gakSrO37rUX60yFUKn3OWA
	BXG9d0aoFqfMM+IqudbsaqHxRQycBnRzuVyfkbun6/f9EN7LiFNusGcsS9E5lwp8
	vgrmuF45J5XPyfxVbmtZycCTKPTarVb1uTQOK3ybKwJnTg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48avvu89p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 14:18:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-75e28bcec3bso5974415b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 07:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754317084; x=1754921884;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yV10ozYgUe4tzTx22lApIwGpt095dJ2LaBUIJh0zJQw=;
        b=BDdvLYWNhZrHYIsNmCuHuaA5mLQjzR1DMLEeEDSj2U2zG+gbefj9wxuVm4BA75VK1a
         7dSnKq3mldPhtTH0H7XOAOBZeEshXoyT2KM/f9ZCiQpV8igYpRqI+8owIR3V9actJVi/
         hfRaRak8fOuWxMmWYHxgdQ74lVLtRGvdxSM+J7oded+pd1c1an/hfLcKQyoGDTG6B+RK
         TS8SIX1t7BjknJQ7mFKhs9ZS8sdwp5Ut9aWG0VYiwYtWSgmgauEiVr0hMIlx6HLfQ9Tq
         +t7JKQuX4Dr+ddByQzXtJ9O0sspLDzE4g5aAWQL2zcYwAJeXMgqxlZlVf5/7AU5bpT6e
         EtEg==
X-Forwarded-Encrypted: i=1; AJvYcCWpk9CZTRX8JBpBZAbmvy1hBE35/3SI+awiJnGJjcMOdRfPImIGR6qO656LeypRcFC1vr9ODMopPWoA4Jze9T1g@vger.kernel.org
X-Gm-Message-State: AOJu0YzgzNi1io2tO0wDUy/Lpa6K4Ts5MdjIiXYO2MDDXqNpQpuPOWMu
	EAYkQa6PzB2/8EPo3iqbJdI7lYP9g4hD3F3MHWmLIhhq0jNBbDHuBlZui99vfIe743TPdrhaGGf
	Zyd6D5/7Wwp6rWfjJCDOxbINSq9d+sLxUkYNWwWeVA8624u3jcxGM5Z5s+Zwhrv59CU74XM4f
X-Gm-Gg: ASbGncvPTml0zcuXGXexXiCssR/h9CXg9URnYBSsLImJrt8MCIEV+6hRYzFzWUR5MFf
	QK2p1mONiX/oUDJ6k7VGvOdqW1e3ob4gg0lXZHo2WfDMqhd8XtlK9FwoSf6MCY9fAEn/UsOWQIL
	V0E4Y5mxbau2q2WOvqoRg9oR4Q3AQeXHkyFhBOIicCU0iIpliAku3XfffYmwwEjVrmgitqnV9Ha
	TTlwI3XQuHBXhAi33541k0uJE0foRUubE2WuG5lc9HWhePy2Jb+YGeIxA/Xl7obtCns9cyXgM+v
	gvV9TnBql9O9aiogPl5HvCw/ByopSNcUm9iJLIfH3H4DqGXgkZPFmqPSqEc1xKmwbzo=
X-Received: by 2002:a05:6a00:744f:b0:76b:f06f:3bdf with SMTP id d2e1a72fcca58-76bf06f4064mr9615987b3a.17.1754317083687;
        Mon, 04 Aug 2025 07:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGDsTzlLGqDnAvh3MpUA8PVpt35YKMpiCWpzipsOhlEqGhm5w5CMVTLOTYyI4L20glEIYSNg==
X-Received: by 2002:a05:6a00:744f:b0:76b:f06f:3bdf with SMTP id d2e1a72fcca58-76bf06f4064mr9615955b3a.17.1754317083308;
        Mon, 04 Aug 2025 07:18:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bea205365sm6411378b3a.83.2025.08.04.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 07:18:02 -0700 (PDT)
Date: Mon, 4 Aug 2025 19:47:55 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <20250804141755.qzwfgqjdx3s6yc7q@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
 <095ab6dd-9b0d-4f58-872a-852c5f19818c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <095ab6dd-9b0d-4f58-872a-852c5f19818c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3OSBTYWx0ZWRfX9aJu9ywUY35l
 BKL6soVhh5QacKuzsRkcG3c96UrEr9LYoEdxrGo0rcrcqpTSNj2MOFQiYs+CjROIXh+9+3qXK/1
 Pg/qzqBaG4PLTx7aplcQ35qAA3Ut1Li3mDnKlKk+Ocio0XRuuH5ILqtLEaRMhgCoIBBr69GLA4U
 Bb1vZij0R51wOR5lrBLjmcq9Rb7IOqN8HfQoOc2p3+nuuHKH5CcdQ677asN4YTJX1VtzYA6DGzW
 d0XVM2IOIPlN3Cba2ZoG204UsTJqRApVOkdyK/oasm5lkFv1mVPh82T25eR7h2CHSaPl4YlMmvF
 y0AApjoP5+ngdNa8HIFYo8Tgm08qBuIPAh53Pg57/zA/hgPhrU3zmETPsTFpUjTrRdFwDCEAwsO
 2wD3Y7lBQQ/Zu5UcIJWYtVOOIdQSldtNRgBBoZXiKjT5UnB0HA/jHQDqst1ciXXhRVS0ttal
X-Proofpoint-GUID: 9ib2JXDvLAzqrN7Ah_NLeEM6hK08BfnW
X-Authority-Analysis: v=2.4 cv=OYKYDgTY c=1 sm=1 tr=0 ts=6890c11c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6krb5mtG3PrLwc7-ycAA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 9ib2JXDvLAzqrN7Ah_NLeEM6hK08BfnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_06,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040079

On Mon, Aug 04, 2025 at 03:16:35PM +0200, Konrad Dybcio wrote:
> On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > -static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
> > +static bool qcom_mdt_bins_are_split(const struct firmware *fw)
> 
> This seems unrelated (or at least unmentioned)

Ah, Missed it.
I will keep this as separate change.

-Mukesh
> 
> Konrad
