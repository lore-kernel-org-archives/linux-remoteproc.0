Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BBB297B8A
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 May 2025 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747077035; cv=none; b=cy/L3dm2mIZQ3K/AdYyMGDGM5QJCT5XhtCzUKTDo6rrd8tX+ooYxrBJbZhI0kEfJrbfALBaAs77wa3fSKOhhHC+dE390AfSJB2JpBQ/DorT7l0TghgPNa/9/GhldQz6JhIPdPP4gO/EbRG/BIH20og6Xq0Lxl9s5ozD0CE6NyqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747077035; c=relaxed/simple;
	bh=7FDvjUhQK98zhiBlhvEoWtXdnuiVq1vo4/mLb46MPuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q43d8TKBd3l1Z9Z9uN+46tsmOQ8+FWirOQ/YhOtigMPvOf13Tl8IzFkAJIk67TugbJ0p8r7TVRmSNcBqOUPLOf/kc4KH4frsql07QOKhF9A4uJZEKA88RlKILJNKLvlt9yME1FNWh6Xjsf1Utxt9g3mlrfkFwr5BLNlvq8M1A4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kB/UHNsV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kB/UHNsV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CG4UCM023137
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 May 2025 19:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YYz3l97YeUs4psiEgphr3ykxMpiyvXGE8Y78//T9RF4=; b=kB/UHNsV5pmCG15/
	QupdvEBHxFCXdLPF8zTKNU95oLEGz8XRpPW2VJZSd3NUmP+Cj+BnaLAudbo+c7yY
	h2KzdiDVo2thhgKA1LjeO1Jvn9bUV881pO2LYuPluNJs7q1C/CAnWj57BwcCgWpD
	Pi/yNC9qWRtZD90SYzavWAtWYLewkJ1lM9Lx8MIGxiN4DE1ciQ4O2dmN0Khep2yG
	iP3ETwy3hxnfG+FP5ib4of9xpAshjznNcSEk8I5SKODjujXGwVl5MQPrscaOr152
	bo8xqoNy5ojMhcr0i7pHafX6o7+lsz5s/nHoQ6WNRTYK/GiVek08HrluiPjG1+Vk
	PBHtCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfehvfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 May 2025 19:10:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso135760485a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 May 2025 12:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747077032; x=1747681832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYz3l97YeUs4psiEgphr3ykxMpiyvXGE8Y78//T9RF4=;
        b=B18yPWPBY4N+E/9GhFdSOyUP4U/2AL//V50eRys8Yn9hAppIdgOXGw0Xue55/rTxVP
         hllL+7FkgcvhqTLfQ9B/xz1UIBmT1CkbT+eGfvru5IO8rXxxFUONn+JpBI+eK8Flx2+L
         LI0jpXcg2SPEhK5YJo383wsa7cT+d8H+9RQgT1fKKfkP2JHunrHCcwlzzqrV1fswR24a
         ZMitV070G/JIA7322Oa7WItGaL153gRqhUAZPmMhnWFTOEjsKtHwQXOzLsU69soPww+I
         gJxNPdy6lQ1O16iYOiU0JWKuvAhb2fG3Nl2cvbiFniZG9Cb50sTAP9ToaaKRSvhIx7K8
         eCIw==
X-Forwarded-Encrypted: i=1; AJvYcCWAXW6pQl8D8x8SVi7mxILC/CWgsx6tUgfbL2XQIn9O3gde+oZiLqYsN9aMJ6hhnkIyQRRmRclIsjh1LpCLNEFa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Ij6pt3TWbwUR05pBbFcCAzPmzha4PelK0fCuyMYNnMLcreOH
	2m+zjfvKx7Bi98v1sf/C0bBs/uFd7JKAKA4RhNIAH9WZAm7fnqFSrEnKNP/b+Pu0VobYpUotwUC
	urtgB2I/zscoW602afvAF5KEAxYusDXpu4frRhm57V6DXBewx5sDWk2CAertKijbBfZYR
X-Gm-Gg: ASbGncvK6l/byIlUdsoNsDT1i/xfYKv8Zp9IOUnUVKIC+FUiwUtC/MMkitEtV9ZAFfz
	yFa8nJLQdB6EJi6kA/UFm1M39YHCDZcYiV3DvADx0qGd8080xFaYPAZET/r7nz5JkXT2samxXHy
	c7VInj/EFdZ312eXNqtsjGp2Ny61+9DWMKmHDf6ipAbMgnZsUH6esG0ttE0r3vYml3/qrTaxYhU
	lHn3KR0xdZLQAA8ssOnshv29qxbWEA6nhg+xS0Uop4VzOhHQ2zCZN1dEg1q5EAGaEE0xNrEekLF
	Vb2FMCqGQAC43+CZMDd+yplphqyR37Aq/8E29DNrMz86QF2ABMFBEflHPalHaNDhqZ0=
X-Received: by 2002:a05:620a:198a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd0120a6a2mr886744885a.6.1747077032124;
        Mon, 12 May 2025 12:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2K9ql15/d4D35gN1KXzYEavsjzdHbxihDRkp7GyzeRQABAyBVS1bBH8kySfi/iFDeV7zB6g==
X-Received: by 2002:a05:620a:198a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd0120a6a2mr886742985a.6.1747077031702;
        Mon, 12 May 2025 12:10:31 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d700e7csm6014016a12.64.2025.05.12.12.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 12:10:31 -0700 (PDT)
Message-ID: <3065cdb1-30ff-4be3-8959-45e4c4edc123@oss.qualcomm.com>
Date: Mon, 12 May 2025 21:10:29 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
 <64893588-544f-4cb0-8c0b-7eef588468d5@oss.qualcomm.com>
 <c0ab504c-2b27-45cd-be8f-1176230b8bfd@quicinc.com>
 <f81b3f81-b14d-41c1-9968-2d473e1f0947@oss.qualcomm.com>
 <2eb4606c-16f8-4e34-8084-039c9e57bbdd@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2eb4606c-16f8-4e34-8084-039c9e57bbdd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5NyBTYWx0ZWRfX7fTzyeNQONqI
 /f4C72Iu6tmo1/iiVpZstYNN2JmQ4qyk1hhmGBJHpWexlIUAEUzX7//Z8X8iXUmSfcwcCXTSE5s
 bbXjldUyi4Y3HAm4otkSqwuiGk+nSosiirbbwgkcsz+nOuF7HaqawzDSRAuVCxhMBW6Q7443JoJ
 6jzElMdftFCG1N6O32c9dnKydnDDcr66xdYtG4M45CZTGuTU6As0eCXO/ghIdstf2N5z8+35Ym3
 SQMQjwT1kk5ah1TbZ3xQxC7lzCe7yDxbDsShY4B59PCUZoqplqpZ8vq5v9jyCnOXPSftfR7vxv1
 qoZ8jtbocccrrXvG1go8HRYVQov2OIQMb9RJuk9UYXQNCWUhZiPta+elf0cyIUl7ubz3pZQcpzr
 qpVkXs74cK5kgkNPUM2WW49C+DnpZ/4ZRfJIY1rSDrgUmFIXwUrTCxryjKR9L9pF3L+11pQo
X-Proofpoint-ORIG-GUID: I-z7E1QC8oY1T9y9C3EYa9JBCjfmZOhf
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=682247a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=BKL5ZcGrS_xDY7syMdwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: I-z7E1QC8oY1T9y9C3EYa9JBCjfmZOhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120197

On 5/12/25 5:20 AM, Lijuan Gao wrote:
> 
> 
> 在 5/9/2025 4:54 PM, Konrad Dybcio 写道:
>> On 5/9/25 9:37 AM, Lijuan Gao wrote:
>>>
>>>
>>> 在 5/8/2025 10:41 PM, Konrad Dybcio 写道:
>>>> On 5/7/25 12:26 PM, Lijuan Gao wrote:
>>>>> Add a simple-mfd representing IMEM on QCS615 and define the PIL
>>>>> relocation info region as its child. The PIL region in IMEM is used to
>>>>> communicate load addresses of remoteproc to post mortem debug tools, so
>>>>> that these tools can collect ramdumps.
>>>>>
>>>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>>>>>    1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>> index 53661e3a852e..fefdb0fd66f7 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>> @@ -3266,6 +3266,20 @@ sram@c3f0000 {
>>>>>                reg = <0x0 0x0c3f0000 0x0 0x400>;
>>>>>            };
>>>>>    +        sram@146aa000 {
>>>>> +            compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
>>>>> +            reg = <0x0 0x146aa000 0x0 0x1000>;
>>>>
>>>> 0x14680000 0x2c000
>>>
>>> I checked the latest datasheet, the Shared IMEM address is 0x146aa000 and its size is 0x1000, 0x14680000 is the start address of IMEM layout. The shared IMEM is used for debugging purposes, while the others parts are dedicated.
>>
>> Even if we don't use the entirety of it, it's good to describe
>> the whole block
>>
>> Konrad
> 
> According to the definitions on all existing upstream platforms, this imem points to the shared imem. Should we stay consistent?

That is because everyone kept copying over whatever the downstream
kernel did ;)

Let's describe the whole region - at best, it doesn't hurt

Konrad
