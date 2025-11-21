Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7562C11D3
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737729; cv=none; b=lZJOKGr4g5sTQr7ysBOxWIPs1bqYrRVbdd2sHDWGK7NO8oVHWmfK/JY5KgN16fQsX1tWaK94cDFw04Z0s+D0vtSTDCycLILTZBkjkcrMhFGsp2ipjLy6LUdd/avDapGsxo0EVjqisMbvHpwjNZnZxUW+oMhMK/Fko60eNFR3k5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737729; c=relaxed/simple;
	bh=uvPi9ASKPbADZRK8UKix4C8KIl9QlRR9xU1PJwogzMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9lw16JtLJohQ+pl+NQ/VAMMISCxEAjlR3v91sKx1wkQoZmlcLgEG0Pq3Uerm7qw9mE2uyX4mjZJAqdQ20QWhJjwy+bcBlEDxFQpRxbEA4k7IwmcDljpnLkLc5/Q7f1ZWBrLoRvBcmtRans8mzU9i9eQGyCWTzSBuEkxm4hQ2u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCPaurN0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmLxhY7R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCPaurN0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmLxhY7R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9VuVP3048073
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 15:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXeMU2t/+YocV/lrKmcdn7FJ/vQLkZ3h6b3+GNAWoV4=; b=eCPaurN0MWzonVcn
	T4viz7ty/3JGsfRv6ahwhXmtROfnpg7wqhlFlVjtiEv99roNMbuEYU/hlukePkaR
	EUJNuFK9yd7ajGVJKVqB9pIEW9ZnQx3rcaqhxR7+VWbYx3SYn/BPsmgFeR8YLLP1
	WCH6BQSvkt+Kkwmx3lnC6Ypl6ASc0ibmT4CTOmZkxojkUH8WTF01NfEo9g5IrEeh
	bLkkLKuL/Nnbi3kDJgIeFbO5BPT+3YxUOXepuT3Y+mwgIOXi2VaQmnA9M+3YB1W+
	Q0ITWnip6ZTu0UmE+x+qz1OcpUumB/lSub0wwqzapUqEUTr5iE8E65XSU0CqX5Tm
	Lgh79w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjs0c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 15:08:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dfb8e7d182so450569137.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 07:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763737722; x=1764342522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXeMU2t/+YocV/lrKmcdn7FJ/vQLkZ3h6b3+GNAWoV4=;
        b=QmLxhY7RMA82vlAxbGqIaoNbuxZICoFfy2Ou4tJQ63AnM2g5wenitjzsEimI1+tEuT
         80S63tLhVDuLPDeC4F5yH4fyWiz+oRy5w69ohwlAsWpMof+CiBbxN9M8/l0nqAVfWGjO
         PSdWiibn+Q0ZD/3itDmrckZcpuEYq1lkIZzTPK7vRMJALMRdj0oerzjGDcyRLLbS7lKg
         0+0hMsv13DR50Kyt2UqXOXWsz4I6gj1atOMvvMI5CABOXJZf1kO804iG/wjLWir9s+Pt
         YotJSEW6axJJgtHKEXG7fiGys/ouDTStdxtGPVis3iQZkOKyxhfTnIwxozlgTouj1ejO
         iS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737722; x=1764342522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXeMU2t/+YocV/lrKmcdn7FJ/vQLkZ3h6b3+GNAWoV4=;
        b=PF9sI+kTS6Scs7h3MpRQbqu/OVz9voCmxPvKSVOHjwxEbSYkQyXggPcrnPFbDe6MJU
         cEwu/smt3ziYY3a9lrdb7gQLunQlBmGird8kI/1DjePfcPc8dsMLFTviENxqeqQ4hr8+
         ugH6vP03LXY06EHD7ilzi4i4zKE7YcDE8cctH22IfjdcRrBwFD/Z5JhoCXscrNb3aEb2
         t5XyagMbQ32Vl67LSauOz5mrbbfmCR0rzeuvxt9tSOhGsc1LmLHtVqpi0vDVPgkEsWd/
         +NzTmcq3nYGTmkGghH3RDJkclaNtX8b2OAuTODQFI1XCno8/e+WbEqVPeb/gO0cpuwbh
         xErA==
X-Forwarded-Encrypted: i=1; AJvYcCWwW2UboE8Wqo9wOk2LQeKT9l3J9o9c6pY0WDMnfFDrDpI6JwPOjusjHbIpVXO6dT4MxU2brDAQPuDDQY5VMxfN@vger.kernel.org
X-Gm-Message-State: AOJu0YyLrhputdOYh8kJ5KTD8bfp0W6ksWsS0/fjFWl9n3rZhslLUzb+
	9zh+Wz43pQWPhVFpLYlSNxAczw+FFzgCRZcnRCxxrn5LCsJckLdnSeNIWR+uF3gqclRk2KhLJc1
	0hczNzGrQb0lMV1bQAppl1jLyOf8QqfQ4NZ+H5GcZNwNqxnyr7W8Tf2V6XyjuMpYGh7e1O6kM
X-Gm-Gg: ASbGnctGaGgsG099Pb/Ug2MYh2m1RU21hXRBhREMvleK5op7LYgQwbbE9NxtdFmxX+m
	YFWiSOwpRDJUt+8tjAOEiI18tZ9tijeX4TCLzQuFKpS/lNCegFL+qVmHDg3o0rTVbb6X8vWRJE+
	cngz2tT8GJyUd0y0yTUQfmMYYemQN4uwrAEoaU+vaNMSMv/NHO3zBauqJdvQjA9jGPz70OHdAON
	WV7v91vE8i4pZaZwySre2FzCaag3MtWeOFjpkYmqa+QvN5KQIRb4nhQzFlEI/MI01y9cQPNRwNG
	CpiH6iKtrl0gXBg2PcimC0unjaKa6uz+h9LyWzTuPfKoXzY0SHfCifZy+mwu9V2/uPABBBkam1V
	UXcZRLxyGH58fXsiBvNQL8Q+ERkJVZCXeRiHVlUJVNZJnTrmFY5iEW8KG5MTehqnj2vw=
X-Received: by 2002:a05:6102:50a0:b0:5df:aa69:be98 with SMTP id ada2fe7eead31-5e1e6a6e492mr342514137.6.1763737722246;
        Fri, 21 Nov 2025 07:08:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO4HZ2HHfuPtxZw+pMyOmNu+f3imzE0i+3JXqRHNARVWLe23jAhWaT+EnRuJOBTWX+AoVknQ==
X-Received: by 2002:a05:6102:50a0:b0:5df:aa69:be98 with SMTP id ada2fe7eead31-5e1e6a6e492mr342424137.6.1763737721446;
        Fri, 21 Nov 2025 07:08:41 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d73430sm485852266b.24.2025.11.21.07.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 07:08:39 -0800 (PST)
Message-ID: <238adfbb-3773-4318-93d3-b23697aa4b18@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:08:36 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: urc_foSluQ9bcCmSCrBwg4sEpNk4RpE4
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=6920807b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JSAmB6C2vfhm-E4Mg70A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExMCBTYWx0ZWRfX4VCW0oqRKniY
 kgFVHZ1JuJXoP2uv6buUXrqkXBGD7nkfn+4UzYswOS4bUZIwZo7+zPXaW6UK3E4TeGK3wQ/5Mny
 7CevsMa4VYnjsKN0Uxw56o5vy+7XQGE3DFar8FyP38IlXv5Rt2Sd2aQxoI4iXjWi0pplo11SJ5O
 9/eMPlqubVyw6g55F/BEhmUFRx22WVFA3w7X8JXWnGmO149o0qU/+sgWq7hKWN3ufiXmof2Zdks
 M5tH/SAkcIFGG6Xhl96dpuC6ZcdHZxLPHSGJsYYhDqWpFf2Mt3PFJTTi7QS6Q3XZ2o71Bw+m9Jg
 yGKmsYxc9rSwuQfXEHMdUxpqwK1ALTDhQpC1Oa2JcoxAIz3Y575e/iDXqH/MoUzlWqRqC5uimz9
 bIu6lcukp6UjZb5Xd6wHzDJWdMBQWQ==
X-Proofpoint-GUID: urc_foSluQ9bcCmSCrBwg4sEpNk4RpE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210110

On 11/21/25 12:37 PM, Mukesh Ojha wrote:
> On Fri, Nov 21, 2025 at 11:27:57AM +0000, Bryan O'Donoghue wrote:
>> On 21/11/2025 11:01, Mukesh Ojha wrote:
>>> In May 2025, we discussed the challenges at Linaro Connect 2025 [1]
>>> related to Secure PAS remoteproc enablement when Linux is running at EL2
>>> for Qualcomm SoCs.
>>>
>>> [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
>>>
>>> Below, is the summary of the discussion.
>>>
>>> Qualcomm is working to enable remote processors on the SA8775p SoC with
>>> a Linux host running at EL2. In doing so, it has encountered several
>>> challenges related to how the remoteproc framework is handled when Linux
>>> runs at EL1.
>>>
>>> One of the main challenges arises from differences in how IOMMU
>>> translation is currently managed on SoCs running the Qualcomm EL2
>>> hypervisor (QHEE), where IOMMU translation for any device is entirely
>>> owned by the hypervisor. Additionally, the firmware for remote
>>> processors does not contain a resource table, which would typically
>>> include the necessary IOMMU configuration settings.
>>>
>>> Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
>>> Authentication Service (PAS) from TrustZone (TZ) firmware to securely
>>> authenticate and reset remote processors via a single SMC call,
>>> _auth_and_reset_. This call is first trapped by QHEE, which then invokes
>>> TZ for authentication. Once authentication is complete, the call returns
>>> to QHEE, which sets up the IOMMU translation scheme for the remote
>>> processors and subsequently brings them out of reset. The design of the
>>> Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
>>> is not permitted to configure IOMMU translation for remote processors,
>>> and only a single-stage translation is configured.
>>>
>>> To make the remote processor bring-up (PAS) sequence
>>> hypervisor-independent, the auth_and_reset SMC call is now handled
>>> entirely by TZ. However, the issue of IOMMU configuration remains
>>> unresolved, for example a scenario, when KVM host at EL2 has no
>>> knowledge of the remote processors’ IOMMU settings.  This is being
>>> addressed by overlaying the IOMMU properties when the SoC runs a Linux
>>> host at EL2. SMC call is being provided from the TrustZone firmware to
>>> retrieve the resource table for a given subsystem.
>>>
>>> There are also remote processors such as those for video, camera, and
>>> graphics that do not use the remoteproc framework to manage their
>>> lifecycle. Instead, they rely on the Qualcomm PAS service to
>>> authenticate their firmware. These processors also need to be brought
>>> out of reset when Linux is running at EL2. The client drivers for these
>>> processors use the MDT loader function to load and authenticate
>>> firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
>>> to retrieve the resource table, create a shared memory bridge
>>> (shmbridge), and map the resources before bringing the processors out of
>>> reset.
>>>
>>> It is based on next-20251120 and tested on SA8775p which is now called
>>> Lemans IOT platform and does not addresses DMA problem discussed at
>>> [1] which is future scope of the series.
>>>
>>> Changes in v8: https://lore.kernel.org/lkml/20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com/
>>>   - Addressed suggestion from Stephen which was regarding commit message(9/14),
>>>     debug log(12/14) suggestion, and return type change(4/14).
>>>   - Added R-b tag on 10/14 .
>> Sorry.
>>
>> Did we actually come up with a cogent reason to omit the video firmware
>> loading here ?
>>
>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>> getting video stuff done and storing up trouble.
>>
>> What exactly is the blockage - is it something you want help with ?
> 
> I replied to you here[1] and given my reason..till something concluded on
> "multi-cell IOMMU[2]", I can not add video and block what is working
> already.
> 
> [1]
> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-hyd.qualcomm.com/
> 
> [2]
> https://lore.kernel.org/lkml/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

I see that the following files call qcom_scm_pas_auth_.*():

drivers/firmware/qcom/qcom_scm.c
drivers/gpu/drm/msm/adreno/adreno_gpu.c
drivers/media/platform/qcom/iris/iris_firmware.c
drivers/media/platform/qcom/venus/firmware.c
drivers/net/ipa/ipa_main.c
drivers/net/wireless/ath/ath12k/ahb.c
drivers/remoteproc/qcom_q6v5_pas.c
drivers/remoteproc/qcom_wcnss.c

iris is difficult, rproc is done, adreno doesn't need it..

would ath12k_ahb or IPA be affected by this series as well?

Konrad
