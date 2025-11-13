Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0631F1534
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044084; cv=none; b=MWxeqRKaestPMmxHXoCOUrE1L/sGLvWxB2JQNGYYlQoQO/WBpaDZXRIUgpGWiFjpdJamhq95NrVdmoaGpuPkj8pnefEbfQCCn0ylAmx73O/Al/WUgCDmsnoLQyczu45sJZx+GlcRBs0YS9ax7HllsdAsqstBQ8v4f2bbofytBwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044084; c=relaxed/simple;
	bh=wxL6JqA5P6ND1K/mSIMRBRSJ/NijehXz7WxjVwIPCxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzFIkxHp4oclMRqwuWX08m843t7nlOrmX6U0Vn1pMn8rAwQiqO+ZwC78rFq2t0Lzv22YG05OG4mtAQmyHhd3D+d58sjpnjLJ/aNepOa1rN+bNNohR/cAOEcomZ0D34ijVcE3xVCi+nkyEccc0ifJJHsMzQrpvvqQmQNvb0h6bVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+lYOFyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYqJK9tD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+lYOFyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYqJK9tD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADCL9UT3440860
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 14:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cvt0Ju6kREFAmxAocRiQVGTq
	zMjryYQhAdRV1lqmy2Q=; b=f+lYOFySTwhBaiQRTWzblGRWvD2Pk9VJhhVFGdRP
	zdSAqcD/MTp4WQZSsMLDiAkbCWR/vKhK7+ZSPsj3qqcCQTYDd8d84c/XkwphgeRq
	FbI9b+qF0/ufnDYk33O0f/vVWVtfTvYdqcNiZJUKyev32S6xyzvUpNlDnzMNabuw
	+uap52v4b1WWGajL3dM9L5Yk30ogSycZuB55MC1siJsjt1OPDZtE5aXu/SDxkmjP
	A3AcoEaJsryNRDWEo4Jl6pHequeo76gFZhEsJef6m2jALHI5GHPvQI4be9mSn3Gi
	iWje3OJ6meGzlMl9UvvgmCXhQfL54Wgo7+wSMhazDidFRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9789mvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 14:28:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b9ceccbd7e8so1863126a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 06:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763044080; x=1763648880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvt0Ju6kREFAmxAocRiQVGTqzMjryYQhAdRV1lqmy2Q=;
        b=XYqJK9tD3oa2p533x0yoaR1nqGCJ8ahogUraU1NrGwz7GYAVyaxUg9+ivmfuc7GCOX
         Va+TpfZCO8D2n1u//PTsmru/AK1nyEE62uFYyaalw5fN7IPkDHZcnVw9hZtlXvmQB8S7
         lipvgQ3zHLLrGGvvkER8/jW+2i+Fi7qo8qgTjKrdguOeQmfJw8puXqC85u1p6T4Q8QXC
         3w7aEH9lqg380KNPSwW3YBv8eVcNFYmDxFEnvTMlSEFO5Wdifxy/PHA5ew4CjFtcTfwi
         c5yB4myVGQqSlkJJLAkOQ4X7R4QCLf/OjI8IeBcVtQhRiDIxGYpN+2npqugedOTXuijr
         7Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044080; x=1763648880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvt0Ju6kREFAmxAocRiQVGTqzMjryYQhAdRV1lqmy2Q=;
        b=RUjY77yuNTI18EQLOSo2/3IHkp6sX5Lv88yQfm6HNubvSFA5cg+0MZQE8kNExn316R
         gbb5UrXpvUeMFYoKdJ9OyUj1FaphGAdGH7Pi+YHOrPWwUIs2qFNffVs1iw+UDkbhwp4Q
         skpRI78KlP9GA4YKHzrOkpW67I3WYo4tS4qShBs+E8YUBYfK98jXUXru7rLPaYrKJgm0
         qpspXIgyMyF/nUUIWBIeJGGHNsoJtC9pj2qR5APNsbgInfYZEZE7WxpiAQBHtNQtfvjn
         IWG8AjKR4+THAZ7crDdAv1YxVAV3tLh1bmI8FXyNNStc3Rrnbu1AthABjlViWm+rCmhi
         biGw==
X-Forwarded-Encrypted: i=1; AJvYcCVrR6TnzaW3IojCT2PkmzRKdcg9BKe0bxMRxh9NOIZJRuFs+m9qZikc1B98iIU2qWZ7kQqQOLfzrhFbxSHH/Ol8@vger.kernel.org
X-Gm-Message-State: AOJu0YxbKgzmcsbMWXNBdxoKajfcBjfoHXIy5wRbLQ6zpbMF6bL7rh8C
	K/aGlG/qFeK8R5BDzH0oiKpGKUgI0bGDlHSaIyBEBEFXElfVwbIUa0OuSdrdU0XqXKlkS/V05c4
	NxYuFCq7JwGQGXcqx0hAFO1bZHnYR0jN3FveK/jRoScRB8Z64+xseI2NScAZlQfWWrRMbtvNw
X-Gm-Gg: ASbGncs7VmddLQLwFlNJyAJNyW8e0TdcuBoxy74YnzM3DoDtKhuEzy+Tq6Li/r67fhD
	9fJYWFJzk8hGbUq3c+KeXG9aUoOKwgiH8NGzF6haOCpePzeCY3A8+CZH+7/uJ9eJVrYqGSzQa+u
	IImb0GSai0VSSo/HidGbT37v6rZ9yvmAz7zUnoAT+mjTjXSe++knD/YC+y0fRGRRkrxN9w9gATi
	7haMimJ8H80u6VRVMzgvKaGNpyJHxPA1lIkZSs319gNSPrnlQhu7zrMjAyZyGNiVQpaAm6kmm/h
	oJqLxS55mmdaXplJKKScxnjoIyq02JAVx9/Pu1sSSf4ykVtUWTXRFhxkBv+atOw0QLcp6rbiJlL
	8m/c9QxyEGC0tuSDVXCIWGQT7zg==
X-Received: by 2002:a05:6a20:9187:b0:34f:99ce:4c48 with SMTP id adf61e73a8af0-3590b50d138mr11223217637.42.1763044080046;
        Thu, 13 Nov 2025 06:28:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgOhKHdoyd4hVxKr3awuEOk5CzcMCINWva12ZHc3reUPY/2Y1RQ63s8nWM8xy6Dy7GUgjo6Q==
X-Received: by 2002:a05:6a20:9187:b0:34f:99ce:4c48 with SMTP id adf61e73a8af0-3590b50d138mr11223163637.42.1763044079363;
        Thu, 13 Nov 2025 06:27:59 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c22b1bsm2502462b3a.66.2025.11.13.06.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:27:59 -0800 (PST)
Date: Thu, 13 Nov 2025 19:57:52 +0530
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
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/14] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Message-ID: <20251113142752.syzvlfxe45a7kxrj@hu-mojha-hyd.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-9-df4910b7c20a@oss.qualcomm.com>
 <aRXLJL632V0ys6rs@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRXLJL632V0ys6rs@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExMCBTYWx0ZWRfX7XTUWJg2s6sI
 l/tVlpp3N9eXf4rL7kbUyum+VIPFAh7WTRUppIJJmr/qRyDbKQmBrciKv4grely1xXi6zyO/Jy8
 MHs+/650t9diUb7cZChBY0uucPxLItp8YTQlgvwfj+wucxhBxiluo0ujvkph5hrNeaH+8K4Ifrd
 7DEg6qsnPJhiAmqK8VnvEthx/0CnikbL7KTFqbI8b3bEee1XDA/X7F8ryI4+JqEb1OA4ajU8XRo
 PpNUyp14gx8ZSp2l4AQqoeGm5tRMbpJXErfR65chh8rBytLyjb0ZFH6j8IDi+8/46JR5YSlKHp5
 5Uvumr2G7+sO2eE9jxjryTmOzbXx4j60TcI4mziUHEmRX1dViQR5oK7BGRf9zvMasNV3XzZNbn+
 XmcdJrxYi+j55Z6cJFs5zJ348Vz1dw==
X-Proofpoint-ORIG-GUID: SCirouCz5k0c89crZ7HRIe4vmcqHnQlL
X-Proofpoint-GUID: SCirouCz5k0c89crZ7HRIe4vmcqHnQlL
X-Authority-Analysis: v=2.4 cv=PIYCOPqC c=1 sm=1 tr=0 ts=6915eaf1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=O8AhHoIjlE42LP3zLE8A:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130110

On Thu, Nov 13, 2025 at 01:12:20PM +0100, Stephan Gerhold wrote:
> On Thu, Nov 13, 2025 at 04:05:59PM +0530, Mukesh Ojha wrote:
> > Simplify qcom_scm_pas_init_image() by making the memory allocation,
> > copy and free operations done in a separate function than the actual
> > SMC call.
> 
> Nitpick: This feels more like "refactoring in preparation of the
> following patch" rather than a real simplification.

Will reword it.

> 
> > 
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
> >  1 file changed, 33 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 550707f2b46d..1d8a2c537c44 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -590,6 +590,37 @@ void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t
> >  }
> >  EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
> >  
> > +static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *metadata,
> > +				     size_t size, struct qcom_scm_res *res)
> 
> The metadata and size parameters do not seem to be used inside this
> function (also not after your follow-up patches), do we need them here?

Yeah, you are right, no we don't need them. 

> 
> > +{
> > +	struct qcom_scm_desc desc = {
> > +		.svc = QCOM_SCM_SVC_PIL,
> > +		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> > +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> > +		.args[0] = pas_id,
> > +		.owner = ARM_SMCCC_OWNER_SIP,
> > +	};
> > +	int ret;
> > +
> > +	ret = qcom_scm_clk_enable();
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = qcom_scm_bw_enable();
> > +	if (ret)
> > +		goto disable_clk;
> > +
> > +	desc.args[1] = mdata_phys;
> > +
> > +	ret = qcom_scm_call(__scm->dev, &desc, res);
> > +	qcom_scm_bw_disable();
> > +
> > +disable_clk:
> > +	qcom_scm_clk_disable();
> > +
> > +	return ret;
> > +}
> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha
