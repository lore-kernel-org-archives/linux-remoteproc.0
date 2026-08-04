Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EBE3ADB98
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Aug 2026 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849474; cv=none; b=PU/rV+IzeQGlaxjImQoTdKgeC3FN5EDiZNYREPFDh7sy+0IdMg5pMxSpZsHFCopOVtuFaBhswSVkyYpYr26iELSxSHJULDkBXGk44lmSoclO/DO2kwFQecViq7fVvVXg8Lsm+Mw/AKuMlXrjVy8cPIISH5jAvRIX5EsKFsU5+rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849474; c=relaxed/simple;
	bh=KBV9u+MGor1moByGYI8TlLt2+9VPUKZjUGrYZGTMITM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxwSgdF15G3mBbhcKwRHYVTatJlpRKPnwp7GypBH7MCajernjCgSY8avN4vLFfSOhR2b6KSO+eCWaiSM/o8QRdZ53156ocpLg5BqUHtmCucxakqR9yXVtBc5sAWDWoGGO+vojVJ3BA4DLIXStIuJWgLKRLXIvSjI2QvYLRXeg9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWTO8AFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSxqlrqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWTO8AFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSxqlrqm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXKTp3829915
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Aug 2026 13:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c/2ac4ry0KYC461Ok3qN+IZ0
	FpV59bLAbnd6M1JN98U=; b=lWTO8AFatUxVohDWGvlipTHPI0V92nLvZNdUkGqa
	OAUqMLOOITfSlvzaEplotk0U75rMj1ng4YFHdyV8XN4OdMgY5ud44FdzfCh5NNek
	O8Y44W5nYGVqe0v7xnjZLLoliAodguYtfvIOjeSQfy0Y5v60eDm66ocRt7zPtk4y
	ve05vAnuAiNZchKhmqyUYcGguiZvW3F+28utsWoJcvvsApb+5yErqcDfh7pdOqnk
	4Y6LjGKGSBepHELtN2awe4zjAOBhqfXYKGsgCujCFNwFcMBGEudgrbmXa6bPqnrM
	XhYGiwCSeP7fWT1dz7OOBrsonSjB0QGdNNVBT0joAJKPTQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5scbx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 13:17:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eac2620cb0so47826776d6.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785849471; x=1786454271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c/2ac4ry0KYC461Ok3qN+IZ0FpV59bLAbnd6M1JN98U=;
        b=SSxqlrqmZ4LuNUyDm6fU5IUpjbLoKUwpHsmG6C1YB7VxS6fxGquHPxNNAsGuDtvgBg
         pw0/SBEZKfBWm7LzyUzaV3YBIJI+AshtqiO2b0osPe7P68CDhTEk7cEPgKdz2pBoJ+Fz
         kF8iZKk/Gcxrp3jlaOLbkAnvMsVQ5z+0cbedjmkqJlRE5GG1nQc8A74RaG8gVZCyRBIa
         yoGKEU8/P5DUGf65B2HCpUjiOVIAk5HmoQdjOiyGAoDbCDzFhT+E26B3o9DGvLBydZBC
         kaqw54tIhtsYwGUAOSFJmtjF4veARNmYzr0Hg+GYWfZzdLWGjjWtRHvCJSrZ3LLjMWXS
         eQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785849471; x=1786454271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/2ac4ry0KYC461Ok3qN+IZ0FpV59bLAbnd6M1JN98U=;
        b=jwEyrMyQAZNbl25ftb/XP+En6cJgcmxzzDlU4tdgXLRoDjcifay/z/v90Rth8evYnu
         pigs/NvATdQTHM9nW5rZ2EsNQTlC/Cx8/rETNKnugBkIco1x34LuP05KfqBD+aNN2P1I
         qi6kGHJl2CyqOJUePpbLEegpy32eY3KybZscH85naNQe9aiqKqgkhqOM1uZsJWcIhjx6
         AbnF+ZerIykyPTmlmaG6a0gJqUREVxXl5zRfKnb7JH9GiWFlyDADKsvxghwHQb47JZIw
         LY5w/CsxlEu+IG+UlIqZm4CB8g8NAZAsDItiehFsfpybfBC6z7naZTUN0nhGqrRkjgxW
         8yCA==
X-Forwarded-Encrypted: i=1; AHgh+Rov3UMAcPrez9fGj5juiN3329J6grMAf8yKGVud05TBQtqqYaO/V2G5W2ZXpe9aCs6F4WXa5kSGCx7vec1V8bSL@vger.kernel.org
X-Gm-Message-State: AOJu0YyjTuoHfLF2vKN3u+c7Bo+cWYsgiRFrVWl0AxlzkfyijDkrkYoM
	ykBsBV6r89O8hA8A/DIzXFaXA0YYySNw40+6b+gMbzC1OQMfGpJExXHwRzb5FJiB7sAGQvv4dlq
	cnx83br/qWniNHz5ZHefskwaq5hZFYZNYBKh27zW2Txht8xyiV4fTqDM+kauaYAEDTvGHDrLx
X-Gm-Gg: AR+sD13KIorVAbdYBTEMoO4YhQTJ+f+oe3Obrlc7jaIo5zw4z0nu8aZBR8yyIoAIM20
	3vV/1zjyZ/vRYW/0tSakEOP22iWyNj+2+MwQ4sudZ8m5NygpcXwLjQgXWrpn0/hOwcbTge1DZZw
	47+vTtq6pIa6DSqL8Kpx25hhscgs9kWeVN24JF2gcZVI2kZWJlcYnzBDs31dX7cHKp0yO69Ot+h
	vhGhz0XkSMOcvlLZZmpFy8M0z7HF0+kgKMcamvCLGSD8HdQe3mmEHGAMXb7PWnQ+VWwDDGqUpy2
	L3lmBYj/lN0N9QYAe5KEfD8t2s3xvw7GkQuq0MGqI92gJ07PTL7QMfVSpa1TJZl3x8JiNFJfuez
	GSvJrXRjeVAW8dLfMuKeIoJJfUGA=
X-Received: by 2002:a05:6214:2c04:b0:8f2:4100:8613 with SMTP id 6a1803df08f44-90849440e0dmr318824506d6.0.1785849470949;
        Tue, 04 Aug 2026 06:17:50 -0700 (PDT)
X-Received: by 2002:a05:6214:2c04:b0:8f2:4100:8613 with SMTP id 6a1803df08f44-90849440e0dmr318823486d6.0.1785849470321;
        Tue, 04 Aug 2026 06:17:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9088008fe45sm958266d6.30.2026.08.04.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:17:49 -0700 (PDT)
Date: Tue, 4 Aug 2026 18:47:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: Re: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <20260804131740.t6zsjm5gu4otudrs@hu-mojha-hyd.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
 <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a71e67f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gCNdU_kgUrXlvZ66xqcA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: yqZXvK2ELMcH_paBEsdRwvW8LOA2ebqX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwNyBTYWx0ZWRfXz2PmTB+MaGGz
 f8/dngXLZrK+LnODvRt1fRjOJM6AcHIjP3q1v3Ldck5BLDY5X9jGtyJJVFC4fsKI7b15fVBfYkL
 j4if7eWATzdbozRHnyovYvuI5ECw3udroYRxiRhmYv5p7iwll2LgmhMxMRDlb2okf/ioJuVQgnV
 SoEF12Yaf3STASnzf9CuHNEdsqK/TXXoqLSsVYdi/lK3VZIHgHFCHt7H4dgiyPh1cNmzC1BH2bZ
 Vuk53X2g/+yt2qjAuvpdXSmWXmXrqj4EmVJSbBdxYj/o/AaPH4Sv4q8TvVY7HyhkcC50i+x32kE
 00Ki9rSA8cWgwKCuFDqmeauOmL1u2hox/Wg/Qm9Id2N3MuyBy1hbVQ2l7BrpXftqKcW7fb80xob
 QA4yDbLG2uyeT+gRrAYUmzXAz8FUQXOJvwQR6cDfA5GzoB1GDMVQmrSEhmGIGqyl1GleNdGI1q5
 L9kVORCAB9pEmb4sqxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwNyBTYWx0ZWRfX/ZBHHJn8y9cV
 3/oBXrs5/v00vFjXrONV4wlKafQKixQsE0n7tkt9JjuTshXGCLBjiw1NiupzNiohh13DzrPeS4z
 i70pHiRF/Xsos7gfr8Vf6ZUC7HRv8iE=
X-Proofpoint-GUID: yqZXvK2ELMcH_paBEsdRwvW8LOA2ebqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040107

On Tue, Aug 04, 2026 at 04:53:48PM +0530, Varadarajan Narayanan wrote:
> Mukesh,
> 
> [ . . . ]
> 
> > >  	if (IS_ERR(gunyah_wdt_dev)) {
> > > -		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
> > > +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",
> >
> > stray change..
> 
> Based on AI feedhack changed %ld to %pe to print PTR_ERR.

Should be separate change.

-Mukesh
