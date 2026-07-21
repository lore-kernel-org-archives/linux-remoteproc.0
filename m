Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8D344470C
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675588; cv=none; b=n8RV2SZ0FQsE9ZkLcfbKz2cd35deqsTOgknt6UXiSZl6qpqzXUYeaRI47uZ0pzkyRFLEMKhqssgRhqNgQhuzhqFzW9AkO1Uyx0e/6211rKzLsEHR+b6E9G7eIsy1iCZFykuBUNPjvrjOFDnbS3K9YSnN0TG+IAtqoxnX7nLJmHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675588; c=relaxed/simple;
	bh=KT1c1OAV9hEPRs7FDQcUUYsNQA8f+0N/BkDtmtYHSi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNHTgcDroKCf/7S4Q0tRrLy+MINGYORgA47n/WA5pB8BZGiAjLm4QkhKOCK+ms9r+I9k5xUMb6YEL4MLjwyPRUVLUzejaYTjPMti2UKpRS9oTpDViXi7czb0iluAFKU9MW9IDWhrOujGQj/Uzhdv9ts7/AWlo7XGSL2BK5xt7Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6MO45X9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoWygCq+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6MO45X9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoWygCq+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZAC93061856
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3bwtoUeYIX4CQ5hBjVs0pHHQlacY1zcuJn2ZoJQM/Vs=; b=B6MO45X9aDbulSWW
	7/q+ylGeihUTzwBF8CN2C4+63wxaPWBizhjoE5sSH48ezWpil4Camqt+WO9dGXJe
	5uU/urb9sEMPKOh9T4Cz9xMLegVKTb3Vv8FuxdOvZJDzSbLE2mtPQ9T9mfbdK5q6
	W9W8QQTaMqx+sjPTJ+9XbYcHkmhhXVuicC5tjo0TUTvUh7JRm88T79U7lg318+2i
	Hzw/7rruMrTvR+3a5FpcLLpf9yNx7/Lr8sp+hV2M/9CuNTZTLEyACItzCXncWSw7
	m6uTkikgitoMxlDc+tgvdCceUkuntVz9TX9aOF4D4QaPzg0a367qUGFwoclEeKuM
	XMq05Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a97gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:13:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso15298701cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 16:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675583; x=1785280383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bwtoUeYIX4CQ5hBjVs0pHHQlacY1zcuJn2ZoJQM/Vs=;
        b=BoWygCq+qu2doOODZaRFCC4kF9dGYp/xRGArkGKUtXtqESHsO4wAkCz+JLl8hG8GoS
         6grxViJNSGFrg2vcRBaiNqPS5OaAO/5op42QFQh9VyIgvwp/yl5JTAFyNBT150C7vPuZ
         H01xuaVMufdM/m49zKsiQeek1HWIKXpNW+/d0OR3AfpjDju8VQMMVEYKV3ERgsEaOQ5I
         xxFhM33Fuf5m3qfWE9p+FC8EIhP9IypKOUph4KKIyF+MS8ZHjEdR8RI3Ki/bWlPAuW1s
         TEbEMihW4yH4qhSfy9nYzjju8w5YGv001d0UZReJTe9HralNVESPkEFw1XM4AhG19XNZ
         cv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675583; x=1785280383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3bwtoUeYIX4CQ5hBjVs0pHHQlacY1zcuJn2ZoJQM/Vs=;
        b=NQCOo0kjWQhKRUFgyk5q83RJzPniPJRVj6WvWQZkMUeR+mNj9gyLQzUz9rGBEtFJBw
         QFpWS8DWk9Y4sK8R52Ofoj8uVqkciEZ69Q3muOOTKh7vJ2/W8wWKmg3bmdA3VLHzm2s4
         CXz51ssU+Cqqj0IaKir+uwgSfQgEengXG2+80QLHMKkpi/eOT+BSUzJ3C2Qs8bDqD+p5
         39iIrGCW+0AKpPg7VNyVTMWJrFhOy8We1SF7mnpCHVF4gIq495mj89Q14eCos7AeJIL8
         LRKQ88YshhuyG8m9BYmI/ddejBF9zFGZa98+QjH41RucrPHkgDjFsJj0tknhM0g8YaTa
         5/hA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7IZXPxxp6xL+edvBd20hIYEYJkvoX+vRaUeWseWIquX7JQKZl+dAjerXBnBWK9+43RHlkUuLNq+ye1ILHhCeU@vger.kernel.org
X-Gm-Message-State: AOJu0YxeW+9DDqbRSqehH5jn20NOYliqjpnkeffnc9Ky/XYjaEbgIQ0N
	Mhkx57LF5JIaHlP/Y/0IJect46UJBvCD3bYNANWVMV5QowqCC5iXxxUxjwaR6XNvFhU/X8vFyPz
	UhprJRF3hbpTgrPIiEBzJqdeCLLD+N/zvEq3WKe8KtgPNXZXxJ1cDn5Ta3p7ymvnHddWaet31
X-Gm-Gg: AfdE7clkYTyurP5wZPccWf4M2k1uMXriutFwtUTOqfSNwwFI4odDB81fPtwGp39lbz9
	mWzI8kfcfbZLn9MrA92uuVr95ScfJU3CVx32sl84JFDFqtT9B9gy1RMuzzVCW9F6gWFhNrUwpNO
	X5K9qYE0D5uvwIE3IaTR2pIhV8Rg8aERDW6tYx/C8LlZ2HPFbroNe7stFKF9uVcBO6vzqnGK9uv
	ZxtsYZhbYw8cs/2RQo0H6bBpkpfhFoLOUt4v/HhlSe3y4jzGL5woEjGn4N7A8ChoMTKKXleKicz
	KOFaOt58XORoE4dZscDG1DvUMrpOs4Vtqb8lTOyPvoMsWrT7hww9zSBu+C7vyLnsGyUpqr8JG4s
	nm4DDZ4gsE88pNgst7ey6xNfMhcjLv7ELtCkPR+6YJGS84KDjx8LA8SlJD4To/8VZPTLvipn6Ty
	6J0/Y9pMMY50VKBw==
X-Received: by 2002:a05:622a:4d90:b0:519:e91a:f4bb with SMTP id d75a77b69052e-5213c9dfbf3mr195128771cf.31.1784675582855;
        Tue, 21 Jul 2026 16:13:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4d90:b0:519:e91a:f4bb with SMTP id d75a77b69052e-5213c9dfbf3mr195128411cf.31.1784675582389;
        Tue, 21 Jul 2026 16:13:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8bfa3sm157071e87.12.2026.07.21.16.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:13:00 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:12:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v5 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
Message-ID: <bp3rrxycikefsoxeve7gzrattjpbzlzxfiw7vacr26e4kf2z2s@gto4byj5sxcs>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-8-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-8-99620e07f505@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfXxCApDho0rbYu
 qOrGobIc4J/+3NnboDooLHFHB+SKNiJZCM8SctP4t7loyJcLZvagpTRpLvZqTDkLaNykKZ2MF8U
 q/H8pN8HvUJ+/t7FAVl8cbjBmX3ybtZ6uIZKw7dhmNnztbmn7bmL2zgbj4jd0nOJx4cd0YsevPk
 j5NJ94ATw7nZHbhZNaNuWuYIe9OKM63Mvx+eZogv3U22VeIum/FniQUm5dPwKOKRIazOEYhuIFl
 KEfW2c9NKG5vlBFpDHD81h2cRthuddu8yxXT5BFDTN3tJjAD9ok5V3Wu0h9ht05JirSmTEYWLTe
 KxHxwlDAyTQpB3OO0cvYhltT0jp4OzdB0H40+IWYPQg8nBdoXD16ATWuEd3Wv5yvnmOxCTN0xD0
 Ed9fyuVhM1wCgssIGlrSj2hokxI6bysovIy7hFBmqaUS35qsxkiYhFAMwVX7y5cuZAx1ZWegpAf
 vcSp8f6dXho28ilpA1Q==
X-Proofpoint-GUID: _BrVvdfk5xvY8M6bbtymgVA3ARJH2PWS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX/ottWB05+vmq
 day5rHgOSvVQ32dAtXOfCg5QFSYb2nE+7oC/3KnpxmcIaBOheJ9oIT7SFtJqogky1vYSLci4FTy
 eMhZ8ZQxKD0EdoHdv9ZZpbzWAHUP3RM=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5ffcff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _BrVvdfk5xvY8M6bbtymgVA3ARJH2PWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:05AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in monaco.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 115°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 99 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
