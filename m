Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3370228C5AA
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520956; cv=none; b=IfbzHQKjEltBKzIH1KEd7Sy8cPZrLqHrXYbJiG0YXIRVictPSjtpBrV+xrdIIgQqpuNFNMzC4Wwzp+AnN27VejY9rNWkupcLQ7gWi7ETBw3CVpZtBnh2UEyGwj+GuQHW9comrVq9GH6jKP+Rga18i+YNT4gbsFQgxc+1u6u+r00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520956; c=relaxed/simple;
	bh=HKaXAFN280w772dBVbyjDj9/rLyHfV369fLHNnVHey0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcvXS74WWpsWFdQQi0XisyTMLQzJ/vl0FrZlN2Sl8RyIRka9zVOW+PKJjvvYhwgyer+TOPjIlL1cCyKczmlB9DIiLz+x9hbdnx3W94+SrWPz0GSFKCfhwRITSCEY/tkRVIkiqwL+Mn7pObHXDpvs3cmr4hIqO8xVgyyirzh9qgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0uHMmgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxVt/O/f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0uHMmgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxVt/O/f"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJCptO1056170
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B26Q6QBnxEEdyF1X89NLCgmm
	ZgY6Dji0pKhEee0lVvg=; b=T0uHMmgcDN5pm3nMpD3kiJUBg2QuNEP/j5RvkeKU
	qg7sB2j3ja8czEpmTgY8iI6ZWlgw3oNyEnDxal3YVWP12llGSNfYDbUdKQ8hwX1f
	h/N1w7AziRNVag2NDGUx7dCavVS1Q1ozOPIzB3V2wOlz4Hkq7xWyXuWz+fjw8eCr
	b5wRHspqxhVcMlL478GYkz/tUt05VNd+C/tyWZshIvAXFXiwu9x3j63hsGo7MJwP
	AvIz2y41wrCC9A+VlhkexkBR4YR/Tom+sdPrqK7hXgEMjsoUQ8B1LllUpfOjHpR3
	YQS7zvwYBV9MsaeV71zt18aQW7FGBIk53r3U/AwBnkxNXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v076d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:15:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2ea3d12fcso210787985a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 12:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766520953; x=1767125753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B26Q6QBnxEEdyF1X89NLCgmmZgY6Dji0pKhEee0lVvg=;
        b=bxVt/O/fFkr8Z8ShGxHsux4hsPNbnkE8i2n6X7VUIsK8053zzU6LiA/UMP2+Aoei+B
         bBS0QdnmwY1jnuVScLugAn25kyX+p75HkjaKAAZ6Fkq9kuZJRW5dKPFNC7x0eeENYfri
         Rgu6DCzB1++Oa0pzoxvRMryhn7PmOaybf6o7hmuBr2PyyZlcmSVHloJplUEVe1l466z/
         /g/dm1yi2bWw3CsZPGsCh1rTo1ii4tSefC/X9X1dpP6UmndHJnjKLOa7NdzTSuk0QlyH
         2jCiKIUHAipxbqIdTIrb5zzSY+ZlaxZ72BsgmS9jXcccbTGR118Dri2VN31AbI7E708F
         lwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766520953; x=1767125753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B26Q6QBnxEEdyF1X89NLCgmmZgY6Dji0pKhEee0lVvg=;
        b=kNZM0XygemsUHXJb4n6Hg/N5907tbHqxoqlxcYfnQu7XO/9GTh3Jq4yOi6yR9tICzk
         eOtR5K8+huoDRcEQqfGNMU9R04bgQxtcBgbUvke/+KZQJFsAwifaSu3AFMSDeetlj+5l
         RXX3z4N9+a4NkFVB6lWfI91BmAIBLeyMI3gOqtRTlfnAix7X8fgVk9yU70K0dZm6i1wq
         jQhiCz+P989YZYK24+IXhpd9zJUQjRCK35wCsNY5TaWMul6Z4tppt5t9X8tFJbzgHOmI
         DMQtn9nA+KLWDBmJUQWuGrXehKaqds+ULh+lAKlAtj+YAGw7EsgHQwz3jnu9wIODnAdH
         /AUw==
X-Forwarded-Encrypted: i=1; AJvYcCVn/MOC3TOI7lV5KX4dEtS9MhASsuRd6DidmTsnEGluk2ZoioSDJ2v+d4M2OVBDAZ28pDTlVE08ZcXi9aBN2HZR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+vRDwwLFXZsTO6eVxlSykNZnmWHw0ibo0lLPblCXW5dEfvsZT
	VRl3dHjobIb2MozePB/IW/Ppembhker1LcOa6tmo9yPasgJscTleVsaaEFcNvmKKEoivsxpZy4O
	8uUpJLEstBj0WqX9GMreytEHaas0OOuAnMvUAAaz0w/AMCYpW2Ztnpa23DXDcHIPYnhY6JYqh
X-Gm-Gg: AY/fxX4WKexq03rKwoPkJAn8d3RUkVuHdKjYAanl5iMElHfJLXketa/98CEKOjdaKRY
	a8YxPY02+9Y9XsVH9z+yTzxzyxK7sfOjBdHQ2SvZx1PKfhvJxfkQxQhDyT+KhbWZmAwCFYLqA0G
	3CYOrioy6eCT9hRB+Ko/3yyD5nQ6HdshKGdaaRlIcl5LaFGkGkNxE4z6R4MiFLHiA2iVlakTx/Y
	CkdsIu9v1+YQ1zL5XZGLyAnXbnoHL67ZzFrXZghFUI27Zes4iN7hWaMC352jtv52ZlaiSyB3wwy
	bshcQasT4+27Ev0m4B5Y6yWNDrI2n9q4qumxmVaXrXMcRkw7B1iNxv1/RLfveqS4FGJOgkSMwcO
	H/7fndEOyNvkNN3+yWiWoY3VVQjGVHR0yDelgMBmLpzsQSoYivJYjdyR7YIyyPc82FRPGc0IlhT
	gr1bIxF8Hym8Esd0NVYvyAAzs=
X-Received: by 2002:a05:622a:610:b0:4ee:225d:ebc9 with SMTP id d75a77b69052e-4f4abcd29bbmr252266221cf.12.1766520953408;
        Tue, 23 Dec 2025 12:15:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFESlK8cUqg2pI93rCBRIT7LmshsGgU8RgzlyuuevZA6TzkJN6XZ4woOf0VjLdPqu2JiIaYmg==
X-Received: by 2002:a05:622a:610:b0:4ee:225d:ebc9 with SMTP id d75a77b69052e-4f4abcd29bbmr252265601cf.12.1766520952829;
        Tue, 23 Dec 2025 12:15:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d85sm4243398e87.48.2025.12.23.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:15:52 -0800 (PST)
Date: Tue, 23 Dec 2025 22:15:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Message-ID: <voeleeu4tb7pnef4tag2e32n6vgwecglo2xobfn2qogkpv4tf2@ycn7ucnsqu23>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-5-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-knp-remoteproc-v3-5-5b09885c55a5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2OSBTYWx0ZWRfX2X31DsEEd8kD
 682QAdNDpxcq0GB2H/fLvnYlyv3vSot1Y64V+cQnf/BDel/d5YsWluq3dU7lbIGEMD8tNUt9nMm
 fefnJRKmKXjTOzMz0Xf60LKh6F1xBjFiXmuax3KOCS2bYfFZ+SDhSrW2l5Dwn4GsZlrzuu3i3iC
 1E4VC3rH5l+ICV2d2D6lrUONBGv1dOXoD+dc9+YnB3wGSEpGgPth5HdbjjgVHGbSOq2o5rXTA5U
 +Fu+OxDQRkZEdHferif5xsPMSesEEi+kz0c72wZL9NjXd+PMB1KhiNsnU+YeMuXyYzbFvX9xDPH
 1m8RTvHN9WiEG8CV19+x9EFosgImRILivoEyum/ZC4y4JDXaGd0HVeeUAmo380TmDMNj430z37d
 nDly+mYEiK03wz89wkS0PiW3oGLQ1o48cSjKL+bTqEiJ5W5YA4OFXE9qFyU88NnLk0Ztentt3Nr
 hu0OlmkG8sV+lcXDnuQ==
X-Proofpoint-ORIG-GUID: OF4pxMHNafC-rCUJOWDBz9GMx7WmMbkB
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694af87a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6tj9FcT98Ui8goLqYs8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: OF4pxMHNafC-rCUJOWDBz9GMx7WmMbkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230169

On Tue, Dec 23, 2025 at 01:13:51AM -0800, Jingyi Wang wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
> platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
