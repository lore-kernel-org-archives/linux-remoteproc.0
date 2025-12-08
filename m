Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681E42F361B
	for <linux-remoteproc@vger.kernel.org>; Mon,  8 Dec 2025 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203719; cv=none; b=Uixi6PDFjNuFRQf1tVud+rOAXMhftc9h5dchzovpGuNv4TwVjKix1WSjndaTzv5fiFgY8CFxXvSQ1dI92C36NRimaaCFjtR0SqtqoMsrrj3r5VHnPRFMqmE41cy98KB+Du2+p1mf2nKZozegFar6aSQEvt/psS7ZR2cX4Bo1Z1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203719; c=relaxed/simple;
	bh=JYDMzgw6EjLiSUpV0rhlEN4mpmMQFS/5pjg3VFIHkYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMG1hL4i4PA+f18CMMNWzGz+mADK9xcQBeyv49MU1sLdr80ht/1VG8i79POxmuxXC3uNdbNo/4d5+bXN9+3yZNBe+Bfjovbx0r8DxoOsaLG6cZ+EGd0REQwmAtH57TBd8vbLjarzPo983S0LVhwuOlKtOL9rKkUGSfWvBiF9MAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cO/cR5BV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdkYBFAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cO/cR5BV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdkYBFAO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88gINn2940608
	for <linux-remoteproc@vger.kernel.org>; Mon, 8 Dec 2025 14:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fs05u8imfaPhoe0d752UHSGH
	Xm4ksFEJZZ619WaDSu0=; b=cO/cR5BVjlLqODge8ivjt8Qyi1xZYW+zj89Roba6
	OF1I0MaQJIFQNRBebyNFmk8IxjjGBruB4a9G/tPHAMT9L8/iyDldnlCFjSkgaeNe
	RIvYaeu1HtoemOgG3twBZSyp0Y8k8zUrm55BOXoq5DX/ZzH6h6U817h4ZRNSEZ56
	pmhdDLRRE3wC3GwplIaMPvGjx2jxj2Ccp54UDlPPe9oFc2qHEvxM03dx+1XeP33D
	7ukOtlQwQB5mr928UeXTLd/5CgOFGL2H5kykh3gqLjY5IuB/H2zA8E97wyoB32xC
	UPD8tozE3K9+K7+NNEvhdJnFqtZDxzhfFbk0Dy21Okcdiw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awhaqt9db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 08 Dec 2025 14:21:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b8973c4608so11346570b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Dec 2025 06:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765203716; x=1765808516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs05u8imfaPhoe0d752UHSGHXm4ksFEJZZ619WaDSu0=;
        b=TdkYBFAOYOt6T0++SHgHDhNbPZpjPDWUlfN/NHMWLPYqZlUgd9Uy6KTqrFiDeKqEKU
         SyDUEltFUKbucq2HQneuGi4QzAIy40ZOTQFpdncdUIR2/KllUh9IrFKKnm/l5rStE9yP
         uG7TNZxnZt89HtFUgkz8MKDhTqqk81FeENy8sM/TG1YRozM/OZO7pbEYq1fjGsgsNlSm
         Wl14JeoDnkn4vaetUL8AJZpSHu9YZC5igM7z+xvzbSt6nZnLOGi7BWkW0hN3uvj1bqE6
         NmJow5CnJA+kacoLFZFuklZB6JmqZqCVO9Fymh0EIGq/e27FnZFbIPmLQjwumFXrapve
         SDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203716; x=1765808516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fs05u8imfaPhoe0d752UHSGHXm4ksFEJZZ619WaDSu0=;
        b=jUvEsIwaAetfDjp2W3PrQPruHLR7eXf5BFT/2IpkROaR+3YzNfvGRM6gTBwiNKQ6Jq
         WSDRLNzJbtqoKttAJSVKeppeU0eNcikDUUo8jDWgfLqWjAAXkDbWeJVRtOYxkFM883la
         jPAziJV9p8YjvqPZcxb6EtdV/5FmdyBW0m0Ea2f308Nfi7DoR1K5ZRfIDRWAoZxqBsrU
         QjbzNXN8YjgqpdpqTIQz2YVXzR30pwxkvgFkth7y4ZsjCS22dAxw0LYw8Y/yDjmcNo64
         573Gt5+6T8APyuyJfn9+xTHkyUWyqTwFM/pJ3ZtTI3l478vi1tXPt1ukNJVwemLkfWFO
         hE6w==
X-Forwarded-Encrypted: i=1; AJvYcCVAtijOcPOyvRVvkpL3gj+9hvc/cqvKd4P09jSb0hhQZsIF8JEcPQkyiB0uMj4TPJS/5rk+IsUs2wuso9NK+lUM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7oBc4xju45SV1Obo8v2HK6GjDDrXHxepeqQ2FEmud299I4kmB
	PQJTpKmsvI1PMuEThVUoT70IoHf2/fgpIJ8KHgIRdv3QfeeO9Y8oK9M1A4C6N3YtsSNoNkEfau8
	JDAspHvzMc5eyt+6OzAMOs4EzawkiuhHkJZC4GAwNPrltEUreVexG8KTCuzia616v892L1LAP
X-Gm-Gg: ASbGncscnKikRQbEs/+P1gsuOiXlou8OcHsBdQ34drjIZBA9ERBymsGXG55s1DWOxv7
	d5rMOM0/4Q9XcRBcjOWdyvT3sUrC6LvTgG3UDUvb7nVTQC9m3nUnqQF7+t4RhxcIF0wWcmXbmr4
	82qhQTSW9R16ipzTxj517v5OAQhqkI5TmKlytJlV0WCVO/WCT52U8WeOR1Jk1nY8Nzdp44R2VxQ
	zxRH/itTUqHsXeNfmZYtku92sNZyha3K/BS0dI+LraxMHtevw2doDDQrUe6LUgspHEW4RB6IyR3
	r+aBgX2aZsd+CusGO8/UkafBJlSPYTnO3F9AuL4HzkQ+BeItc2mW6GRcVHpQ78Bw80aUvfsI47W
	ySoB0XjTOgbcB7+1WQRx0GGfsuGeAlFW6d9oS
X-Received: by 2002:a05:6a00:ac9:b0:7e8:450c:6193 with SMTP id d2e1a72fcca58-7e8c6daaf97mr7728913b3a.42.1765203715780;
        Mon, 08 Dec 2025 06:21:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNlaFxdUOcQav1uV4OanRBtTE4SnS6w6kf2ovoDR9kPlaQnndKsSCiZ5UyNUU4RJjdcqgw5g==
X-Received: by 2002:a05:6a00:ac9:b0:7e8:450c:6193 with SMTP id d2e1a72fcca58-7e8c6daaf97mr7728870b3a.42.1765203715149;
        Mon, 08 Dec 2025 06:21:55 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2adc5c17esm13330756b3a.34.2025.12.08.06.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:21:54 -0800 (PST)
Date: Mon, 8 Dec 2025 19:51:49 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 14/14] arm64: dts: qcom: Add EL2 overlay for Lemans
Message-ID: <20251208142149.o6mmb7zwwjy7ywda@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-14-8e8e9fb0eca0@oss.qualcomm.com>
 <537jfsochzicr6pha6jt46ngltk2z4jjm5se7sti3klcgjd66u@wawpyrsihqeq>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537jfsochzicr6pha6jt46ngltk2z4jjm5se7sti3klcgjd66u@wawpyrsihqeq>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEyMiBTYWx0ZWRfX0boeiGJmzOVJ
 b5vnTMU3VIalLpv2MM2HThwgV06SDWJbeLoDP0R1VPg4wc8fo09Wlk4bniKqqtuJhtSS8BP5zwB
 omrrrileodyO2t48KyrGTHWVlmr3Vcj6oPIxyhVX1KS0oPWAOOWzRLLOcKF2ALXrxhFE1beEUlN
 OJ74YXWowuIK/RB/C6lPjZcjjIuK/6Ch8/6viW7WKQmOXgwMNdLRleGtMj0yGyyKCnEaBG5ZQRb
 +yCtU4s0+n1oTvc2uTnk7A/SneB1/slmq275JSSwH7hix77Dg2YbezwJsTZLWoISTZrFGwijso8
 vMYaxbLJtgtNUh8AvqFwqrwhGWxa+TdKKP0r/ebZk/N0iWCpXEvA2s+Ph60Hb9ggAy1GSqfD0aI
 valY3BMODqYn4OQSyTWbfmHQGHwggQ==
X-Proofpoint-GUID: Nuw4MeM7KWs1zAwlprGF4hHALgeGJ6Oy
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=6936df04 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Sz9PB_RVBE0MPzD3x4sA:9
 a=CjuIK1q_8ugA:10 a=eSe6kog-UzkA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Nuw4MeM7KWs1zAwlprGF4hHALgeGJ6Oy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080122

On Fri, Dec 05, 2025 at 05:00:20PM -0600, Bjorn Andersson wrote:
> On Fri, Nov 21, 2025 at 04:31:16PM +0530, Mukesh Ojha wrote:
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
> >  arch/arm64/boot/dts/qcom/Makefile        | 10 ++++++++
> >  arch/arm64/boot/dts/qcom/lemans-el2.dtso | 41 ++++++++++++++++++++++++++++++++
> >  2 files changed, 51 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 6f34d5ed331c..56efd90b7a5e 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -37,6 +37,10 @@ lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
> >  
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
> > +
> > +lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> > +
> > +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> > @@ -142,6 +146,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> > +
> > +qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
> > +qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
> > +
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> > new file mode 100644
> > index 000000000000..af35039946e3
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
> > +	/* More driver work is needed */
> 
> You can write this comment without referring to some particular
> implementation (as DeviceTree should).
> 
> /* The binding doesn't allow for describing the firmware IOMMU stream yet */
> 
> > +	status = "disabled";
> > +};
> > +
> > +/*
> > + * When running under Gunyah, remote processor firmware IOMMU streams is
> > + * controlled by the Gunyah however when we take ownership of it in EL2,
> > + * we need to configure it properly to use remote processor.
> 
> The comment describes how things work with Gunyah, and then from that
> angle explains why we need this. I'd find it preferable to keep the
> perspective of not having Gunyah. Something as simple as:
> 
> /*
>  * Without Gunyah, the IOMMU is managed by the consumer of this DeviceTree,
>  * so describe the firmware streams for each remoteproc.
>  */
> 
> That said, once the iris binding (and others) allow us to describe the
> firmware stream, this comment will be misplaced. So perhaps apply my
> feedback to the commit message and omit the comment here. If someone
> wonders why it looks like it does, the commit message in the git history
> will tell them.

Will move all the required comments into description of commit message.

-- 
-Mukesh Ojha
