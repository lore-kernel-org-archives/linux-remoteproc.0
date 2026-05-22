Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43263380FE5
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451995; cv=none; b=ihVC+oSAUPDw6eNBpYEZWdZYHfMyVTl/Z4BYbkyBBokVMDduLCC6k6cuTAyijHRWRdAkVpoMMEE9Gqg93zo5LRTX0Ors2AgFzlTzUdpbCYM0TkV7Kvw3iXU9R/wv14/YMpej3502W0nA3gVTDOAZUI/RDED7C5yh5wshbt0x9QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451995; c=relaxed/simple;
	bh=dsFCDXR6KfRqwQ/1dEbG5yHBbEaQjAaKEfASudO2kzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQiO2kxPTvQ+HANs5z5DczIa4o3mRIuCmQZDtkhBRPkuvfQSVFLR7/8aEPnDq9W671hiocb4UsESwdq2FEcfToW5Mb5DW4uQIqnPVL7oatpZ03N0iSIgmtTLcx55YIxJTy9qk7tXtvvclsIUQUHSVXej1j0NZPQcKWGMOMH/Afs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHghqaDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tx3h/y4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHghqaDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tx3h/y4Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9Kbj43005223
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 12:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxMK/paVn1ngW6KHoUEHILSkmmr1MWqnQJ3Uf0bYrz8=; b=eHghqaDNzay+elpc
	kIzOfma9K1chVowFizfBShC6YMxRItbLGZlx7ZLvqZqY3LHT3DqRvKAMEUn0NhKw
	lQOsO14gb7YttV71il0/J+FnyHSmT3yDh8u1Q01PVYgwVSPkvfH6NGoW80Ku/tHj
	cSh+6EfRxx7LiO1t/voE0eYi/esFdSUna4mSY6nz1bUlQ7zOFruRz4UOD8CJiCYk
	mvJ8Uxpn9A2RF9asxV/416WAymPg4AhNF/94cVWlu/xVYH+cbygLyuGn0J7FAoY6
	oiTkNbojtQ1HlfdIFCwKBZFlVvph3pn6SwT2KtfA74JegP0tpZA1n1AZz5uwnc4y
	0Hlf3w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9vs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 12:13:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faec938fcso17779741cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451992; x=1780056792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxMK/paVn1ngW6KHoUEHILSkmmr1MWqnQJ3Uf0bYrz8=;
        b=Tx3h/y4Yk6yqZ4bgRaU/BZBj9DE7K8AFGtp0RW82ogHOGQfEA9Bp0vLLRrZ8xF3fuA
         mIg76cpn+d6WMbz1OwXxI76fmgBJc2OXbQcmLoFyBVBaatqAcxx3bh39yQjYZzo1xIb7
         YBRP16a8gorOrvKjh+jgfqwxCQis0ecrh8FjEetkcyZNdBvEvgZH7Ght8SMI61vRjmnP
         4PdD+A5HWEK/QNM87DH7DeWnZ/soCK2o4D63nYjEtrAzY9EfbBcmSI0UzHEm8xsiliYa
         HcUH3NgD3qP1xe2vAM0NnJZ/OmgBN83vQYTxYptslVfzDY04E9chjrjjfH4Kv/QTlDB6
         nQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451992; x=1780056792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxMK/paVn1ngW6KHoUEHILSkmmr1MWqnQJ3Uf0bYrz8=;
        b=G3B/ejtTG+DdpSBW5Ouqn+ES4w3STqpI/GhPAU5mnMnyJ1aGl7ZN24XPfZbQ7Q+uaf
         YHBJvB4Mb144n3XBNijIrWdsd1EeiGVGAeDfydzXlD3iTFCohZ16gWNeIWswvq8/KvSg
         aPyov0BWkkFf5c85N0BKl49/DA1iyhh3FkYNZ6czy08RKobBYXDJnhyR/SCbWxj2nVf9
         eenkU5kWvs0jGtRLHx3VsUPHwj7yxN/pecLaFKxKtLzw3eT+pdCFbGHbY6EjpTPl9qcH
         keloTY+GsuMkvKD6+c37RThAJJqR7eRChJ2Rwj6wSxc5Q7UdqfFTOwDC0keP0jNeOLdb
         wNkw==
X-Forwarded-Encrypted: i=1; AFNElJ+0r8mRmnCcXacE6WwTVLzdKykYpBFihffO+17L9QZWUgRuxAXJNK0xU6VlqkmhlZBfLhZawbzBIHFXUzAIUcBF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ZEXnIcVkiGfXhB0KRVM3byfUHbuceLDrvwOzAdj7HSkPRRDM
	+/fkEHvQFhFMgG5zh4j0CIZfstxFPZruXlIuGIPuXMzZeo/SH6Jglu71TBAYkRSu+o2N4zEdpqx
	Dy/TO4cUzcLfPbmUN9yREonJjcL1CGsOBFmfXBAtqBaWBISyT1hj8d2lksxe9ouDwPUm13c8W
X-Gm-Gg: Acq92OHLBMESvFQ7AEuohTYfZDeetcbtnA5fNzzg2X/0nLn505CM3W+Fzn5MSg5wgYE
	tQQSWOXgFfghf4i4dDe93Sg25C/gMKG2x5v8pW93rD//2IyVq8n1USFhDDgpYjycTZbbSWkhEz3
	k1YOd9L+57Q/MFjNlWhkOIUPewHEOaO0epL5CAFG2T2V0I+zX+0hQFYr9L60TuyG3anpkCWbt4o
	KCs+t4NE97SlChEouKl75kHoavdCmMNIxuqkeJyBKuQUn/xR/0hIC7gyyL+2bzt8DZar0wsdFuF
	sckYTiJbPBB6UO7HtIJJs2/QNrbM1dbICGLFyPk7NzIII3oWvJctxWFsM5eDQtz7x3+b10U3XTV
	JYIbRkLfaQkvvdFgJ7Bf4l7cUcnVcZoT2Js8vl4r+PNH/dQ==
X-Received: by 2002:a05:622a:a903:b0:509:e68:22cb with SMTP id d75a77b69052e-516d439424amr24955341cf.5.1779451992463;
        Fri, 22 May 2026 05:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:a903:b0:509:e68:22cb with SMTP id d75a77b69052e-516d439424amr24954851cf.5.1779451991851;
        Fri, 22 May 2026 05:13:11 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ecedf2sm48860766b.37.2026.05.22.05.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:13:11 -0700 (PDT)
Message-ID: <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:13:08 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
 <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a104859 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pC2wnO6ryxLTosdQjxEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMiBTYWx0ZWRfX9CkBZ1H190O1
 fjadGVhuQ4PUjK4qUzm3e68wX8WFShSbZHKrXOwrhAbupAdv49QrRhEvzbG0kvuE2F4l5Lxllld
 IP7GKOmg8Xs6hIOArqlZJIq8zVbthJtbRTAOuhAbfNWR4rKB6D+RpPMq0zrMluOmWigHpcoAs0u
 s5H8lGTsyuBkz0g08acQDM3LgWpJiAmaTTED7mTNMcFVn/nADJyioCW2bAdU3j8sUEExUwQCbYX
 FTKP7Pp4tvU5osFxFFCLcHxqI/9+yIh/6bKeJKZ0JnmBAJIktmJFAC+CeyCJDm1fx9VT/Xv2GqF
 wp5rra1YXIGaV2JoNwAyykYqW9DoMqJ2+1tl3MYBolQ8eJ0icj6aYpuim9ElORzUG3//Qm7CSEp
 bmrSQJiHlG5UmWkxwOnoqxtzFWYzpgYEnSlfuj0jUSnAChC5I66iyGvaDuy3wmT2XPpWt1CPzsj
 k/u2C9duOrt0wdFdW6g==
X-Proofpoint-GUID: V3NGq19pR-iYujh_GIUh_Igl8zaxxVHP
X-Proofpoint-ORIG-GUID: V3NGq19pR-iYujh_GIUh_Igl8zaxxVHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220122

On 5/19/26 5:03 PM, Komal Bajaj wrote:
> On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
>> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
>>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>
>>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
>>> for the Qualcomm Shikra SoC.
>>>
>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>> ---

[...]

> Ack, I'll address it in next revision.
> 
>> point you can use sc8180x_mpss_resource instead.
> 
> minidump_id is required for Shikra. (decrypt_shutdown is not applicable and will be removed in the next revision.)
> For minidump_id, we still need to use shikra_mpss_resource instead of sc8180x_mpss_resource. <?>

Is there a chance the same ID would be applicable to 8180 as well,
just that we missed it in the past?

Konrad
