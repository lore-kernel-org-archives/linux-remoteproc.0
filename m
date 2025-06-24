Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D7513AA20
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 00:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750726755; cv=none; b=frEfGEi3L5Z93vwRntBwH27rXHPSo+LKYHOiOx1YIYj4a8lRwFyWOLd69WlybgiogQiWr8FQNZHgo6xDEwATjoamo5VKa62uHcI0cSVz4og9QLA1YJqRikqBK7taVA1eQfbnHcyyprHrW4cU3OQp6VKxupMfjAmwOrczEm4rMl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750726755; c=relaxed/simple;
	bh=JYUAOGvUK29IFunmxLuYweJTMsA9TRZOorHO6S+oXwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhiZS7ZckIGtYvQ9/eL3EwKG8QNgy9RbFJUqT8A4hLNkiKiE0tDPneSRF/k+diVHrrgdY++IzoyvlEAjoZ4b8TPpJCFflbBQLTRkat3whJrX0OSPSGu6mXrlsx5ddD8R4/VOJvphj98V3E3hgQjTPu1RrqcJbcRer5tokvgz/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhf4kfKW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhf4kfKW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NIXFVd015731
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 00:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AxLK5B4OfagnPv6t+o+jFPMN
	vAJ4a85Lwkz3DtkuD+A=; b=dhf4kfKW/Gs1mSBfdkIuPSPVaA5M2LoXT3ucxJ6K
	AZqIoHkY/sP//lo8+nPvscCs9GGqG9oGuAuB0TJLht/N0cn3/JQRsse19LhRUUDm
	Nk+0o4AUcLGANWfwmgSx6I6BYjJeoS5Y3YhzsnsuHlszNCq3s7UFdKgGQtAXsTv8
	80w69rTyQ1/FCY8WD2yqbOnr1xJ2kFZT2e9YTDHSvYQPhBFZ18BqbBQHF0y7EWlb
	sfzBYVV/3XyVvrVivm/ObEPq0kOagzwSEODqN42ugvacA6d5Pi7bv4mI5Wbijk4J
	dP7m1OvOMDAtz8S1tasTTiQ/LdCbVLOwwLFRdgzi2Lhc2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5kfg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Jun 2025 00:59:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7cf6c53390eso386631485a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Jun 2025 17:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750726752; x=1751331552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxLK5B4OfagnPv6t+o+jFPMNvAJ4a85Lwkz3DtkuD+A=;
        b=ZsvqR4mW4fLah1NXtkrom+p0P3x+Tz5DYw0wPLcemPFHV8yTrHvdMSMbrdahgmpYSk
         D9hgi4I5/Qa9k5RSDIoOpobhRmqdJ/zQhbpFmhk/fPDLlQgQYq0aDojwUEUwfyDc7wNL
         nU5kCXxBhm0Geit5KUwMHK8dKOvgIJ2qCgVKy1gF2QZRr7lZwLFSIwM00KbWQhVNJxlM
         GJ4JVzv9ZVQ4WqEFxLjRb40nRX+dBL3FKkgf6qUjIsWq+kX7mu7ZF6evxzJpmTBORaWv
         lMdS5YJZLl3Pd+clyXViaqjY/hs584xvzP16l/PluCgSSJhvtdBtA2dppVVwjR2fRenN
         qJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUusWJyRnfgVsA+ltCoeBB3S+VaW0YhRD6IXH8GCP7VZCe2XkjDHsdZEFPhoYA2VWDSHlSlQsAUkLS5zOw7Fni9@vger.kernel.org
X-Gm-Message-State: AOJu0YwycmQpXJ+9IeFVbNVzr6nMLIuFAevuLAWxNEheXgUEzfjX5jBs
	n2UrgL9mOklL3YvEzlURuI07J+pH26UCV2caTl1BX3qEHgnVMXV7KEU6ojiZipn6nZKfUx0kfv2
	7UgrL6J1Q2iGMLRqdqO51TbuyRg4x4cL1gUq8YplLPHs7IU9nRA+EDuclNEB9TD+3lyV+zHJX
X-Gm-Gg: ASbGncsDA6T+hVf5UsUCWXJDnfU2ThVHL15v9Pvx5EkMDxcBRmwwFfDP089KuJLZMz2
	89U1pY4TukcY0Mt2pF7VA7RKmX+b9GXDqu46YtDwoHDXAKzdz0qIQx4hi3W51YZyjA5OKMMWfNu
	apxC29oM9dFVxxvws62fqZxoCvk1Dz+0XQZk0m9+ef4NXi5ZMuepj/BHQvaVa+xfuSCT0hr6FX8
	mSOorprHG5RzKs6OxFB9E+ANZ8ImiLTobnUYLWR5jvByf4/QvzFKWGnQYZRlmstoAMljUfJlJFl
	MLWHRcuva6+HmDfCdz6/GVxLvyXh0IC4cd0WHZ5WXOqhQtgpbe+lw+Lkk4UcD4s9Ih/kpaC4YtT
	vGsASqBrdFwNOI45A7NVXOI2UTcCqnGHu3yA=
X-Received: by 2002:a05:620a:a90b:b0:7d4:f7:3baa with SMTP id af79cd13be357-7d400f74702mr1750091485a.8.1750726751793;
        Mon, 23 Jun 2025 17:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbrdGvPGdMsxD7cM7pxk9ZTzDk39wxGR/2YWHHePKYKtmHmosEildSYIv+nX67voLtWmHHaA==
X-Received: by 2002:a05:620a:a90b:b0:7d4:f7:3baa with SMTP id af79cd13be357-7d400f74702mr1750088885a.8.1750726751378;
        Mon, 23 Jun 2025 17:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41d71cfsm1622121e87.243.2025.06.23.17.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 17:59:10 -0700 (PDT)
Date: Tue, 24 Jun 2025 03:59:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Start using rpmpd for power domains on MSM8974
Message-ID: <amfgwjgstu4hoxz4lo7fqrqz5fqtf3r7o6wqvrrjkcfubwrjyz@5i75peprq3wn>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
X-Proofpoint-GUID: Xc5gPGxy6d5qfysbGLwoEB2xCqjmbcbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAwNiBTYWx0ZWRfX1eC/A7+mpmOU
 zIxHIz/IhPeIVkyulU62ixZYpxz5pMVhDjF3ISaCkN/z4YzrU7dqSF/0SheGeRg2a0QMSq9bicl
 rIg47/ecIRHof3kxyr8dId3SeOy9aSuTkW2kc5zOyYwNi0zqL9+3SiHOgpkMcAV0c7wvMM0yGDI
 2mdqIzXeoQu3fBSMdleXYaSXGBPlDe+XTqFof9ziSWpi6v8+mQPKaT3HNZDWNqwAdY2j8oiW1sz
 GJ4oo9U4IcMPkp7hNXMNyHJWuji6/iD9N9y6nJtXVwYDKyzMfBXnjsTAHMjgaKyhWzfJrwVHgg/
 R+s/9YKLXwbSAyqvjrnPWrrjwK50B4kXIQYL159Oz0AwxUItzhC12DgJvAOcvCnuDjn5hu8gZZ8
 iC3n5MaJAtcawUOPkB+0rgoN9+deftEKpBiMPy05dqfnE4r8Y1+7J6CJu7Gf8ei2WGYAeYc/
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=6859f861 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=GRKTxiLP57tiYEfkEIsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: Xc5gPGxy6d5qfysbGLwoEB2xCqjmbcbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=894 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240006

On Sat, Jun 21, 2025 at 03:19:55PM +0200, Luca Weiss wrote:
> Switch over the ADSP PIL to use power-domains instead of a regulator,
> and have one commit switching over the MSM8974 SoC plus all the devices
> to use power-domains.
> 
> Note, that I'm aware that these changes are not backwards compatible and
> not really bisectable, but since it only affects the ADSP on these

Why? The cx-supply is handled unconditionally. A single-domain usecase
is also handled via a special code path. I think this might be
backwards-compatible, by the pure luck.

> pretty old boards, I say it's fine to have this. Get all the patches
> into the same release (6.17?) and then we're good again.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Luca Weiss (4):
>       dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain
>       remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8974
>       ARM: dts: qcom: msm8974: Sort header includes alphabetically
>       ARM: dts: qcom: msm8974: Start using rpmpd for power domains
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 18 ++------
>  .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
>  .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 12 ------
>  .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 ++++++++++++++++++++--
>  .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
>  .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
>  .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
>  ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
>  drivers/remoteproc/qcom_q6v5_pas.c                 |  2 +-
>  12 files changed, 56 insertions(+), 114 deletions(-)
> ---
> base-commit: 7fa2fb97cd28e1d9670da538095565b6fba83977
> change-id: 20250621-msm8974-rpmpd-switch-b19b166c02be
> 
> Best regards,
> -- 
> Luca Weiss <luca@lucaweiss.eu>
> 

-- 
With best wishes
Dmitry
