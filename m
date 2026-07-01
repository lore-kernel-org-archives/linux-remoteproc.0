Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A6426EC0
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Jul 2026 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903723; cv=none; b=rKU6ehM5hFLobrlkH3hGaBSylDsiHGGwjlNH4ZD+3yzWMgvAiwZn/8fhVT2PgViE/4OE1s/jDXO3bW0EERhmFWderS4XBnub/ltFYyzkvWATYt5MryCcalpHq8kEZ+AKmxZxlrZisbToGBKj3qigUp/tMjN0gcWFKGCu/roiF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903723; c=relaxed/simple;
	bh=Br8s1Od3JEOL8qZORdm4eG395Bw56pWcnLaBfgp/wGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUNH4QOj9pCNgbDnWDMEq+otaroUGB9HO2RC/5Sw0C0nm2sP9E2ArTHQXdFGTNxkg7dpITvLhY5lP41lDupGCCsN6RrJ+WSr+jt/3To8aFm0Vfd0rrwe4uAwwTNezkhvkBFZw+AEcMw3ECMEf5i0g9wGv5y0ey2+7ymaEtmT3f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElGUKYke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJ86M/Py; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElGUKYke";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJ86M/Py"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8lCB681875
	for <linux-remoteproc@vger.kernel.org>; Wed, 1 Jul 2026 11:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxGUWVh7XlY2oaLv4zshgCYnYU/gzVpwiXufl467KvU=; b=ElGUKYkeMmxIkgOz
	thIHzWjBi816QcqEqbreeIRMyIZU+6rVG+rebZE9G66w0v2luGay9FWAi2p11+1b
	WamPKZU6YNqu7ehEZvQLIGFOubMPljNHBV6TpY9kaACuypXi8Tws1YrI7JRqy8fv
	/6poc5jXITgCRmlN4UxleWMjee9AhxwgIFQia+bLF2p52rMPRZzlNMD0jtzleArO
	QPMnxD96dfuxWEZRWaUJJKBAiWutTS2hZg4RH8cER7WZY+ny5Mh/FPfQU0YASFbQ
	QLPI+AisWhheOktOthSyv7cWpKLU0IzeZfN9AUvYqC1zqfwKOtZAN14rBvDkutKP
	bTNfPA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3skt57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jul 2026 11:02:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73761f92dd1so13683137.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jul 2026 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903720; x=1783508520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxGUWVh7XlY2oaLv4zshgCYnYU/gzVpwiXufl467KvU=;
        b=NJ86M/PywGH353GBtBowoRzMKI3udNfy2UyMYJveHrxx4CX3JO7HVCAXZtsc/SyWQT
         wY5h4ODE1vUunQoPy73EEw6PC+P700Aq5zvMLBTar3/HwheXr/fp2cZJkQPa6V7/NyXK
         SDVuoEELaXP3AxHg4InRmMl08Bd1luMdZYyr1DYJwUzISYF/hqVEVAdluOn14113CHso
         U68aJtQ+rWieoVbTRUpHaWGp7gvJ1//4+9uPVa5fiuKEfrbgdcr6EyQKlgtGI95ftUdu
         10Z3cWAz5qgSZhASLXsP7EQef4kmz2aiaud9QuSJwW6mW1G+WcbpUF7JIkwCBgYgaBMM
         c6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903720; x=1783508520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxGUWVh7XlY2oaLv4zshgCYnYU/gzVpwiXufl467KvU=;
        b=dMHQAiIDqUrm5ck97CRBhxpb+z0bxVCy02HjH1SymVW9IlaFWFKRfw5XcxwQKdgc97
         qLu8TD1/zYDtRicna/uXlPyUjU2BxtS30//ZeP9C1zOeqHru0vlNbTEAa75D6yKShxvk
         kINwMVnQTbo+4VKxgwuCIQKy9T7dQDfrtF9JNhrcQDLJiS3yWoPEOlEbaLal3jEsNE61
         UM3sVfbId1DMrvs8rydUNz8/gTfzcdKoMBttZn36Q1I5v2YLn3C8gemMnIHr1LGjz6LE
         w/k95DQAY3dnbCIR1Mg1SkqkTOGfEaCszdlLveH/G3gZe1dWf3wMbh3xisfXOg6QrXKs
         7UKw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8o0FeT+WtoxzXjoCBA0zTZitdR5pHkloFWuubhqwnIbeSo8Thf2uMo9FfEMDRRxcvQZY+IlarHGPNqeRQ6Sl6@vger.kernel.org
X-Gm-Message-State: AOJu0YwOjooFT1H0t5XgFj9BDSKPXBPbkmo73rA5inAzrpttD8ANHO7C
	UM3zSaOynMCJFZD6mdKq2bJEpQR/yB7ysQg4LHnJpK31WUzlsuTKyGY780x26tOBKk81TVF9JXp
	t87IEN11cm06xWfMg0mZtRIq0esYrGcW2xklPdOES2D7FMQMZw7YF9KvJ//xq0ecTgqdlrXOh
X-Gm-Gg: AfdE7cktY4DUXFEy27q/HHVwEtUcUpG6e9t9DIL9IGvPhj2QGI6/QO9NbFu5VBEWd2b
	OYiSqvF8XE9eahCgEHTsUGpphMPzys0YrdKZwBHxLsxVqw3w8YfVXV8/oLygyzlufPkHIbAQIvT
	6pT882scNSf5PlmN4Ql/gl5bLJwZjAnaZrIsyPMi4ewq6hWT8WgLt0oI4SeoOBiaxHox/BfOImn
	/c87pCWchrTcj+YY7LmHXQOw40a/Cy2J2oVHFx0a+3vpofeE3npHljLRiAhEatNSZdv+3LTul1V
	kH+h9Q6Z+w/X32ijulpgXXu6Lh6SLVWhNLjBqL9WiD8/NTNcaAzMHmfcfrbumrkRAlrja6hHnta
	+orabwHEMULB4Z4COJ1DsgMnrDJTHoqzPbJ4=
X-Received: by 2002:a05:6102:3e0b:b0:739:5c3d:605b with SMTP id ada2fe7eead31-73da8836a74mr86246137.1.1782903719656;
        Wed, 01 Jul 2026 04:01:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0b:b0:739:5c3d:605b with SMTP id ada2fe7eead31-73da8836a74mr86169137.1.1782903719140;
        Wed, 01 Jul 2026 04:01:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c128917536csm257546366b.56.2026.07.01.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:01:58 -0700 (PDT)
Message-ID: <c93b47af-e291-4a6a-ae4b-cc46f25c422b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:01:52 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/14] media: qcom: Pass proper PAS ID to
 set_remote_state API
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-11-sumit.garg@kernel.org>
 <c251430d-2184-4ecc-8d05-9cb47533e5ec@oss.qualcomm.com>
 <akTFZgKBQYQUYxx4@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akTFZgKBQYQUYxx4@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EMZTBHs3eFceGj8zSKmNfHbrtlVhHTxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX+ddIk+l9VEAz
 YkqEu+uNUCuZOoHgZeEuPj4JDlrtwV1CfsD048pMMC23x3+gVLv+9px4a41+GEFCPo9mJ2Nti6D
 EnOA/E9uGZ89CkxpQBLhVjyDkaglckHGeiOPOm0M5blESvDQMpqeFFiE3/i7nIwOwVlnA//e5tZ
 NSS9tExg2hSQzOqo1ZGjsEw9BWwhPcKmb+nzrS1b2L6tbVEdFSRMx5m8cpfw+N7K7LMlw8XJK6E
 tsaM8a5Px21O+cfEU1vUhLV0aOLLbrYFBr1AZRxBd82AHRLfU6E7qa+XK2jvsTy3JDMXuptnZll
 YvJeIhcDnN/8LxQm+PdH50w87nmgdCyEJnUfYJ0cxjRmwCWQVWP7Nlb6yOeJ7YsKdaPz5qY3dmW
 fz4FuUU/fochiU4MoIegEyhd7IzBgQbwhskR0VYtlci5QylfF2XVNw5pf8gDHDsnNUAJnP4vvUT
 9WVrRpoMdBXUlHAuqlQ==
X-Proofpoint-ORIG-GUID: EMZTBHs3eFceGj8zSKmNfHbrtlVhHTxf
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44f3a8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uyZSW4wqkseYk8rkHTIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX8HiQ4BibNCpW
 6H8bry0Ve+3ay/V7+Cjrm15GnfBd9YHzO99MuPUXztPtLudaa8I0LdKc3A3Xd1WZc3IGvvVVm5q
 dKxHVMTHafjjjZx/vFJAdP5NPed3p1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115

On 7/1/26 9:44 AM, Sumit Garg wrote:
> On Tue, Jun 30, 2026 at 02:42:25PM +0200, Konrad Dybcio wrote:
>> On 6/26/26 3:34 PM, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> As per testing the SCM backend just ignores it while OP-TEE makes
>>> use of it to for proper book keeping purpose.
>>>
>>> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>>>  drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>>> index ea9654dd679e..d2e7ba4f37e3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
>>> @@ -110,5 +110,5 @@ int iris_fw_unload(struct iris_core *core)
>>>  
>>>  int iris_set_hw_state(struct iris_core *core, bool resume)
>>>  {
>>> -	return qcom_pas_set_remote_state(resume, 0);
>>> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>>>  }
>>> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
>>> index 3a38ff985822..3c0727ea137d 100644
>>> --- a/drivers/media/platform/qcom/venus/firmware.c
>>> +++ b/drivers/media/platform/qcom/venus/firmware.c
>>> @@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>>>  	int ret;
>>>  
>>>  	if (core->use_tz) {
>>> -		ret = qcom_pas_set_remote_state(resume, 0);
>>> +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);
>>
>> This should not be in the middle of a mildly related series..
>> The PAS IDs should be centralized into a single header. And the
>> name of the driver shouldn't be part of the define. I would guesstimate
>> that on the secure side it's probably called VPU or VIDEO
> 
> I agree with your comments, this is something I would also like to
> consolidate on OP-TEE side as well: see discussion here [1].
> 
> However, the patch itself was needed to do book keeping on OP-TEE side
> but I can drop it since anyhow the video isn't functional yet in
> upstream dependent on the proper IOMMU support.

For this patch.. I think QCTZ may be ignoring the argument so it
may not matter.. on a second thought you already have it reviewed
and it's already a cross-subsys merge so might as well pull it in,
worst case scenario it'll revert cleanly

Once this lands, please move all PAS defines to.. hmm.. qcom_pas.h
sounds like a good candidate?

Konrad
