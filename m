Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD942BDC27
	for <linux-remoteproc@vger.kernel.org>; Sat, 31 Jan 2026 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769846082; cv=none; b=a8S8VQm1XpsKOOdvKFM0jH0IFNWWVPG5VbMHhhG8nzwFBLSLL53Nn2+xoAMK/dQg6yefY+5eFTmYDTOWPTVqhQMSk4MNcyw3m+nbjFZNAUQNapPqW6S4z3faI+DyQPfynFr9okER0javQEsePVPE/Srlx7WgXWvZfK4bDRUZHgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769846082; c=relaxed/simple;
	bh=CWDOa3OXSZPAQCY7FNjuE0d2Db7vcuBhjJcU6z5Du68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rwrzt6kw7el2dn+p0PESSurdfZkRqjJIyqddQ5i7zNmcigf87qFkCzZBLXWSQGQONb0C83aEvCaS8k4qJEjmXN9fZezjlr+Jhq4DEBcppmEq29dRyAtrw6YfVJ036URC0i5nHSlJn1px+EqR2LAHsEbjaAv2BksPVRBFOfR/p78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXSub0HD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOio0sgt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXSub0HD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOio0sgt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4SrEG3956249
	for <linux-remoteproc@vger.kernel.org>; Sat, 31 Jan 2026 07:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BNGCdgB+I/241R6e7TdCbqbF
	QIHMkedIcP3fo1ofUoo=; b=iXSub0HDBbJZF7c8ZqLFgDfRVEOTyO3PdLhPloqn
	VfizqYx/98oUCJO1ujItkVh53g4XeeTLMIDpEv+vugTMiuF5zqVYGtrYPNEwFEmu
	smOqNwijvmv6QfKPrlKOu5Nl9CjMSuhHiqzloNRVP4FV7QSxHgXRlfbN9wQd00+E
	pijhEMPG4itwILT+4aalkniebQ5yjheRO6KdQ1jSETVPSVx9OSN9EaXv1C4WQmvE
	+WeBt0QAVsUOuSarqVss9Z2SBHnw1P0oSPQwTxEzxyggHO3brTP8mXBp3q2AMBhh
	zWTH4BmzwOEHq96DdLBT1Qr4iTVKu0f/8lqmZs/20g2XOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1are8e4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 31 Jan 2026 07:54:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ef98116so678825685a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 23:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769846078; x=1770450878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNGCdgB+I/241R6e7TdCbqbFQIHMkedIcP3fo1ofUoo=;
        b=eOio0sgtvXxso26+5kNRkz39w5ioyQtjRWpoyCnGmHCtEnCNaRH2ccVMb/BKJ1Y6PN
         pY+X4Od+3X9Hqz8OyTnGzxA8ooF7L4XWG0NoTp7OVO97vosmnJPSCcm04Yoni5tGYjMt
         LRKhEnk+62BcKXlY5VDzjEnaabBf8w0Z929me/DgUF48Hm4xZhXqYgwzLjpuo5KkJRQU
         gFMv3WZSnNQECU/drlQRYgwRgtw4n4QaRi8w4crHnuR7oPju5VItR3VYqzleUiMCx0gY
         to5zxDZ8QVdpuvNYdHYBiIsZ2rwe1GU/0t83lmTeXqVVaQMoChmFdPD0g0lwBBk/GuN4
         lSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846078; x=1770450878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNGCdgB+I/241R6e7TdCbqbFQIHMkedIcP3fo1ofUoo=;
        b=w9+60ATh60CdVDHpiGB+yq9ushmPeg+6L3leZ/ZK5+lQJs/7249wIhv43Ht2opioBI
         1lBA+i2yqz25KdooC+H0NitpnLz0/VrNmrTwMqC/ZA6zv7Hy8Q4tEwkENuDiq1ayYd3j
         AU0NjuhwTdHuxwg00/oGHRhmILh6KNEmbUSIQhwonUlrpkyxaD+ISbY1VpeB5woj4oJ3
         kRBmSDIRrxbV45R7fWoIKubxAk44AdBkDU5Nlbb4h8Q4GHelxwi1DYoeEOaIOysRgSPl
         jTYaJI2O09rUFeGn7gLxf/0wsuvVCnVmfqNCl7z05eRDFM7iYJ6mh5ycFWQ/fVfmGw3B
         xoUw==
X-Forwarded-Encrypted: i=1; AJvYcCVYwzjtqTc9WzaebediZvZjqzOCq6QmEnVOUVqa0PnQBz9WD4nJ/p41NmsITtBnujQqemJ9k+i42XpwMeMgGfEx@vger.kernel.org
X-Gm-Message-State: AOJu0YyDT7WZJmln10Mkni0DKGjXgTfmabuxPTVQX133k+M/kU1VRXQI
	P+jRefIV3/ierSD45pxf7mkOGxtT5nuEJQKOBOCjQ8RvkqevDCxQWEwTj7OCk+Ig3e16d3zXOiE
	mBXObPj4UNPuJ5xSAc7TwnNxMtPXV+hNwjethWRtgzBhXXb0lt48E+nc3DxCEqW2JLpZW7DJs
X-Gm-Gg: AZuq6aI11yhVMiOpDWKWXFLDjybvKVdjEK8hcvdo6qhHjfjdVNtg8AoA33ulfP21Ceo
	P7XQL3RVxrdgBSGj1VabzDrBMA+MehwgTg2ivXeikN7GS886tpqXa5i7HHj+r0+d8FJgbR7OifR
	MluXkqa/3ccRKRxHp8gl/pe7JSRrO8ox4wzcVOZFznutI5ix+FdwaLDRB29/r/TRGPtwzCmMIeW
	7h4FA70wkzEAajFbvZ/+YOiN4s9OkDX+8utW9MGMkkSFVAsu47UV4lDCeZUKYOH8ooxfEDMmJRX
	31i1O3xlVQAzuZsOGS6drfwy0XtJ+QxieOA+3bbs9w7v8mlkYnAwwoU0JM36/4L/t8+5wu2hB5r
	5+ciwI/mDQxrJRhqZQtrLgwGDKqc2FWKhRnAsDpQ6s7SmyjJ9elimXL3rD1XK2eXmGy22J9DSNj
	CfaOAyWvyr72SfCSBSGz9qfCs=
X-Received: by 2002:a05:620a:d8e:b0:8c6:a5bc:8a80 with SMTP id af79cd13be357-8c9eb276269mr783150385a.29.1769846077922;
        Fri, 30 Jan 2026 23:54:37 -0800 (PST)
X-Received: by 2002:a05:620a:d8e:b0:8c6:a5bc:8a80 with SMTP id af79cd13be357-8c9eb276269mr783148585a.29.1769846077410;
        Fri, 30 Jan 2026 23:54:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fbd154sm18624001fa.43.2026.01.30.23.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:54:35 -0800 (PST)
Date: Sat, 31 Jan 2026 09:54:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=697db53e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JZfQ_b1XWSiC6XszZi0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2l4afke1wTDjlENlkBxiV6kdHTIJ9Xc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2NCBTYWx0ZWRfX/KBGOQec+osk
 m51ppQaBGomS2rdx/8nWO3S+r074yvNhMRqkoftZ53lixi7CnDq8Lr3Id7yOUFlCnQnzsvHylG5
 7IEWtW2tovhK/2vBWCuZqh8o2ZL6M6fX6jQ3E/VJjS6a/uHFLo/yXU665HEQjz17RuXVvUqUcXp
 IpcHwiHLaou2naVfgwTIyWcoriub1KXRHqWB7xGOOnrC6GF42jeXr4gOk59R93g0+8f5iq+eolA
 HazQsEqqLwrEx5LSecIWvszU5rw8WOPhqjDmxlPeLw4oXjoT03ctl55MEi12PsxARsfkIdxiX2p
 +drFKLZ7aEIcPyxw+Ors8RObYcVRpllQtUOz+Z2Acr/YfMSOzt1M1VuMSLWRgrE5L1UR5+mmjM6
 AjpIFKSruA5dxItaWHOy2N87gzfUFmyKqlGBlAfr21d2E69qr0yrZNuVtuPQbobHtF4QCoBKCnM
 Lcn4+xckp84WK/gbazQ==
X-Proofpoint-ORIG-GUID: 2l4afke1wTDjlENlkBxiV6kdHTIJ9Xc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310064

On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> On 1/29/26 1:13 AM, Sibi Sankar wrote:
> > Enable ADSP and CDSP on Glymur CRD board.
> > 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index 0899214465ac..0eed4faa8b07 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -487,6 +487,20 @@ &pon_resin {
> >  	status = "okay";
> >  };
> >  
> > +&remoteproc_adsp {
> > +	firmware-name = "qcom/glymur/adsp.mbn",
> > +			"qcom/glymur/adsp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	firmware-name = "qcom/glymur/cdsp.mbn",
> > +			"qcom/glymur/cdsp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> 
> Please make sure it gets to L-F (only Kaanapali is there right now)
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
but the firmware in linux-firmware is (now) targeting IoT devices,
should we use WoA-like names for firmware on Glymur CRD instead
(qcadsp-something.mbn). It would match what was done for the SC8280XP
CRD.

-- 
With best wishes
Dmitry
