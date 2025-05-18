Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54232153ED
	for <linux-remoteproc@vger.kernel.org>; Sun, 18 May 2025 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565912; cv=none; b=OW3tEPZeFv04YNLFCxso649/PJ62pPjUa2CtJZWcZPa12py8LCLT+l9/Qfz5hVXADm8ZRieTrJtteKVdl6m9c6RDp5A9U6JdSJR9pF45YMZwYrzDULSdzYgjKVLtSAq1EZ0Hf2TrYv2LXlM7cu8sV2It9TDORxvoiInKlR6dVhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565912; c=relaxed/simple;
	bh=Kf1RaFNUgXQV8P3hFgMzRJzehXqOmieKWtM+BxPAu2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFxSZhN6VOgIh169AkMO5lL4Niu8jmnGagrR2gaN0ylNnkhiE6No30fqLJB01EL4VUZD9qzgxHFG+QXnMGUThsIJqa6+W9DNw3JUiil/XOzOiQASbUB6heygf8RZcnYSKqXnhl6SAjgKq47gpctEeWbw9f1TCIH54NQkHDaNjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyHLh0E4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyHLh0E4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9hXkX008650
	for <linux-remoteproc@vger.kernel.org>; Sun, 18 May 2025 10:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C+kAhzs70HWO1mZC+/wygNfV
	TouKKuehRfxHw2wkEf8=; b=oyHLh0E4NtKKPiUoiC86tFhbXkkMe8QpCOCaR3vU
	GITYLlXl68cwTN1heBxqCYCIuUhCyEsWsfpjAqRuox9zS4b3+yyd5mO2QCvYqeWg
	xajvGcm5OkKi/s8QzMPZj4JJ+Z3D8c4sJBE7oakYp6d7eMVYzkJcgJF6mK7QhlEm
	EZZngxvIC47S4mA61pu+jq9CRXPuVeYOATBHINVYIGHrPbO2daMEa3bywyHADZGJ
	E0DtOuD7WPzvec9Vck/+qAzCNTXv/08OgJYVON2QlC0e8rNmUe02WHld206VyB4v
	eQvYeEDjcx6jW+szLW2j3Dtr65XgJ+yUNSnvmbRLk6pqKQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4svnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 18 May 2025 10:58:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d448a7f3so4603756d6.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 18 May 2025 03:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565908; x=1748170708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+kAhzs70HWO1mZC+/wygNfVTouKKuehRfxHw2wkEf8=;
        b=aHxymeiKyVsanaumN/aUe1mZRo5FOuPQ/24jOY4egbmGZ41kTDnMk//0+MT4h4hLuC
         ra9ZFK3QNJtjJZ48LC17T0tdrXXsOBJEccWu2vnHcHRC0zPoKIYS4WjY1ZcM+5pJSmy1
         AilUrX/F44vGswinLs3uzEch0vdIGX7fUHRFij8QfX80slfvzphZbSXiBsdwEYhbRKpk
         auspuhcV0QDXYrzWRIxv3DR+tYq7EABvgDqhBN89CoLkUnPCkdoq0/BlNC60TRu2YApN
         /VgJv5n1XaHfk36SdncVyK2MTkockTvhI2KM7K60t2NFZOTPOo4pfs7YMpnXRMUH1brd
         bjQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqqdkMlFDDq88Qk/iRq7c44O79uO3hVLyIq3mfV8NzdaDoFsItYuiWGaD37+IofIj9CRyuvmw9DWl4yS6dosTB@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjyjc4VteBBwYe3lMg62ThwSFKVOEq71OST/l/rabZ+ODZdqy
	gmeIcObfAu5y3uaWQiU0+R73lI4djTo75MOwlSWcqXwVnIDJgporYpQLEYvIQ9MLBgfLnP1pqGt
	sxv1YZ/nK+pxBL665uo/vofWNmJxV58WtLqI8PMGBhm786J59/RrA6dOXpm2sP2+2MFrt9BVL
X-Gm-Gg: ASbGncskIvTepqUdv6240TrMmQqbAd+0b1nafZC+EK4lYAapdDqSELgECPDdAPmHVWk
	9Ms4G9yC66KAyyx+c+gFwja2HRTtVgCFEMJIDAA2+xxEECNfkQenGO2PTKPwAeN8qUiw0PXhFlR
	Tef2deSXw8zLeyHTbL8wZ9gyCFsaZbjipwAjHaNKXWIruqn+wgfY4OzOXWw5DRwU16gLQK5/v0z
	apclo3kvd2/u0S0kd9EHaAwHCukg8+GURn+4Zd1k6CeAaU4k5rVAlr+VT+He9CzdBgMh3bj7jEs
	YsphHMxYrU2RfotwoMDyVaModGkYF9+5xSKqOaDLAIngwP2MfD5QhYrjM2208rSlwY9CU5JJXp4
	=
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f8b080f716mr146093606d6.5.1747565908546;
        Sun, 18 May 2025 03:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWwPNf6b4oHQwVwY5J6NAuClm/OnyCb/hY8gSkEcTMvpD8A4ZCc9Gw1UENXkTw1ZvfEZtpEw==
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f8b080f716mr146093486d6.5.1747565908199;
        Sun, 18 May 2025 03:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cae55sm13842111fa.45.2025.05.18.03.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:58:27 -0700 (PDT)
Date: Sun, 18 May 2025 13:58:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sc8280xp: Add SLPI
Message-ID: <tv27xnenkg7uc7webgr6yqhua7xntqvjv5fnatmngfm2sjlhqx@rdoxt3ng5wdn>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <20250517-topic-8280_slpi-v2-3-1f96f86ac3ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-8280_slpi-v2-3-1f96f86ac3ae@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829bd55 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GJIz9k70rp-aHLqeSlwA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 2LWo8s3Y_cok7OQ0FXFVhcnzpo4f8eIP
X-Proofpoint-GUID: 2LWo8s3Y_cok7OQ0FXFVhcnzpo4f8eIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX9eVPQf5+xOrN
 +Y+y7Uc4xQdL129g+o0h4PtIQ1SzGX75n+pymPn7o/RCifbYHOksgg5I1i2LoViJqN5nGH6Qrko
 XYHg619PYLFPyjCoZMJfpWvrI5uQ6LvLsgeLr+x7VYIHPQLHkU1ZJQbx9qexPkdhkYMgX5XtUkE
 Qv3uw+OJj7WtDlQTcvUoXqq863rfZOZGpsU/vW80UO26OmdonobcSBuKcZ602gbFUm8RieSCYeA
 hMzXBClnMfQrJcm7/ZE/8YAvNrZrm46P0tsHYNwJfHKzGNoOFS2oSyiL7FLN89Otv9l5NPDW/a0
 9mXge2mUulgT9yqxwvjUtMBN5FE17+MUZTz96IGqW+28AABUXyevytZZRRyWlCHW+eYQ0LYL7vq
 6AhN6cd+tCk5HRKuRkayvCYaeC0bad7T/EtnfYQzvxH2h17w3JUcqnNvQ5nT6rVKp1JPihzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=788 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104

On Sat, May 17, 2025 at 07:27:52PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 99 ++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
