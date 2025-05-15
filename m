Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9F872605
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 04:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747282620; cv=none; b=hHkpBdR6RIXR73btphLlBTS/O2ryRfV+3OwE6EDKfMcO8FLP0GmQpaadktqmHJWLy8qpHCrMKJTvOt3E+gDlMz+DIhvUTNbLU4XwaeqQnrHvrXL/RJ+zDbUfxKwHof7v5BeolY5/qtDbKpUIEWwtgBqbqAqELLnQtFV2MIs2uoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747282620; c=relaxed/simple;
	bh=KgcLR1oRKC4Bv/OOFiAyyENLF5qMu8d4vlBvf/HQ030=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0AA1kx7mgTNBrwjikAYOoU3NIzM68TvdzATBFIkWib82+4BPOTkShDj0hiQ53KbrVzqoIJwO7IrAIJmSSTtEvpYRRpqEPMlh3x9jBPaJ7Nly57rFSJd3hZwGhRqTS0ZPhXua71QhdXwW/Hbc1ETlrQ961ymwbiTfO8eFGA36FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVDU2ntV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVDU2ntV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EHwYOC015921
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 04:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kd8BACwLMeJ2zbpewf7cHuRK1eqa/uuDVR7pqr+1NDE=; b=oVDU2ntV4XC7xyE3
	GZ8J8Je8Cysi9CeMtYPLIDf8UL+UkTnHdoviGgMqXhmOYvxPnf/OVqu1m8V9u24f
	bqSsoIA+mgM1uZNlKFkrkk9xYrJEeTJzOBkseCz5azq/XpHPiATwJQDR5/yMWTPV
	xB6pBMCSJpaV4wHl+3VmuWQNs7dmBsm6cILVy8mLi1G/KU/pvgFDm0PfuZkSRrUB
	MjGOYVWIBEtDag2CeXZ4aTHB341RVSxandGt2iyCggXgvpt+QCgQgsDHqf35MCe8
	gcLnPdy0UDmmNtZ3FjVahRCcLdKr50HLjsQmqfQvocpFq1C/8417oAXKV2Um3Kje
	n86UOA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmvyxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 04:16:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e3b03cd64so4303795ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 May 2025 21:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747282616; x=1747887416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kd8BACwLMeJ2zbpewf7cHuRK1eqa/uuDVR7pqr+1NDE=;
        b=GYtcuJSnH0uWaVn04Xi6n4+zsz1Ah5UawPxkLavccitbp0THeqkiDgbUwkdm1iZy2B
         f25WCgrur8kxi/MxRZH5lXtnPIe9KKc971h/SAPGSmGfCW/l10lDougdJMaxDvOqoGEW
         z5/eapwGF6b6mb3ItjCzp4GZYs294DUoJ49CSsO2iWAjcmBrZxo+VhqVs5WBJ9yYkrXX
         bWUaiTYesQIqi36yy18HIN2VKvh+Us5VTb1ZZjugtRE1d1tTnAX81ABoI31qLYFTfvEs
         W84u3YIN4oQtIwxIugm+j80AqNk5N+HAZkYw7zQa6T2C9CpHWwjvgqu9LUEEMJH4xygc
         w5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1C6vb6JrSxVckEK08CxqQRsazxQL1EMIsv2hAiLkJr2FupQqrlxuri4rxTN+WYVH+UvEHZ9AiVuXjC39rQzvw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxv19CTSgqJGGfZbZl2FiBgcki9/xl7bXf3hl2WRP0G0bzILpZ
	SlJSvqBa0pV8g5jcV8xGd31p6xqpYSRaT5kvv91TqhcaFyKJBtY8J+c8n/79m4VOQr8rc/iM16e
	PVdNoL/qji84bPZ7HEQdRS465uV8bvJxq/7nUjChnjjsMwcqIN/4ixEjzQULulwOqZnng
X-Gm-Gg: ASbGncuIJkDlplFy2D5bUIoTd+83nljITlA7vVl60vBUekazK5x2jOhIuzaGZKZa6jX
	vyNGgHmbcZANJBg9OAsO0ACJXBcF1GGZLZrQxKHhmO8VGU6qGx/fH9fpcHuxAE9pVa2FTrq+cqB
	D/bWWh4FDtrXeHmPUmzqw/GgzFKUR70kvmqHu5VLm5LyUlq0qv3mHnlQCdlhWpuZlmTCawcGW54
	liRT7hGg0qbHb609U1qf4ahPy5yBLm7ukmuxMirOxa7Unc3EP0uPpUc5/oyue2LQbO5DFtvZGWe
	B458/ZnCowULhIf/fhno/N2H0LLEVTtSR/ulCMqi
X-Received: by 2002:a17:902:e548:b0:22d:b240:34fe with SMTP id d9443c01a7336-23198105cc2mr84369905ad.25.1747282616603;
        Wed, 14 May 2025 21:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe8M7Pns6BOfigcI/LdoCzGcLiooRhtIWO/6Xb13UpzJZRpET6QLi1pEDd4SPeyUwIO1RhMQ==
X-Received: by 2002:a17:902:e548:b0:22d:b240:34fe with SMTP id d9443c01a7336-23198105cc2mr84369605ad.25.1747282616167;
        Wed, 14 May 2025 21:16:56 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc77421b2sm108603835ad.70.2025.05.14.21.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 21:16:55 -0700 (PDT)
Message-ID: <7d4f174f-18e6-402f-9a29-c4c461d0db0b@oss.qualcomm.com>
Date: Thu, 15 May 2025 09:46:50 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/6] arm64: dts: qcom: ipq5332: add nodes to bringup q6
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-5-gokul.sriram.p@oss.qualcomm.com>
 <242f6059-a32f-4ee2-a794-8a29b6449e96@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <242f6059-a32f-4ee2-a794-8a29b6449e96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7ozvdmwRA1sR2Anz8LUtrpzgUo_cii7d
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=68256ab9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HdtPUk39sM2pxYiq6tsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7ozvdmwRA1sR2Anz8LUtrpzgUo_cii7d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAzOSBTYWx0ZWRfX9iyJv9tw5ORk
 GAY+h98OsTE2jzaxMDYkpSgh+VmYTseMlVWTkpGZFeEjEsGTlbJvT2P8gQC0FiQbyj8lTTwq4s6
 MlJ74zFsI6p38gN6B0cC1Gbq2hOQM3GQzR7Uo9ELaVgpotEI+NltrJRcGSLL/JoadHefCEsRhw9
 E4ZRr8X0blSv94VCqSoHEtYjq1gmOdUnC1frd5vCCtzt7cgjSeC7HFEhs1axHrNJFNDUKie4R+1
 H+9rE7lRoYTjFJ8Aga0jzvCe+j5u9o7NTiw1u/aQdF7b6U7Sf7eHW7du7mu8xdsXC1+B8E71BAH
 Hl5vpg24qhDgiGQ54Cad1P3DbZzRAjKsnZkAAC15/2ByneNI/XwjgkQSGex1hWvf94hXvyK5aEG
 jr8y+XCsz+Iv78W3aMmrn+/sl8CKZWRrNX19oaOqgyS017CMaCxZpRDWFrLdBzNA2sD3jGAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_01,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=866 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150039


On 4/26/2025 1:53 AM, Konrad Dybcio wrote:
> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>
>> Enable nodes required for q6 remoteproc bring up.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> ---
>> changes since v3:
>>         - added necessary padding for 8digt hex address in dts 
>>         - fixed firmware-name to use .mbn format
>>
>>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
>>  1 file changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> index 69dda757925d..fc120fd8b274 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> @@ -2,7 +2,7 @@
>>  /*
>>   * IPQ5332 device tree source
>>   *
>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>>  #include <dt-bindings/clock/qcom,apss-ipq.h>
>> @@ -146,6 +146,11 @@ smem@4a800000 {
>>  
>>  			hwlocks = <&tcsr_mutex 3>;
>>  		};
>> +
>> +		q6_region: wcss@4a900000 {
>> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	soc@0 {
>> @@ -545,6 +550,39 @@ frame@b128000 {
>>  				status = "disabled";
>>  			};
>>  		};
>> +
>> +		q6v5_wcss: remoteproc@d100000 {
>> +			compatible = "qcom,ipq5332-wcss-sec-pil";
>> +			reg = <0x0d100000 0x4040>;
> This is 0x10_000-long
>
>> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
> Is the firmware OEM signed?
>
No. This isn't OEM signed. userPD firmwares will only be OEM signed.


Regards,

Gokul

