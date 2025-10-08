Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAFF2F3C11
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908745; cv=none; b=u9/8zdoVP5ff8kH1G2MIReW8uRpzogO+8FoodtOv/QRlY7jhiv/3I5ZypWgbc3QVTQKATy9TNQsfoa1KJffWrZqMoLZiwyT/S6psXRg0cet4+EKu1OaScqJkHe5pMHMzcHizDmLaMIlBNVXlq9FLO9RIQXe+FGC2st2hrZdGO+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908745; c=relaxed/simple;
	bh=jh6UkzNl+DTGeEljlKIF+q1+nI6R4/qrb27HHLhQs5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpyVmWClfGYfqXuPdZeHhxJjup2uJDrr5bWRgYh5yo9HQychaP5SItNcQ8svBX8LA7yVIKv8X8bBES0J4b1cU9cj2uaTplHGh5y9EmBh5lNLXqAp9Ho+l1e1GXNLaSxundcX/HwcTtswrPoTU5euOr2nCV+h1SbWVRpZ8miDIC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oT/VQP0T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oT/VQP0T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598040po026588
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 07:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1fzCvC/mud0h6/8oCdHHnGn9nJk3gPg86nsBkzf1MU=; b=oT/VQP0TxHLlenzZ
	sxjW96377A7DqNd7g94GUx7psR/7d4zqeSikYWua+iiO0FKEktbzd0zqsvT+Dyno
	XD8JyyHH5B1h1EN8PLvOrDayuZMhZIqZL4wvmBxCuQfxMggFL5kk+gkz7zoF/RlI
	u+xuMwR2sX9ZG5TMgKxRNvTY4yfeZ7D5TJ3kuSr9c0Iz0r4CKYmt/20yGVqBrMHx
	rjDseX2xMGsVP3DnugXiqQQ2ANr9INPrJ+nswWL6m2yteriDlgh/rUEnJr3kb32x
	WzgPaFqXwfErGkzyt4iTq//UR0gthgxUB0jwFp2NqkkxGdwHPLLawdhIOD73RQdB
	6hYj7A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1sm5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 07:32:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269af520712so80669915ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 00:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908742; x=1760513542;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1fzCvC/mud0h6/8oCdHHnGn9nJk3gPg86nsBkzf1MU=;
        b=hFLrjjpGt/oq84mqob57zg6bdK1/xNzvw/lPEJ2Tj+UdL5uNjf9OgkWpnU3e22+k+S
         ner+idgC7Ij35wM5/SDDCQfEFq5a0hdU2+nIa327cS9qqWI1kT+c0IJijXCFCokeMKlJ
         H/eXnQuMo6VEbZhs1ZFejrGUdiDEwALB+ooG3s8OmET42Res8qCUUFL1urxSimeeq4OH
         gQfDg/drmevp/K37LQYjqrweSgl0ZVh7NPsCQ4QhqwUggy/nENntU7HeOEK19omdpGie
         6j0QV30XED5NEDq9yLUXqherHYs0PO0oBlPum1YkLUHfSfIcsRQtOUmapfBeFY2AkEHU
         uTlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+6JyRTp9kKqk6EZ2QoGmY2W+za+WafUnyVSj5NdyGyuK4jVYCLCpEFns2DFcfrH+FUnwTm9MfaU4o0F96im4I@vger.kernel.org
X-Gm-Message-State: AOJu0YwDSehFVaR7aCY9OSzlJpEHivtQP9WnEkh8zmrDdGCq7AHkFgmx
	i63d20hkfHSG7lec9PBS5Am3uqS+t/Ce06qNU6APlt4MDhkYcCAHvmc+usLtlGFs3O2w9oCdmKF
	vQuW7h9s/T2uYailnnsn9cBy9QuSCzINlYpgYeKPay6T15AtVgHTVUAEF7TXbqCVexUMPgcQH
X-Gm-Gg: ASbGnctSpPKjvyUn/P2A/Twhvc+ngMaEHPvSfpBau06iLI6h74ECh/WYpo7aUGJ45cq
	bo0ns5DFUGrYVnpe9YJPaevYS+HpW5vdo6B/e57YDeuWKro0BGSc6enIwgtet4kBuaWkiCKcSCM
	aeRmozDCOvPZsUHx8ilrADjNExBd9LUJ9KtEoWVfC/f361X/Qvx5BHSDB2zFtod4/XHd/yi22n/
	8SAFubn6R1+3FiZiir+7g4MoRppTZKbNGYhSG+uZZ+AHCLprCgCV1areL8okGMaqIuMSRlm63hz
	hrVIjj5zHtiHv+Rw0brx8fBVW7Y4/2V+lvIQsqt3fXuN5xbxQg2LbYcTPMLLjOQXBbj8BSOC
X-Received: by 2002:a17:903:acb:b0:24b:270e:56cb with SMTP id d9443c01a7336-2902739b362mr32998225ad.27.1759908741552;
        Wed, 08 Oct 2025 00:32:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF8UQO63P5sJR771oG/+zCEQf8tTNKYiSviO1HlgbxCHP0JCB4Md6bptNeqiLM2cManUuPuQ==
X-Received: by 2002:a17:903:acb:b0:24b:270e:56cb with SMTP id d9443c01a7336-2902739b362mr32997755ad.27.1759908740874;
        Wed, 08 Oct 2025 00:32:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b51395229sm2215138a91.17.2025.10.08.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:32:20 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:02:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
Message-ID: <20251008073214.kcanrljguox2vtzq@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-12-de841623af3c@oss.qualcomm.com>
 <yef5jtmcfuks2w2sngxr4a4htihxx4xidsgwpro6wckbfvmvvn@jfr3dlsdf5vm>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yef5jtmcfuks2w2sngxr4a4htihxx4xidsgwpro6wckbfvmvvn@jfr3dlsdf5vm>
X-Proofpoint-GUID: qSneYe85jT0qWM9hneqlfDRzjSVjWJYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfXzc6bsjzD1tmU
 t61Na015Q0LF7eU+aJJ99qPZ5tIcYOEr2/gyWz2nnrKuXdwzHPb6N3QN4pPUgwUhGTbwvOfodNN
 4x9CPzh4yvXDxMjobztakaOc5xZIEJ5oI+UydTznwxrJsnA25tgl6tl1XmO9jWePlTPLUh967Ts
 sw6a4srKdXbsLJMvPldMyy4Zdt4dCrYgH8U8h3eryVEiYeiBTq7YoC23uA5pL858bhK5cmh9cm2
 H7VnEH9H3GT3tH/86FbGGuUC5aYsLwlyd83YNuUabqI10xHOtRD4uKzPhKkMcLvpBKMII3HeAhh
 I9iVH9p28hJJebHDMPiyXK7Ou+HVnQT/JI9HO4Df2bLyI/jT/O4PkoANYwV7QBXdfO2zxxYqUyw
 wRVc9RwCrYCN9mn1nYniPQyYHZyH8Q==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e61386 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=3fz2ViL2mOl_e04HJqEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qSneYe85jT0qWM9hneqlfDRzjSVjWJYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On Tue, Oct 07, 2025 at 02:55:04PM -0700, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 10:18:57PM +0530, Mukesh Ojha wrote:
> > All the Lemans IOT variants boards are using Gunyah hypervisor which
> > means that, so far, Linux-based OS could only boot in EL1 on those
> > devices.  However, it is possible for us to boot Linux at EL2 on these
> > devices [1].
> > 
> > When running under Gunyah, remote processor firmware IOMMU streams is
> > controlled by the Gunyah however when Linux take ownership of it in EL2,
> > It need to configure it properly to use remote processor.
> > 
> > Add a EL2-specific DT overlay and apply it to Lemans IOT variant
> > devices to create -el2.dtb for each of them alongside "normal" dtb.
> > 
> > [1]
> > https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile        |  7 +++++-
> >  arch/arm64/boot/dts/qcom/lemans-el2.dtso | 41 ++++++++++++++++++++++++++++++++
> >  2 files changed, 47 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 296688f7cb26..e2eb6c4f8e25 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -35,6 +35,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
> >  lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
> >  
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
> > +lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> > @@ -136,7 +138,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> > -dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> > +qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb qcs9100-ride-el2.dtb
> > +qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb qcs9100-ride-r3-el2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> > new file mode 100644
> > index 000000000000..582b0a3a291a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> > @@ -0,0 +1,41 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/*
> > + * Lemans specific modifications required to boot in EL2.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&iris {
> > +	/* TODO: Add video-firmware iommus to start IRIS from EL2 */
> 
> So the missing 'iommus' property is the only blocker to enable IRIS?

Yes, but this would require some changes in the driver as well to create
a platform device for the firmware and IOMMU domain, and to attach the
firmware device to the domain.

There was some discussion around this in v2[1], where I added support
for video. However, the change involved hooking into the video-firmware
property, which was used for Venus.  There were concerns[2] about following
the same approach for Iris, and due to that, we have dropped video
support for now.  However, an RFC has been posted from our side to
handle such scenarios[3], as of now unclear about the direction for
Iris.


[1] https://lore.kernel.org/lkml/aKooCFoV3ZYwOMRx@linaro.org/

[2] https://lore.kernel.org/lkml/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/

[3] https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/

[4] https://lore.kernel.org/lkml/4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com/
> 
> - Mani
> 
> > +	status = "disabled";
> > +};
> > +
> > +/*
> > + * When running under Gunyah, remote processor firmware IOMMU streams is
> > + * controlled by the Gunyah however when we take ownership of it in EL2,
> > + * we need to configure it properly to use remote processor.
> > + */
> > +&remoteproc_adsp {
> > +	iommus = <&apps_smmu 0x3000 0x0>;
> > +};
> > +
> > +&remoteproc_cdsp0 {
> > +	iommus = <&apps_smmu 0x21c0 0x0400>;
> > +};
> > +
> > +&remoteproc_cdsp1 {
> > +	iommus = <&apps_smmu 0x29c0 0x0400>;
> > +};
> > +
> > +&remoteproc_gpdsp0 {
> > +       iommus = <&apps_smmu 0x38a0 0x0>;
> > +};
> > +
> > +&remoteproc_gpdsp1 {
> > +       iommus = <&apps_smmu 0x38c0 0x0>;
> > +};
> > 
> > -- 
> > 2.50.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha
