Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3083246FD
	for <linux-remoteproc@vger.kernel.org>; Mon,  8 Dec 2025 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203927; cv=none; b=Nyy25dTijEKK2qwy00ENTPpj9vK/nFr11vJ4w77Hr4L/dmznEHOzZjuUfD36qJwsneEXFvehRTeqAXV+Mm2HyxL7zDt0qM/Ubpj5AWNeslJEtKTjIooFyvNk7FUUH0/uAMXE0Vn9XdkoZrP5W9LeMb2AIbNjZ/oyEBSboRRku/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203927; c=relaxed/simple;
	bh=Ppw7wRM0wBbCaPjd5el6qk76FQRh20pkumuSo/hRLdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdtAqLm4zGjoCololfKsYRIspFlGJmDO9Ihgdw1bfh8u/izGHUuqumLd0DvTkp44zsEVTSG6GfpUIjAAdMEAe06kFR75eMEwCVmk+lTTK/NroR0MRkZo2Hfuyjq82DZ89dAdi3Kb/FbrvHfxUPrl+yOKVB1/x0kZDtS7/eBgnxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzaAR94P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiO2YsDV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzaAR94P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiO2YsDV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B89FAYb3863078
	for <linux-remoteproc@vger.kernel.org>; Mon, 8 Dec 2025 14:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+uTeFMrSmVdakec7XKSAsdwj
	aXaP4GIsMmUDOx/E8zo=; b=WzaAR94PXKkc8MoeLR3U+qtnluuyRHlZ624/n/s9
	xt1G/rLr5S11curKRTf6wec1I+kBhCQvPk34x0f8fPpLyPB7OKHznVgyNUpSA6Xb
	9q/NFuSaWH7xE6APgbKU05qcHMun5iPI20N8zcgaUGi4GNDrjqbCFCv+aexgH36s
	ChWf+m7d79r9iJ08D7ha7bwyFGSYtSlG85hG0cqg0f4ZjayUHjkDZylthc2FFoKo
	gvcbgwkiWSTSbslYPQyJP3gxuQAsPU8W4gr9cRLpjp4t8LQFXHw9FZwFrbcOSofc
	EufFvhUWx8lwDSVtWgpdUPr6al+8LI7M7I60euHIZ2xdmQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awuvg0vc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 08 Dec 2025 14:25:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2954d676f9dso11864915ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Dec 2025 06:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765203925; x=1765808725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+uTeFMrSmVdakec7XKSAsdwjaXaP4GIsMmUDOx/E8zo=;
        b=PiO2YsDVpD1vNdRInfhKUZZx8txAZK2vrV+hdaOu2XMyY5i/nsh5RotVoI347NWfWf
         iiCwlYNo9IVi/O+AGCKhkMd1tteW+Em1jEFZSMzVtCErXPRtuQDSB1rWGbRaKbLVG7GI
         ZQrQOOLT4NXh8qIS+Tk8kK8SXqLrTxRvp+OQd7L3xbSMBFkGoRdaz605GP6kBzhpdM6Z
         qndtfBsYx4arXde3HAfYHMaK3C2M4tH+VmjB/xo0/H01/JSRXcKBxkLAwXqslm2HIQSh
         xC4aDtzt7DHFNyiN3woABk8qLQtupdEhFt5VJ8p6ygTfGGMy9qk2YgAVortw/b7Uvdf+
         jGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203925; x=1765808725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uTeFMrSmVdakec7XKSAsdwjaXaP4GIsMmUDOx/E8zo=;
        b=mVdroZdNQXp5dW2xqPS1sFsuhwlYxZQ7AZGKSTfkUg7wPfAQTQO/GXM2UJNRfznScC
         iFIgYsounla8WdnV1CAN1Dnrzdz8U8Fjrw5pQzrtPcz8D0XBfD03VowGXrsSLSw48VlJ
         8H1bomHNVC8RTv08vb9uCsp+94N6Yj+XIndDKKncNqko42tT2TnbKwAHsLSYL/UHGQAS
         4Rvh6GSFISaO22xS9npL0HJhYU8Cp5e237ERp4DdTbM6x4oj49g+pTUw9i+DPRPwau52
         z00JgR1Aly8tFoy5Dayb2KWyuH/k5bpP9lncAxQhWCtV3avGfrl1VCSNb2KSp1CJuLcw
         sxeg==
X-Forwarded-Encrypted: i=1; AJvYcCWc4TXI/DH15DxC3luTyGGXzst2jksUD5SGmlc6FAOnyB6UfUKMAD7r8AeliCyDgqLDyupltbKLq5juHzZIt2GZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyVwY/o+SLGkwfbSBoC/uvcKhUaoiKZx8NTujOStozSgL/ZWH+t
	CkSfpsNhNRr3Yv5JT6jZydHzi68T0F/RvWludMWOsebleC/FxRyWOFKib1LDJ5P7IEUwl880nq5
	MFvvzFoiaTD/mL69ts9IC+QHVGMMbv2Ck64C5lPeHXhidsl/6LuDvxMFDrvJB0yQGvr76ZbwI
X-Gm-Gg: ASbGncvX+xZfcAml99ale1gQ4cHq8kfkzztFLoQzCiT/L73WcFj3vjvNXfimY9hMkho
	jF4n0okzZ5D1u1X0tUBKdsZhGCh2dVHf/G3qn7lMYX1qlUpkgiwjWau5niVyHNtEHxVMiheccW/
	Ft8/g9Z8hHuOC1cY+ScuxeUN1WuqLpdsyH/m+vI7xDvrjaZzNmwDElLA+7geht5O585wQ77RTYb
	ReCn0jri0o4AZTYYKJ3GGue00sjRSRQrgqA3YcGJ0ND6C4RsCQJz+DFlT4gFrxtBA/0CRCNUJ3g
	JTL95sjw651Uk9h+jcLmHmd7WY4XHl2/uTkS8UQsmsmfrbK2Xfbl0Kao06nFH5aXhqVlnKdoxUx
	gP9YyCIGhwZicxSypZIY19MTbI8J4oVVGeAFA
X-Received: by 2002:a17:902:e950:b0:295:3f35:a312 with SMTP id d9443c01a7336-29df5abdf36mr54824285ad.20.1765203924565;
        Mon, 08 Dec 2025 06:25:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLusxfrDXiXne5FSC3yqKkWrlHG22BZERr/Fi6paq2FhLIFr4DrT058tbCaXaTlMtOavPBdw==
X-Received: by 2002:a17:902:e950:b0:295:3f35:a312 with SMTP id d9443c01a7336-29df5abdf36mr54823985ad.20.1765203923826;
        Mon, 08 Dec 2025 06:25:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf97fsm126735465ad.25.2025.12.08.06.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:25:23 -0800 (PST)
Date: Mon, 8 Dec 2025 19:55:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20251208142517.wdve2btbcvn2dmq3@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
 <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
 <p3t7ggu7wg74knfa4x6kauelfalgi6yx7xdgsoemwekpzogetg@a7xwv2s3zxmw>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p3t7ggu7wg74knfa4x6kauelfalgi6yx7xdgsoemwekpzogetg@a7xwv2s3zxmw>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEyMiBTYWx0ZWRfX8VR+j33Kt07U
 rXVPZAyYZRWobSuoGkTUDvPUoYo0wyl/lOKVk6idFmI7gDEkY9bzwih3/ULAb0Ww/QlGLqcRLnF
 i8qnuBa+jGeRLK7HyB/pvcM04+cD+KAaUqR6kmY8DTWA6DoFPNiL4sH0oW4k6qd9/n4tCUTQypx
 iSfNbDUTZqw5qXBWhpX8JyUXSvazsLRGyxmE5JlLMBSObhDJLGzOAdcL1S1dAKo8bp5X+aoBGS7
 LNee7VY6bEVb6e2nIVnFb5EXkks1gbC70b9YTOKiioo7Jx+9JHFqur5dCF5tAHaeq0MkyQEdMbm
 wH8rrMICQF+ncO3YVugaKC1XFtpzKj/+whddqZ9iHDVpOSrD9va+6qYo3yhNWzwk5pxJEmhQxic
 Z+thkLlhsIVvazQjn0wsu0OxuKIr3Q==
X-Proofpoint-ORIG-GUID: F00RYKiAgVOoLYFZV1YYb-IxEyCEiMAn
X-Authority-Analysis: v=2.4 cv=cqSWUl4i c=1 sm=1 tr=0 ts=6936dfd5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nmGXgFyiiTx6iAFQcSgA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: F00RYKiAgVOoLYFZV1YYb-IxEyCEiMAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080122

On Fri, Dec 05, 2025 at 04:21:07PM -0600, Bjorn Andersson wrote:
> On Mon, Nov 24, 2025 at 08:55:38PM +0530, Mukesh Ojha wrote:
> > On Mon, Nov 24, 2025 at 12:48:31PM +0100, Konrad Dybcio wrote:
> > > On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> > > > Qualcomm remote processor may rely on Static and Dynamic resources for
> > > > it to be functional. Static resources are fixed like for example,
> > > > memory-mapped addresses required by the subsystem and dynamic
> > > > resources, such as shared memory in DDR etc., are determined at
> > > > runtime during the boot process.
> > > > 
> > > > For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> > > > hypervisor, all the resources whether it is static or dynamic, is
> > > > managed by the hypervisor. Dynamic resources if it is present for a
> > > > remote processor will always be coming from secure world via SMC call
> > > > while static resources may be present in remote processor firmware
> > > > binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> > > > with dynamic resources.
> > > > 
> > > > Some of the remote processor drivers, such as video, GPU, IPA, etc., do
> > > > not check whether resources are present in their remote processor
> > > > firmware binary. In such cases, the caller of this function should set
> > > > input_rt and input_rt_size as NULL and zero respectively. Remoteproc
> > > > framework has method to check whether firmware binary contain resources
> > > > or not and they should be pass resource table pointer to input_rt and
> > > > resource table size to input_rt_size and this will be forwarded to
> > > > TrustZone for authentication. TrustZone will then append the dynamic
> > > > resources and return the complete resource table in output_rt
> > > > 
> > > > More about documentation on resource table format can be found in
> > > > include/linux/remoteproc.h
> > > > 
> > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > > ---
> > > 
> > > [...]
> > > 
> > > > +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> > > > +			       size_t input_rt_size, void **output_rt,
> > > > +			       size_t *output_rt_size)
> > > > +{
> > > > +	unsigned int retry_num = 5;
> > > > +	int ret;
> > > > +
> > > > +	do {
> > > > +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
> > > > +		if (!*output_rt)
> > > > +			return -ENOMEM;
> > > > +
> > > > +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
> > > > +						   input_rt_size, output_rt,
> > > > +						   output_rt_size);
> > > > +		if (ret)
> > > > +			kfree(*output_rt);
> > > > +
> > > > +	} while (ret == -EAGAIN && --retry_num);
> > > 
> > > Will firmware return -EAGAIN as a result, or is this to handle the
> > > "buffer too small case"?
> > 
> > The latter one where a re-attempt could pass..
> > 
> 
> But why would we need more than 1 retry here? In what cases do we expect
> that the first attempt is too small, and then the next 4 attempts are
> also going to be too small?
> 
> Why is 5 a good number?

This was a misunderstanding, will fix it as per latest discussion.

-- 
-Mukesh Ojha
