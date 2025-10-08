Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A702F2616
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908962; cv=none; b=BK4qTvM3xTLgJN331sN7C2FxLL1N1Uj1mqgQI8IbvnhoTW/UOR8g6w8smzkqDAGLksOsQ4ykg8i70QxfXFirv1YSWUIFp4FFpo2XhDNcnW4yTXVa/FZzxbPT4FeJ+r4gMJN1UMv4bAwHvxAkwyoLLgzgYKx8SWOEVqgyBMn2mrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908962; c=relaxed/simple;
	bh=ovPhlT67EBW8wa69dniODvAyxrycxNseuMkV8IOqDZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjaSy58YIHUNWsqZCDjH0DgB1Ca4ngurhNVLafai7xQuZDm3ZrnPpzvTtQCJQJ8Q3DWZZpfxQbCxmJGqVivo1kxwiY6HAqr+wv3U2NyMUkyEV2Qf/6oe/1BbPRXyVOo91nTmJ3QronNI+ajk0c4Gjtxpbp8V5AX76KwNWiz89K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnxfQovD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnxfQovD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598043Bf026749
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 07:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44EHVLBf9lEv9QfcJCGopHnLha1JTNsWJh+6EDiLAuc=; b=CnxfQovDpDSuCKsq
	mJiJluf7prd/H3TimnWlOsRvD9e+xz/Ed2K9GGsh2kOiSo5dY2ttM54m978OP6bO
	+SCp5SjeGOMH3U8HVbIi2LvWbMRuCto2+COyE7TdHjmuXSgHBcJoeRsChEe5c9ar
	F+8XrIwNcEqbMnqVkemS5qm2FVz2fCRQ+Jlqi1L61TsqGO7TFNaOsACAwA51ZtPr
	axa8eeaM89KDXbrxQEQqednWqoY2i4xCiutUr+C1UF9gFt4I4snR7fb+4BMBx/6a
	PEGMccJaEeaqm0CpxinijBAnyVvoR11Qc8wuxegIUbUGUegvqhNJD844OmjUxrns
	/gQyTg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1smfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 07:36:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28e8d1d9b13so82263845ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 00:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908960; x=1760513760;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44EHVLBf9lEv9QfcJCGopHnLha1JTNsWJh+6EDiLAuc=;
        b=gR2T6buDMKn+yMDagpM6+NTIaFguPRrdrPSRo8nle9JUlnGGxMHz3nyZUPCvVAOWku
         RVwwD5qeneEb1y5xGnhGzjDj9d3SJJBMSQx+3QGl4DXy81W2MIIZ3XI73TX8IlyPimwt
         PZbElCyNDwYfjUarZ3CcF9dL3/hX29mGdglBKSP9Ar4hn5sHk9xPFd8OEP3GUru8F+DS
         5dxL5hmIw7GLzDz/m36KPCScBPPf8kr8W9wC+u9Eu+4Q92EL8wrXPXGWNiA3AvaXxd4O
         6vVAn+FxG/ZwdLEtVtm91uoPQ7TsCO2HWFWv4R3eH7pPupLWoyhPra4LEtolpHOLrr49
         kaNg==
X-Forwarded-Encrypted: i=1; AJvYcCVyhetusfXzsqIfJc5BiztmDxSUgOaLkr2ReoO/hgos7+SDksA68keMR6GM3NtKdcN5gYoEXb6MVxfG28MpMknN@vger.kernel.org
X-Gm-Message-State: AOJu0YyWXDZJcgWYcEey9Td9lDjfS8H857h5nZZ2RPrtuswj79umb7AI
	MuxhZKcTdu6Xw/BQXzozCwndz4/6czMcvcmCQB3tqKYEIohh1lnRHC6CB7tj4tyFWCk58NxxHdk
	YMKZwmW6avtTC34KHkwR8kLJ/+VmUNF++Pd1sEgTx3Cso00ShfQnyKEaFfWlEfD9eqzNnaNdL
X-Gm-Gg: ASbGncunnoMuGcgPeyOFhw7dPeiBKqmj/xaY/ReVZJPDHLUGOaOExyDK8TRFelf3t6g
	ytBLbv/sKYfJcVtRW6n+OyrNtpC3tit425lx3TefLXhnNAvMTP/ybHW5bfwxUTMkqW6yqvU0Sqp
	jj4++qyeha/i2SDssNtgaPGxEu7gSH2o0Y33V6UhVgaIljATJnUsZLCc3WwpETfPWebfgz+Yoa8
	WZVQmlbqy9mGjiFU4TL0mCcM3GrXGAx8Bs3HYOMBOo2q2nuf+wR8zE+gfVERykzwCD4vONfXuDZ
	FX6rQZ8YdNiHTECeNHCFOy0nLBgvXDHfJ4ct3pj5etSAxC/QjfPGmrBCmJFSvJEqazDEpIjc
X-Received: by 2002:a17:902:f546:b0:269:b2e5:ee48 with SMTP id d9443c01a7336-29027391bdcmr36922145ad.52.1759908959646;
        Wed, 08 Oct 2025 00:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA0HIpa1eYGM2/2CWP/TMlSB1Ie2IF9ksZjRnCg+UoYWsRxcudmptOHTzrOTYahOydcSCUPA==
X-Received: by 2002:a17:902:f546:b0:269:b2e5:ee48 with SMTP id d9443c01a7336-29027391bdcmr36921745ad.52.1759908959015;
        Wed, 08 Oct 2025 00:35:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d134859sm188696395ad.57.2025.10.08.00.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:35:58 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:05:53 +0530
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
Subject: Re: [PATCH v4 04/12] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Message-ID: <20251008073553.qnjvb76ygkd6rybj@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-4-de841623af3c@oss.qualcomm.com>
 <jlpxaewyitfnms7qmesrsghkwkowabgzo4i4n25kiyp4n5ccvb@cs6txshdju4b>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jlpxaewyitfnms7qmesrsghkwkowabgzo4i4n25kiyp4n5ccvb@cs6txshdju4b>
X-Proofpoint-GUID: uxZ6nbQ0Ao3VyfcOr9y89ZC8-5kguXuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX6aJ9zrNJGGzk
 e6QzXmwGhg8r78Z66plTBl08JRkvP3YXk45cZiVJb5bP4Ey6oZBAl6cHnPPndVT4bsSeVdwx4Nx
 3NyzClOwNNBjps4RtEQSQvTUp0ILHy+FoElPJYlND6WdU/NIyBDjYfe4JeDfoUrR52l2g8qBwea
 euQRTdQ4H4SJ/WLS6y7C0Rw+KYQaKP2b31vpjqdL4T2hw+I3jVhS0yrxKboH0EO1DNtdqzcTdvq
 IdiK3Jvoc3DNctvKKwD4cWPw6x1o68hz4BsfDHoBrRfua++v+aflFQbnu3HemU7MLNnAHbmvVuK
 ndl9chjZmPP+F6UD0H7rfyrD6fUlAlsoaGHayAnG56+/McUVwRiAA2U4OGr3xr1dBHS2NgI+AZo
 qS4J6sM5Fzfun08tna+tcTAeee+vzA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e61460 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=hN60wAwBI9Lfv06IXC4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: uxZ6nbQ0Ao3VyfcOr9y89ZC8-5kguXuT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On Tue, Oct 07, 2025 at 02:29:20PM -0700, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 10:18:49PM +0530, Mukesh Ojha wrote:
> > Add a PAS context-aware qcom_mdt_pas_load() function for remote
> > processor drivers, which can use the context pointer returned from
> > qcom_scm_pas_ctx_init() to perform metadata verification and memory
> > setup via SMC calls.
> > 
> > The qcom_mdt_pas_load() and qcom_mdt_load() functions are almost
> > similar. Clients using the PAS context-based data structure can adopt
> > qcom_mdt_pas_load(), and in the future, all users of qcom_mdt_load()
> > could be migrated to use qcom_mdt_pas_load() instead.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/mdt_loader.c       | 29 +++++++++++++++++++++++++++++
> >  include/linux/soc/qcom/mdt_loader.h | 11 +++++++++++
> >  2 files changed, 40 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > index a5c80d4fcc36..31855836b251 100644
> > --- a/drivers/soc/qcom/mdt_loader.c
> > +++ b/drivers/soc/qcom/mdt_loader.c
> > @@ -486,5 +486,34 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
> >  
> > +/**
> > + * qcom_mdt_pas_load() - load the firmware which header is loaded as fw
> > + *
> 
> Could you please reword it to make it clear?

Sure.

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha
