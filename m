Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CD12D6E53
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520986; cv=none; b=aVXC4tUCfi6vcn08hyPJelHORkwRHAXc9d6cWZUtej1N5PQe70kB1mxf7iJbvdppNoeGIH06/U0xRtawjWZ+VHi/KwnM0Aqyc6DIknKz+h+lvyH83fqRBrEmqsy66OEhgki65xjcaYQj1WVGlV4NDJEcozWdkaJ5XB4XkUD1yTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520986; c=relaxed/simple;
	bh=bwvFWy0d/zJxjZnixmg7+ZG1rxxiZjDsn68fhnDRl6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYryl1RhmImfff9wYVzo3JCodqQHxvIZ8g/UrFQzTccpYAnjJqMWX8DGG+DP4MQ2FtajjkdALY/S4nJboeACN+pm+d1nk5PXjYCwLDf2zeP5NOdtRZpVAlVYg91hvD7p+nfi2bOJxUuU3Nre8IQQqg5T4EyxaLWh/FUa+fYtXLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNtS0qw9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbaQrhCy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNtS0qw9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbaQrhCy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGOEtg1018224
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9ECGpupRfaLiqIYIdw7qviZp
	4NwEym2EMqQh7VcytA8=; b=NNtS0qw9k6wsMjff7yFf/M7E1nc7YQZiCBgnfIq0
	H9w3nf5XPRyv1l1/5M8yyf2ujQXSC828Iu4OsvpwHkcOXTxijvh7OGFVlPv5R4ZS
	IdgsRvGQjcHEvLWrNVdxbC0KVaLr6n4XTPNjVTJKdH49F2YT6ac+tn7jzdL5Tdt1
	nXfejP+wslBCgCSfPkyhDu5lc59j131xPEnQdwiDjZz4tBi1M3+QclZ+zEUrrmYk
	ktKuZH9zuX8Z7c5T3fahtE75o7989bajAm2HzhJmPfC45WObrQP+m93SvoGJJJ1J
	CY/NlpmZCnAiDnC+f0UyQzWOsVumcZx/mkJwYqT3l44s6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs8q58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:16:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaf9e48ecso139293831cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766520983; x=1767125783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ECGpupRfaLiqIYIdw7qviZp4NwEym2EMqQh7VcytA8=;
        b=gbaQrhCy6GV5YrqTQ/x+CXejfJaCM3ZsuB5U0YT+A4Hd4R4cF5n1JVZ5TV16GmfP43
         qVOjt+tSkmjWjB/pGVYjciM3lCGiHOH4kxyZLTy7TcE8n2iXsS8lGPKONPHa6cvm0T1Q
         llnvE61OLPX60Lz1T5141tGt0w24tuFfh99bMNqxAV4J6TJoFk2nYlmc+bLl5ia1/Mgc
         JtrmIicLqB2pA8RCJlf8ZL1AIGsS4qG9WwkEIIaIJTW47/YlpU3VMn/8gdC1HnKKHV4K
         oHmR5MFeP6tZm9G5oJTMDyMHva/zD2VWzaDpBVRO1qhraSXcMYkAblADjTcoJeavp1nf
         Bu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766520983; x=1767125783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ECGpupRfaLiqIYIdw7qviZp4NwEym2EMqQh7VcytA8=;
        b=Xjbx8M3P/EJUw+XK0CuyZD8GFiGFTSbRaVfy/myKDu+lQkUXKns8JaeELZnFphjz8w
         BqjQuR5C4+sH8RZR1qbMTvL9e4Kx6KcAxLkZjb1K+nXCdilfWsarbLemTQMPBUXWL3LZ
         WBT0VVjfjwJS3lVbHbY64jMSGS6S4rX/RhCN/G5rNfyfrB/0TckL2tP4UT28Ap8SnvEk
         rVKhWbXh38bNMXPPzaNn8qHZkmLjvk2/rqcKs/UtweyZXdfs6AHgeelFH/dhqcI53uIG
         Woddcw09JUMC3kEgBpo5vmltNc0b0iEKpx363+If0KzNMhVglzb0h7EbvRO/t+y9skYU
         EyBw==
X-Forwarded-Encrypted: i=1; AJvYcCV3E7dgksSKK+hyY9nPM3carcFnh+/djewcdEekm216mCHNLHM1PcHKS2sGGhOCjmrwE0TszzPOWnInCcGL0Em2@vger.kernel.org
X-Gm-Message-State: AOJu0YxBI7O0U5Xbm+b38r00s0BcmHwmN6jttjbwy1Im4ciecUi6030j
	Vfpa29AQUopTkCedZ2t9Kzj9OlpsqyDm4vS/Jal/8LlwP/Qtda/Mucza+YH/rhb5ucOIQ1OKuDn
	ApUdRdjsKaIhKJiBD656HdTIt76P0wtrmYOAwvsd+hwqkS9cOsEEEn2oL0gbd9fKppZ50xDqo
X-Gm-Gg: AY/fxX4eRXMoYRlq6Tn0yPXbeeNxSiEibOMuG9HvuLAH8YRQeO3C46ShmTdB0YD2BsM
	VAYv0Cl6XjuJobznWtc6XxNe2+EfeioAqXj2+NAi3cQpIEkWgtw3wd8lCeeKqPaoE56vcKGTkuo
	h1Y09o+Taq2yhGcS6vcUyK2/QFTGaoPK1KxDJwC20jcQbx7Vy6RPvncPrBU981Io+krGlOuhC0i
	CsoUETSR3NcRy9wATQWFe29RMvs5ohdNi1/J0P1UgufCvkJqARgVyeMCZVBEoX8Va2Z9jenBm5m
	wsZa7Yf+n65S/eqrov+XwgXIPn8Ufpy9bAzRwq3oz+9YDsNpHnVAgNtSBpPtJtrEOsHU9khJaVm
	atEXewkTs9uklCBAHME4y/l3gHtKTD+5gvNZEpUugO1EBFhLoiD9pDdxSu2aID9pXc6k+kwG/wx
	Xe1aBx6mo7R757zk+cTqZBcT8=
X-Received: by 2002:a05:622a:750b:b0:4f4:d29a:40e7 with SMTP id d75a77b69052e-4f4d29a4257mr72537901cf.74.1766520982642;
        Tue, 23 Dec 2025 12:16:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECdFvKD+ipW92Bxiw1izJumGMy02FzKvHafNctwOeaTbO9ebvYzBzKblpzJ81MiNQlAN1lpQ==
X-Received: by 2002:a05:622a:750b:b0:4f4:d29a:40e7 with SMTP id d75a77b69052e-4f4d29a4257mr72537581cf.74.1766520982243;
        Tue, 23 Dec 2025 12:16:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea2d8sm4308298e87.45.2025.12.23.12.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:16:21 -0800 (PST)
Date: Tue, 23 Dec 2025 22:16:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Drop SM8750
 ADSP from if-branch
Message-ID: <3pnmjqtxiq7vcgoimgfywuxohujlyhw5zci3vx7wbsswqunawc@2qjpsdrjw3mo>
References: <20251223130533.58468-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223130533.58468-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2OSBTYWx0ZWRfX+MfeAQC67JNn
 wwGHfrxWyiqQsaQD+SxwUug2l6FQz5wyVH6nCwHIJGdZ28IssMGMI1BTGMLimrO8e53+daV5UnT
 /+9zHm6suuGq0D1XnNq3HpKGBFB+fiRMUiAK9jdM3y7TWEBvtDRtDkyF8AyDtNOSPIBpo2S3G+2
 Qp2N/80wX6ucnasJRn9ab82lgO9UXEQw37rQpApvwaEPKq2qyTu63yPT1xxMRcFjURjdJcH6jhO
 ff0vUhXqxr7dHJjYwyBeSr3Amsfmeyn1XIQrPXZaYT+vy466LHU2fS7tXUQQLtAnfNde/vphm44
 m+VocPX1nQgtzvTDZTz5y4TqwGElK6hYy+Z1amYPYlajmq3/SCwRYF+kMSDOXX33QofO92ThSPm
 tRJgekdd9M2EKaYz5HXrhUAUlpvaWpfGkqhdGTYsBWZb7Zh1otEhHT6noC1PBJsGVEgsr5WRp6m
 saURDdHT+vksQcRvkHQ==
X-Proofpoint-ORIG-GUID: dbNY_tSpr7egHMHTKyiwZek-CxqohWoH
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694af897 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_foDIjl0ucieEotE9C8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: dbNY_tSpr7egHMHTKyiwZek-CxqohWoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230169

On Tue, Dec 23, 2025 at 02:05:34PM +0100, Krzysztof Kozlowski wrote:
> The binding for SM8750 ADSP PAS uses SM8550 ADSP as fallback, thus
> "if:then:" block with "contains:" and the fallback does not need to
> mention qcom,sm8750-adsp-pas.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
