Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624825CC54
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400624; cv=none; b=GZaZa/xRxZtmpEEq/hO6VoOnzt9GTwkzS8iEjXIhWzUZnxs3QSZHqubOvbqkYQEGxz6JDgCdyXSGqU1aP4d4sBs6wfrtVaEWalu71qkfzK+9Ak76V1ACMw5/w7FK1kPwiHGydZPjGXeofsEHPrEeq1RTJRN1GOtY7xBqk1HmyOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400624; c=relaxed/simple;
	bh=KhFXpabGbKqNKN4jEUG3Gsr5KqeWcLFALNi2Exu7Wds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjLkxpIYjcDRfpVCyv342A6AILcYr+6J86Te/G/7umqGezsIp1bde1lf7m7fDBT8SsUqcndUAoh+iLF+xgudeJCXpxkmYQJATdiIq0Orj8GqEQC1Vr0gKZCf1idv/IwIx+ACtBNRiAUUL9n+/9/b37/neDj+YywTxWCWg0F1QSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgnmXYJS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgnmXYJS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iA29022024
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 09:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2RfEZO7YG6Zogn9SRD/U/qedhxSt7eBAmsr8vFvW5k=; b=QgnmXYJSKwgcFXRp
	LhBCvmJXZ5d7xPDhYd+3oF5I3LJ8aKjEDbeCLieplaaETwY9tftj0IAY8p6fWVEB
	4g8LJNoEHNwhk8/pszTNS2l4TZhPwYzgmgDydUoaCbo5ca6zlgELuJlcGbYlq/ID
	ouR+/py33AXNb/mdGqNPkF6Tyt9NfT2B8Tm+UCpv3lCsVwDXisixz6lCynkgUSwF
	uDBiqVbD7b7ITh8XfETbgYmOO8FtHQnKKhczf1ukBu8YUxAf2Zl7mjH+EftPAZuz
	dZ5+b/ZNHYT12jl/0Go3G75SP+lKOIRGPg1TsgWwyDfq7XGYWq+KrSRhY7hVreWL
	ro8QaA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh11kyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 09:30:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476783cbdb8so13476521cf.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 02:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400620; x=1746005420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2RfEZO7YG6Zogn9SRD/U/qedhxSt7eBAmsr8vFvW5k=;
        b=V1DZ1I85WaP9FH7AuBnRdWpcmqfqArdDA1BemmTUTsr+q1sn/LiZ2z8YdBoFUI/eC8
         NYanrcfpZgZp1pcfwemh1Jxtq1+YTrVLmcPKvkg+D8hXBSqbDeqHffAO1TQtQZCTwfoS
         pPAB+Y3nIuBbg7RNgvp+MmTwkQAw0n0lCchPLVotpAz47LFg5Eulvnl4Ck0t9Ns/6xXc
         Ajg7zK3sPpKjCkrKdXbzPK9uBG1fvExYY58Yk9idDJtls3RWlAGugcNcNejVNauLGmoY
         C6rd5Kyujka99Gk136oDlsfw/UO4i8i2xI45zaXnbbssQWXCbeZkHVfMYCxjYfUqNOAw
         j6MA==
X-Forwarded-Encrypted: i=1; AJvYcCWB+AKAVxpjG1xrPF6GqeINWh7Jtx43HxtUC4/9uPoEqK+Izxcp8DkhvqKtLsZwKWp0xetxohya/ukbGG3TKX5g@vger.kernel.org
X-Gm-Message-State: AOJu0YyOatVwUIEStJOPflhyfSWLz4bLzngAQKy49tWKFQ+LPQPukHMQ
	DFH4k+f2sZrJVLXhBSYPoIdYVruECy5ZbCNwnrTFglmqn6w4eMwB4996reGVB6xs6g3OiGoqCOW
	cuhLfRroFBoA8MIsqed9h2pAnylG/kJLad4Gf1+9lI7Ae/DWlalR+OdythgLeW8yWcB4/
X-Gm-Gg: ASbGncvZQ3Tel6oVwcZh0tJQHpL58B1GO2PKePyAiq0Rq/TA9RzYGqazMuu7iykEbMU
	pLpBOI1E92ljNSsx+VmYgp5gzef/1lpdq8wIPvBOMSTzGfoDt+3IRw1wPbVSGGZF8ONAGtjAjHC
	bgUIhYGPgAl2xRBLVkoVZh1vtGtAm+6ee8SaSwCd4Fk9vA0dQfZxKTWIc+5i+BcSenNUgiodpBz
	+/dU0bKpLW5V/yTU3n0iQMSBp6cFUsG8JG9xmvm8Q8VCLfEuVqdCbxMgztHtx22ZccEPhkczlov
	EHg1a4YNgdJ+x2IeOn+gK+vuAWxwU/cjmXKsFaMr4fIzA13XIuerZL/A4PyDJ8c7xFU=
X-Received: by 2002:a05:622a:8e:b0:476:ad95:c08 with SMTP id d75a77b69052e-47d1be7947cmr13214241cf.5.1745400619900;
        Wed, 23 Apr 2025 02:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5vFPCb0l6vMoBMz9fXqDHwfp0G7G6fbQNsGjj/FVClyK0wqBPS0xHQBBimDr76TPecV1jSQ==
X-Received: by 2002:a05:622a:8e:b0:476:ad95:c08 with SMTP id d75a77b69052e-47d1be7947cmr13214091cf.5.1745400619353;
        Wed, 23 Apr 2025 02:30:19 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f62557a151sm7209483a12.32.2025.04.23.02.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:30:18 -0700 (PDT)
Message-ID: <b8bde418-450a-42ce-8d39-098d5c10e2a4@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:30:16 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Lijuan Gao <quic_lijuang@quicinc.com>,
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
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-4-a94fe8799f14@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-4-a94fe8799f14@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5CHwtymw-aCVyYifBWQYzTep3VvnL4sq
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808b32c cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=SE4aMjCliAL7rhkqCSYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5CHwtymw-aCVyYifBWQYzTep3VvnL4sq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2NCBTYWx0ZWRfXxVIHRmYyEKfQ yUM4gFGzay/HDc2+2lnQP/fQOqz+vJ3HVQfag3uqtuvs2SAhGP4G8T0ifhgo9fHftgSUoXso55i mT8xgPjj5Lu/45YEsr4XVvSoozemnMy/b8sJBpS6jX1W/wQj79YGDoDXuye/2+cIrqEJPwgidbR
 B0m9/7otrs0jZWDBRyF4F9w9ruekiOBLltgYw3UWpIdnSSzuStg/fqVNgPXwEjDuU7fM4jbH2Fk L3uUF5Q9Jc9W1mVPlXcx+aHLF0MOK7xQadXKrGZ13nvpmF9UKkmssLQvFwW2rjw/SJjZ8GXnMe3 937GG4p4UxIYoBTvgl2E9mzN5pWhauWeULHwi/Vp8KoQx6Sxu7ssFAjEcYVWTGqhrd8tdVIq33r
 +jHskbc/9vOhOwSY93BUJgTB+rGyMdfwE9mpXHmGui0ZPPJx0TenznR1hyngfdYgDSM5wOAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=803 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230064

On 4/23/25 11:17 AM, Lijuan Gao wrote:
> Add a simple-mfd representing IMEM on QCS615 and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index ab3c6ba5842b..fe9fda6b71c4 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3297,6 +3297,20 @@ sram@c3f0000 {
>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>  		};
>  
> +		sram@146aa000 {
> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x146aa000 0x0 0x1000>;
> +			ranges = <0 0 0x146aa000 0x1000>;

IMEM is a lot bigger than what you describe here

Konrad
