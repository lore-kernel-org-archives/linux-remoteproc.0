Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8E7292938
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 02:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766544306; cv=none; b=TYamMldFDmKDEHrbgIW9738vx43U6V8VWTN08mTOPhRLvRD9Cs1vSlk7WARgXvZpEzyb39TPOCUVlzOLuSwBoPitRYnU2cPRO4fNPMgh36mydA2H5qyAPVa0be/0hOcmd0IlmCN8JvhvwPiw3vNwweWTlHbWDyrNfJEhmjKC42E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766544306; c=relaxed/simple;
	bh=bD1cb1E3J3z1i8ZcgFPIL9aVpMF8d2MjSlH32Zn5Aro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GsyrWaH4zX2sag1ejaaCMRwAxnAVcdO+OZ3BiPOCVCSXcMdDbxp7LE3uprZgyfbS0dL74VPPbCzZrC3EQe6EL9YWvwGMQnGxT37UneJNRSnrCm1tsNTY7OVlq3yyRkwRwfT5z7Vn6IURhswQdfTQDoecs17Iq7utoIhG+0/r2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVJLUPCe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bn7Mbe2W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVJLUPCe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bn7Mbe2W"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO1Hikp559899
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 02:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfGjHhbYw5xNFTJJyktEctcbFF/Yp9ewzr5cQJX69Zc=; b=HVJLUPCeMAjP9Hn6
	EjFK+JpMgEUsNtg80sezMg+9Nohm8na+Fl5eKYLriPdgSMtHD9ldRjRYT0Bdxl81
	zFtd5doYHLJ/q5c8tiBzZHrdD3yCTPWe5LBvcnaxME4ykBylkoUkMXFQjvj++4T0
	470kOHhMndXvWGHrTI6ymfudPNK/aBME26PQusOkoZsjlMbW3wlDuij7zyKmbNPx
	ItTgjOHqPbQtf69aWb28olQS0XClUos5P0lNfOHwZiBiOwUhLyAwHYf9oz/zbG28
	aduhMemrSExHRECrpdOe6t6Rfywr6wmbaPYJMEfuP1gHRTxbhtfxbQ6R216mNE4W
	Gsz4Dg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9ct5av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 02:45:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso11410646b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 18:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766544302; x=1767149102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IfGjHhbYw5xNFTJJyktEctcbFF/Yp9ewzr5cQJX69Zc=;
        b=Bn7Mbe2WqiltGO34vsL0/nuGMVMyFuddojI38ynAwMWMqDPnMWlKdhUN9dY4J2sZa4
         g1Sq9WV02n8g92QkAxGBVJi+CS+nufiDjHYM5W14aAcPrdD8wB2XlXXW7pekVorCPNSM
         AdMYX2gUdF5hdLV/yJO1m1ljBRe4HS28YGzN8mq/BZPG/XwHc55cUDDOFeNPziUcOfiV
         vvU8OW+pstdrYrzEYAgbfAarXypoTrMLXlMD2PRuYN0kQ1AyXV1j6XlxGKs9E+U2Lvn5
         a8+Sp2ymrw0mvwJ7IyYV6JGNKgkQXmTSup3tb8DLNLsPK1kP+fdHI1fWe4ZFe8N8kc9G
         jPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766544302; x=1767149102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfGjHhbYw5xNFTJJyktEctcbFF/Yp9ewzr5cQJX69Zc=;
        b=D9XsgYFBNK6NPOs6QMH2/+a+dx+rsAF1ecvMwdBfXXuOEDx6cVDCz75i0dTDXa8ixz
         kxB/6qJME2AZQlGJzamfooOBxHtCaUTEhZiijt98FJCAd7xpzTY+1y0q/cOhEbFEg7AE
         K4xvMkvmYHFYx6zD/YDCV0atZbpiXb3gKaw2D8b5m3rEDk4ViamzyUJ5qCHEjFxhu375
         iS4sXIIkjhc3/XvvWTsyXWwMatQSkZ19S2Cf99o+lsFn0Gd3JoTbq0eR9pgDa1rT0zcc
         nB95/zs/xYZyFoc2Lu0PAnxOjSUEp+VCfw99Wtn934AfBLTA5jvg2pOwcoasLZOYay1F
         J1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJFYOTx/O1Pl2BItzE/C+A6nVOYYME0gR4yamhsVspbITIJjnUivhO4KBGzWF093DVOaLm1Nm8oRV0oz4yvMm+@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrPLLdd0RlXyxa/HVi/y/gYQZ06HrlfpVgZ6wFU3wuZ8k2URd
	LsP73j9oxDx8C02oLxNnyna1ZpwcfYmQH52xvqPvTBmqRTeP6hT9mOuatsY9VhTbWZocEYBaTQZ
	4f4gMnLPB+ViQOWTOu/M2+8xb7p2R1SBfZgiMChZjbthkhHFwKNhKzh7aH3cSPCDQyhNMhgyl/x
	AvrBr+SP8=
X-Gm-Gg: AY/fxX7MRTzs23nMVAUGIEjHAbIgTUJkE6NDLkyB62mMNT6EKUN9gFABfw8t01WXLrU
	sZOxpLTvT2xWq8eTS4rSnW9GKIwCFMAYVxaArP31YUdcJA0dtPp8UzPYjF03fHyA/WgxEKcovCZ
	GmhkbBSMg3AdEBO09rcn578qRCzUSqk6iZTWAw28HfkWTLYPB5b1Ncirk/Ve9dXVERucdNWPf5O
	vZ76E0mW4eR3zJ+UJNyr83gofNFKO+nJPh6iCDp7QJTIJbHhPZE46jRcjzxxKiaNZifaMGcujF+
	SnldRpl/knVldd2zlIMBIufaY758GQ8tN3Cpxf4ltFhT3tcEDlXPjvez79vV4G8pyaqYbmAeWC0
	eggza58V7/xMRI/v0eM6zmgGxLRf5FfoD5wnohcZ/e0rdvMVG4qFTzxwTYjJfYsmGC8Q/LD0HIJ
	UdpeUp
X-Received: by 2002:a05:6a00:1bca:b0:7ad:1e4:bef0 with SMTP id d2e1a72fcca58-7ff64403ff2mr15613574b3a.4.1766544301875;
        Tue, 23 Dec 2025 18:45:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWQuhrBW4esQyr58tJTAvLN4g0/+Ce1v8UPn55MvG0FsmylDmfWdjb4pgT3FzooaYOpOg01w==
X-Received: by 2002:a05:6a00:1bca:b0:7ad:1e4:bef0 with SMTP id d2e1a72fcca58-7ff64403ff2mr15613538b3a.4.1766544301400;
        Tue, 23 Dec 2025 18:45:01 -0800 (PST)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af2ddf2sm14968649b3a.19.2025.12.23.18.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 18:45:01 -0800 (PST)
Message-ID: <bd5f3700-8c4c-420f-a3d7-5b2429c0cd56@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 10:44:53 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-2-5b09885c55a5@oss.qualcomm.com>
 <20251223-loud-pastoral-ant-f9e74a@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20251223-loud-pastoral-ant-f9e74a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kGjjwjOuAWYM-HNPAJ-YEac4pQ85iGJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyMCBTYWx0ZWRfX0K0jvqU1vfZS
 Ir3ed9u1n3OJ55GWPTlSF8KZc3ckBby28mmannZLjzq5ZIBLko0HnB/apjwpE1ZDnYvfIhxqO+l
 WeEjJNd9S+BoXG2ra5yb3n7XEOHxrYK0F4N7nEBpF7Ha90IBC6XF8+iJFnMozsPLpLdQ31NBx7U
 AzpSUueUpt5FRTen3n1Ti5lyqHI4dLmr61bZE+ego+c/IF6ni5rp6tXTPIkvj3zzDlGCz8nZC0s
 1INNbdlRtG80hVZIVDfGdiEaR7b5L4cnVK6V+inWuYM4zOAR3+AxNN4t6iBNWQ/hV9sSRIO4fkc
 N8o1peR1qoB6RXnp9odLwH8e6uUGiuMCPLZvA5zo/9PyGL6GSnfBPOOBcZvEfXIeYagtgRqUh8H
 i+6c1CifIVFFHnVD8dZzOtaMzzg+LXvH2TqBD1cWsfZFe9iZKH2snmZAr307DBKL/Kd9NBItdpP
 5ZAE6la2u9EVRFh1dSA==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694b53af cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4G0_3PWqEY5C_guDPkQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: kGjjwjOuAWYM-HNPAJ-YEac4pQ85iGJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240020



On 12/23/2025 9:07 PM, Krzysztof Kozlowski wrote:
> On Tue, Dec 23, 2025 at 01:13:48AM -0800, Jingyi Wang wrote:
>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
>> interrupt. It is not compatible with SM8650 because one memory region
>> "global_sync_mem" is not managed by kernel on Kaanapali so it is removed
>> in the remoteproc cdsp node.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 31dffd02125a..3b66bd106737 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -35,6 +35,10 @@ properties:
>>        - items:
>>            - const: qcom,sm8750-cdsp-pas
>>            - const: qcom,sm8650-cdsp-pas
>> +      - items:
>> +          - enum:
>> +              - qcom,kaanapali-cdsp-pas
>> +          - const: qcom,sm8550-cdsp-pas
> 
> This should be placed before list with "qcom,sm8650-cdsp-pas", because
> we generally sort them by fallback.
> 

will fix this

Thanks,
Jingyi

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

