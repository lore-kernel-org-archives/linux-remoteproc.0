Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913542FD7A5
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Sep 2025 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986218; cv=none; b=MgJmQ1AaJ2fOu7EN1s1Se62jFk91Pgcyq8O3s7Ye3ZjjpL3husg0aHjD4DmqMQuK3hSWkgvJQyBOMFSvku8tQWhWmd8kdOaYCcqTtUtaQRFk6lF+nrkEvqak7ep7/9YEe/j81Mg2zpean+VlQP5IGTMYYNP0TxmgeCDiN/NxiPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986218; c=relaxed/simple;
	bh=8/IakGCw46hrazl3aA4VwfOOwE8rVlBce2R/a6e/u2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehW1uQzc2NMojdmrPUGG1YLrfPCYu+cCso8Wyivf0a8vOWCtIcwvEY3pSttIUBt0+jjfmN+4xoggs0eTKv2g0SX9I4kN/yHX1rPdf2lQ/ZFnpZEzH7kmNMAg/H9icsKswT4NjkNsq7sleSxgFIkW7o7v+deNUoIqns2Ohl7+Xsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eu/aciE+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eu/aciE+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8cO031754
	for <linux-remoteproc@vger.kernel.org>; Thu, 4 Sep 2025 11:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JlHa+bLNOlllt7+sjrqxahbi
	SpEqBtvYmevS8IxN37c=; b=Eu/aciE+0JBxEsh8nSfm0b0bLNMSXdcHMa/txli2
	5lV6psm5FjnQ7Kvdsqr0/hoGUejlrcGPoUHxb6Y/TByvPdnN6gxFHL2Dk9WdcxxK
	5ScCKgXwDzgjrH8IJ8GAxaNxEcEWInDNQWpv92uVXWyNzePC1Vop0Bya3nTaOyxL
	YJ+htRBBxHB0kNi/PV90T3VdbUpYbGpI2mV+R/A0Kdg6PXoNrmszC5SokIhid7Yh
	Fuyho9ALog4Yn8XY5t3pgjeWBBUdjKHJ2AQpneA9An1JD7C9gbqdxioBBq0q1b2W
	cruSwL+pyxDtD00zHI8a8fzIQGMFFDk1XsRVHo2I45R2jA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw07c65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 04 Sep 2025 11:43:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4f93fe3831so1200656a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Sep 2025 04:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986213; x=1757591013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlHa+bLNOlllt7+sjrqxahbiSpEqBtvYmevS8IxN37c=;
        b=rZaZ2dD+0Seaj1fB36VgwzbhJl//gWqP2ySG7DFnRDmIwK84dfjjW362ZOfJj+wZsd
         /aPBTRb2Yd573YZ/DD91s/lYvPMh3n5PesLzyVc+XRxNHwsJ5X7xE+JDz8kia2XBzqHo
         /1p108Lxv1zSAaM8sPX9nJeyW8Wxo4gWl/9TDPm+ZzdMWV8Dlrr4RZsRx5yDayeprAVu
         rmE1sm4J9pZayKh8x7leBik6aHKJptsCbfuTWMrF2pvfFEnmN9QLZP2fba66pbvJZYRT
         U86KMKZ6GzEjzWJu5QR1yKdZB4ANLmsLNSJ61CG1WpnhTCp3zihJDH4DWXidTuyoBJaK
         m2bA==
X-Forwarded-Encrypted: i=1; AJvYcCVStyOyaOVpWyZ72S+tJWTu/q+7LPZ4WUl+O5mpZp7ensEjn5hK5AXQDEW1u6Ujd0de3f/qKsabTeH14Lc8RH/k@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0HGti/3A2AC1j6ENJhPIEfY2OyOUlKbEvemOFXxGBd7GydaBw
	C3fteJeWgo1CRbO8RdZVgmK7D44S1euB5svCThphydRoSOU27eI77rFDSSDENXr0+rMzIKx/Acd
	CzFLEBZQxMBqnRElNl0eXdfUPsitgpap4hxF1FIiIRljpwLlNXBTGJE9Yqo01SPriMjXbrQ4zg8
	2Ygw0D
X-Gm-Gg: ASbGncsz3lf0w/gHCqSxzzjnESY0mas8G7dTxUlTJUJfr8+t0L/pgYFyd4xSsqG35FI
	g6SxAKwW/JQMMfi34+aom9xl29tzQmlsTbisFnQ+clQa8KWkE7YTUYeUQKlTAfJ9TOMIFRQOhNe
	zlHvIMq90+bSqT4dg2qKI3twJeIfq+2Di6p/c6ByPR1EWLq8IKD38pV+CQJBAIokqUOTaNMCjmo
	cl2em1iHtlhlqBfZ3pcplPnOBtE+WDf1b5M8kQer2dRdjJtncFSbnA9enpmqmAao6GeBxB82syd
	YGCht3G+3c7qVpFNI283WnUPw3W8+2lCnBhKBsExgXISVrnJLmOf7kcqJz5p9UidWCM=
X-Received: by 2002:a17:902:e543:b0:24a:9b12:5248 with SMTP id d9443c01a7336-24a9b125499mr224992405ad.54.1756986213336;
        Thu, 04 Sep 2025 04:43:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeyBcM+HOUTvrl7j0Vv8OyjKVeRmkSlcU//DcGS2QbTxlYo7fNmNHEzUkkEEXJtkjRK88Cmw==
X-Received: by 2002:a17:902:e543:b0:24a:9b12:5248 with SMTP id d9443c01a7336-24a9b125499mr224992055ad.54.1756986212899;
        Thu, 04 Sep 2025 04:43:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249037223d7sm182353305ad.32.2025.09.04.04.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:43:31 -0700 (PDT)
Date: Thu, 4 Sep 2025 17:13:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 02/11] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
Message-ID: <20250904114324.qtizk6wm44xa4ryj@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
 <0b4472cb-0c73-4eb8-a360-22b40aae44f5@linaro.org>
 <20250904095215.ekkhrt5ql65ap74k@hu-mojha-hyd.qualcomm.com>
 <a793c2ff-3f06-4ed4-90f4-4b2a11e714e0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a793c2ff-3f06-4ed4-90f4-4b2a11e714e0@linaro.org>
X-Proofpoint-GUID: RGzCxC20KmFPJSaz-DOS0fnBaoW5oKoW
X-Proofpoint-ORIG-GUID: RGzCxC20KmFPJSaz-DOS0fnBaoW5oKoW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX1/j7RU9nFPFB
 f42k5rBVP45K14epSIe2HQYEwm6GfoynCvkO8rXjclaF91nzfeWy/9KVO7zY5dthvVD2nbx5EHi
 SoMnlDcB4+ZUEq/F9crImuaUvGwAnnupqJ3T2WfryZnBfpsNCMvoertGMMELhTdHCaPadv/RWbY
 3kA0YqtDCEEB+D/QDd3SVPdwrYwvUgXt/vRMPwWkDvmuNjGh/admgJop9UhEec+nIA9BV1i9/k0
 WBjvlZ2EHacDWbEMqGVYNhLrlNdje/rRfRViIMiaVrfZBzp0/4qvANFXpFgT9QpNYlNZcfOJA3P
 BgYNwmuYXwfQM/TrOe5BKSxMiMNGbh4IJNnuuiKq8XK1Rr3vZW8zTHZq+eG2TQKn0CbnJxPyVXk
 p/xhevIH
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b97b67 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=KyAPywjRas_nfg25bTcA:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Thu, Sep 04, 2025 at 11:15:29AM +0100, Bryan O'Donoghue wrote:
> On 04/09/2025 10:52, Mukesh Ojha wrote:
> > > So is it really the intention of this patch to change the callsites where
> > > qcom_mdt_pas_load() away from the init version to the no_init version ?
> > > 
> > > Maybe its a symptom of patch collision but hmm, having a hard time
> > > cherry-picking this to test.
> > My intention is to unify all subsystems whether it's remoteproc, video,
> > or others using Secure PIL, so that they all use the same set of APIs
> > via context (cxt).
> > 
> > Like, we first initialize the context, and then use it for other PIL-related
> > SMC calls such as pas_init, mem_setup, auth_and_reset, or even for the
> > new rsc_table SMC call. This way, everything is connected, and it
> > becomes clear which functions need to be called and it will also be
> > extensible via a small handling for SHMbridge on gunyah absence. Similar
> > changes would also apply to the MDT loader APIs.
> > 
> > That's why I asked here after "---" in this patch if this approach is
> > preferred, I will apply it consistently and eliminate redundant APIs.
> > 
> > Let me know your thought.
> 
> For me its a question of digesting the change.
> 
> Your series says "Add context aware qcom_mdt_pas_load()" but, it does more
> than add - it changes logic.
> 
> At a minimum I'd suggest splitting the addition of the function from the
> changing of the existing logic so that the two could be disambiguated.

I agree, I did more than just add even used in current patch itself.
Will split it.

> 
> The other comment I have is, is this change really required to enable pil
> loading @ EL2 ?

Not exactly, but to looks things cleaner..

As the other way was carry extra boolean "rproc->has_iommu" in qcom_mdt_pas_init() 
for rproc and qcom_mdt_load() for video and other smc function to tell what needs
to be done extra when Linux at EL2.

> 
> You could for example structure this series to implement the changes you
> need for EL2 - and then have a last patch at the end to make the code "more
> beautiful" or even a second series to do that.
> 
> So I'd suggest one of
> 
> 1. Splitting the addition of the new helper and its use into
>    separate patches in the same series.
> 
> or
> 
> 2. Doing the full EL2 conversion and then applying the
>    "make the code look nice" patch last.
>    So that we could for example take 11 of 13 patches
> 
> or
> 
> 3. Making the EL2 conversion and the posting a second series
>    with your proposed tidy up
> 
> Either way for me splicing both the addition and the usage here is a bit
> hard to parse, especially since I can't seem to find a public SHA where this
> series cleanly applies.

I'm fine with 2 and 3 as well only if non-cleaner way with EL2
enablement gets accepted which may look ugly with lots of if's
in the code or just do 1 for now.

> 
> ---
> bod

-- 
-Mukesh Ojha
