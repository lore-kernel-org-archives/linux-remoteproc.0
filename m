Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D268E3E1D08
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179622; cv=none; b=JxLM3ym9UYYAiBsS40ddahUg9gw2AdWy/whxJzFxmEGS5UlRZ7CKxK2bROsOF0DphD2MxbOdTj6E0oTKVzX8yr688y0lRInaa2mPknyk+/uz95NcZS2ObROkjSnLnvg1XpamDnhdISs/muQUHnicyeQjs6lgFZchKk4rjnQCaBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179622; c=relaxed/simple;
	bh=5VDmw6EVBSY19Kh4ckawKa2UeToCfnVQ6kAam/z/G4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABUAlu01p0vyv6ZBvR3JMt3zOcMOxIoPs8Q4dV3dSzAGSJU9lWZxfOGR5JLynYtoGT9cSUnHUyIKRgyRubkoMB+4JKuUbQ3cf1xVeEeugMYtDtYRNtPXperacoKoRqcn2MNDrWbUGr0Kt0xFPu2JA9IZssHE8kAMkdhzsVoQat8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VA2YcSro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQRjIDrw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA2YcSro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQRjIDrw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4vPNR2437943
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 08:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NCEF9FcioixssM2nc9MdKQTK
	okCifycvGnvJXrz6rRk=; b=VA2YcSrobwt2Sme4e+RIcUvC9emfkYlWD7ykLX2n
	MlkshIJgjtrvZSUTbAPNJRF4JzBMoRWXu6tY0g3Df1rvtOgO+jBGEOT/4lFi8JAM
	nnJJDokZ2Qfoj4zs/meQvGBhbh7KCgklzwHvdqZND6zms2E8XlGcuEMFJmpEwPRI
	0zvjO9lyccyv7PW8McEy09LQbsq1YkpMFWGxrE6jevRciG+sbN8IwAqjOV6IWdwy
	Bz+jguMBrrroQoMG4cdHq4ANIJzepsZvDc7DcJ+F8+ZAavEUeTzUQ+3SPerXo9Gz
	CwgZvGlOWWY2eZv2amV5u2DLvyRj09eYN9FLgDN6ebvV0g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v419a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 08:33:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1353ac304f3so5840903c88.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779179619; x=1779784419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCEF9FcioixssM2nc9MdKQTKokCifycvGnvJXrz6rRk=;
        b=ZQRjIDrwqFtgwBBVq0JCUKIhSfQDqrGsummxi4dZu+bLackZdbgJpoXxX4a9KzUK1N
         DT84QsG4JytsmZ0zC3QT1+gGr3N5w2aR4v2vsDus+xAN0cUi220thGMIGJg/I8dhci8N
         FbqG0AXz1nlNXDYRvjfn/UVmueIHBXXkSAQZH5O4puqb7B5QKcs9Vc37gQmDrCPbfJRM
         mLHC3v1f/7Ag8lUCURY8GbgsAqHyum9svKJIq0m/8cuTbm0hdBkPd6cQH5QcDftcGjXD
         BeMtgQHG727IICX6i27hO1vsw6ecZG/MP65wlHyMVyrVSwbg+f02KQUfBgUUKlI2RPGZ
         JtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179619; x=1779784419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCEF9FcioixssM2nc9MdKQTKokCifycvGnvJXrz6rRk=;
        b=PC6QyeffZKtPWRkfZOvn1k6fbgYV0YW59uaVDq53VQ/tP4YNgXFqym1TMqtH5CkPTF
         ztSKRYfWhrwQ5ZCNPx1zw9utLCYw+0q3B3c8MeS1Se1zL+ZTpdhieYhkTd0Cm4jq/jfe
         bli8W5nYeSHmWf3aLvEZWwRaX2oaMiJSxVWzQxsBcof5mVfQhw5t50NYACw/mp76audU
         q+dCNUnGlEKNUKR8AlEOM3InkjGeXw4Xw04ui2qD9x267yOP4SO+N2Bflo06chitP+ry
         0igWOg5sRqpFZBAX9Nb3FgCRkqNcy/XA4nz1BclFFZGPrplLAIRyHaauvXvKrDhKVe7F
         UtEA==
X-Forwarded-Encrypted: i=1; AFNElJ/JOOpCmDBdnixFNd93RBu1tjKJanTIEOzX0gnaeP1Myp5CSSgw20a/k4Jz4hLFybU2P+AoJp9LB0C8cSsN8o7p@vger.kernel.org
X-Gm-Message-State: AOJu0YwSGSvAzKLJu7hpqUBCIwsJWMNb1/77xqlfck58uRmqCTt0IxFO
	/sfWlQoPyd+4DOBHdSGNorYGlSoFpj/PhE7sRvhqYqV9L3+TdsB63uZVG2rmAparNjMTOIxhH5l
	lIq9BMtJh1wrvNbBa7L0rFvRigfNoo7Ft4dd0i6k1XyO07APnFSLmjzBFTx9fes+uSSd07N+3
X-Gm-Gg: Acq92OFf+wP/skPZcdtyrQQEemD7pnnhF3YhzLgIcpTROWjicIamirbgLK3QSlHxzTt
	Q2QAcoTk0aA0//53gvuDuHnXskReIuSzTybnoGMoF4fMj3uINJVs9cIwiYueT1Oy7r5rpmmPSpj
	mT0on48OHJINCF6pRMxlToNXYd7JmnA09c22eXVm3nYAiBH04AwAF6SdTg1wWfyVZH0Vz9tFLGP
	eabUfRv+CEo34urCd+NaAnVp6B/CXpkXnUa36ct08Kx6IrcK0B5GaLMTLkVcYEFcHUy1kMUkdwi
	NXu2RGyv0+mYoaEz0OlUbQZ62lSVHLeIoyY+vDwv9MsetgXf55YkWAatId4FtQXPrSQmy7vIV2r
	3JnrjnHoGlKXAGl1VNY19kIEkRIwP3W9DnKgt3mzoxVTXQ0WtJLEj2Pp4i4MFbKvH
X-Received: by 2002:a05:7022:627:b0:133:3c47:92de with SMTP id a92af1059eb24-1350451daaamr7996453c88.17.1779179619044;
        Tue, 19 May 2026 01:33:39 -0700 (PDT)
X-Received: by 2002:a05:7022:627:b0:133:3c47:92de with SMTP id a92af1059eb24-1350451daaamr7996435c88.17.1779179618461;
        Tue, 19 May 2026 01:33:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2352f2sm22425874c88.10.2026.05.19.01.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:33:38 -0700 (PDT)
Date: Tue, 19 May 2026 16:33:28 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <agwgWLdL9P-z8eqo@QCOM-aGQu4IUr3Y>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c2063 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UBS1206eJaUMAjtCYMMA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: EfyRkTVdPBRKsSZCFfeTpprKiBFQLiua
X-Proofpoint-GUID: EfyRkTVdPBRKsSZCFfeTpprKiBFQLiua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4MyBTYWx0ZWRfX2U9ceAjqt9dq
 hvXCii13vqNO9EoDP10ZdPqqC0olpOr46ORWlR4rTx0svptUTFIlKDOZfsHdYooQW85IPK2jXTW
 7dttOufsPK58V1+ZtIOcJ33YgLydiIRahY74amXXAqy19ezsvDOTSKTRDTPbcR2xJ1NJL7WrOVg
 MAFAfk1pRNFzWjCDoshDEvr7ssyeVQkSFWHvmSSsL3UDdJ66PXarpQyOMQlzk3oj6++77NtMQjd
 gyE4GObgb8QBzohe8xlqVpZrN6wCR3s8IMsq+yom3z6K/TaE66KqsbSbhIpH4KtzYMdx3i1E8WG
 DCdl+0R6EnqKQ0jd6WiehmWEA8XYgatZCDOKp0cqZV44+rKuVFJljYUvz+t8XizCpkjm/O+VXVD
 T9+1AJxIVmyNdpleRrfWXw1PdzR3dDUDfObscq8t2OJIyXR7QW62F5sH4C4U+AYoqkZT7xZR+W6
 1eiuYJ83oseRvq/8+kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190083

On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the ready
> state is detected, it will be marked as "attached", otherwise it could
> be the early boot feature is not supported by other entities. In this
> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> can load the firmware and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Thank you for the work, Jingyi!

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com> # Nord ADSP

A couple of minor nits below.

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..ac2a00aacd2e 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>  	int region_assign_count;
>  	bool region_assign_shared;
>  	int region_assign_vmid;
> +	bool early_boot;
>  };
>  
>  struct qcom_pas {
> @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
>  
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	int ret;
> +	struct qcom_pas *pas = rproc->priv;
> +	bool ready_state;
> +	bool crash_state;

Move "int ret;" line here to get reverse xmas tree.

> +
> +	pas->q6v5.handover_issued = true;
> +	enable_irq(pas->q6v5.handover_irq);
> +
> +	pas->q6v5.running = true;
> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +

Unneeded newline.

> +	if (ret)
> +		goto disable_running;
> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +

Ditto

Shawn

> +	if (ret)
> +		goto disable_running;
> +
> +	if (unlikely(!ready_state)) {
> +		/*
> +		 * The bootloader may not support early boot, mark the state as
> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> +		 * start the remoteproc.
> +		 */
> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> +		pas->rproc->state = RPROC_OFFLINE;
> +		disable_irq(pas->q6v5.handover_irq);
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	return 0;
> +
> +disable_running:
> +	pas->q6v5.running = false;
> +
> +	return ret;
> +}
> +
>  static const struct rproc_ops qcom_pas_ops = {
>  	.unprepare = qcom_pas_unprepare,
>  	.start = qcom_pas_start,
> @@ -518,6 +570,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static const struct rproc_ops qcom_pas_minidump_ops = {
> @@ -529,6 +582,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  	.coredump = qcom_pas_minidump,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static int qcom_pas_init_clock(struct qcom_pas *pas)
> @@ -855,6 +909,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  
>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
> +	if (desc->early_boot)
> +		pas->rproc->state = RPROC_DETACHED;
> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> 
> -- 
> 2.34.1
> 
> 
