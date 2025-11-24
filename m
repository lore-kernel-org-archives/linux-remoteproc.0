Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB8B26059D
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763983914; cv=none; b=gKjJNbFlWSe46Uvk+ZsuZb4/ar4frbJ2fptUhOKwdqHmhnl8M9IltWcUkiqV78zE1qlcgu9B/lVEF7QB2cC+iXFlMggFlwTiRiWU9MAobIws1d8RXiocZyTbngUEj6ZbX4QnYx6VBewb2SRC/72J4BCgSVIuuOffP6n68iQfxHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763983914; c=relaxed/simple;
	bh=POgvD532Psv8/4iElHJei5dmrqieujOLDI0+1ls8BCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TW4zUafMKwh0OVtcFun7GWRMtVwZNk1895dOFTr9NwP8LMw6+ko3UBWC+kUdjPhqSnMEmI0uFgXezZg3gTGroJh/avuT7fMRmx1urTcdKjZgHU/mPg5aUbfcgrwKkYVL/IdfoLr0qMBpZxXcrczqPYUophJ3kiaBAsc3/TdFXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKUl9il+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3bJvgCJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKUl9il+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3bJvgCJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8Z2I62709308
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 11:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0m+PkJu4/Z834m2Gn1mfXXSme7MGZJ5oYLAYQ+0JQ9M=; b=lKUl9il+SgN6fbEG
	yxuPfkhclWzryU2RWZmyLi8dEmmsE8/INCMG6ErUl32hkogt2RDaOJFN5fL2BhDb
	24M35ZeM3vJCc0q8vuLVQMwJfTpwBi1zHTcOAOQMWtIxyB2mbQrZeD0G96T466f3
	RX6EmUdhlBAVErxHGBOxOPyCg6yQCbM2SQLndfpMcmaJ5TUR6BnfI2U8xAFsEpsN
	oOSfMFofAmYRx7yNDWoz5dC5o/48ikOdtV7IeeTSLURrSggIb0pAx+lmMhwPxj6B
	TRfHIHzkuJViye8dM7bsdNMxlovurd4t5a8lXtDqwwdSmCh2x20iGx9cLjYgxzW3
	WuIqXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak691mty9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 11:31:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b184fa3ffbso142344185a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 03:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763983911; x=1764588711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0m+PkJu4/Z834m2Gn1mfXXSme7MGZJ5oYLAYQ+0JQ9M=;
        b=G3bJvgCJnSAwuYp7T9NQbKW78gkYSkon3nSyD5mUfuJMp1NMNCZ6cASSOzBZqAiTMe
         CnKuHuukU1FLA9wmefta4+3dLpuN/Mk/yy7EGBYaqrtvxZTB0wi1dTzHFfALypDIGi/v
         zqFggEZAKAutSWDh5Tjoiw9V74K+eJIX7MTggLjC78wZYyvlBQjUCIwT86Wi0BIFWfTP
         6td01w9KL1zacwdmVfJ2qf7f1MDz5Zh8e8IrA/+5LupJlW/6MSY6N0CktvaTWn0qZr49
         4So5SbqI6gphfDVvgSAqy7Vu1qXffs/9sFYfkgz1L6YoG/vBePf9FTmFceZWZK0IUM6A
         DUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763983911; x=1764588711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0m+PkJu4/Z834m2Gn1mfXXSme7MGZJ5oYLAYQ+0JQ9M=;
        b=Uma8ceFr6TXBnPgucN0FWN8Wy9moCTzkBkpK2hQDOD0vdjOT8ZNWlHJxFNIeR4ZXaP
         qT3cM4fS/yBxgxpeHsNXz2NheM8qcPYjg9pfsuqL+WvNoxu2JEVox0rNfz3aaJY7k8OP
         KRLex5e2Uv/haS2v/+FMgamKD1UbnVOf9+HcI+lY7nzI46/CaNohcxJ8A91fyKZ/YoCk
         6fn3RoPBS6mGtjSHuGb7bPCtNCGAI7NkPfZzSnegHHNHWQrwvQEIT19IcLf7J/duiSs/
         VoJ9sC2zuPTLNmlnMuenfhvD+sRfGk36RQuvxT/1G81N4ChTFt8tEcl+SEn7ylVnGGq0
         zIjA==
X-Forwarded-Encrypted: i=1; AJvYcCUsSragU2ncBnrpbrzliar94I/90n1jdZHK+5CROIUoNywCNjWzu/M+XI4daDFvlE4ldwimwHOe4SCCFZ0how72@vger.kernel.org
X-Gm-Message-State: AOJu0YxEq5ByRbfvaTm4g3zr+Spl0+cgSDDlV+/6H4/JALbJn83+rbV+
	7tSujv8Bi4vYM7oVn0RBW8JyXbUwq5/csPzFAqgOiumpD83xfEJKYTCLbCykYIy4pyEGSrBYr7A
	pfJ4tow3Tp0hJj3HxC88G/Smg3WuCC+ycWtprjfdABOqb9jUpKxMFuNJj5SkNWBNGokVMi1Xz
X-Gm-Gg: ASbGncvsdY5QnRUt2j2ukAvUFQ05/T50vcPAbqnh+/3Q+Hw8aUVdTVX6rnf9yaP5P3I
	MG5RhziiTCATqix3I6K1gT0OevRvksDInyqqei+rQ675PLOO8gk4e0SILpdYRKwazyNl2SqIkkX
	4PTtt2aHz8ljOLviBYUj0/7KAtw6zrHS+pVCHM0J9B3GY5VGzcCd+DvJNNNgYRdqqTlqQY42B/a
	Dyo2xYEcTlG5ZbMfnlrWfzwC2GJ9gw61IQ35TjuAkFU4DYnSwZJCyj3iTpWYzSRzhaygwac6xb8
	bcpndvu0PJcobt5TL1/FTRtUomJrDm9xrfvh217ZQLBamS1jp/ndoxb4XYRxaeYEOFKebdH6G6U
	G7/2F5cVsHEgVaMLhrRrDCTNi6F3xGOozqn5EexT0gM3l7nBq07hH3PF11yVn4CeqPGY=
X-Received: by 2002:a05:622a:284:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ee5b764240mr104467431cf.5.1763983910762;
        Mon, 24 Nov 2025 03:31:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ2vguzLUn0pa+csYBEUVfXDooRIujsUhiPcLX4A8hVoX6JZU9DMDYNwgT0GK1SHuFpGTYvQ==
X-Received: by 2002:a05:622a:284:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ee5b764240mr104467211cf.5.1763983910281;
        Mon, 24 Nov 2025 03:31:50 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdabd0sm1248373166b.12.2025.11.24.03.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:31:49 -0800 (PST)
Message-ID: <d7342610-c37b-4f5e-a2bc-1a683f9acf97@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 12:31:47 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-13-8e8e9fb0eca0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-13-8e8e9fb0eca0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Be3VE7t2 c=1 sm=1 tr=0 ts=69244227 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BNBRsNz8S9qWWGfTIFwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GnMwOQ1yZEsRsN0KYoWWnhKUBfZjziqF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwMiBTYWx0ZWRfX7ZuThpQu3Upr
 7SWTTQdLyUN1NYw5GjzYaXvuHEdQ//afBFpozYoT9eFdwh9X/LDEfjvCsvSCjUpdeWDXb5J1dYr
 jxvFwNbqRhwuN6N2sKXIRLlcRJxYzqRnrFHk8Hxeew1zPwbTnUVHAcun9fGwNWxfKYm72DwYBAJ
 +E81QC8ipCgo+zFbY+4drFdJlpIzV+166OHwM9OSSU6vi3SE3TfhTzEVB7WzB0IVgOvhojMuwiK
 FEWnXhedgmFrllraqta9/GmtIqhnmOrNXiytsFFXgPVnY7+j9gClkN3h43pHjK7auPUa6LcuqfR
 u2fAXrjeTOkeCPrTP6YCa4dtamCdAXYPeSel73KX1ZUKbPVTMuY9kp4bjelpOvxX9Wvq/2V6CwV
 wOFVcv84N3570p6skispUCrE7QwW8A==
X-Proofpoint-GUID: GnMwOQ1yZEsRsN0KYoWWnhKUBfZjziqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511240102

On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> Most Qualcomm platforms feature Gunyah hypervisor, which typically
> handles IOMMU configuration. This includes mapping memory regions and
> device memory resources for remote processors by intercepting
> qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> during teardown. Additionally, SHM bridge setup is required to enable
> memory protection for both remoteproc metadata and its memory regions.
> When the aforementioned hypervisor is absent, the operating system must
> perform these configurations instead.
> 
> When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> own device tree overlay file that specifies the firmware stream ID now
> managed by Linux for a particular remote processor. If the iommus
> property is specified in the remoteproc device tree node, it indicates
> that IOMMU configuration must be handled by Linux. In this case, the
> has_iommu flag is set for the remote processor, which ensures that the
> resource table, carveouts, and SHM bridge are properly configured before
> memory is passed to TrustZone for authentication. Otherwise, the
> has_iommu flag remains unset, which indicates default behavior.
> 
> Enables Secure PAS support for remote processors when IOMMU configuration
> is managed by Linux.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +	pas->pas_ctx->has_iommu = rproc->has_iommu;
> +	pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;

Sorry if we've been there before, but I see that IOMMU-mapping happens
before ctx initialization.. can we drop this parameter and just use
device_iommu_mapped(ctx->dev) in qcom_scm_pas_prepare_and_auth_reset()?
