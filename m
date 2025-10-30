Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993F0286D7D
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Oct 2025 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761790266; cv=none; b=lsWbnSXmFnaoEqOCMMJRpu72Ohd9kKP2uHhhcpYEHs91zKdFOfob/CBBygItuK0ikz1w7TyGd0eLkTzbzG5CZoKixskMWRH3VNp9+2xcyv196fDPBCKtTrxu/NydGEoKHGopQPsdJHT1DEJB+YYdt+ihSy6y2Zb3zVwaWEJR27w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761790266; c=relaxed/simple;
	bh=shYbqVkuLNtiI53CreU8QZTbiYYqgXW7xVc9VY9PI0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2W+unXveeZMcXTwBgTLry1M8EbcMLc10LEceWatvcEyvw1HtIGoKO+qFyknxLcHUTvclGQOqexrJpNDnZMwjEl69izidtsrMuJyaKOKCpQkikHehqVc+CCVPN35FrnErQ6Ku3hkfsUNJdb4a5fN6iiObL74Ns3bprmkMhBdI1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2T51kls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSrP6yRB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2T51kls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSrP6yRB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U0ibH81995212
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Oct 2025 02:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z3iJpVuXX3j99GeKbgFiZof6JOIHOivPLoo01x4NiCM=; b=d2T51klsW1sj5z92
	5vDcJNzrei0myoE3xHRF9OrvueJ57LQAAOnmXz9kGQPf/3DbLFkwDmlkdBkkqut9
	+0/WjCJYPz8n5Ve82PAwrmjqajc+aSbgfVBXLW96J1KyAMw3NJ92iSjskyz64Lbd
	AgCclwGE6dKK/W7TqKspLtFNfUyjYROBUj3a/Ge6ELacnebRIjqT2R6MKxQ3xgGM
	mY1Hib6h6ZjuDjRy9VXDD6grfTUNtfO9gAcFZDmf1ro2yFazMwfpfV7zFOkSX6jV
	Wdw88J/H+95qf1OL6sXDH73xDwRRxdAz6DrfQjribFsS6fa6ZpxM0hOvj0T5lyQL
	4JoPIw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr7067h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Oct 2025 02:11:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33bb4d11f5eso567140a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 19:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761790261; x=1762395061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3iJpVuXX3j99GeKbgFiZof6JOIHOivPLoo01x4NiCM=;
        b=hSrP6yRBzkNa6kX7MtjIvb3jboRa9uJ6KlhfWHW/9sdvfhBcvCgKL5yQPcM8QKUN3T
         hS/mLqSeoYVHhwbiSMhm2w0VjR5cHOFct1yt2hn5GLGJ/ezPfJkromjxcTxGzpmpG/WU
         Y2CrOp9X90YYtCtWo/9EdfbFQf80xtNgss/ZQR2aZyjaDj60HFYdvwYKF4GWGatJepzy
         BEHHMpsT8q13uRJ4miLJYMUN0wT9qjU8WUNA3TAt58TfZAy2i64zciv31vxkXlxBdT/3
         0XadKS4WJWGFK0nK+301af2ACpz6PdTUBQBGckZPIi2gbMv6vUYLYfKSSfh1aR295tTS
         EKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761790261; x=1762395061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3iJpVuXX3j99GeKbgFiZof6JOIHOivPLoo01x4NiCM=;
        b=mwpD3YR/EOPblhqZ0u4fTutuxML4vZ9t7Oe054ni6HmKC2YBkrdToA92AVUPV5xP12
         +sd6rHk1Bx2KVdT5d0G0wcaxBsweHa/Lu5kLcU3ESfLDhQELkxwnpMzNnCAoVPKfqiRg
         cBLsMy+KppyO0SC3SHisZQf7OqN0Wp2KpQwxGHeuIg8bINKMWrZGXDh5ueHadjmIjvER
         DowpC5mGcBw3u+C/d2my98M9FI0bAfBZw8JhGlN5S8KjooFjoP6NesDdjF/CE1fpOIpa
         YK8IDjW9LON2YxF8B4QI+2mhNreCKCZ/MKLiEIICABwlcmGVAzDHo4+bY0b4s4e4k+/s
         5ahQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMh4lheRmEDzKAtK9GHNFvZ2VZt6blqtmTgqtwNxo3OUI/9z43HogOD98WBlzLhK3yF2DldjiVAT3bXHcKwmOx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3+wxj7gpiGJqeT0OPsf5qk+QCb202BxCilMu/++rCvQmH5ky
	tjNcmNo93b7rTTQPvndHoCLIaMJ6DyTmtwD5A3TFLVDLfdKNduDspbxw2pci/4P8GsmYxaKHmu9
	X8B28Xmv8tu1zIM1S7d0ZrVbOeAGTYGBp0vu5HsuWIDqPH1QlrCLtKd9xA1lmwcKnT2qbSWi4
X-Gm-Gg: ASbGncs2ssf9f1VbylTD+z9G+ItoJkzqN9xmZM6BKoL25TJBIy0wqxIjN9bNW6Lk+F8
	qE9ePqSThUVSGuGmRXC8T+cmL2VpmoYsWr3tZfiXRcXjQM1jON2/UyG57x9L250jWvdnHgC6bz4
	DSk9vZ0qkBumk/vb6nYFgQ4+mMafeoBTDn9s4VK0qtXsVJ/PIQ+YXdGjwJiGT5gSkszep4qzJUZ
	00CmHQj2DCoYkDdVhoakiKY7ybXUMFQlbq4afEvjFx1YuipWHMO+o7zQrXQrpFqWygzm1eAPZoo
	kAfRHKFH0D001lZkUxZBXctEOqZHrEsLoeUHs1dzpxRERGa0iIu8U1frA7ponzpTwFqRmzTpRcL
	FVVtt2FNM5zGs0bFfV7DXm+M0n8UmUFO9PCerfrWEoGRLkDdgO9SIYMumyfWoV+9G5Spc
X-Received: by 2002:a17:90b:3907:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-3404c41c74bmr1567845a91.13.1761790261372;
        Wed, 29 Oct 2025 19:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj+R3WSmUGG6kffdX4nhUtyKII1fP8kB2aIG3NI3dVQuvVgPVLuOXt0D6O52gUK2tjrBHApw==
X-Received: by 2002:a17:90b:3907:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-3404c41c74bmr1567808a91.13.1761790260667;
        Wed, 29 Oct 2025 19:11:00 -0700 (PDT)
Received: from [10.133.33.37] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3402a528e81sm3939736a91.4.2025.10.29.19.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 19:11:00 -0700 (PDT)
Message-ID: <554b2053-db21-46fa-b5b0-3d548c1e182d@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:10:55 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, trilok.soni@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>, yijie.yang@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com>
 <176173731073.226348.14173297054891268954.robh@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <176173731073.226348.14173297054891268954.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAxNSBTYWx0ZWRfXw4JIrpiKkG6l
 VFhUpplquXxbFP1mlLt7Mx5KB5dJ9hIkLDcEvowqYCxA12BuWKmEb6rlOvdO/zwVS2ruR4ccKsU
 iiLkmuYsrk0SOUn0vw2akQGmdCUFzmUFEFMdoGRtz1EHgPujBoUuOp/nvz78xLDgpLvpKXWp0Rk
 9VOIfBjeBW2u9yN4a1gq37yVlNzPSxAQY3Taa92PjaftGai3Jobj/oN+YNUKLuCA8wG5pbsVl4s
 Br01txZiUjutUGAeJYVVJByrXuRIOPDOV8rdLfBwIQihdLa3SLgBHCT0D3anWWPofBgvq9OmvuQ
 glww5VK/Vdq9+m1NZt6pd75CsRQt6/1ti7XpuW5y5JZbsKHG0tKIhO5V52nNqijKHmrxgl7Hzqn
 09N9eDtNBqMJ6Q9qFdVEYSvMhAWPQg==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=6902c936 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=VXIIVhnlSoNZEwAaSBwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: C1gbgJ6iSy9i4STLrvVzSXQmspohRTKs
X-Proofpoint-GUID: C1gbgJ6iSy9i4STLrvVzSXQmspohRTKs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300015



On 10/29/2025 7:28 PM, Rob Herring (Arm) wrote:
> 
> On Wed, 29 Oct 2025 01:05:41 -0700, Jingyi Wang wrote:
>> Document the component used to boot SoCCP on Kaanapali SoC and add
>> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
>> the "qcom,smem-states" and "qcom,smem-state-names" properties and
>> add conditions for the "interrupts" and "interrupt-names" properties
>> in the pas-common.
>>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 134 +++++++++++++++++++++
>>  .../bindings/remoteproc/qcom,pas-common.yaml       |  83 +++++++++----
>>  2 files changed, 194 insertions(+), 23 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.example.dts:67.46-62 Unexpected 'IPCC_MPROC_SOCCP'
> Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.example.dts:70.33-49 Unexpected 'IPCC_MPROC_SOCCP'
> FATAL ERROR: Syntax error parsing input tree
> make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1547: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Will add dependency in next version for the include files in example.

Thanks,
Jingyi

