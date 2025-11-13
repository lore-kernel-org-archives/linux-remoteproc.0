Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE723D288
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043517; cv=none; b=AD8MG/KjQBh0NFanH5AcSm/ZBhkh3hgnA6OwoEFE5OT7MpPM8YH13SydZEGNoyq8rl41yH10iPupIlUpqSTIgwWYmqNKx0Uv1RqBu2p7AWI7HuwMbeJf5ZCG/O1dzAs5xTNnm8FPRXAduSdvkGh+NZ33dAL+J0LvvQgvWck9scw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043517; c=relaxed/simple;
	bh=YPiMjVGtnmzVmhP2MBtXj02fTkYPYr7pqgd1RZjfN3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIAPb1l24uoMkMe420I9SDuytpLB2IeG6PmCrBUUGksploBbs98KWP8DRtaWc/3/PVp4+hmwDF9vSxPaU8H2vqrfgJWuY2DiOnwrftSncedE2qJm+Pm4xPXenBZwc7i0kVBZuyrIeHJKUypmOyzylPO2NPwQqFztyUZX9vM+1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsyT2DR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHFYuCyT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsyT2DR9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHFYuCyT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD9FNlh3113203
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 14:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PYfAGt7xLkn4IooIS/dHIQut
	IGT7n93ycU/0f7jdrwk=; b=fsyT2DR9Z6EGpz7UZwYGX+c/PHOi6PG2tCSSe10e
	j0QKJHQtqWK5K2o+m5nj2y2v4wYkYHoLmMo5PJGWt6cX8cMxwQq1em76Pw7v9er+
	J68o4gDGAOCcXxa/3ODHDXci1zLYFJC2mGYOFJvR46qPpeAuoYU3G1MpRpM9cnZR
	oRGwhI3J9WINQuuVJbx7SxT6Q6Jz/gV3/pMpVocFX55Vng9Npno7AJVjplk/jfyU
	Uj8aisMlrZWXj6+IeSWDq8kAyaJObuWWDNjp8kWG4ArlB6erAduP8b2MSGJPqjM7
	Zj80xLF9gpbpVReuCCvxNqGeyn9WBaZm7Q2v4B5Aj4tg2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw4c4eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 14:18:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2955555f73dso7517515ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763043515; x=1763648315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYfAGt7xLkn4IooIS/dHIQutIGT7n93ycU/0f7jdrwk=;
        b=fHFYuCyTCxRP2paq5NpShMNdHpNYheqXhDwMSRMhaWcJSlTpY+pLLriU0YS353wbXQ
         ooK0L+hdUHfwUXrFJ7UOpijvLzqPNZG1zUzQ6EGTVNa7Z445q5XFhW8fT1eLtuyGrj0I
         471ulT7lATNStZrV2aziqFl/eJIYNSlZ3nf+8y0Dci3VM5RU6n4zPhXQa1v30FzOk88K
         PvSjoDTLjotSWTLsl0VKdLosOCqJ/cUop8ddJ37lq3HlyRDttX76yawqICE4taoXhe1w
         ErcPIVfEAn6Tl6wQg0rv+fFeB5n8Pd/Lk5Vtu9wjQCbPJpvSne8z5XV3Y0EgqkTOU0+g
         Yb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043515; x=1763648315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYfAGt7xLkn4IooIS/dHIQutIGT7n93ycU/0f7jdrwk=;
        b=PC5c1J42NVBL8lB8uYz/DaiN2DDpprQEUcM5/7dui42GvsOtD5ZP/syG75WpMDHurc
         ATHauRCMoYoOdBzkl5cacowjYraNGMth3FB9JsfAL3YQvk+tlMOcwghC901fjTMgfOJ4
         TbWH1D9aSIz4lH0yxXn0CruGGpgrB9TmK0ZMcwy6cozSbyjqzs0/U+7F78clWpzHsbDk
         ad4fSNYRraqs6b3HaVvwIGxj+iArzsubB5B8ZElLTQ0m4AUGk7T19oMSQqV8sJe2PFfi
         OU01PqMvhJ0qhCZioeHkiZVMeEc2d6pxa3xFOAaUdicryDXj1q0BpWfaYTs/WcTPTm4q
         hASg==
X-Forwarded-Encrypted: i=1; AJvYcCVnP3RK4MgVmJQFkFgFRLPHe5DrcAXc38uMsRht46Sz2mX/2JlH9HGVXnKjK5da6GHqoyYvuuQi1tD2FnI8rtSp@vger.kernel.org
X-Gm-Message-State: AOJu0YwdInRIA10B/ZsEaMUSsu5TH5u5V+oprJEBIq873QFntYNBoQ/D
	Ky/mFq2Z8fr/9RdTN+APzjEvZvJaS0wXpP9RUu/TWSFF69APKxNjDEcFHxCBeh57fz/88smI+8m
	qoAwy+frG+vi2uQ+DG9MvaNOlXJao2N3lHSkA2nf1a1X+YvosT+sZE3dprxQb+Hk8emtW57d+
X-Gm-Gg: ASbGncuBBfgC0hc60PAmKsQ0yJ+wzBCmZS0/QzhqWKztimF82KnGMmLFV0reekBNj/x
	y1vBgFNOCUqslaMIA5A3HxfzZ7GBFHKvLdgNL4uztjM9RmX5S25TtU9wec2MX0QZr34CtjSWPbM
	lolhKfgt96f2+fipSB0prUTYrsqKRIgo6e4uXnoH88K0ImxupKlWG0zKgpuFcr6U0iuKBL0Bxix
	vfu5IglkW1h38h4YSCz5z2L1bYDJB6yLHHZv3GC5geok1c8wzBRGYGDMlSXUfBx7odPV2SLR1eV
	aqvIeQP1yzt968/2N+l8F8kDgipUaTPNoAbcRi72szOUgdjBFQtV0mK0hwXVgQjidvESXEz4wjp
	RRxkcxTP97pNDQO5RpovHZqJe+w==
X-Received: by 2002:a17:903:1c7:b0:267:f7bc:673c with SMTP id d9443c01a7336-2984edccae7mr85923245ad.44.1763043514542;
        Thu, 13 Nov 2025 06:18:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJyQhQCidxyHZGx2ofEawlrPhEHp8JTQarlTsdV8cD9Z81y5uxOIWAhSZjP2GH3r0u2/kFpQ==
X-Received: by 2002:a17:903:1c7:b0:267:f7bc:673c with SMTP id d9443c01a7336-2984edccae7mr85922725ad.44.1763043513787;
        Thu, 13 Nov 2025 06:18:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245f74sm27334445ad.39.2025.11.13.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:18:33 -0800 (PST)
Date: Thu, 13 Nov 2025 19:48:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 04/14] firmware: qcom_scm: Introduce PAS context
 initialization helper function
Message-ID: <20251113141826.qvjz4ozlnvx3ucw6@hu-mojha-hyd.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-4-df4910b7c20a@oss.qualcomm.com>
 <aRXHlL49sSGML__G@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRXHlL49sSGML__G@linaro.org>
X-Proofpoint-ORIG-GUID: vBZ4fjhRQGa2bY_d8qsocgbVlnl5nHaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEwOSBTYWx0ZWRfX0gCfEnBU2pLp
 +PCbXtwQm2E2m28iSFY0rU487szOA4QoRg/WujtF0Nbne/Bv+tSu9NwiJ4JkYpTgb7PPbJPUsj2
 8aSxp+dmF/dxCa5cYWkF5OxUGHzo/4vWFXU4ERCtMALEXHOlrlPMvz+MeIVDceE1+urNYj/Aejc
 s1aZMj+cqFpJ+LtnsVf71QXfImcbGMZ+GzVStOdnCqW0zMOmUb2yFjsMx/3R5sMXwEXO09xZafo
 cXYe8BsL6lFeMEyfUjY1YvTz0d/hSvOg34so6AXEdUf9VzT9iHilZOF4VhoAeEqjVkTwZRRVWIC
 1P6awNcwoDtRDLxiP1pa+90FUvP5sz4eFQsAMjRKm3BDZZP8noX3tb98ZhLP4TWseZXQIiRXVwz
 A9fETr6BRK3kG9HbaCNQYzVFbAP39A==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=6915e8bb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uguQWuAc9R0SQO7IgggA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: vBZ4fjhRQGa2bY_d8qsocgbVlnl5nHaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130109

On Thu, Nov 13, 2025 at 12:57:08PM +0100, Stephan Gerhold wrote:
> On Thu, Nov 13, 2025 at 04:05:54PM +0530, Mukesh Ojha wrote:
> > When the Peripheral Authentication Service (PAS) method runs on a SoC
> > where Linux operates at EL2 (i.e., without the Gunyah hypervisor), the
> > reset sequences are handled by TrustZone. In such cases, Linux must
> > perform additional steps before invoking PAS SMC calls, such as creating
> > a SHM bridge. Therefore, PAS SMC calls require awareness and handling of
> > these additional steps when Linux runs at EL2.
> > 
> > To support this, there is a need for a data structure that can be
> > initialized prior to invoking any SMC or MDT functions. This structure
> > allows those functions to determine whether they are operating in the
> > presence or absence of the Gunyah hypervisor and behave accordingly.
> > 
> > Currently, remoteproc and non-remoteproc subsystems use different
> > variants of the MDT loader helper API, primarily due to differences in
> > metadata context handling. Remoteproc subsystems retain the metadata
> > context until authentication and reset are completed, while
> > non-remoteproc subsystems (e.g., video, graphics, IPA, etc.) do not
> > retain the metadata context and can free it within the
> > qcom_scm_pas_init() call by passing a NULL context parameter and due to
> > these differences, it is not possible to extend metadata context
> > handling to support remoteproc and non remoteproc subsystem use PAS
> > operations, when Linux operates at EL2.
> > 
> > Add PAS context data structure and initialization helper function.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c       | 32 ++++++++++++++++++++++++++++++++
> >  include/linux/firmware/qcom/qcom_scm.h | 12 ++++++++++++
> >  2 files changed, 44 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 0a0c48fca7cf..e4eb7f3ab7a5 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -558,6 +558,38 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> >  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> >  }
> >  
> > +/**
> > + * devm_qcom_scm_pas_context_init() - Initialize peripheral authentication service
> > + *				      context for a given peripheral
> > + *
> > + * PAS context is device-resource managed, so the caller does not need
> > + * to worry about freeing the context memory.
> > + *
> > + * @dev:	  PAS firmware device
> > + * @pas_id:	  peripheral authentication service id
> > + * @mem_phys:	  Subsystem reserve memory start address
> > + * @mem_size:	  Subsystem reserve memory size
> > + *
> > + * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
> > + */
> > +void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> 
> Why does this return void* rather than struct qcom_scm_pas_context *?

I kept it similar to align with other devm_* api, however, I can change it to
struct qcom_scm_pas_context if it looks more reasonable.

> 
> > +				     size_t mem_size)
> > +{
> > +	struct qcom_scm_pas_context *ctx;
> > +
> > +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ctx->dev = dev;
> > +	ctx->pas_id = pas_id;
> > +	ctx->mem_phys = mem_phys;
> > +	ctx->mem_size = mem_size;
> > +
> > +	return ctx;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha
