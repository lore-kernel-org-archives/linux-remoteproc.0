Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3A52F25F4
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759909925; cv=none; b=QhPokvZRuQwgadCai8UJvA1TwOGC1RobTka9O+g0VY/9VyB7M1hRvySNRNvLhvvzXrSBU9CQJMJlPBzJk14Q3BI5igDPODQK/9qTxIGkHMvAKmjyBk4oiMgEljdboGMS/4Z4FkYVtoBYp5lNcGW8ZyOliSjOC87YyEl87N3ZNlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759909925; c=relaxed/simple;
	bh=jp/zJEcCPvf4jK9W6zx5g+YSKeu8yY8hjmywdRuZSmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laEZVajXPEgjoTyWqq25iJJB6/LKGt0VPKMixr4U9/kPiM8trc0GTItkb36Mg1YXmzFCon4oaKhx1NugSNdRmUnzW5G0eGQ2eHXP6y36I5Koc3bZ+n3NXGv7hsLHZ6qsQ6H8cXC1dZEOrfn6Bn3tXtIHiHw48Zx/q3wAqZ+YhUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbEkQFpe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbEkQFpe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987b0TG028065
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 07:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRZFPPJQeCYCUJqQnDigqrNWBaX8OJqlWKA0JVc92S8=; b=nbEkQFpeRBLgPSQj
	/f1GLwdqSYQnSLmOMzcCP/how7x3+eNBMtAEDUCjEX6Utd/E+yinB3QFfMMQlwSc
	Uv2i54Y9RR30fXkrqie3pUnR3f9Cp0UQlYWlbniINnGP7l/4ADBxvbF9HlWpZawl
	tUUh/kDy69TLdt2XWjXovWJT0u+AF2BWBzBoyWTd9UTyc0+dHg6Z+d148idjyTZv
	B2gpn/vQoYrza6C3lHN0woop40T/CvLqET9ZGP+2k8ZNd0/k843l51L83fQV+v8G
	36q/si8FyItZ4TygoYzZOVRK8RK03imRIVzfWprJVKf6VLO6AY5QEopuGSRsCy+w
	Saq1sw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgsrey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 07:52:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33428befc5bso7992062a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 00:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759909922; x=1760514722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRZFPPJQeCYCUJqQnDigqrNWBaX8OJqlWKA0JVc92S8=;
        b=qimmv8df7ardU+T0J2iGu+4VjyZtw9tioBZFhwytubMXs4OvxvkXip6ofNGqHUpax3
         /kMAIYh1kpE4RzHkzF1pLBvSSNHlQKOha5TQDRPpvlHKIGoZs14K744aO8o5Mt/tHjlw
         sMB2ll8P7rw1nFr5kN5ddku9rD0JSSzeJLnd5mplest4CUZmgVuGHiMPyrtM+a8+U2kV
         CfXDzu3cfRS6ydGeqc714D7gvpVWqJfGguoFwliVJvjdOkMfaj59nfgLCDggLBJCyJ5l
         9aSEvmdpSTiXU6GUgb1x9MyjUBWiWHU7TUsyYbMyxExmJnH+x0Jf/SO4t1RPoTNY9GmE
         ZUSw==
X-Forwarded-Encrypted: i=1; AJvYcCW52Q8ENMV+rc2zNi7Ew2q3L9Diidijt0uv6k0DNme4LyfqTsrBLhbidFhTUklXD20vFxhyfQClRHwuv/PTJU7E@vger.kernel.org
X-Gm-Message-State: AOJu0YycGVq0PvmiZfonyygxaBRJtU4YGRGPOkD7+Gu1xr5Br2VgJCWl
	tN4dBCWgI0eswj+2YL4ClIDt/zn3huYptkjTNMudDysWmImO5S4Hzwh31chhfrnhChgvSJx2g3R
	qAUL6OaB9ffwIpgzSA7X1wORuyqX46COkx7q+kEM1RStVIgvihK/+KX4IbjqbTTMyDBXYMW6d
X-Gm-Gg: ASbGnctyNLRR38gIc5ugRUu/H14xf/H1M7G/icITEu/KUIKi4zkOYqpEThf4km69yoA
	MudXimL9TvMDG6vFWYVuKqCO/hTK+FXlZabdPZEK6wKlnmW7Os5N2FPAT5o73vdDGjWnfGwrAfk
	LSLdBgf0y7ZnzUZJgSIVfl15IPT5RBd7ZTiY/zj6tVD2EuihbmHFbq1cLxBPatojMtYms88fkVn
	K2k9abdi/DgiViXkb9rlHa2I8PUKxAIBfx3/1MvX3Z7gi27iYMkyfcrfNdYh0y33qC4VZhWcYeR
	VZYxWcctn7GSx+/taRVS8iE9Xv99YrDmaUenIW8UzV8LtqkeTwLzXy4BnHJnvaHUZuf4hZby
X-Received: by 2002:a17:90b:4d12:b0:32e:3c57:8a9d with SMTP id 98e67ed59e1d1-33b5139a279mr3467241a91.30.1759909921538;
        Wed, 08 Oct 2025 00:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu01xYjaBLVLru0tk2ZrxcSyg6W5LORhAKpnIdoAjX3D22/ZziNpKkl1IjWF6AN1qDNFxpNQ==
X-Received: by 2002:a17:90b:4d12:b0:32e:3c57:8a9d with SMTP id 98e67ed59e1d1-33b5139a279mr3467197a91.30.1759909920761;
        Wed, 08 Oct 2025 00:52:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5296d52esm888452a91.2.2025.10.08.00.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:52:00 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:21:53 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/12] firmware: qcom_scm: Introduce PAS context
 initialization and destroy helper
Message-ID: <20251008075153.wjvlnjr3iuncfued@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-3-de841623af3c@oss.qualcomm.com>
 <qqjynnzjhpe6elglh3xb4ghbtesfkr4ssxyq5flhcy7a5jp6ym@3viy7jyesamq>
 <45eb9c5b-bc8e-4866-bbaf-5afaed9fda21@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45eb9c5b-bc8e-4866-bbaf-5afaed9fda21@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX0iJbAxWRyQZm
 Zzw8SeGXH/OOqmCWyZVvTqlA5pkNXmwVAte3cwjiAaVm73UrnlF0DKLeNaf5gn/BTYfXXnRnwN3
 K6SJZep0nAMUJXq4D8TGuvXNQUbBMx5N88JYWijNII919POZ3NK16HjrAI9R8kR3bpO+pezyPav
 /RBWurCobuj1PJGNxppddykIkApII5qelAFtS2Q3mtZ1xr3LefeApfybrOSNNQrvbxyAApphgz5
 /dD2rHooo+GUG7guCZbFsw2SnOX7+EeSpACpWgEHOE7VM6xcGqs2Wl25yOxXqciQRmYhbMEUrSX
 HqEKeSVg7ixvQM7ZyVfQ/M6dL3liY+WKHjmP8Yg0cHaUnPvZL5JQBS2v4HaYIhFauCzRAc8ncGh
 VYiFEuOwws+lVmwLicxX0RdD0+PRVA==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e61823 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=3aEvWvYx403qF7UyPRkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VSW0srMfOoOCtGocThPxuMviIxu0kLCC
X-Proofpoint-ORIG-GUID: VSW0srMfOoOCtGocThPxuMviIxu0kLCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On Tue, Oct 07, 2025 at 11:16:28PM +0100, Bryan O'Donoghue wrote:
> On 07/10/2025 22:23, Manivannan Sadhasivam wrote:
> > > +void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx)
> > > +{
> > > +	kfree(ctx->metadata);
> > > +	ctx->metadata = NULL;
> > > +	ctx->dev = NULL;
> > > +	ctx->pas_id = 0;
> > > +	ctx->mem_phys = 0;
> > > +	ctx->mem_size = 0;
> > Why do you need to zero initialize these fields before freeing? Are they
> > carrying any sensitive data that warrants zero initialization?

Nothing special about the data.

> 
> Mukesh, have to say I don't think adding my RB to this patch is really
> warranted.
> 
> I gave review feedback that the above looked odd.
> 
> https://lore.kernel.org/linux-arm-msm/9139706a-708c-4be6-a994-120cce0cd0e6@linaro.org
> 
> Could you please drop my RB here, and fix the above in your next version.

Sorry if I misunderstood your comment on this particular patch.

I assumed your concern was regarding the manual destroy call, and I
responded to that point. Since I didn’t receive a follow-up on that, I
proceeded to address all other comments and added your Reviewed-by tag.

However, since we are revisiting this discussion, it seems appropriate
to remove the destroy function altogether and switch to using devm_
APIs.

> 
> Also please add me to the cc list for the whole series.

Will surely do it, thanks.

> 
> ---
> bod

-- 
-Mukesh Ojha
