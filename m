Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0F31CA68
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762516208; cv=none; b=rzzSAj3Hf/esKswDuwJaABFvH2/M+ScS9byfVHnC+Y/Rf9fGiN75kB1YsRXRf7Ws87jeXpXagUShWxMBKe0DISElk4Ct2p0qvhJHcwZfWrogd5i9ne7qr8V6+aKDTQgx2RnziGjUMXKuQUnKJi6AEoJgtLbp2Ymtyzpnh0bWJQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762516208; c=relaxed/simple;
	bh=9zKjZpUIYk+itNggUJ5MlXLhe3sBQBIWHa35miBX6W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYqQZ1scirwcGk7iTXdj4GX8ngc+a7sd2Gy/ysWBYxEZRLYSP6mwNr6v6m9nOR8VB4S9wit5Jhdun1MVueuzuIVJppAziyi9vksw2fpuyR5uhDxjjMeMJAPvW+65jI2ExXAplC1FGaR1BKPyyxJcB+kD89wPXdc8gm54a1O6Il0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncQf/rj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N98ADC6n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncQf/rj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N98ADC6n"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7B2Vj93041281
	for <linux-remoteproc@vger.kernel.org>; Fri, 7 Nov 2025 11:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dMrXAflLekSr2reWqAqWS0yB
	ySzoUwcO6ionW8M4Tzc=; b=ncQf/rj+sIhsA9BrBH/ZggfgAEiW/UZekYS7yKHN
	ojUvgTNPnIUixJvdLfDOzi1ht0SF46BR7ysoEvXFivkG+H8HVtpIMu0SH/emDGyH
	Ofd2ID5ytSt0xD+ExRDAVwG3XJMP6szhnHM/vW+KRcOD73Qj/XRu3qBwZPv+HKGM
	teW5F+LdC3DlEzzK45+FCOIGh/o99jX02KRhcB2G8sxPXr7XXVzk4ZMV0lw1LYU6
	+mB9fj/AyXUuu+xEkNLlNAqAhDT3qBcq/9KaGr0JWvYZjEERdrsV8gdl1SC3Sx33
	50yHxSA/31sAmJ4Dzba4UDCPCtjYTP/a7kkSyX+Wh0q/ow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fj083m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 11:50:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290ab8f5af6so8036605ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 03:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762516203; x=1763121003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dMrXAflLekSr2reWqAqWS0yBySzoUwcO6ionW8M4Tzc=;
        b=N98ADC6nQmt6QV1H5P6JbXCdmk/YrHkasEQUc3JMrpovHo71zSRop29W4Kqmf4FxfR
         YT5QueeTq2UyNHbjYd1lmL6iIY8PgB0kdyvSWmgtMJ/Fkbl/jvJj+uwPd+buLJKa+GO6
         8dqqyyOnBb2wyXMctd+d2RiR89j4K/ibMrslx47QQ284mI49HNjliSM//F/kzrtcM/qa
         jceqsVpM3BQ/csYWjPQMdv7U0KkAsKLrR6NJBgq1yHwZiIFYNQ2ibteJfeB4Y3XelKnd
         2jftdOYxSXTBq/HG3xIG8VN7hlmcaF9pg5Ouw7Wk9puhjSc9X6zVBMHOqbnvhSp3ekHm
         v8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762516203; x=1763121003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMrXAflLekSr2reWqAqWS0yBySzoUwcO6ionW8M4Tzc=;
        b=NI5vKaqyRszYGIDsSXnGCWH5FDuoNv9mWerCusGPN2rjMox/a8/jI+c9g2sTdVVJBJ
         WfCSrC7X+8PUWtZTNqtOv33cc51BnsKxYJfRrjOp9cv1u3/R4EX88kI3A0TvrlZpqd+M
         NAQrVYZroafIgX/atjltSnzR4QjI/i66yeV4fgUgmHNqlbxJaFL16GDxj/+UlJFZljTh
         XYUk/JsFY9PcU5Wy5b+3mh9q1YvyR8Q5zKPRvIDn7RUnICI/3oj0qeMEGkoBUx1Y0FEi
         t1HyfcHtdv24Rkp/mmXFKmmgP4PZdbMAangMaSisrESSxfP3TgQ/3TsWDUjqvCi8cncd
         GRWg==
X-Forwarded-Encrypted: i=1; AJvYcCUU49KtTBhwgkMUHd/W8qAgoXltD6aXC9OPtOGqye0lvSP8pSmcXWRGPfa+TSJEhNR/R2EnDpB5ODDqFo6yUkxY@vger.kernel.org
X-Gm-Message-State: AOJu0YzOdALPNb3DBiXayq1M0iRYfUE2VOi/ZJREALABsGUNfxDWEuEL
	Z6UH5E/mWM6NVDG58zJrfJhl4DTASEl6008tsU8XZ2G0PUgzzXLzWqscnUEbSS034DPfct8MmOw
	TI1fr1cfbPbFBMWpkevOSfkJFStoPXDJA3LC99Tinvg31oVdKsnOdQiWo/QNS6lWHKcKnriQ2
X-Gm-Gg: ASbGncvc0GYKbJKR/aJ7+VGiYyeqs2z44coXZIppCn6DDB6nmYvL7+gzpRdVRsIQfAC
	Mpi6+NnAGvL8ECQKbHSEIw0BuMYWF66tH8oRsOtHWBMuG+zAPViMWSYZAeitH90gHod5B3D73Ic
	LbyPTTt4+/viD0UEbk9/05aHN7U2NC8WZfvtZ41MMUn58qzgIbOSHYFUcBOS53Opn+L1BRWyXvn
	Dtu8t3tO9Y5XhdYBUUm2u5E+Hb4OnJWgmhTwmRk5cHnBHzLMwHTk0axmqdf/A9Gmv8GA+kP82r8
	8o5eWrW/wpNsfj/ipjWklPXSgitN4sMQB6iLnKTX0dhp4fBUfqeEhteUpKoiBpindKtcDZ3+N5d
	UH+bcQf6hs8j7eb6Wtyd2c2Af9g==
X-Received: by 2002:a17:902:ea05:b0:295:73f:90d0 with SMTP id d9443c01a7336-297c04931d3mr39770205ad.50.1762516203083;
        Fri, 07 Nov 2025 03:50:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhNAjO6ANvx/Ku1ZgGqWvUkOpsCN5R864El2BfAS5aa0p1YaTkf88N9laM4ZHwBOWafYkMdA==
X-Received: by 2002:a17:902:ea05:b0:295:73f:90d0 with SMTP id d9443c01a7336-297c04931d3mr39769635ad.50.1762516202345;
        Fri, 07 Nov 2025 03:50:02 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cc1907sm58007315ad.99.2025.11.07.03.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:50:02 -0800 (PST)
Date: Fri, 7 Nov 2025 17:19:55 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20251107114955.zprgt2peq34im3ji@hu-mojha-hyd.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-11-7017b0adc24e@oss.qualcomm.com>
 <5239980b-f74c-4458-a7e3-a5e7f6927449@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5239980b-f74c-4458-a7e3-a5e7f6927449@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XZyEDY55 c=1 sm=1 tr=0 ts=690ddcec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=g61vSUFNigzP7AYlN20A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: nPIv4NqHAhpH1Be0ORcZx9TFtFU6U8EY
X-Proofpoint-GUID: nPIv4NqHAhpH1Be0ORcZx9TFtFU6U8EY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5NiBTYWx0ZWRfX3JcGH+HwI6Er
 g2zAX5y7t4mXAjT/jL9ea/MAkT0aTykkx4mF+3ZCIyqi5tRh2Wxjr8owmwaWQjwIlGQbdJk5FIE
 Bcg+R5RpGQXVlGGv3LnALXPWqoUAzspcijpR1NPzlYbs5FqYIhJgzNPGnhG/IMpNwdYzW6AXHas
 Sgp3U5f8q/FIzfaU/9J/0II590126R/SF0mDr80YbT83hdPX1LFbz4TKQ7H+qSVslzlWXzuHJ+1
 ScbdPD77wKagMsFXwg4cxA8h16W99zO6KxlA5T+KvXijO4eDtvyTXEV5UkVyyPLoTYlho1Sdy1Z
 eO8EKfwVYPaRRIzrDLm6WqOtfU01HPBesZkt5+efG3Wf04YkU1g4lSsM6VbS42y9KSMcI2PtjxZ
 18slwFYvlz14dG+CnsDGp5t4ByBVig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070096

On Fri, Nov 07, 2025 at 11:20:20AM +0100, Konrad Dybcio wrote:
> On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> > Qualcomm remote processor may rely on Static and Dynamic resources for
> > it to be functional. Static resources are fixed like for example,
> > memory-mapped addresses required by the subsystem and dynamic
> > resources, such as shared memory in DDR etc., are determined at
> > runtime during the boot process.
> > 
> > For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> > hypervisor, all the resources whether it is static or dynamic, is
> > managed by the hypervisor. Dynamic resources if it is present for a
> > remote processor will always be coming from secure world via SMC call
> > while static resources may be present in remote processor firmware
> > binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> > with dynamic resources.
> 
> [...]
> 
> 
> > +	/*
> > +	 * TrustZone can not accept buffer as NULL value as argument Hence,
> > +	 * we need to pass a input buffer indicating that subsystem firmware
> > +	 * does not have resource table by filling resource table structure.
> > +	 */
> > +	if (!input_rt)
> > +		input_rt_size = sizeof(*rsc);
> 
> Would the expected size of the received data ever be any different
> than sizeof(*rsc) anyway?

input_rt_size != 0 and input_rt = NULL as input to this SCM call are 
invalid scenario.

Expected input_rt_size would be greater than sizeof(*rsc) if remote
processor firmware will have resource table section.


> 
> [...]
> 
> > +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> > +			       size_t input_rt_size, void **output_rt,
> > +			       size_t *output_rt_size)
> > +{
> > +	int ret;
> > +
> > +	do {
> > +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
> > +		if (!*output_rt)
> > +			return -ENOMEM;
> > +
> > +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
> > +						   input_rt_size, output_rt,
> > +						   output_rt_size);
> > +		if (ret)
> > +			kfree(*output_rt);
> > +
> > +	} while (ret == -EAGAIN);
> 
> This should at the very least be limited to a number of retries

Sure, how about 5 ?

> 
> Konrad

-- 
-Mukesh Ojha
