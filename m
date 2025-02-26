Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CE32253BC
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Feb 2025 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740591412; cv=none; b=kKF38NvKolrSBYymfPunOsNeiYH3NAs3IkX+EDHRB/2s4q5hKWZ7Axy9NWzJIU88v/NoV3bU/tT5k6CEMJYL8LlCkdg9fT8e4scrLgRrQHgwCvH6tunYeKXbWkNZVWXKEMT2N/doTx/PlMVvGhoQFk2+i4y8udqwLearOWJ0Di4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740591412; c=relaxed/simple;
	bh=iKrBE8YXHqxKwWS/VKbfRuC81Q3gfZ2jZsZgbYf9j74=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KTjnynf4DsAl/+WcsgAbyBlBZuNCTXBMH3bHHHpYT/l4vVi7djjl4+JtWxR63zO54rg/j6laolQi4P4LNyOP2EmGQSf9lx3D5xz83rXb/2UHr55TTdWJr845Z681kJxqjesrhnNQmVbouHOPgd58WYn5eMHvKU7wqsd30lUhe/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdNZnwvP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdNZnwvP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QGHLhe022545
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Feb 2025 17:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vAlFBNXTCAS0/SdDMb8XLAtCY8C+/iNcJ4PHLsBUW8=; b=EdNZnwvPSfBlNAU9
	X/suYF0Y0yVI3EdAJ1LYooz/HBwQqOdH/fKrXYgUfVchCpTsuQLtAoJIsG5XyFjI
	3rEwKn3RLeNpAB2z/bOArYiBuHouVUVzLGsSB8s7trKaYORfb8/SV2E8PwGqwh/K
	gFvay+fmLqKtQkqu0QADMlE60Hogfe3U5jlP0yPLjUkS2fmMyBM1s0+Xq5Aa12EL
	kJlpHSsBCDSqYH/R/1nW6ANEQwd4y1/OgnRwM5kZtmZ+sGY4lderl8Q2n1k9ohwZ
	a/Xrw5B79dkhz9qJuzbqrYpJVXEQpcX1hRZEli2s0l07BEol6rhx9gUrf8KmLiGv
	iJ7yHw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4526bj06y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Feb 2025 17:36:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e88b3d5d8bso199696d6.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Feb 2025 09:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591409; x=1741196209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vAlFBNXTCAS0/SdDMb8XLAtCY8C+/iNcJ4PHLsBUW8=;
        b=nKmlSylKsNGiEDFH8CRMytCxOAgfPd6Ry6TLicHItciob38NSx5LqrlE4JErM3NfB3
         I/fLXUnle9BymswJZSsV5lw8oCcJBrfSxoOR5lQoJEyXaaQH5aCpl3uoFyAagEgHCG8W
         c2sTcwxD7E9JWoeyHl4VvCxK+LT4e8IfZRX9eBMVtHy+PSzEzsOwO1Pfe8iL6NIzlY4A
         JyOCuDGf0PsSge/wwGO1tToAsIqbPJcjEdnA1Z1Z70NtEKJJSSu1z8m6KEe2Qpoj9dE6
         SCg6izxF5pavMmpz3zQyKN67G67uK7YsEGjbga2o8lTGbdY2USR0u2Sk9G1ARHxgRpGT
         omlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsyaRBRig6t7GT8YgHccBO3FIe3ThvnSAPQ0BSLNvzT02bbxHd5FVhuqSOeYZlxj5vJuIqaX2A0wHeg7K5b7rP@vger.kernel.org
X-Gm-Message-State: AOJu0YwdfrqlI7hVmMm6NICRG1TwO+rbPhl9hyz/ZJYoz8RdTI0uJeJ4
	br7BiapWAPPmAmZ7TWrNbifhSh/9MpqkvntNlY7TaPu2/gYuJVhgjOE4CdisxOd2SdxEKgkQNMP
	Fp1jEcKRUNQ0qmIi46rdQYhLajtOdCY7X9Ju909HeAn2qLmi0oSVjmTvhTsiJyA6/mabB
X-Gm-Gg: ASbGncuVKVfG0w1mA9qomJ/JM/66CPSmg0NUg9zmkYBy/81AQ95YJb3vwA928TdrSLX
	cGsMpciCt+zSOWGY85iv5J6JnKZLetBaVSIbN/Jztce4t89a4vTj8krgWKHYqjMOaZ/BFRXMyWU
	eABjR3ObYJHbo28FiWsDBbwdQ0bspOHcHkvzm3g/WgZrbq/Thv1yG/KrwQ9IgSzahdepwjTIai7
	yroDvbfpfEaYWgKHzUTrUWyKr/UClSpFjDIDolWSd2sMDdUdQI5bO/QjZ/OJP3+3xEJyyhlNzMl
	/bHNGSWfkAS1QV8sYExX3QkjnaaTDYSv1i2S6zQM3kekKIyP2zUW/uKUR1DQVxEIWOY6Bw==
X-Received: by 2002:a05:6214:20ea:b0:6e6:6081:34ed with SMTP id 6a1803df08f44-6e6ae9d5df9mr99922766d6.9.1740591409145;
        Wed, 26 Feb 2025 09:36:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE9yjKiCO0PPVVHKLN1SK6jQTYG+qFIB3DXGCQMIW92FMkg1aRScPbwLzZ0IUF/Fm78vPClg==
X-Received: by 2002:a05:6214:20ea:b0:6e6:6081:34ed with SMTP id 6a1803df08f44-6e6ae9d5df9mr99922576d6.9.1740591408738;
        Wed, 26 Feb 2025 09:36:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2046462sm362913166b.130.2025.02.26.09.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:36:48 -0800 (PST)
Message-ID: <abe67db8-5dc8-4af8-af2c-c6bd72204a70@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 18:36:45 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,sm6115-pas: Use
 recommended MBN firmware format in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250226145103.10839-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226145103.10839-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eQCk5XVzXDRhYTEnAhTdrc_hExNwr-Pz
X-Proofpoint-GUID: eQCk5XVzXDRhYTEnAhTdrc_hExNwr-Pz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=857 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260138

On 26.02.2025 3:51 PM, Krzysztof Kozlowski wrote:
> All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
> instead of split MDT.  No functional changes, just correct the DTS
> example so people will not rely on unaccepted files.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
