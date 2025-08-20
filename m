Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F42634166C
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710343; cv=none; b=iNWatbJA5ExEXA9bnlDWD/oXOp2hVT3e4WaBizjS/NxIwkHbHIvqady8O6lqfRLA65DtEFkX9QvBFiP/R42lgl+lbknZ4ufCX05geSKMb6e6bS6G/8ZnBPooAhTetai8EeSJBU/7HhB5XgYoOYuRYYsT+16E1nQx/yExOxNZ6xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710343; c=relaxed/simple;
	bh=G6X07DMJoJGHfvSbycLea+tudvMXf5oz0RpWYgY0qMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+0N8mFbCLJYbUiq4D9EA/zQWejfgeUSnUTY/EwSqK/NGo/jNExraFM3pBKOaPqAC2QUoGPCID1LKScIDLJB+NA0GaRqvI3UbRRmFYcTYYKxq4rD0ymlDzK+uZHPiLFyQ4NMH4tHG5vvwiB9eSUMfuhCUeuaTssNiMW4gdIhbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZGc/RFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZGc/RFP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KGmeTO001012
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 17:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D4c6VjJCxHwNMdHY8pDWjWO0
	85ZA1m3/u33QomEdPGY=; b=QZGc/RFPA8AMae48g6OvIQGNkf3YiSAQVucXFO9f
	qtb6l585YnHzzGlmjmWsDrhEn4ljF3RlTZMZwyDgvNxpaxLVFcZTfiJQqdMOeH9E
	FLbM6mlrihlzrxjId669nd16XbZ/JXe2WZMfIoZdB8hMXUtKy9o6pMX3QK1djRnI
	VWF3/Rgc8XR88Oa2wHM0cAbOKcf4q2GgmRbYrVNeadAytIG8kLefHEhOu69ks0j0
	BfEcx8akS2rRni/0wFmPEbuQHp9JXEJP06aepQFrYYoJcto12jqPOGup+dXQmFEm
	9MNZhdNAqpib46BnlhCMJJnT82u+/sN7ZeKtbxMS3HHCqg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52djg25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 17:18:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9384d33aso1736246d6.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 10:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710334; x=1756315134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4c6VjJCxHwNMdHY8pDWjWO085ZA1m3/u33QomEdPGY=;
        b=ijF1lq1TZa0zc8PncsrNSzlG/quhA8QIU25fTYxdGToBzStHFbGumbfPid24ZO02/W
         n1IXmT86sC8PRB2DY7Zzxcjx6xbHSiimrQaQCyEKKjz3wd4ZoY6uQnzwbJPf0ic/llzS
         PvZ+O+kvwnfaX3HL2u3BWdUHdK6hHCHJWYz/W3CtJWmB1gz6bD/olEEABDYRHw7Ba/Iq
         0n/OdJKT0ky5Lq1jaFTNZqX5EkGMaY1808Kmt/14hWMGDq3sVam1Juw3MYiA4sovRXTW
         I9Sc4kHiUNElvxBpSZIuNoN1pMwvwU/oK+/X7fHlSq9EvfZK5VEnbVRL4u1WhKSSFasJ
         8w8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVByGJ4o8Mq8uARDMCws3RqPt95dexi9Wj8IzFLMDWFVLQEV9xE+oNtLJTdnPhHxJYChCd8UOOhD6oz6n/jFEcI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6k0ghCmQGJoGIGoq9p0gsNmaeWHrkBI3HXlFEz1+kSa0pKGhf
	KjqpqGvp5Utnf07+a5lIxw+jvFXsWpZif3+Vr1mn5Gcb2Bq9Jw8uF/+fASpbnFjqOWeS452Nnmo
	dW/csB08SSejX+pc9+311eyJfe4O4oLF2D/Rg2wni+f1eGniVZcQum/UVtmqRxEbfKdWEP48h
X-Gm-Gg: ASbGnctyi6aECIeILXe3gYagsOuth44KWq9Q+6mUA2PYyH65k1+TUscBRL5to1u3gvF
	dRgll4AIeNztcN9uyP5xZMUgBxaXb7uyUDRBN9DW5qNflVDDU+nRGagbEB4fSRva/gLvcyZm0io
	AAjKfgSjakl0vt2AqpFh39KY8jwGFzzisC5+LKX4fFrVG3moVDHfvUfNtfzWHS5xdfEnCb3di9b
	PmSGIu1pMuosGDRQsMU8tuDY1O0KRn0/UYTjY82z4Rlze4pvx2Raao1xwLX6rHtW54EI4TSmNcJ
	AL02wLG3wCRnU5kkF6k82WmPcwQTnl9ZwLRIS5J5jkQldseKr+XfARiptP5DdmCoOnxyEHU/CmH
	ekuwkhl/4LsSbly3oktcSy/vAUZaJotfKi+q+ELCiSA3amO50mHLZ
X-Received: by 2002:a05:6214:21e8:b0:70b:af9c:d0ed with SMTP id 6a1803df08f44-70d770ec90cmr33161716d6.32.1755710334178;
        Wed, 20 Aug 2025 10:18:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJMbKVOPkMoNV4lYsAx4gpHUcgozCfe+fx8N/3mB2f42zwfWVqWvV8n+duLWyQQLwTizWwFg==
X-Received: by 2002:a05:6214:21e8:b0:70b:af9c:d0ed with SMTP id 6a1803df08f44-70d770ec90cmr33161366d6.32.1755710333680;
        Wed, 20 Aug 2025 10:18:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f481esm2666722e87.126.2025.08.20.10.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:52 -0700 (PDT)
Date: Wed, 20 Aug 2025 20:18:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 4/4] remoteproc: qcom_q6v5_pas: Drop redundant
 assignment to ret
Message-ID: <5eh6q3hry4zchaptogbxykiiuaul7dkrshzlmfay7w7tondues@irxamm7vt6en>
References: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
 <20250820-rproc-qcom-q6v5-fixes-v2-4-910b1a3aff71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-rproc-qcom-q6v5-fixes-v2-4-910b1a3aff71@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX953c2O5Ipkni
 jppFSKbKGhJOIKDDZULPs/S8gH8WS3kccRPFE1zhTcNQdIy5O2GJAimhGFSs+Um3gGwp4+ie+gB
 ubNslKkG1d3rtQOyMQz23CviOCJKj9dZrI5ErG1697jYxv7olCxrGTYo4esL5vECjSi8kaae9HO
 /ltQIFRnhs2QI7rEOGwX80qTa7Bs8Y6tDx2Xzv8aUU/rSkSSQvZr71Jxjf70UCuDrbEOcGUb0Ml
 5tV/W3FWW/zv2TA1K/IUOjFREmY4ZYsqYPmPS7rShCTaK1FgElU4frIlHFUWPKymVZCud5tSxRt
 iAV4lQhAhdr2UtMwqOwF8BlePIE8MSwFLWNRQ5vp6Agrm184Bl1o9kiKFGoyNftz1nYCLv/C6Y8
 yWXgp7JwsUzrojGXpKAQkSvDbSVvsg==
X-Proofpoint-ORIG-GUID: oHNWGfpxQRxpGtYy-x3dESv8GMW65s8e
X-Proofpoint-GUID: oHNWGfpxQRxpGtYy-x3dESv8GMW65s8e
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a6037f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gpV1-yxKdiVEvkH9OoIA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 06:02:36PM +0200, Stephan Gerhold wrote:
> We don't have a way to detect if the lite firmware is actually running yet,
> so we should ignore the return status of qcom_scm_pas_shutdown() for now.
> The assignment to "ret" is not used anywhere, so just drop it.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
