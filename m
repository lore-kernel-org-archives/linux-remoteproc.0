Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74966364E81
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 16:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766075312; cv=none; b=JnouiWzv1EdcszMAMnTX4NWvE1y/RR1nN9ds1DPmAfRWU5y19FF2OsQmFUsuBUrenQEK6///GnJlV2Zn2TnFY+cGhnoxfOl22jXJQRt5fekA6kSs3PDowkd515SYk7Mp5mBoz0uL8ZCXj79HjU//SaHUBMeUWTcb+grcKIN+OLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766075312; c=relaxed/simple;
	bh=+Q53S7+cfkUr0qjDgKgzwKKSMP7B2bU1hpixqHl5s+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfVKW2slFpiRzrTvQgAmUOxNfUmb8dizPiXyarKGAXXPoMP7Kn9MEUuVUmT0rxWUPXM3hWvNMhXuprbj4rRf2JHPWcrY2VBi0ARGYAw99mY0lRBOmMytVNc4FORV0XqMnxmIuf9rsKkqu2moB+IPxaO32uxvXZD6bGTPkcp7ED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SN2390Uj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNKG3h5L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SN2390Uj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNKG3h5L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI99FhW237350
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 16:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cFXufThGmi6KqtAMINkt3iEQ
	N5zq9xMwp/lgUM0zTlo=; b=SN2390UjWewENPZXe8yHFrqbnclgBBPsaucb7+9J
	CDtLH2acC2nrFbOtePebOx5yRUUCuQ8XY57iEmXe2y3uSSsirJPhglreObiZG+SK
	vAgirMsqclpIa7JFVSOu7VkA40Y6blwIntG4NRHEKI195oM9Vl1QaBNLCPCHrUGJ
	KFOUmVHM3wkKzEHmQx8J3lChH52WYdJFKBJvnNfnhC1qS5QFpOMZVAbgJrx3ONSw
	ILZlLbPEAZDALudeonUkjhjn3Oq0M6asUPjCcB3rVZZl0SujZj+7/9MSL+RN7R6z
	cRbVOvp3ORC5cJeyTmh0gRlFLPPOMGlaout52iWKQTa69w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3k39x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 16:28:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso8994505ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 08:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766075308; x=1766680108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cFXufThGmi6KqtAMINkt3iEQN5zq9xMwp/lgUM0zTlo=;
        b=GNKG3h5LVKjMeVRmOIalT7/K4Q8wUsUng8RWOjn1Ze4fAZuB9I+pTubGti+d1del9o
         tfzwsQFijCJCZZZr725X1DLq5R+Deeh9V+jdkPdYPe0g4HlSuNrCKwMJJyvQNH+w2WEM
         7jJXQmOBy1TUiWhRWvnmyXVnN35OUc6G/cbNzjaxvKlWiZKYHNCZpeXLpdj+WGuK0WAx
         S4mZlsykg4n7fPb/BeUHF5I8FYxI4Eq0+HJixvNR8oa5V97dFBqzY9/LhaI4AZrE6hia
         0c7X9ZoOIjbXrFoQ49MTjSIcdtxuMLUiGBg8i2pJ7JqUCQLYagFJxxi4VbcYOSf8F1Tu
         JVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766075308; x=1766680108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFXufThGmi6KqtAMINkt3iEQN5zq9xMwp/lgUM0zTlo=;
        b=iHDqetNBWaAM3DDXAFtgTgbpOLqpyxoIH0y1YsBSCeTn0ArmffNOgucBjTk5rboL1Y
         ilr0J0rVyfyFFVr5YkTDjuI51AY7Y+VXECWqlcfU9FIGxqdi1JauNtq5YKKCLkDNGeSr
         E/sewMx3R9OYikp768vyyDGV4FZZsRklEXeQTLQQUB6KjdvcLh9nks6TSweXT9OAu0+6
         UYT0vXAlVmK1wDDbOVqKjZoh1r3nwri34laGCdmN91vL+WV30V9ciwR/iDzCKMNgpOCO
         F/TuD14vGk3S6Rp/W0kZWmyDoTjplx5kMhFNiQhjZPytA2rJaX76rPwP4W2Tru9n8xh3
         /HHA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Z3n1tBQEhndXyaC6uQALLL2EIUxrCoG86Yl4OuoBILplezXo0BKZZrgJLTGZS7JoGcIfd9WSEg8m5QK/5RJF@vger.kernel.org
X-Gm-Message-State: AOJu0YzoonGIAOXI8aWZ9OKUCl6zamkuB+1wnslixQw1dkhXYPBkpeo+
	SipyJWH5tm7XBjxkQ6ceN3b0O6S9Xf+Vj+Gi6bSymr3oto4Z4Vzp/XySwJ/2gwL0IWgeHt1sZ71
	aj635qXaX5ua7FVxPD9/0umolSMACBK/AcOly4f1D6OPC45Y5yI/zbshxgpw7Ps5OCewjmaL3
X-Gm-Gg: AY/fxX6J8BlGgjRq2BOz6pIMuLNaP2VgaBPwI4Tmky1TOhqAIbkzz95/wqh06oE28IN
	rfxkZeOD5IU67Cgt6E+6YK6L82z+2eeHVcPpOxYGDnA6/MqSclTh88EXl+ThMxHvpEOnXc6Dkku
	5t3FNk2NVMzn1AbxL58o3IsDFcrNj3gGMMEpnyzlENpMbOVOnvWBMQ63klBiqFZzRRCrF59mkCp
	Z6OS32H780VfvXlyLX6PRuxyc4C5WEpfXvqg4QBQU7iO84seJjcXbstbw+HQteu3ZW1L0lIlZMC
	ZCTzFQTRKbUfQQnQ/81YPoRdU+BL0jIaxqmybnZzV9zMUyCkV99rXzk/Ut0TCZPE1htDpsh0FUa
	HOb4d0Nu+WVHVrDlc37kDI202/NqD85zj4C51
X-Received: by 2002:a17:902:d4c5:b0:2a0:c884:7f09 with SMTP id d9443c01a7336-2a0c8849791mr163809225ad.38.1766075308044;
        Thu, 18 Dec 2025 08:28:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvV0t8gQL94/p5tlQuYFozg5mD8lYzdNTXP+98KkNS13iOcrz1ATjM2pe6BGnxrdUHVnWf5g==
X-Received: by 2002:a17:902:d4c5:b0:2a0:c884:7f09 with SMTP id d9443c01a7336-2a0c8849791mr163808865ad.38.1766075307305;
        Thu, 18 Dec 2025 08:28:27 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f0cd45fbsm761655ad.97.2025.12.18.08.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:28:26 -0800 (PST)
Date: Thu, 18 Dec 2025 21:58:20 +0530
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
Subject: Re: [PATCH v9 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20251218162820.fkhxc7nr7xcye57m@hu-mojha-hyd.qualcomm.com>
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
 <20251217-kvm_rproc_v9-v9-11-ab7ac03e0ff1@oss.qualcomm.com>
 <646c0f6a-9d84-490b-a55c-7ff92e2b26f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <646c0f6a-9d84-490b-a55c-7ff92e2b26f5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEzNyBTYWx0ZWRfX3wrD8AtFVj8x
 rmMZNcJWN0cgZHSyZktqqtjezNR8YJ41jf2di7N8+B0VNo1Hk/8rdYlcRvIIZ/6vbmJ6NKe9zpS
 EEmohfe81IkVjK1mF5nUjZZ9mJCSpiCBPgVux93dcCe9mhBOG1IGi8KfW/cjPUqX00+8Bm/YzHH
 Df7GduQv9/5X+one8zjNTLg1feJYGYKRtT0p6n6CfMKuYOjK0O7u8T/ooM2n5iwc+3FPGpMwM3F
 DrtCU+nWOr2nuOjC3SqN6Hr2GPTuKJkQ80aR+ylWYUsnsbGy5xqjsVF7J++eA/a4J4j5no/pWh1
 HzvbspUwCePizVwW4ZJDqbWxvzfsWmjAKQNAVgw0mmgh3sVy3jt7zsSzO/ltTZxSfhTcmGHxUr6
 zNYCb4JFlqbf2sZ6+6XIq1KGaH46vw==
X-Proofpoint-GUID: oH0P_AAVGBpO8v4X-rlhV9aGZxuiWDK_
X-Proofpoint-ORIG-GUID: oH0P_AAVGBpO8v4X-rlhV9aGZxuiWDK_
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=69442bad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=g61vSUFNigzP7AYlN20A:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180137

On Thu, Dec 18, 2025 at 02:34:27PM +0100, Konrad Dybcio wrote:
> On 12/17/25 5:34 PM, Mukesh Ojha wrote:
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
> > 
> > Some of the remote processor drivers, such as video, GPU, IPA, etc., do
> > not check whether resources are present in their remote processor
> > firmware binary. In such cases, the caller of this function should set
> > input_rt and input_rt_size as NULL and zero respectively. Remoteproc
> > framework has method to check whether firmware binary contain resources
> > or not and they should be pass resource table pointer to input_rt and
> > resource table size to input_rt_size and this will be forwarded to
> > TrustZone for authentication. TrustZone will then append the dynamic
> > resources and return the complete resource table in output_rt
> > 
> > More about documentation on resource table format can be found in
> > include/linux/remoteproc.h
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	memcpy(input_rt_tzm, input_rt, input_rt_size);
> > +
> > +	do {
> > +		output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> > +		if (!output_rt_tzm) {
> > +			ret = -ENOMEM;
> > +			goto free_input_rt;
> > +		}
> > +
> > +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
> > +						   input_rt_size, output_rt_tzm,
> > +						   &size);
> > +		if (ret)
> > +			qcom_tzmem_free(output_rt_tzm);
> > +
> > +	} while (ret == -EOVERFLOW);
> 
> This still looks shaky (do-while is convenient for calling this twice, but perhaps
> the allocation could be moved to __qcom_scm_pas_get_rsc_table() since it's static
> anyway, and then we can just do:
> 
> ret = __qcom_scm_pas_get_rsc_table(...)
> if (ret == -EOVERFLOW) {
> 	/* Try again with the size requested by the TZ */
> 	ret = __qcom_scm_pas_get_rsc_table(...)
> }

Nice, Thanks., will apply.,

> 
> Other than that, it looks good (although there's still a lot of boilerplate
> that we can't really get rid of with C)
> 
> Konrad

-- 
-Mukesh Ojha
