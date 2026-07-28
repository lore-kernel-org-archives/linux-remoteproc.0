Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533E241B8D4
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231526; cv=none; b=IBYwL1hobRGyNGQ2T8LQnH53356zi4FrIAcCXzFrSjQyCbA09BRBqPH8peufldH3XCOLhSsIy/w5KrWEpFXI8lvkj3QB431Hyra+gbD1lCP7Mq2SbaY2CB4qiqdFsbo6LLRq2NBbNJyD4kXCEdDFtqJ7EjoCnhgaD/ISuDf83MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231526; c=relaxed/simple;
	bh=7a0iVTRGF6tta4qp8zGJhIF49sI6kiJeJaLuzEvpJYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vv2o3Xf/GZtSdqqiP6Odgc/O2skoXf1Y9Pm9U3tdI9+eOn9BiBc0DCvPkln75dR70H9vHtcKXD+rZ1NosRxsiBfbjQkxD/bxz4j+Cz3bW5v0Sklu+AC5XwU9KgvzE+w9Y/XVaQ8ADhtcobMWqSWdWzgLcNFF4/iKfCIi7+Alv6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDwA3HZM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQpq+BAI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDwA3HZM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQpq+BAI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82TKT2027078
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o2fXXWs5o/xUnPXLsVww3EMR
	s7qxBFpy3fCvpyBqnfI=; b=EDwA3HZMMi3BAKRAa0AyFBXlmde7CAVp91Wawq+X
	QaZcJsS2q9HYeKwyKSFDtiYUJ6Sb4tddSUUOTTh1zzhVg4QVocwNnNuV/UbiAFX9
	GxfBOnvfrDx9kkeOvdoGCu5fG822H/NENhHS+s1tUTsTdK//m82q0Jl3Fcrgaql7
	E4ASsLywua09Rw0Csds/1WibF05M83bmlNvLet5C8m2drD9TX4ol0NC3m+X3ArJt
	pbvFKIEXrG1qfhGlmRu56vGvMFF1SBJuouXP98SGsMKsotnESEjCHFgr8xOqOOkD
	Fipe12JK8D5CAB4Y6P4H0AAwD89oK/+3C+UghohFbZz9RA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hgqxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:38:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1206453a91.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 02:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231522; x=1785836322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2fXXWs5o/xUnPXLsVww3EMRs7qxBFpy3fCvpyBqnfI=;
        b=BQpq+BAIdE+iFLrM3+9yoU0t5tnqDSQ56VqGhlRUW+GJnIHlw9RST3gvNRruz1wqTf
         snuNCkhwFWIB/dA1Lo1P2C39n/xAriMlX4CgbIxYH0e8vbz2c38KB4wJCfdkquiEal+3
         SHIuC7lzaVcRT+pd3ZqIx4hUfSP96oqNCaVc3TJh8uQUWtZE8gwc6/CAAhrVBMdLDpEd
         Ke9rA8L1KOyOM6eiTvdxA9Oo6c5QiGeFsqa2/nbLoVmsiZrmC+TFxFsMRXv3mUVPoxIP
         3NDmbLdF/vQs0ddPF7FLGpTnFskzmxQxCxL0oRTpZ1CVIkasc7y2aVDQCyigcg7iSY9s
         W0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231522; x=1785836322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2fXXWs5o/xUnPXLsVww3EMRs7qxBFpy3fCvpyBqnfI=;
        b=J9LcnSMtMkdJx8GiZ8Lpld58y9buFeXiNPZah5jTX1+IBCLM+bd/g/Be1aGqOycHFq
         CqckX9i95EbjNJPkqlcCiGocVJacH6VkFp7dK4o2L5bwayS1PliMf6X7CI8XB3gcFlVx
         PYIjjJuXShCA8JKie4HHW2b4OuL6hdk/vAGSVg0vQ932egLRoJdC09EcxtCMbXnw/Gfp
         JbOcWN8yPkTp/4apSDNMnuEZS4cj88ceb9CsZuEH7OSL3Pdmwv3AcxlgYfkCQaWDF1l6
         pXU8nPeuKdTbP/0SJNAxcssAvAVIyvgbASMMMA2XZvl+gKQXFxjLfaYhGDFr60X68LMA
         lvvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPyi09CXCX/a3TJo4MCAz8ld3bNJMvdjQYfnnAR4tBfJ/IvG55TFtM0QXv4S/g6WTHdyc4aTaPOJyS3EuWBozK@vger.kernel.org
X-Gm-Message-State: AOJu0YzUUZ3UZfH3iiG/Bw4dAsABi40gk92OTxAWVGL8N8D3b21z8xbE
	Orwm29wsbQP20k+t/lmorgX5BHq23dQF8K/Yla8q3KKwTdooquBV1TXfaH3hXO/6GFOJGu2Pe9Y
	L2IxW4y9uY17XCmNMptKh+VEQNEK52MJMzpeCHCK1XYb79ZPQ2E+5DAzEk+Iql7m3+jcuVzjE
X-Gm-Gg: AR+sD13scYxnQRSPegbAlOs8WPzLXZBTEDQkdCJVhr1jFEZYUR2yHRJIgtsHTYvqDIL
	A8kqPZZhfOHxlmePxwGaPU/n4iDll6uF66hyPiJDLHJJIs9lq7kKngPH7GMwTE+TwcFJkX6f7Pj
	T6O4FdkzFA2n4T82Zb2oE91X1nDPK35ngkuuLxbeH7G2Dgw2572BS8qfONGOLh+NzXSNSD60GJv
	ELXA55nIoRitYqz/Mk8GxX3DVPXUkEif6AwPGdWbOlJQRUDEO+UbDhs40XIrHX3jTSXu0WMdRio
	mfhb5cYsKsA/Xg2PXxv+vjCPItJpsLnhONGWsyFX+9lLB5zKqREVz72amrjww9KjFk8RCS6VCqd
	hJQysYvKWGPNfDYZiv2OHyRl0spJPOI7PqXchzfNnD8w=
X-Received: by 2002:a17:90b:4ad0:b0:38e:11ba:992e with SMTP id 98e67ed59e1d1-38f6a544ac8mr1474633a91.35.1785231522215;
        Tue, 28 Jul 2026 02:38:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad0:b0:38e:11ba:992e with SMTP id 98e67ed59e1d1-38f6a544ac8mr1474616a91.35.1785231521809;
        Tue, 28 Jul 2026 02:38:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f08e14762sm4074858a91.3.2026.07.28.02.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:38:41 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:38:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
Message-ID: <amh4m9rupzbTpoPv@QCOM-aGQu4IUr3Y>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
 <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
 <20260728092749.bb32hwpaokxxw32s@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728092749.bb32hwpaokxxw32s@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MyBTYWx0ZWRfX/7jjyylVSNo4
 QyZj2Oe+c7LhSFvHJD1CO/188t94gvMLZgYeuOZcMZ22/RzR1oEFUKQIzGLiKO9XFLLfdz7zKpb
 FfeWN3IMQdAx3hvdav/ClM+FuXl541E=
X-Proofpoint-GUID: j2wjFrKEslPvZIAROsco2Uylo_Mb8jH3
X-Proofpoint-ORIG-GUID: j2wjFrKEslPvZIAROsco2Uylo_Mb8jH3
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a6878a3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ReI_smAkPlKsL6naA8cA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MyBTYWx0ZWRfX+z3QnV74TUGg
 Ya1boA1gf1y8AwVxI1/BlIvQG2jx32vEtGQugkO41oAL8zkXNm5Nze/DN2okZ0JMvNhpGZvQl/9
 FoV/JGBy1hSEqO+Y4HD1EW7qgxWo3Y0zQp45yGLldOBvU0IGpSLFoz8daCoetyirxNHeXA++clg
 OAPD/EmM3tT6zIG41sS3mOJ92tMRxPnSDn4uVYGFB+Pb/jaQmVCQzrHKPSeh7Ful2ffYSZlpnKT
 fY+KcfrJBD06q6i54o65DSZs4wK7Pib9iUTAUs73H4uz3KfI1B8MVhx0sWEQT1iUrlSgdHCCZmP
 mLLj5ySaO1nBA3M4fEmh7NRaxJt1bFjeKC53k8wrR6ufRihWvCXVxQtsiFPsB14unpmi2qodVHe
 49+oJ5BB836OM8buAWoG8uhMDH4H2De9wzO7S6QALG8UQcjQGop3YKHwa1Ky/1rB9TGZZdvfXuD
 hIFvk6/29H/7wh24lkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280083

On Tue, Jul 28, 2026 at 02:57:49PM +0530, Mukesh Ojha wrote:
> On Tue, Jul 28, 2026 at 04:40:12PM +0800, Shawn Guo wrote:
> > Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
> > is pre-booted by XBL before Linux starts, so set early_boot flag for
> > attach path rather than a cold boot sequence.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
> >  1 file changed, 110 insertions(+)
...
> > +static const struct qcom_pas_data nord_cdsp0_resource = {
> > +	.crash_reason_smem = 601,
> > +	.firmware_name = "cdsp.mdt",
> > +	.dtb_firmware_name = "cdsp_dtb.mbn",
> > +	.pas_id = 18,
> > +	.dtb_pas_id = 37,
> > +	.minidump_id = 7,
> > +	.auto_boot = true,
> > +	.proxy_pd_names = (char*[]){
> > +		"cx",
> > +		"mx",
> > +		"nsp",
> > +		NULL
> > +	},
> > +	.load_state = "cdsp",
> 
> is this a miss or a known thing to not use cdsp0 here but use X it at other
> cdspX instances ?

This is what I found from downstream pil-rm code.

Shawn

> 
> > +	.ssr_name = "cdsp0",
> > +	.sysmon_name = "cdsp0",
> > +	.ssctl_id = 0x17,
> > +	.smem_host_id = 5,
> > +};
